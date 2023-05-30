pageextension 50103 SalesInvSubFormExt extends "Sales Invoice Subform"
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
        modify("Appl.-from Item Entry")
        {
            Visible = true;
        }
        modify("Appl.-to Item Entry")
        {
            Visible = true;
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
            // field("Amount FOB"; Rec."Amount FOB")
            // {
            //     ApplicationArea = All;

            // }
            // field("Amount FOB LCY"; Rec."Amount FOB LCY")
            // {
            //     ApplicationArea = All;

            // }
            field("Shipment No."; Rec."Shipment No.")
            {
                ApplicationArea = All;

            }
            field("Shipment Line No."; Rec."Shipment Line No.")
            {
                ApplicationArea = All;
                Visible = false;

            }
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