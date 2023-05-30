query 50008 SalePriceAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    EntityName = 'bisSalePrice';
    EntitySetName = 'bisSalesPrices';
    QueryType = API;
    DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(salesPrice; "Sales Price")
        {
            column(itemNo; "Item No.")
            {
            }
            column(salesCode; "Sales Code")
            {
            }
            column(currencyCode; "Currency Code")
            {
            }
            column(startingDate; "Starting Date")
            {
            }
            column(unitPrice; "Unit Price")
            {
            }
            column(priceIncludesVAT; "Price Includes VAT")
            {
            }
            column(allowInvoiceDisc; "Allow Invoice Disc.")
            {
            }
            column(vatBusPostingGrPrice; "VAT Bus. Posting Gr. (Price)")
            {
            }
            column(salesType; "Sales Type")
            {
            }
            column(minimumQuantity; "Minimum Quantity")
            {
            }
            column(maxquantity; "Max Quantity")
            {

            }
            column(endingDate; "Ending Date")
            {
            }

            column(unitOfMeasureCode; "Unit of Measure Code")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(allowLineDisc; "Allow Line Disc.")
            {
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
