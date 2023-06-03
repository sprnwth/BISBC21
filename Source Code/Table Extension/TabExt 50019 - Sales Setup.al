tableextension 50019 SalesSetupBISExt extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Max Overdue Date"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Autoblock after create"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Force Sales Person by Rel."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "ISO for SI"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}