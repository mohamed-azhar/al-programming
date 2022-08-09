table 50104 "Employee Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Employee Code" <> xRec."Employee Code" then begin
                    recHRSetup.GET;
                    noSeries.TestManual(recHRSetup."Employee Code Nos");
                    "No. Series" := '';
                    noSeries.SetSeries("Employee Code");
                end;
            end;
        }

        field(2; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Designation"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Associate","Consultant","Manager","Director";
            OptionCaption = ', Associate,Consultant,Manager,Director';
        }
        field(4; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Employee Code")
        {
            Clustered = true;
        }
    }



    trigger OnInsert()
    begin
        if "Employee Code" = '' then begin
            recHRSetup.Get();
            recHRSetup.TestField("Employee Code Nos");
            noSeries.InitSeries(recHRSetup."Employee Code Nos", xRec."No. Series", 0D, "Employee Code", "No. Series");
        end;
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

    procedure AssistEdit_EmpNoSeries(): Boolean
    var
        HRSetupRec: Record "Human Resources Setup";
        noseriesMgmt: Codeunit NoSeriesManagement;
    begin
        HRSetupRec.Get();
        HRSetupRec.TestField("Employee Code Nos");
        if noseriesMgmt.SelectSeries(HRSetupRec."Employee Code Nos", xRec."No. Series", "No. Series") then begin
            noseriesMgmt.SetSeries("Employee Code");
        end;
    end;

    var
        recHRSetup: Record "Human Resources Setup";
        noSeries: Codeunit NoSeriesManagement;

}