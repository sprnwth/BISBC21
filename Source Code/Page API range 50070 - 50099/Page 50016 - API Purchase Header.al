page 50016 "API Purchase Header"
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'purchaseheader';
    DelayedInsert = true;
    EntityName = 'bispurchaseheader';
    EntitySetName = 'bispurchaseheaders';
    PageType = API;
    SourceTable = "Purchase Header";
    ODataKeyFields = SystemId;
    Editable = true;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(DocumentType; Rec."Document Type")
                {
                }
                field(SystemId; Rec.SystemId)
                {
                }
                field(No; Rec."No.")
                {
                }

                field(VendorInvoiceNo; Rec."Vendor Invoice No.")
                {

                }
                field(VendorOrderNo; Rec."Vendor Order No.")
                {

                }
                field(BuyVendorName; Rec."Buy-from Vendor Name")
                {

                }
                field(SellToCustomerNo; Rec."Sell-to Customer No.")
                {

                }
                field(DueDate; Rec."Due Date")
                {

                }
                field(OrderDate; Rec."Order Date")
                {

                }
                field(PostingDate; Rec."Posting Date")
                {

                }
                field(BuyFromVendorNo; Rec."Buy-from Vendor No.")
                {
                }
                field(DocumentDate; Rec."Document Date")
                {
                }
            }
        }
    }
}