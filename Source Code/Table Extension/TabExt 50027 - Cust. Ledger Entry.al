tableextension 50027 CustledEntryBISExt extends "Cust. Ledger Entry"
{
    fields
    {
        // Add changes to table fields here

        field(50004; "Cheque Bank Name"; Enum CheckBankName)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Cheque Branch Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Cheque No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Cheque Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        // field(50008; "Overdue date"; Date)
        // {
        //     DateFormula = true;
        //     CalcFormula = count()
        // }


    }

    var
        myInt: Integer;
}