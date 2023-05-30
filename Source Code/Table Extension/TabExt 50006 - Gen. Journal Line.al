tableextension 50006 GenJnlLineBISExt extends "Gen. Journal Line"
{
    fields
    {
        field(50002; "Charges For A/C of"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'LL1.0';
            OptionCaption = 'N,Y';
            OptionMembers = N,Y;
        }
        field(50003; "Advice Mode"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'LL1.0';
            OptionMembers = E,F;
        }
        field(50004; "Cheque Bank Name"; Enum CheckBankName)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Cheque Branch Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        //ApproveGenJnl
        field(50006; Status; Enum GenJnlStatus)
        {
            DataClassification = ToBeClassified;
        }
        //ApproveGenJnl
    }
}