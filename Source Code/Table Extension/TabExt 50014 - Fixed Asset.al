tableextension 50024 FABISExt extends "Fixed Asset"

{
    fields
    {
        // Add changes to table fields here
        field(50000; UnitCode ;Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
    
    var
        myInt: Integer;
}