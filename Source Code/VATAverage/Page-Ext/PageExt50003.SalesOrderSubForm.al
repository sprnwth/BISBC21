#pragma implicitwith disable
pageextension 50100 SalesOrderSubExt extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Unit of Measure Code")
        {
            field("UOM Name";Rec."UOM Name")
            {
                ApplicationArea = All;                
            }
        }
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

        }
        modify("Location Code")
        {
            ShowMandatory = true;
        }
        modify("Purchasing Code")
        {
            Visible = true;
        }
        //Cancel Order ++
        addbefore("Qty. to ship")
        {
            // field("TC Qty. to cancel"; Rec."TC Qty. to cancel")
            // {
            //     ApplicationArea = All;
            //     Visible = false;
            // }
            // field("TC Qty. canceled"; Rec."TC Qty. canceled")
            // {
            //     ApplicationArea = All;
            //     Visible = false;
            //     Editable = false;
            // }

        }
        //Cancel Order --
       
    }

    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            // action("Cancel Receive")
            // {
            //     ApplicationArea = All;
            //     Image = Cancel;
            //     Visible = true;

            //     trigger OnAction()
            //     var
            //         SalesLine: Record "Sales Line";
            //     begin
            //         CurrPage.SetSelectionFilter(SalesLine);
            //         if SalesLine.FindSet() then
            //             repeat
            //                 SalesLine.InitOutstanding();
            //                 SalesLine.Modify();
            //             until SalesLine.Next() = 0;
            //     end;
            // }
         
        }
    }

    trigger OnAfterGetRecord()

    begin
        // LineAmtLCY := 0;
        // LineAmtLCY := Rec.GetLineAmtLCY();
    end;

    var
        LineAmtLCY: Decimal;


}
#pragma implicitwith restore
