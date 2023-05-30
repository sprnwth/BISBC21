pageextension 50069 GetShipmentLineExt extends "Get Shipment Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document No.")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = All;

            }
            field("Order Line No."; Rec."Order Line No.")
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
        myInt: codeunit "Notification Entry Dispatcher";
        app: report "Notification Email";
}