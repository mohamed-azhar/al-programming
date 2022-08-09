tableextension 50103 "Human Resource Setup Extension" extends "Human Resources Setup"
{
    fields
    {
        field(50000; "Employee Code Nos"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }
}