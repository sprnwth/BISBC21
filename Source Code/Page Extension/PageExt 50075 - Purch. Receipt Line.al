pageextension 50075 PurchRcptLineExt extends "Purch. Receipt Lines"
{
    layout
    {
        // Add changes to page layout here
        modify("Order No.")
        {
            Visible = true;
        }
        modify("Order Line No.")
        {
            Visible = true;
        }
        addafter("Document No.")
        {
            field("Vendor Shipment No."; Rec."Vendor Shipment No.")
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