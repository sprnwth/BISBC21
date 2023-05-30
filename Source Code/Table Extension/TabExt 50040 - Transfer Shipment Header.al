tableextension 50040 "Transfer Shipment Ext" extends "Transfer Shipment Header"
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