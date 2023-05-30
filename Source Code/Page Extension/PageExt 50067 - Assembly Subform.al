pageextension 50067 "Assembly_Subform_Ext" extends "Assembly Order Subform"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("UOM Name"; Rec."UOM Name")
            {
                Caption = 'Unit of Measure Name';
                ApplicationArea = All;
            }
        }
    }
}