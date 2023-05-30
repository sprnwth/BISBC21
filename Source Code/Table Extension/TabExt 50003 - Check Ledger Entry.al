tableextension 50003 CheckLedgerEntryBISExt extends "Check Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Check Status"; enum "Check Ledger Status")
        {
            FieldClass = FlowField;
            CalcFormula = max("Check Ledger Status".Status where("Check Ledger Entry No." = field("Entry No.")));

        }
        field(50001; "Source Table"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Source No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Cheque Bank Name"; Enum CheckBankName)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Cheque Branch Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Submit Cheque Control"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()

            begin
                if Rec."Submit Cheque Control" then begin
                    if Not Confirm('ยืนยันการ Submit') then
                        Error('Cancel');
                end;
            end;
        }

    }

    var
        myInt: Integer;
}