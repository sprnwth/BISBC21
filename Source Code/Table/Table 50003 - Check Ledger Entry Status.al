table 50003 "Check Ledger Status"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Check Ledger Status";
    DrillDownPageId = "Check Ledger Status";
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Check Ledger Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Source No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Check No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Check Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Status"; Enum "Check Ledger Status")
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Bank Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = customer;
        }
        field(9; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: record "G/L Account";

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}