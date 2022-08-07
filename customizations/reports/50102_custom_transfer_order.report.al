report 50102 "Custom Transfer Order Report"
{
    DefaultLayout = RDLC;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Custom Transfer Order Report';
    RDLCLayout = '.\customizations\reports\report-layouts\50102_custom-transfer-order.report.rdl';

    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            RequestFilterFields = "No.";

            column("No"; "No.") { }
            column("Notes"; notes) { }
            column(Posting_Date; "Posting Date") { }
            column(Last_Shipment_No_; "Last Shipment No.") { }
            column(Company_Logo; companyInfo.Picture) { }
            column(Company_Name; companyInfo.Name) { }
            column(Company_Address; companyInfo.Address) { }
            column(Company_Phone; companyInfo."Phone No.") { }
            column(Receipt_Date; "Receipt Date") { }
            column(transferToLocationName; transferToLocationName) { }
            column(transferToLocationAddress; transferToLocationAddress) { }
            column(transferToLocationPhone; transferToLocationPhone) { }


            dataitem("Transfer Line"; "Transfer Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(lineItemNo; lineItemNo) { }
                column(Item_No_; "Item No.") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(lineItemName; lineItemName) { }

                trigger OnAfterGetRecord()
                begin
                    item.SetRange("No.", "Transfer Line"."Item No.");
                    if item.FindFirst() then begin
                        lineItemName := item.Description;
                        lineItemNo += 1;
                    end;
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {
                    //field()
                }
            }
        }
    }


    trigger OnPreReport()
    var
        helper: Codeunit MainCodeUnit;
        transferToCode: Code[10];
    begin
        //get notes attached to this transfer order
        transferHeader.SetRange("No.", "Transfer Header".GetFilter("No."));
        if transferHeader.FindFirst() then begin
            notes := helper.ReadNotes(transferHeader);
            transferToCode := transferHeader."Transfer-to Code";
        end;

        //load company image
        companyInfo.get();
        companyInfo.CalcFields(Picture);

        //get trasnfer to location info
        transferToLocation.SetRange(Code, transferToCode);
        if transferToLocation.FindFirst() then begin
            transferToLocationName := transferToLocation.Name;
            transferToLocationAddress := transferToLocation.Address;
            transferToLocationPhone := transferToLocation."Phone No.";
        end;
    end;

    var
        item: Record Item;
        companyInfo: Record "Company Information";
        transferHeader: Record "Transfer Header";
        notes: Text;

        transferToLocation: Record Location;
        transferToLocationName: Text;
        transferToLocationAddress: Text;
        transferToLocationPhone: Text;

        lineItemName: Text;
        lineItemNo: Integer;
}