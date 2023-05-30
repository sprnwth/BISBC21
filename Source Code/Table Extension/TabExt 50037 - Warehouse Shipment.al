tableextension 50037 "Whse.Shipment Ext" extends "Warehouse Shipment Header"
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