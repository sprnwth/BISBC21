pageextension 50068 PageExtPsdExpenseList extends "NWTH Psd. Purchase Expenses"
{
    layout
    {
        addafter("NWTH Company Branch Code")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                Visible = true;
                Enabled = true;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter(NWTHPrintVoucher)
        {
            action(NWTHPrintWHTCertificateFIX)
            {
                ApplicationArea = NWTHLOC;
                Caption = 'Print WHT Certificate';
                Description = 'NWTHLOC.LOC00005';
                Image = Print;
                ToolTip = 'Executes the Print WHT Certificate action';
                trigger OnAction()
                var
                    //LOC16
                    PurchInvLineL: Record "Purch. Inv. Line";
                    NWTHWHTCertificates50BISPL: Report "NWTH WHT50BIS Posted PE FIX";
                    TextNoWHTtoDeducedLbl: Label 'No WHT Deducted.';
                begin
                    CLEAR(NWTHWHTCertificates50BISPL);
                    NWTHWHTCertificates50BISPL.InitialDocument(Rec."No.");
                    PurchInvLineL.RESET();
                    PurchInvLineL.SETRANGE("Document No.", Rec."No.");
                    PurchInvLineL.SETFILTER("NWTH WHT Prod. Posting Group", '<>%1', '');
                    IF PurchInvLineL.FINDSET() THEN BEGIN
                        REPEAT
                            NWTHWHTCertificates50BISPL.SetPurchInvLine(PurchInvLineL);
                        UNTIL PurchInvLineL.NEXT() = 0;
                        NWTHWHTCertificates50BISPL.RUNMODAL();
                    END ELSE
                        MESSAGE(TextNoWHTtoDeducedLbl);
                end;
            }

        }
        // modify(NWTHPrintWHTCertificate)
        // {
        //     Visible = false;
        //     Enabled = false;
        // }

    }

    var
        myInt: Integer;
}