page 50102 "Custom Hotel Menu Items"
{
    PageType = ListPart;
    SourceTable = "Custom Hotel Menu Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(LineNo; LineNo)
                {
                    ApplicationArea = All;
                }
                field(MenuNo; MenuNo)
                {
                    ApplicationArea = All;
                }
                field(ItemNo; ItemNo)
                {
                    ApplicationArea = All;

                    /// <summary>
                    /// Automatically loads up the Category / Price / Item Name of the item once the item no is selected 
                    /// </summary>

                    // trigger OnLookup(var Text: Text): Boolean
                    // var
                    //     recItem: Record Item;
                    // begin

                    //     if Page.RunModal(Page::"Item List", recItem) = Action::LookupOK then
                    //         ItemNo := recItem."No.";
                    //     recItem.CalcFields(Description);
                    //     Price := recItem."Unit Price";
                    //     Category := recItem."Item Category Code";
                    //     ItemName := recItem.Description;

                    // end;
                }
                field("Item Name"; "Item Name")
                {
                    ApplicationArea = All;
                }
                // field("Item Name"; ItemName)
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                // }
                field(Price; Price)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Category; Category)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

        }

    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
    var
        ItemName: Text[100];
}