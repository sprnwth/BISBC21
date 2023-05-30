codeunit 50009 PurchaseSubscriber
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReopenPurchaseDoc', '', true, true)]
    local procedure OnBeforeReopenPurchDoc(PreviewMode: Boolean; var IsHandled: Boolean; var PurchaseHeader: Record "Purchase Header")
    var
        ArchiveMgt: codeunit ArchiveManagement;
    begin
        ArchiveMgt.StorePurchDocument(PurchaseHeader, false);

    end;

    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeValidateDocumentDateWithPostingDate', '', true, true)]
    // local procedure NotChangeDocDateAfterPostingDate(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseHeader: Record "Purchase Header")
    // begin
    //     IsHandled := true;
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'Quantity', true, true)]
    local procedure OnvalidatePLQty(CurrFieldNo: Integer; var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        Rec.InsertAVGVAT();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterUpdateAmounts', '', true, true)]
    local procedure OnAfterUpdateAmtToInsertVATAVG(CurrFieldNo: Integer; var PurchLine: Record "Purchase Line"; var xPurchLine: Record "Purchase Line")
    begin
        PurchLine.InsertAVGVAT();
    end;


    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterInitRecord', '', true, true)]
    // local procedure BookPostingNoAfterInit(var PurchHeader: Record "Purchase Header")
    // var
    //     NoSeries: Record "No. Series";
    // begin

    //     if NoSeries.get(PurchHeader."No. Series") then begin
    //         if NoSeries."NWTH Posting Nos." <> '' then begin
    //             PurchHeader.validate("Posting No. Series", NoSeries."NWTH Posting Nos.");
    //         end;
    //     end;
    // end;

    //Purch Expense Only
    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterInsertEvent', '', true, true)]
    // local procedure FixPostingNoSeriesPEonly(RunTrigger: Boolean; var Rec: Record "Purchase Header")
    // var
    //     NoSeries: Record "No. Series";
    // begin
    //     if Rec."NWTH Purchase Type" <> Rec."NWTH Purchase Type"::Expense then
    //         exit;

    //     if NoSeries.get(Rec."No. Series") then begin
    //         if NoSeries."NWTH Posting Nos." <> '' then begin
    //             Rec.validate("Posting No. Series", NoSeries."NWTH Posting Nos.");
    //             Rec.Modify(true);
    //         end;
    //     end;
    // end;
    //Purch Expense Only


    // [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'No.', true, true)]
    // local procedure OnAfterValidateEvent_FieldNo_TablePurchaseLine(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer)
    // var
    //     NewNoL: Code[20];
    //     NewDescriptionL: Text;
    //     NewDescription2L: Text;
    //     ItemL: Record Item;
    //     GLAccountL: Record "G/L Account";
    //     FixedAssetL: Record "Fixed Asset";
    //     ItemChargeL: Record "Item Charge";
    //     PurchaseHeaderL: Record "Purchase Header";
    //     FADepreciationBookL: Record "FA Depreciation Book";

    // begin

    //     if Rec.Type = Rec.Type::Item then begin
    //         if ItemL.Get(Rec."No.") then
    //             Rec."LL Master Description" := ItemL.Description;
    //     end else
    //         if Rec.Type = Rec.Type::"G/L Account" then begin
    //             if GLAccountL.Get(Rec."No.") then
    //                 Rec."LL Master Description" := GLAccountL.Name;
    //         end else
    //             if Rec.Type = Rec.Type::"Fixed Asset" then begin
    //                 if FixedAssetL.Get(Rec."No.") then
    //                     Rec."LL Master Description" := FixedAssetL.Description;
    //             end else
    //                 if Rec.Type = Rec.Type::"Charge (Item)" then begin
    //                     if ItemChargeL.Get(Rec."No.") then
    //                         Rec."LL Master Description" := ItemChargeL.Description;
    //                 end else
    //                     if Rec.Type = Rec.Type::" " then
    //                         Rec."LL Master Description" := '';
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopyPurchLineOnBeforeCheckVATBusGroup', '', true, true)]
    local procedure SkipCheckVATBusPurch(PurchaseLine: Record "Purchase Line"; var CheckVATBusGroup: Boolean)
    begin
        CheckVATBusGroup := false;
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforeTempPrepmtPurchLineInsert', '', true, true)]
    // local procedure PrepaymentDescription(CompleteFunctionality: Boolean; PurchaseHeader: Record "Purchase Header"; var TempPrepmtPurchLine: Record "Purchase Line"; var TempPurchLine: Record "Purchase Line")
    // begin
    //     TempPrepmtPurchLine.Description := PurchaseHeader."Posting Description";
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterCopyPurchaseDocument', '', true, true)]
    local procedure ClearWHTCertAfterCopyPurch(FromDocOccurenceNo: Integer; FromDocumentNo: Code[20]; FromDocumentType: Option; FromDocVersionNo: Integer; IncludeHeader: Boolean; MoveNegLines: Boolean; RecalculateLines: Boolean; var ToPurchaseHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
    begin
        PurchLine.Reset();
        PurchLine.setrange("Document Type", ToPurchaseHeader."Document Type");
        PurchLine.setrange("Document No.", ToPurchaseHeader."No.");
        if PurchLine.FindSet() then
            repeat
                PurchLine."NWTH WHT Certificate No." := '';
                PurchLine."NWTH WHT Report Line No" := '';
                PurchLine.Modify();
            until PurchLine.Next() = 0;
    end;

    //Cancel Order ++
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInitOutstandingQty', '', true, true)]
    local procedure RecalInitQtyaftercancel(var PurchaseLine: Record "Purchase Line")
    begin

        PurchaseLine."TC Qty. canceled" += PurchaseLine."TC Qty. to cancel";
        PurchaseLine."TC Qty. to cancel" := 0;
        PurchaseLine."Outstanding Quantity" -= PurchaseLine."TC Qty. canceled";
        PurchaseLine."Outstanding Qty. (Base)" := PurchaseLine."Outstanding Quantity";
        PurchaseLine."Qty. Rcd. Not Invoiced" -= PurchaseLine."TC Qty. canceled";
        PurchaseLine."Qty. Rcd. Not Invoiced (Base)" := PurchaseLine."Qty. Rcd. Not Invoiced";


    end;
    //Cancel Order --

    //Select Order No. Series ++
    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterInsertEvent', '', true, true)]
    // local procedure AutoAssignOrderNos(RunTrigger: Boolean; var Rec: Record "Purchase Header")
    // var
    //     NoSeries: Record "No. Series";
    //     PurchSetup: Record "Purchases & Payables Setup";

    // begin
    //     if Rec."Document Type" <> Rec."Document Type"::Quote then
    //         Exit;

    //     PurchSetup.Get();
    //     PurchSetup.TestField("Order Nos.");
    //     NoSeries.get(Rec."No. Series");
    //     // if NoSeries."NWTH Posting Nos." <> '' then
    //     //     Rec.validate("Order No. Series", NoSeries."Order Nos.")
    //     // else
    //     //     Rec.validate("Order No. Series", PurchSetup."Order Nos.");
    //     Rec.Modify();
    // end;
    //Select Order No. Series --

    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterGetNoSeriesCode', '', true, true)]
    // local procedure AssignBookOrderNoFromQuote(PurchSetup: Record "Purchases & Payables Setup"; var NoSeriesCode: Code[20]; var PurchHeader: Record "Purchase Header")
    // begin
    //     if PurchHeader."Document Type" <> PurchHeader."Document Type"::Order then
    //         exit;
    //     // if PurchHeader."Quote No." <> '' then
    //     //     if PurchHeader."Order No. Series" <> '' then
    //     //         NoSeriesCode := PurchHeader."Order No. Series";
    // end;

}