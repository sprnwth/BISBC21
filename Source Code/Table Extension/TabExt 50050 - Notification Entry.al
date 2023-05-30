tableextension 50050 NotificationEntryExt extends "Notification Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Reason 1"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Reason 2"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Reason 3"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Reason 4"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }
    
    var
        myInt: Integer;
}