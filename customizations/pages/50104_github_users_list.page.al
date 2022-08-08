page 50104 "Github Users"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Github User";

    layout
    {
        area(Content)
        {
            repeater(Lists)
            {
                field("ID"; id)
                {
                    Caption = 'ID';
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Login"; Login)
                {
                    Caption = 'Login';
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        mainCu: Codeunit MainCodeUnit;
                    begin
                        mainCu.SaveGithubUserInformation(Rec);
                    end;
                }
                field(Url; Url)
                {
                    Caption = 'Url';
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field(Type; Type)
                {
                    Caption = 'Type';
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}