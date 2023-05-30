tableextension 50035 "Inventory Setup" extends "Inventory Setup"
{
    fields
    {
        field(50000; "Register Item Nos."; Code[20])
        {
            Caption = 'Register Item Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
