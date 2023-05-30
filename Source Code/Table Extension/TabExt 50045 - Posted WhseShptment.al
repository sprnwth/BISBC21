tableextension 50045 "Posted WhseShptment Ext " extends "Posted Whse. Shipment Header"
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