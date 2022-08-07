report 50100 "Customer Info"
{
    Caption = 'Customer Information';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = '.\customizations\reports\report-layouts\50100_customer_information.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";

            column(No; "No.") { }
            column(Name; Name) { }
            column("Cus_Picture"; customerInfo.Image) { }
            column(Address; Address) { }
            column(Phone_No_; "Phone No.") { }
            column(No__of_Orders; "No. of Orders") { }
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


    trigger OnPreReport()
    begin
        customerInfo.SetRange("No.", Customer.GetFilter("No."));
        customerInfo.FindFirst();
    end;


    var
        customerInfo: Record Customer;
}