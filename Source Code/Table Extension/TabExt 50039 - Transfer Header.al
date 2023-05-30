tableextension 50039 "Transfer Header Ext" extends "Transfer Header"
{
    fields
    {
        field(50000; "Reason Code"; Code[30])
        {
            Caption = 'Reason Code';
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";
        }
    }
}