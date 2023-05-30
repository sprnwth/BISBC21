page 50074 WarehouseShipmentHeaderAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'biswarehouseshipmentheader';
    DelayedInsert = true;
    EntityName = 'biswarehouseshipmentheader';
    EntitySetName = 'biswarehouseshipmentheaders';
    PageType = API;
    SourceTable = "Warehouse Shipment Header";
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
                field(PostingDate; Rec."Posting Date")
                {
                    Caption = 'Code';
                }
                field(Status; Rec.Status)
                {
                    Caption = 'Code';
                }
                field(ShipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Code';
                }
                field(ShipmentDate; Rec."Shipment Date")
                {
                    Caption = 'SystemId';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
