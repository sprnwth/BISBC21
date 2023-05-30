tableextension 50011 PurchLineExt extends "Purchase Line"
{

    fields
    {

        //ACC02   24.10.2020   SSI +
        field(60100; "Base AVG. VAT Line No."; Integer)
        {
            Caption = 'Base AVG. VAT Line No. ';
            DataClassification = ToBeClassified;
        }
        field(60101; "VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        //ACC02   24.10.2020   SSI -
        field(60103; "Currency Factor"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."Currency Factor" where("Document Type" = field("Document Type"), "No." = field("Document No.")));
        }
        // field(60102; "LL Master Description"; Text[100])
        // {
        //     Caption = 'Master Description';
        //     Description = 'LL1.0';
        //     Editable = false;
        // }
        //Cancel Order++
        field(60104; "TC Qty. to cancel"; Decimal)
        {
            caption = 'Qty. to cancel';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Rec."TC Qty. to cancel" > Rec."Outstanding Quantity" then
                    Error('Quantity To cancel is only %1', Rec."Outstanding Quantity");
            end;
        }
        field(60105; "TC Qty. canceled"; Decimal)
        {
            caption = 'Qty. canceled';
            DataClassification = ToBeClassified;
        }

        //Cancel Order--
        field(60106; "UOM Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field("Unit of Measure Code")));
        }


    }

    procedure InsertAVGVAT()
    var
        VATPostingSetG: Record "VAT Posting Setup";
        AVGAmount: Decimal;
        PurchaseLineL: Record "Purchase Line";
        PurchaseHeaderL: Record "Purchase Header";
        LastNoL: Integer;
    begin

        if VATPostingSetG.Get(rec."VAT Bus. Posting Group", rec."VAT Prod. Posting Group") then begin

            if VATPostingSetG."AVG. VAT %" then begin
                PurchaseHeaderL.GET(rec."Document Type", rec."Document No.");
                IF (PurchaseHeaderL."Posting Date" < VATPostingSetG."AVG. VAT Starting Date") OR (PurchaseHeaderL."Posting Date" > VATPostingSetG."AVG. VAT Ending Date") then
                    Error('The Posting Date not within range of VAT Posting Setup, VAT Bus.= %1, VAT Prod.= %2.', rec."VAT Bus. Posting Group", rec."VAT Prod. Posting Group");
                AVGAmount := 0;
                AVGAmount := Round((rec."Line Amount" * ((VATPostingSetG."Of VAT %" - VATPostingSetG."VAT %") / 100)));

                IF AVGAmount <> 0 then begin
                    //if rec."Line No." = 0 then
                    //    CurrPage.SaveRecord();
                    PurchaseLineL.Reset();
                    PurchaseLineL.SetRange("Document Type", rec."Document Type");
                    PurchaseLineL.SetRange("Document No.", rec."Document No.");
                    PurchaseLineL.SetRange("Base AVG. VAT Line No.", rec."Line No.");
                    if PurchaseLineL.FindFirst() then begin
                        if PurchaseLineL.Amount <> AVGAmount then begin
                            PurchaseLineL.Validate("Direct Unit Cost", AVGAmount);
                            PurchaseLineL.Modify(TRUE);
                            //CurrPage.Update();
                        end;

                    end else begin

                        PurchaseLineL.reset;
                        PurchaseLineL.Init();
                        PurchaseLineL.Validate("Document Type", rec."Document Type");
                        PurchaseLineL.Validate("Document No.", rec."Document No.");
                        PurchaseLineL."Line No." := rec."Line No." + 5000;

                        PurchaseLineL.Insert(true);
                        PurchaseLineL.validate(Type, rec.Type::"G/L Account");
                        if VATPostingSetG."AVG Unclaim VAT" = '' then
                            PurchaseLineL.Validate("No.", Rec."No.")
                        else
                            PurchaseLineL.validate("No.", VATPostingSetG."AVG Unclaim VAT");
                        PurchaseLineL.validate("Gen. Prod. Posting Group", Rec."Gen. Prod. Posting Group");
                        PurchaseLineL.validate("VAT Prod. Posting Group", VATPostingSetG."Default NO VAT Code");
                        PurchaseLineL.validate(Quantity, 1);
                        PurchaseLineL.Validate("Direct Unit Cost", AVGAmount);
                        PurchaseLineL."Base AVG. VAT Line No." := rec."Line No.";
                        //PurchaseLineL.Insert(true);
                        PurchaseLineL.Modify(true);
                        //CurrPage.Update();
                    end;
                end;
            end else begin
                // if rec."Base AVG. VAT Line No." = 0 then begin
                //     PurchaseLineL.reset;
                //     PurchaseLineL.SetRange("Document No.", rec."Document No.");
                //     PurchaseLineL.SetRange("Document Type", rec."Document Type");
                //     PurchaseLineL.SetRange("Base AVG. VAT Line No.", rec."Line No.");
                //     if PurchaseLineL.FindFirst() then begin
                //         PurchaseLineL.Delete();
                //         //CurrPage.Update();
                //     end;
                // end;
            end;
        end;
    end;

    trigger OnModify()
    begin
        //Clear(Amount);
        //UpdateAmounts();
        //"VAT Amount" := "Amount Including VAT" - Amount;
        //InsertAVGVAT();
    end;

    procedure GetLineAmtLCY(): Decimal
    begin
        if Rec."Currency Code" = '' then
            Exit("Line Amount")
        else begin
            Rec.CalcFields("Currency Factor");
            if Rec."Currency Factor" <> 0 then
                Exit("Line Amount" / Rec."Currency Factor")
            else
                Exit(0);
        end;
    end;



}
