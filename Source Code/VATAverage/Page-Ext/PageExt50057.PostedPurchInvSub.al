pageextension 50108 PostedPISubExt extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("UOM Name";Rec."UOM Name")
            {
                ApplicationArea = All;
                
            }
        }
        // Add changes to page layout here
        addafter("Line Amount")
        {
            // field(LineAmtLCY; LineAmtLCY)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Line Amount (LCY)';
            //     Editable = false;
            // }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnAfterGetRecord()

    begin
        // LineAmtLCY := 0;
        // LineAmtLCY := Rec.GetLineAmtLCY();
    end;

    var
        LineAmtLCY: Decimal;
}