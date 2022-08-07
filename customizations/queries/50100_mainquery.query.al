query 50100 "Main Query"
{
    Caption = 'Main Query';
    QueryType = Normal;

    elements
    {
        dataitem(Transaction_Header; "Transaction Header")
        {
            column(Customer_No_; "Customer No.") { }
            column(Date; Date) { }
            column(Store_No_; "Store No.") { }
            column(POS_Terminal_No_; "POS Terminal No.") { }
            column(Staff_ID; "Staff ID") { }
            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = Transaction_Header."Customer No.";
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}