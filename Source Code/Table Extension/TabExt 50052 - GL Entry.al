tableextension 50052 GLEntryBISExt extends "G/L Entry"
{
    fields
    {
        // Add changes to table fields here
        field(60500; "Direct Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(60501; "Direct Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}