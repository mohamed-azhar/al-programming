codeunit 50101 "Custom Json Object"
{
    trigger OnRun()
    var
        itemno: Integer;
        rec_item: Record item;
        json_item: JsonObject;
        rec_temp_blob: Record TempBlob;
        in_stream: InStream;
        out_stream: OutStream;
        file_name: Text;
        result: Text;

    begin
        //set vars
        itemno := 1000;
        //get item
        if rec_item.Get(itemno) then begin
            //create json object
            json_item.Add('no', rec_item."No.");
            json_item.Add('description', rec_item.Description);
            json_item.Add('category', rec_item."Item Category Code");
            json_item.Add('price', rec_item."Unit Price");

            //insert to temp storage
            rec_temp_blob.Blob.CreateInStream(in_stream);
            rec_temp_blob.Blob.CreateOutStream(out_stream);

            //write to buffer
            json_item.WriteTo(out_stream);

            //write and read
            out_stream.WriteText(result);
            in_stream.ReadText(result);

            //download
            file_name := 'item_schema.Json';
            DownloadFromStream(in_stream, 'Download json file', '', '', file_name);
        end;
    end;
}