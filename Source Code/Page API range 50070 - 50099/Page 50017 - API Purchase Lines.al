page 50017 ApiPageName
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'purchaseline';
    DelayedInsert = true;
    EntityName = 'bispurchaseline';
    EntitySetName = 'bispurchaselines';
    PageType = API;
    SourceTable = "Purchase Line";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(SystemId; Rec.SystemId)
                {
                }
                field(LineType; Rec.Type)
                {
                }
                field(DocumentType; Rec."Document Type")
                {
                }
                field(DocumentNo; Rec."Document No.")
                {
                }
                field(No; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(GenBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                }
                field(GenProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                }
                field(OrderDate; Rec."Order Date")
                {
                }
                field(VatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                }
                field(PostissngDate; Rec."VAT Prod. Posting Group")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field(UnitOfMeasureCode; Rec."Unit of Measure Code")
                {
                }
                field(UnitPriceLcy; Rec."Unit Price (LCY)")
                {
                }
                field(VatBaseAmount; Rec."VAT Base Amount")
                {
                }
                field(LineNo; Rec."Line No.")
                {
                }
            }
        }
    }
}