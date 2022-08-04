page 50100 "Custom Hotel Menu"
{
    PageType = Document;
    SourceTable = "Custom Hotel Menu";

    layout
    {
        area(Content)
        {
            group(General)
            {
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
            }
            group(Contact)
            {
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
            }
            part("Custom Hotel Menu Items"; "Custom Hotel Menu Items")
            {
                ApplicationArea = All;
                SubPageLink = MenuNo = field("No");
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}