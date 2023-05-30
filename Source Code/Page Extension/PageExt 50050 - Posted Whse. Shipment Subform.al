pageextension 50050 PSDWhseSubformExtension extends "Posted Whse. Shipment Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Expiry date"; Rec."Expiry date")
            {
                ApplicationArea = All;

            }
            field("Goods Type"; Rec."Goods Type")
            {
                ApplicationArea = All;
            }
            field("Salesperson Code"; Rec."Salesperson Code")
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