tableextension 50030 Employee extends Employee
{
    fields
    {
        field(50000; "Payment Terms Code"; Code[20])
        {
            Caption = 'Payment Terms Code';
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms";
        }
        field(50001; "Employee Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "username"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";

        }
        field(50003; "Password"; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "SMS Language"; Enum SMSLanguageType)
        {
            DataClassification = ToBeClassified;
        }


    }
}
