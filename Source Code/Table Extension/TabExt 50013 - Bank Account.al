tableextension 50023 BankAccountBISExt extends "Bank Account"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Book Type"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Bank Branch Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "SMS Language"; Enum SMSLanguageType)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}