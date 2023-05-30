tableextension 50041 "Transfer Receipt Ext" extends "Transfer Receipt Header"
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