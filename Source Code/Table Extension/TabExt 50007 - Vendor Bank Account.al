tableextension 50007 VendorBankAccBISExt extends "Vendor Bank Account"
{
    fields
    {
        field(50000; "Bene.Ref"; Text[16])
        {
            DataClassification = ToBeClassified;
            Description = 'LL1.0';
        }
        field(50001; "Branch Code."; Text[4])
        {
            DataClassification = ToBeClassified;
            Description = 'LL1.0';
        }
        field(50002; "SMS Language"; Enum SMSLanguageType)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}