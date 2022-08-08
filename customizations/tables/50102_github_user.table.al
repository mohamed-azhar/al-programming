table 50102 "Github User"
{
    Caption = 'Github User';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(2; Login; Text[20])
        {
            DataClassification = ToBeClassified;
        }

        field(3; Url; Text[100])
        {
            ExtendedDatatype = EMail;
            DataClassification = ToBeClassified;
        }

        field(4; Type; Text[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; id)
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