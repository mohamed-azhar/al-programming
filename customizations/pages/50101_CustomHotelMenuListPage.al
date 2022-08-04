page 50101 "Custom Hotel Menu List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Custom Hotel Menu";
    Caption = 'Custom Hotel Menu List';
    CardPageId = "Custom Hotel Menu";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; No)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field(HotelName; HotelName)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Address; Address)
                {
                    ApplicationArea = All;
                }
                field(EmailAddress; EmailAddress)
                {
                    ApplicationArea = All;
                }
                field(Website; Website)
                {
                    ApplicationArea = All;
                }
                field(NoOfLines; NoOfLines)
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
            action(Help)
            {
                ApplicationArea = All;
                Image = Help;
                Caption = 'Help meeeee';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Go help yourself mate!';

                trigger OnAction()
                begin
                    Message('Hey, Vsauce. Michael here 👋😁');
                end;
            }

            action("Run Codeunit")
            {
                ApplicationArea = All;
                Image = Action;
                Caption = 'Run a codeunit';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Run a codeunit';

                trigger OnAction()
                var
                    myInt: Integer;
                    cu: Codeunit MainCodeUnit;
                begin
                    cu.Run();
                end;
            }

            action("Run Query")
            {
                ApplicationArea = All;
                Image = Info;
                Caption = 'Run a Query';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Run a Query';

                trigger OnAction()
                var
                    myInt: Integer;
                    qry: Query "Main Query";
                begin
                    qry.Open();
                    // qry.
                    //Message('From: %1', qry.Customer_No_);
                    qry.Close();
                end;
            }
        }
    }
}