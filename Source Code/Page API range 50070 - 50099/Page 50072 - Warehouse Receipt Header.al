page 50072 WarehouseReceiptHeaderAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'biswarehousereceiptheader';
    DelayedInsert = true;
    EntityName = 'biswarehousereceiptheader';
    EntitySetName = 'biswarehousereceiptheaders';
    PageType = API;
    SourceTable = "Warehouse Receipt Header";
    ODataKeyFields = SystemId;
    Permissions = TableData "Warehouse Receipt Header" = RIMD;

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
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
