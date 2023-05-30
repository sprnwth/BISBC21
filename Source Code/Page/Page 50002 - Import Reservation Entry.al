// page 50002 "Import Reservation Entry"
// {
//     PageType = List;
//     // ApplicationArea = All;
//     // UsageCategory = Lists;
//     SourceTable = "Import Reservation Entry";

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field("Entry No."; Rec."Entry No.")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field(Positive; Rec.Positive)
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Source Type"; Rec."Source Type")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Source Subtype"; Rec."Source Subtype")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Source ID"; Rec."Source ID")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Source Batch Name"; Rec."Source Batch Name")
//                 {
//                     ApplicationArea = All;


//                 }
//                 field("Source Ref. No."; Rec."Source Ref. No.")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Item No.";Rec."Item No.")
//                 {
//                     ApplicationArea = All;
                    
//                 }
//                 field("Location Code"; Rec."Location Code")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Lot No."; Rec."Lot No.")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Item Tracking"; Rec."Item Tracking")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Warranty Date"; Rec."Warranty Date")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Expiration Date"; Rec."Expiration Date")
//                 {
//                     ApplicationArea = All;

//                 }

//             }
//         }
//         area(Factboxes)
//         {

//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action("Import Physical Inventory")
//             {
//                 ApplicationArea = All;
//                 Image = Import;
//                 trigger OnAction();
//                 var
//                     CreateReservEntry: codeunit "Create Reserv. Entry";
//                     ImportReservEntry: Record "Import Reservation Entry";
//                     TempReserveEntry: Record "Reservation Entry" temporary;
//                     ItemJnlLineReserve: codeunit "Item Jnl. Line-Reserve";
//                     PhyItemJnlLine: Record "Item Journal Line";
//                     Phy : Report "Calculate Inventory";
                  
//                 begin
//                     ImportReservEntry.Reset();
//                     if ImportReservEntry.FindSet() then
//                         repeat
//                             TempReserveEntry.Reset();
//                             TempReserveEntry.Init();
//                             TempReserveEntry.TransferFields(ImportReservEntry);
//                             TempReserveEntry.Insert();
//                         until ImportReservEntry.Next() = 0;

//                     TempReserveEntry.Reset();
//                     if TempReserveEntry.FindSet() then
//                         repeat
                       
//                             CreateReservEntry.SetDates(TempReserveEntry."Warranty Date", TempReserveEntry."Expiration Date");
//                             CreateReservEntry.CreateReservEntryFor(
//                                 Database::"Item Journal Line", TempReserveEntry."Source Subtype",
//                                 TempReserveEntry."Source ID",
//                                 TempReserveEntry."Source Batch Name",
//                                 0,
//                                 TempReserveEntry."Source Ref. No.",
//                                 TempReserveEntry."Qty. per Unit of Measure",
//                                 TempReserveEntry.Quantity,
//                                 TempReserveEntry.Quantity * TempReserveEntry."Qty. per Unit of Measure",
//                                 TempReserveEntry);
//                             CreateReservEntry.CreateEntry(
//                               TempReserveEntry."Item No.",
//                               TempReserveEntry."Variant Code",
//                               TempReserveEntry."Location Code",
//                               '',
//                               0D
//                               ,
//                               0D,
//                                0,
//                                TempReserveEntry."Reservation Status"::Prospect);

//                         until TempReserveEntry.Next() = 0;
//                     Message('Imported.');
//                 end;
//             }
//         }
//     }
// }