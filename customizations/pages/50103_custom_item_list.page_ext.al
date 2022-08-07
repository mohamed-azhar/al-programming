pageextension 50103 "Custom Item list" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Item)
        {
            group(Additional)
            {
                action("Download schema")
                {
                    Image = Export;
                    Caption = 'Download item json schema';
                    trigger OnAction()
                    var
                        itemno: Integer;
                        json_cu: Codeunit "Custom Json Object";
                    begin
                        itemno := 1000;
                        json_cu.Run();
                    end;
                }
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}