table 50101 "Custom Hotel Menu Line"
{
    Caption = 'Custom Hotel Menu Line';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; LineNo; Integer)
        {
            Caption = 'Line No';
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(2; MenuNo; Integer)
        {
            Caption = 'Menu No';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(3; ItemNo; code[20])
        {
            Caption = 'Item No';
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";

            /// <summary>
            /// Automatically loads up the Category / Price of the item once the item no is selected 
            /// </summary>
            trigger OnValidate()
            var
                recItem: Record Item;
            begin
                if ItemNo <> '' then begin
                    recItem.SetRange("No.", "ItemNo");
                    if recItem.FindFirst() then begin
                        Price := recItem."Unit Price";
                        Category := recItem."Item Category Code";
                    end;

                end;
            end;
        }
        field(4; Price; Decimal)
        {
            Caption = 'Item Price';
            DataClassification = ToBeClassified;
        }
        field(5; Category; Text[50])
        {
            Caption = 'Item Category';
            NotBlank = true;
            DataClassification = ToBeClassified;
        }

        /// <summary>
        /// First of all, an illogical field but put for demonstrating how a flowfield works
        /// Uses the Count function to count the number of items having the same category as this item line
        /// </summary>
        field(6; CategoryCount; Integer)
        {
            Caption = 'No Of Items With Same Category';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Item" where("Item Category Code" = field(Category)));
        }
        field(7; "Item Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field(ItemNo)));
        }

    }

    keys
    {
        key(PK; LineNo, MenuNo, ItemNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}