tableextension 50053 PurchRcptLineExt extends "Purch. Rcpt. Line"
{
    fields
    {
        // Add changes to table fields here
        field(50053; "Vendor Shipment No."; Code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Rcpt. Header"."Vendor Shipment No." where("No." = field("Document No.")));
        }

    }

    var
        myInt: Integer;
}