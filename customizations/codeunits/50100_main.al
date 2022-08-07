codeunit 50100 MainCodeUnit
{
    trigger OnRun()
    var
    begin
    end;

    procedure ReadNotes(transferHeader: Record 5740): Text
    var
        recordLink: Record 2000000068;
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
}