#pragma implicitwith disable
pageextension 50102 PurchOrderSubformExt extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Unit of Measure Code")
        {
            field("UOM Name"; Rec."UOM Name")
            {
                ApplicationArea = All;
            }
            field("Outstanding Quantity"; Rec."Outstanding Quantity")
            {
                ApplicationArea = All;

            }

        }
        addafter("No.")
        {
            // field(VendItemNo; VendItemNo)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Vendor Item No.';
            //     Editable = false;
            // }
        }

        modify("Location Code")
        {
            ShowMandatory = true;
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

        addafter("Line Amount")
        {
            // field(LineAmtLCY; LineAmtLCY)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Line Amount (LCY)';
            //     Editable = false;
            // }
        }

        //Cancel Order ++
        addbefore("Qty. to Receive")
        {
            // field("TC Qty. to cancel"; Rec."TC Qty. to cancel")
            // {
            //     ApplicationArea = All;
            //     Visible = false;
            // }
            // field("TC Qty. canceled"; Rec."TC Qty. canceled")
            // {
            //     ApplicationArea = All;
            //     Editable = false;
            //     Visible = false;
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
            //         PurchLine: Record "Purchase Line";
            //     begin
            //         CurrPage.SetSelectionFilter(PurchLine);
            //         if PurchLine.FindSet() then
            //             repeat
            //                 PurchLine.InitOutstanding();
            //                 PurchLine.Modify();
            //             until PurchLine.Next() = 0;
            //     end;
            // }

        }
    }


    trigger OnAfterGetRecord()

    begin
        // LineAmtLCY := 0;
        // LineAmtLCY := Rec.GetLineAmtLCY();
        // VendItemNo := '';
        // if Rec.Type = Rec.Type::Item then begin
        //     if Item.get(Rec."No.") then
        //         VendItemNo := Item."Vendor Item No.";
        // end;
    end;

    var
        LineAmtLCY: Decimal;
        myInt: Integer;
        VendItemNo: Code[50];
        Item: Record Item;
}
#pragma implicitwith restore
