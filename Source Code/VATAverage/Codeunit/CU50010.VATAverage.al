codeunit 50010 VATAverage
{
    Permissions = tabledata "G/L Entry" = rimd, tabledata "VAT Entry" = rimd;
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterModifyEvent', '', true, true)]
    local procedure OnAfterModify_PurchaseLine_Table(var xRec: Record "Purchase Line"; var Rec: Record "Purchase Line")
    var
        ModifyL: Boolean;
    begin

        // if rec."Base AVG. VAT Line No." <> 0 then begin
        //     ModifyL := false;
        //     if xRec."No." <> rec."No." then
        //         ModifyL := true;
        //     if xRec."VAT Prod. Posting Group" <> rec."VAT Prod. Posting Group" then
        //         ModifyL := true;
        //     if xRec."Direct Unit Cost" <> rec."Direct Unit Cost" then
        //         ModifyL := true;
        //     if xRec.Quantity <> rec.Quantity then
        //         ModifyL := true;
        //     //spr allow edit
        //     //if ModifyL then
        //     //    Error('Not allow to Modify because this line linked to Line No. %1', rec."Base AVG. VAT Line No.");
        // end else begin

        // end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeDeleteEvent', '', true, true)]
    local procedure OnBeforeDelete_PurchaseLine_Table(RunTrigger: Boolean; var Rec: Record "Purchase Line")
    var
        PurchaseLineL: Record "Purchase Line";
    begin
        if NOT RunTrigger then
            exit;
        // if rec."Base AVG. VAT Line No." <> 0 then
        //     Error('Not allow to Delete because this line linked to Line No. %1', rec."Base AVG. VAT Line No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterDeleteEvent', '', true, true)]
    local procedure OnAfterDelete_PurchaseLine_Table(
        var
        Rec: Record "Purchase Line";
        RunTrigger: Boolean
        )
    var
        PurchaseLineL: Record "Purchase Line";
    begin
        if RunTrigger then begin
            PurchaseLineL.reset;
            PurchaseLineL.SetRange("Document No.", rec."Document No.");
            PurchaseLineL.SetRange("Document Type", rec."Document Type");
            PurchaseLineL.SetRange("Base AVG. VAT Line No.", rec."Line No.");
            if PurchaseLineL.FindFirst() then begin
                PurchaseLineL.Delete();
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertVATEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeInsertVATEntry"
    (
        var VATEntry: Record "VAT Entry";
        GenJournalLine: Record "Gen. Journal Line"
    )
    var
        VATPostingSetupL: Record "VAT Posting Setup";
        CreditBaseL: Decimal;
        OriVATAmtL: Decimal;
    begin
        IF VATPostingSetupL.Get(VATEntry."VAT Bus. Posting Group", VATEntry."VAT Prod. Posting Group") then begin
            if VATPostingSetupL."AVG. VAT %" then begin
                CreditBaseL := 0;
                OriVATAmtL := 0;
                //TC 
                //CreditBaseL := (VATEntry.Amount * 100) / VATPostingSetupL."Of VAT %";

                if VATPostingSetupL."AVG Claim Base Percent" <> 0 then begin

                    CreditBaseL := Round((VATEntry.Base * VATPostingSetupL."AVG Claim Base Percent") / 100);

                end else begin
                    CreditBaseL := (VATEntry.Amount * 100) / VATPostingSetupL."Of VAT %";

                end;

                OriVATAmtL := VATEntry.Base * (VATPostingSetupL."Of VAT %" / 100);
                VATEntry."Credit Base" := CreditBaseL;
                VATEntry."Original VAT Amount" := OriVATAmtL;
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertPostUnrealVATEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeInsertPostUnrealVATEntry"
    (
        var VATEntry: Record "VAT Entry";
        GenJournalLine: Record "Gen. Journal Line";
        var VATEntry2: Record "VAT Entry"
    )
    var
        VATPostingSetupL: Record "VAT Posting Setup";
        CreditBaseL: Decimal;
        OriVATAmtL: Decimal;
    begin
        IF VATPostingSetupL.Get(VATEntry."VAT Bus. Posting Group", VATEntry."VAT Prod. Posting Group") then begin
            if VATPostingSetupL."AVG. VAT %" then begin
                CreditBaseL := 0;
                OriVATAmtL := 0;
                //CreditBaseL := (VATEntry.Amount * 100) / VATPostingSetupL."Of VAT %";
                if VATPostingSetupL."AVG Claim Base Percent" <> 0 then
                    CreditBaseL := Round((VATEntry.Base * VATPostingSetupL."AVG Claim Base Percent") / 100)
                else
                    CreditBaseL := (VATEntry.Amount * 100) / VATPostingSetupL."Of VAT %";
                OriVATAmtL := VATEntry.Base * (VATPostingSetupL."Of VAT %" / 100);
                VATEntry."Credit Base" := CreditBaseL;
                VATEntry."Original VAT Amount" := OriVATAmtL;
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Amount', true, true)]
    local procedure OnValidateAmount_SalesLineTable(var Rec: Record "Sales Line")
    var
        VATPostingSetG: Record "VAT Posting Setup";
        AVGAmount: Decimal;
        SalesLineL: Record "Sales Line";
    begin
        if VATPostingSetG.Get(rec."VAT Bus. Posting Group", rec."VAT Prod. Posting Group") then begin
            if VATPostingSetG."AVG. VAT %" then begin
                AVGAmount := 0;
                AVGAmount := (rec.Amount * ((VATPostingSetG."Of VAT %" - VATPostingSetG."VAT %") / 100));
                SalesLineL.Reset();
                SalesLineL.SetRange("Document Type", rec."Document Type");
                SalesLineL.SetRange("Document No.", rec."Document No.");
                SalesLineL.SetRange("Base AVG. VAT Line No.", rec."Line No.");
                if SalesLineL.FindFirst() then begin
                    SalesLineL.Amount := AVGAmount;
                    SalesLineL.Modify();
                end else begin
                    SalesLineL.Init();
                    SalesLineL."Document Type" := rec."Document Type";
                    SalesLineL."Document No." := rec."Document No.";
                    SalesLineL.Type := rec.Type;
                    SalesLineL.Validate("No.", rec."No.");
                    SalesLineL."Base AVG. VAT Line No." := rec."Line No.";
                    SalesLineL.Validate(Amount, AVGAmount);
                    SalesLineL.Insert(true);
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'VAT Prod. Posting Group', true, true)]
    local procedure OnValidateVATProd_SalesLineTable(var Rec: Record "Sales Line")
    var
        VATPostingSetG: Record "VAT Posting Setup";
        AVGAmount: Decimal;
        SalesLineL: Record "Sales Line";
        SalesHeaderL: Record "Sales Header";
    begin
        if VATPostingSetG.Get(rec."VAT Bus. Posting Group", rec."VAT Prod. Posting Group") then begin
            //Check Period VAT
            IF NOT VATPostingSetG."AVG. VAT %" then
                exit;
            SalesHeaderL.GET(rec."Document Type", rec."Document No.");
            IF (SalesHeaderL."Posting Date" < VATPostingSetG."AVG. VAT Starting Date") OR (SalesHeaderL."Posting Date" > VATPostingSetG."AVG. VAT Ending Date") then
                Error('The Posting Date not within range of VAT Posting Setup, VAT Bus.= %1, VAT Prod.= %2.', rec."VAT Bus. Posting Group", rec."VAT Prod. Posting Group");
            //Check Period VAT
            if VATPostingSetG."AVG. VAT %" then begin
                AVGAmount := 0;
                AVGAmount := (rec.Amount * ((VATPostingSetG."Of VAT %" - VATPostingSetG."VAT %") / 100));
                IF AVGAmount <> 0 then begin
                    SalesLineL.Reset();
                    SalesLineL.SetRange("Document Type", rec."Document Type");
                    SalesLineL.SetRange("Document No.", rec."Document No.");
                    SalesLineL.SetRange("Base AVG. VAT Line No.", rec."Line No.");
                    if SalesLineL.FindFirst() then begin
                        SalesLineL.Amount := AVGAmount;
                        SalesLineL.Modify();
                    end else begin
                        SalesLineL.Init();
                        SalesLineL."Document Type" := rec."Document Type";
                        SalesLineL."Document No." := rec."Document No.";
                        SalesLineL."Line No." := rec."Line No." + 5000;
                        SalesLineL.Type := rec.Type;
                        SalesLineL.Validate("No.", rec."No.");
                        SalesLineL.Quantity := 1;
                        SalesLineL."Base AVG. VAT Line No." := rec."Line No.";
                        SalesLineL.Validate(Amount, AVGAmount);
                        SalesLineL.Insert(true);

                    end;
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterModifyEvent', '', true, true)]
    local procedure OnAfterModify_SalesLine_Table(var xRec: Record "Sales Line"; var Rec: Record "Sales Line")
    var
        ModifyL: Boolean;
    begin
        if rec."Base AVG. VAT Line No." <> 0 then begin
            ModifyL := false;
            if xRec."No." <> rec."No." then
                ModifyL := true;
            if xRec."VAT Prod. Posting Group" <> rec."VAT Prod. Posting Group" then
                ModifyL := true;

            if ModifyL then
                Error('Not allow to Modify because this line linked to Line No. %1', rec."Base AVG. VAT Line No.");
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeDeleteEvent', '', true, true)]
    local procedure OnBeforeDelete_SalesLine_Table(RunTrigger: Boolean; var Rec: Record "Sales Line")
    var
        SalesLineL: Record "Sales Line";
    begin
        if NOT RunTrigger then
            exit;
        if rec."Base AVG. VAT Line No." <> 0 then
            Error('Not allow to Delete because this line linked to Line No. %1', rec."Base AVG. VAT Line No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterDeleteEvent', '', true, true)]
    local procedure OnAfterDelete_SalesLine_Table(var Rec: Record "Sales Line")
    var
        SalesLineL: Record "Sales Line";

    begin
        SalesLineL.reset;
        SalesLineL.SetRange("Document No.", rec."Document No.");
        SalesLineL.SetRange("Document Type", rec."Document Type");
        SalesLineL.SetRange("Base AVG. VAT Line No.", rec."Line No.");
        if SalesLineL.FindFirst() then begin
            SalesLineL.Delete();
        end;
    end;
    //ACC02   24.10.2020   SSI -

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnValidateVATProdPostingGroupOnBeforeCheckVATCalcType', '', true, true)]
    local procedure HandleValidateVATProductPostingGroupPL(var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; VATPostingSetup: Record "VAT Posting Setup")
    begin
        if VATPostingSetup."VAT Calculation Type" = VATPostingSetup."VAT Calculation Type"::"Full VAT" then
            IsHandled := VATPostingSetup."Unrealized VAT Type" <> 0;

    end;

}
