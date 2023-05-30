pageextension 50111 pageExtention50409 extends "NWTH Settlement Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
      
        addbefore(Report)
        {
            action("Input VAT (AVG)") //Change button Vat Report to Button Vat Report LL
            {
                ApplicationArea = NWTHLOC;
                Caption = 'Input VAT AVG';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = NOT IsWHT;

                trigger OnAction()
                var
                    NWTHSettlementEntryL: Record "NWTH Settlement Entry";
                begin
                    Rec.TestField("Submit Month");
                    NWTHSettlementEntryL.Reset();
                    NWTHSettlementEntryL.SetRange("Settlement No.", Rec."Settlement No.");
                    NWTHSettlementEntryL.SetRange(Submit, true);
                    //NWTHSettlementEntryL.Find('-');
                    REPORT.Run(REPORT::"Input VAT AVG", true, false, NWTHSettlementEntryL);
                end;
            }
        }
        // Add changes to page actions here
    }

    var
        VATEntryG: Record "VAT Entry";
        WHTEntryG: Record "NWTH WHT Entry";
        // TempNWTHSettlementEntryG: Record "NWTH Settlement Entry" temporary;
        //IsWHTG: Boolean;
        NothingToPostErr: Label 'Nothing to Post';
        PostLineErr: Label 'Please select submit, ignor or pending for line entry %1.';
        ConfirmDeleteDataQst: Label 'Do you want to delete Data in line?';

    trigger OnAfterGetCurrRecord()
    begin
        CheckSettlementType;
    end;

    var
        IsWHT: Boolean;

    local procedure CheckSettlementType()
    begin
        IsWHT := false;
        if Rec."Settlement Type" = Rec."Settlement Type"::WHT then
            IsWHT := true;
        CurrPage.Line.PAGE.CheckSettlementType(Rec."Settlement Type", Rec."VAT Type");
    end;
}