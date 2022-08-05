report 50101 "Transaction Information"
{
    Caption = 'Transaction Information';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = '.\customizations\reports\report-layouts\50101_transaction_information.rdl';

    dataset
    {
        dataitem("Transaction Header"; "Transaction Header")
        {
            RequestFilterFields = "Transaction No.";

            column("Company_Image"; companyInfo.Picture) { }
            column(Receipt_No_; "Receipt No.") { }
            column(Store_No_; "Store No.") { }
            column(PTNo_; "POS Terminal No.") { }
            column(Date; Date) { }
            column(Net_Amount; "Net Amount") { }

            dataitem("Trans. Sales Entry"; "Trans. Sales Entry")
            {
                DataItemLink = "Transaction No." = field("Transaction No."),
                    "Store No." = field("Store No."),
                     "POS Terminal No." = field("POS Terminal No.");

                column(Transaction_No_; "Transaction No.") { }
                column(Item_No_; "Item No.") { }
                column(itemName; itemName) { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Net_Price; "Net Price") { }

                trigger OnAfterGetRecord()
                var
                    item: Record Item;
                begin
                    item.SetRange("No.", "Trans. Sales Entry"."Item No.");
                    if item.FindFirst() then begin
                        itemName := item.Description;
                    end
                    else begin
                        Message('Item no found: %1', item."No.");
                    end
                end;
            }
        }
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {
    //                     ApplicationArea = All;

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }

    trigger OnInitReport()
    begin
        companyInfo.get();
        companyInfo.CalcFields(Picture);
    end;

    var
        companyInfo: Record "Company Information";
        itemName: Text[100];
}