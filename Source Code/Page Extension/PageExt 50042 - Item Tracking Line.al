pageextension 50042 ItemTrackingLineBISExt extends "Item Tracking Lines"
{
    layout
    {
        // Add changes to page layout here
        modify("Expiration Date")
        {
            Visible = true;

        }
        modify("Warranty Date")
        {
            Visible = true;
        }

        addafter("Appl.-from Item Entry")
        {
            field("Bin Code"; Rec."Bin Code")
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