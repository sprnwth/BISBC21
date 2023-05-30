tableextension 50018 ItemVendor extends "Item Vendor"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Chain Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Chain Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    
    var
        myInt: Integer;
}