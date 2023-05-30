tableextension 50004 EmployeeLedgerEntryBISExt extends "Employee Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
       
        field(50000; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Payment Term Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms";
        }
    }
    
    var
        myInt: Integer;
}