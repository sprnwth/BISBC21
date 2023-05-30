page 50019 ItemUOM
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'itemUOM';
    DelayedInsert = true;
    EntityName = 'bisitemuom';
    EntitySetName = 'bisitemuoms';
    PageType = API;
    SourceTable = "Item Unit of Measure";
    ODataKeyFields = SystemId;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(description;Rec.Description)
                {
                    
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                }
                field(packsize;Rec."Pack Size")
                {
                    
                }
                field(packuom;Rec."Pack UOM")
                {
                 
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
