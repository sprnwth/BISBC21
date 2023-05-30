codeunit 50008 "Warehouse BIS"
{
    trigger OnRun()
    begin

    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnBeforeCreateTempItemTrkgLines', '', true, true)]
    // local procedure TestFEFO(HasExpiryDate: Boolean; ItemNo: Code[20]; Location: Record Location; var IsHandled: Boolean; var TotalQtytoPickBase: Decimal; var WhseItemTrackingFEFO: Codeunit "Whse. Item Tracking FEFO"; VariantCode: Code[10]; WhseShptLine: Record "Warehouse Shipment Line"; WhseWkshLine: Record "Whse. Worksheet Line")
    // begin
    //     Message('%1 %2 ok', ItemNo, HasExpiryDate);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnAfterPickAccordingToFEFO', '', true, true)]
    // local procedure TestFEFO2(ItemTrackingSetup: Record "Item Tracking Setup" temporary; LocationCode: Code[10]; var PickAccordingToFEFO: Boolean)
    // begin
    //     Message('%1 %2 ok PICKFEFO', LocationCode, PickAccordingToFEFO);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnBeforePickStrictExpirationPosting', '', true, true)]
    // local procedure TestFEFO1(ItemNo: Code[20]; LNRequired: Boolean; SNRequired: Boolean; var IsHandled: Boolean; var StrictExpirationPosting: Boolean)
    // begin
    //     Message('%1 %2 ok StrictExp', ItemNo, StrictExpirationPosting);
    // end;
    // //PickStrictExpirationPosting

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Item Tracking FEFO", 'OnBeforeFindFirstEntrySummaryFEFO', '', true, true)]
    // local procedure findfirstfefo(var IsFound: Boolean; var IsHandled: Boolean; var TempGlobalEntrySummary: Record "Entry Summary" temporary)
    // begin
    //     TempGlobalEntrySummary.SetCurrentKey("Expiration Date");
    //     TempGlobalEntrySummary.FindSet();
    //     repeat
    //         Message('A: %1 B :%2', TempGlobalEntrySummary."Lot No.", TempGlobalEntrySummary."Expiration Date");
    //     until TempGlobalEntrySummary.Next() = 0;

    // end;

    //For Approve not FEFO

    // [EventSubscriber(ObjectType::Page, Page::"Whse. Pick Subform", 'OnBeforeRegisterActivityYesNo', '', true, true)]
    // local procedure CheckingPickingFEFO(var IsHandled: Boolean; var WarehouseActivityLine: Record "Warehouse Activity Line")
    // var
    //     WHActiHeader: Record "Warehouse Activity Header";
    // begin
    //     WHActiHeader.Reset();
    //     WHActiHeader.setrange("No.", WarehouseActivityLine."No.");
    //     WHActiHeader.FindFirst();
    //     if Not (WHActiHeader."Approve break FEFO") then
    //         CheckIsFEFO(WarehouseActivityLine."Location Code", WarehouseActivityLine."Item No.", WarehouseActivityLine."Lot No.", WarehouseActivityLine."Expiration Date");
    // end;

    // procedure CheckIsFEFO(LocationCode: Code[10]; ItemNo: Code[20]; LotNo: Code[20]; ExpDate: Date)
    // var
    //     WhseItemTrackingFEFO: Codeunit "Whse. Item Tracking FEFO";
    //     EntrySummary: Record "Entry Summary";
    //     Location: Record Location;
    // begin
    //     Location.get(LocationCode);

    //     WhseItemTrackingFEFO.CreateEntrySummaryFEFO(Location, ItemNo, '', true);

    //     IF WhseItemTrackingFEFO.FindFirstEntrySummaryFEFO(EntrySummary) THEN BEGIN

    //         if ExpDate > EntrySummary."Expiration Date" then begin
    //             Error('You select Item %1 Lot No. %2 Expiration Date %3 which more than you have Lot No. %4 Expiration Date%5\Please confirm approve choose later lot in line',
    //                         ItemNo, LotNo, ExpDate, EntrySummary."Lot No.", EntrySummary."Expiration Date");
    //         end;
    //     end;
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Tracking Data Collection", 'OnAfterAssistEditTrackingNo', '', true, true)]
    local procedure OnAfterAssistTrackingForWarrantyDate(var TempGlobalEntrySummary: Record "Entry Summary"; var TrackingSpecification: Record "Tracking Specification")
    begin
        if TempGlobalEntrySummary."Warranty Date" <> 0D then
            TrackingSpecification."Warranty Date" := TempGlobalEntrySummary."Warranty Date";

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Tracking Management", 'OnCopyItemLedgEntryTrkgToDocLine', '', true, true)]
    local procedure OnCopyItemTrack(var ItemLedgerEntry: Record "Item Ledger Entry"; var ReservationEntry: Record "Reservation Entry")
    begin
        ReservationEntry."Warranty Date" := ItemLedgerEntry."Warranty Date";
    end;


    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Get Source Doc. Inbound", 'OnOpenWarehouseReceiptPage', '', true, true)]
    // local procedure HandleNotOpenWHRPage(ServVendDocNo: Code[20]; var GetSourceDocuments: Report "Get Source Documents"; var IsHandled: Boolean; WarehouseReceiptHeader: Record "Warehouse Receipt Header")
    // begin
    //     IsHandled := true;
    // end;
    //OnAfterTransferItemTrkgFields
    //OnBeforeTempWhseItemTrkgLineInsert
    //OnAfterCopyTrackingFromWhseItemTrackingLine

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnBeforeWhseActivLineInsert', '', true, true)]
    local procedure AssignWarrantybyPickingFEFO(var WarehouseActivityLine: Record "Warehouse Activity Line"; WarehouseActivityHeader: Record "Warehouse Activity Header")
    var
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        Location: Record Location;
        ItemTrackingSetup: Record "Item Tracking Setup";
        WarrantyDate: Date;
    begin

        if Location.get(WarehouseActivityLine."Location Code") then;

        ItemTrackingSetup."Serial No." := WarehouseActivityLine."Serial No.";
        ItemTrackingSetup."Lot No." := WarehouseActivityLine."Lot No.";
        if ItemTrackingMgt.GetWhseWarrantyDate(
                                            WarehouseActivityLine."Item No.",
                                            '', //Vairant
                                            Location,
                                            ItemTrackingSetup,
                                            WarrantyDate
                                            ) then begin
            WarehouseActivityLine.Validate("Warranty Date", WarrantyDate);
        end;


    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", 'OnCreateWhseDocPlaceLineOnBeforeWhseActivLineInsert', '', true, true)]
    local procedure AssignWarrantyPickPlaceFEFO(var WarehouseActivityLine: Record "Warehouse Activity Line")
    var
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        Location: Record Location;
        ItemTrackingSetup: Record "Item Tracking Setup";
        WarrantyDate: Date;
    begin

        if Location.get(WarehouseActivityLine."Location Code") then;

        ItemTrackingSetup."Serial No." := WarehouseActivityLine."Serial No.";
        ItemTrackingSetup."Lot No." := WarehouseActivityLine."Lot No.";
        if ItemTrackingMgt.GetWhseWarrantyDate(
                                            WarehouseActivityLine."Item No.",
                                            '', //Vairant
                                            Location,
                                            ItemTrackingSetup,
                                            WarrantyDate
                                            ) then begin
            WarehouseActivityLine.Validate("Warranty Date", WarrantyDate);
        end;


    end;


    var
        myInt: codeunit "Create Pick";
}