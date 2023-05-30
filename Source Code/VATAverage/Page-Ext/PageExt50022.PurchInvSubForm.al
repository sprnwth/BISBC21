pageextension 50104 PurchInvSubformExt extends "Purch. Invoice Subform"
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
        modify("Appl.-to Item Entry")
        {
            Visible = true;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()

            begin
                CurrPage.SaveRecord();
                CurrPage.Update();
            end;
        }
        modify("Direct Unit Cost")
        {
            trigger OnAfterValidate()

            begin
                CurrPage.SaveRecord();
                CurrPage.Update();
            end;
        }
      
        // addafter("Line Amount")
        // {
        //     field(LineAmtLCY; LineAmtLCY)
        //     {
        //         ApplicationArea = All;
        //         Caption = 'Line Amount (LCY)';
        //         Editable = false;
        //     }
        //     field("Receipt No."; Rec."Receipt No.")
        //     {
        //         ApplicationArea = All;
        //         Editable = false;
        //     }
        //     field("Salvage Value"; Rec."Salvage Value")
        //     {
        //         ApplicationArea = All;
        //         Editable = true;
        //     }
        // }



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

    // var
    //     LineAmtLCY: Decimal;
    //     myInt: Integer;
}