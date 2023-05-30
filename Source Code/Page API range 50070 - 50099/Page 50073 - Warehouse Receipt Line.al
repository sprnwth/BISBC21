page 50073 WarehouseReceiptLinesAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'biswarehousereceiptline';
    DelayedInsert = true;
    EntityName = 'biswarehousereceiptline';
    EntitySetName = 'biswarehousereceiptlines';
    PageType = API;
    SourceTable = "Warehouse Receipt Line";
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec."No.")
                {
                    Caption = 'Username';
                }
                field(LocationCode; Rec."Location Code")
                {
                    Caption = 'Code';
                }
                field(SourceNo; Rec."Source No.")
                {
                    Caption = 'Code';
                }
                field(LineNo; Rec."Line No.")
                {
                    Caption = 'Code';
                }
                field(SourceType; Rec."Source Type")
                {
                    Caption = 'Code';
                }
                field(SourceLineNo; Rec."Source Line No.")
                {
                    Caption = 'Code';
                }
                field(SourceDocument; Rec."Source Document")
                {
                    Caption = 'Code';
                }
                field(Description; Rec."Description")
                {
                    Caption = 'Code';
                }
                field(ItemNo; Rec."Item No.")
                {
                    Caption = 'Code';
                }
                field(Quantity; Rec."Quantity")
                {
                    Caption = 'Code';
                }
                field(DueDate; Rec."Due Date")
                {
                    Caption = 'Code';
                }
                field(UnitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Code';
                }
                field(SourceSubtype; Rec."Source Subtype")
                {
                    Caption = 'Code';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(QtyToReceive; Rec."Qty. to Receive")
                {
                    Caption = 'Qty. to Receive ';
                }
                field(BinCode; Rec."Bin Code")
                {
                    Caption = 'Qty. to Ship ';
                }
            }
        }
    }
}
