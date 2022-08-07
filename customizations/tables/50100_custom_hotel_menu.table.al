table 50100 "Custom Hotel Menu"
{
    Caption = 'Custom Hotel Menu';
    DataClassification = ToBeClassified;
    DataPerCompany = true;

    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No_';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Menu Name';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(3; HotelName; Text[50])
        {
            Caption = 'Hotel Name';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(4; Description; Text[500])
        {
            Caption = 'Menu Description ';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(5; EmailAddress; Text[30])
        {
            Caption = 'Email Address';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
            NotBlank = true;
        }
        field(6; Address; Text[100])
        {
            Caption = 'Hotel Address';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(7; Website; Text[20])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
            NotBlank = true;
        }
        field(8; NoOfLines; Integer)
        {
            Caption = 'No of Lines';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count ("Custom Hotel Menu Line" where(MenuNo = field(No)));
        }
    }

    keys
    {
        key(PK; No)
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