pageextension 50055 GetReceiptLinesExt extends "Get Receipt Lines"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Shipment No."; Rec."Vendor Shipment No.")
            {
                ApplicationArea = All;

            }
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = All;

            }
            field("Order Line No."; Rec."Order Line No.")
            {
                ApplicationArea = All;

            }
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;

            }
        }
    }
}
