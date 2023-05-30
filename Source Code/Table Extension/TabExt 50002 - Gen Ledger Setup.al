tableextension 50002 GenLedgerSetupBISExt extends "General Ledger Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Check Return G/L Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(50001; "Check Change G/L Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
    }
    
    var
        myInt: Integer;
}