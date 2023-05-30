pageextension 50077 PageExtPost extends "Sales Shipment Lines"
{
    layout
    {
        addafter("Location Code")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = All;
            }
            field("Invoice No."; Rec."Invoice No.")
            {
                ApplicationArea = All;
            }
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}