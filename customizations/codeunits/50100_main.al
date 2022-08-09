codeunit 50100 MainCodeUnit
{
    trigger OnRun()
    var
    begin
    end;

    procedure ReadNotes(transferHeader: Record "Transfer Header"): Text
    var
        recordLink: Record "Record Link";
        noteText: BigText;
        stream: Instream;
        recRef: RecordRef;
    begin
        recRef.GetTable(transferHeader);
        recordLink.SetRange("Record ID", recRef.RecordId);
        if recordLink.FindFirst() then begin
            repeat
                recordLink.CalcFields(Note);
                IF recordLink.Note.HasValue then begin
                    Clear(noteText);
                    recordLink.Note.CreateInstream(stream);
                    noteText.Read(stream);
                    noteText.GetSubText(noteText, 2);
                    exit(Format(noteText));
                end;
            until recordLink.Next = 0;
        end;
    end;

    procedure SaveGithubUserInformation(var githubUser: Record "Github User")
    var
        url: Text;
        client: HttpClient;
        response: HttpResponseMessage;
        content: HttpContent;
        result: Text;

        request: HttpRequestMessage;
        output: Text;
        jobject: JsonObject;
        jtoken: JsonToken;
        newobj: JsonObject;
    begin
        url := 'https://api.github.com/users/' + Format(githubUser.Login.ToLower());

        client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365 Business Central');
        client.Get(url, response);
        if response.IsSuccessStatusCode then begin
            content := response.Content;
            content.ReadAs(result);

            jobject.ReadFrom(result);
            jobject.Get('id', jtoken);
            githubUser.id := jtoken.AsValue().AsInteger();

            jobject.Get('login', jtoken);
            githubUser.Login := jtoken.AsValue().AsText();

            jobject.Get('url', jtoken);
            githubUser.url := jtoken.AsValue().AsText();

            jobject.Get('type', jtoken);
            githubUser.Type := jtoken.AsValue().AsText();
        end else
            Message('Invalid github user login provided.');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"POS Transaction Events", 'OnAfterChangePrice', '', true, true)]
    local procedure OnAfterChangePrice(VAR POSTransaction: Record "POS Transaction"; VAR POSTransLine: Record "POS Trans. Line"; VAR CurrInput: Text)
    var
        fiftyPerc: Decimal;
    begin
        fiftyPerc := POSTransLine."Net Amount" * 0.5;
        if POSTransLine.Price < fiftyPerc then
            Message('Price cannot be lower than 50% of the original item price! 😡');
    end;
}