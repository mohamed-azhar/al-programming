pageextension 50105 "Transfer Order List Extension" extends "Transfer Orders"
{

    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Reporting)
        {
            action(Run)
            {
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                Caption = 'Print Report';
                Image = Report;
                RunPageOnRec = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    thead: Record "Transfer Header";
                    theadCode: code[20];
                    stuff: Text;
                    ctor: Report "Custom Transfer Order Report";
                begin
                    theadCode := xRec."No.";
                    thead.SetRange("No.", xRec."No.");

                    ctor.SetTableView(thead);
                    ctor.Run();
                end;
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}