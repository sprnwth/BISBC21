tableextension 50020 NoSeriesBISExt extends "No. Series"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Draft Quote"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Confirm Quote"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Draft Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Confirm Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "From Sales Shipment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}