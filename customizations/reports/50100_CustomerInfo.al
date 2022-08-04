report 50100 "Customer Info"
{
    Caption = 'Customer Information';
    UsageCategory = Administration;
    ApplicationArea = All;
    PreviewMode = PrintLayout;
    DefaultLayout = RDLC;
    RDLCLayout = '.\customizations\reports\report-layouts\50100_customer_information.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";

            column(No; "No.") { }
            column(Name; Name) { }
            column(Address; Address) { }
            column(Phone_No_; "Phone No.") { }
            column(City; City) { }
            column(No__of_Orders; "No. of Orders") { }
            column(Retail_Customer_Group; "Retail Customer Group") { }
            column(VAT_Registration_No_; "VAT Registration No.") { }
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



    var
        myInt: Integer;
}