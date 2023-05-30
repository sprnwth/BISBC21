pageextension 50053 PurchQuoteSubform extends "Purchase Quote Subform"
{
    layout
    {
        modify("Direct Unit Cost")
        {
            Visible = false;
        }
        addafter("Unit of Measure Code")
        {
            field("UOM Name"; Rec."UOM Name")
            {
                ApplicationArea = All;

            }
        }
    }
}
