page 50012 SalesLineAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'salesLineAPI';
    DelayedInsert = true;
    EntityName = 'bissalesline';
    EntitySetName = 'bissaleslines';
    PageType = API;
    SourceTable = "Sales Line";
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    trigger OnValidate()
                    begin
                        if (Rec."Document Type" <> Rec."Document Type"::Quote)
                                AND (Rec."Document Type" <> Rec."Document Type"::Order)
                                 Then
                            Error('Document Type must be quote or order!');
                    end;

                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                }
                field(unitofmeasurecode; Rec."Unit of Measure Code")
                {
                }
                field(uomname; Rec."UOM Name")
                {

                }
                field(locationcode; Rec."Location Code")
                {

                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(qtyshipped; Rec."Quantity Shipped")
                {

                }
                field(qtyinvoiced; Rec."Quantity Invoiced")
                {

                }
                field(outstdqty; Rec."Outstanding Quantity")
                {

                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(lineamount; Rec."Line Amount")
                {

                }
                field(lineDiscountpct; Rec."Line Discount %")
                {
                    Caption = 'Line Discount %';
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                {
                    Caption = 'Line Discount Amount';
                }
                field(discountbypercent;Rec."Discount by Percent")
                {                    
                       
                }
                field(vatpct; Rec."VAT %")
                {
                }
                field(amount; Rec.Amount)
                {

                }
                field(vatamountcal; Rec."Amount Including VAT" - Rec.Amount)
                {

                }
                field(amtincludevat; Rec."Amount Including VAT")
                {

                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }

    trigger OnAfterGetRecord()

    begin
        vatamountest := 0;
        vatamountest := round((Rec.Amount / 100) * rec."VAT %");
    end;

    var
        vatamountest: Decimal;
}
