pageextension 50057 "Warehouse Shipment Subform BIS" extends "Whse. Shipment Subform"
{
    layout
    {
        modify("Qty. Picked")
        {
            Visible = true;
        }
        addafter("Qty. Picked")
        {
            field("Completely Picked"; Rec."Completely Picked")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }
}
