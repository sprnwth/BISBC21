tableextension 50059 SalesPriceExt extends "Sales Price"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Max Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    
    var
        myInt: Integer;
}