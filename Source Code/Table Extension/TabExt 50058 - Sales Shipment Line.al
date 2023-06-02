tableextension 50058 TableExtensionSalesShipmtLine extends "Sales Shipment Line"
{
    fields
    {
        field(50055; "Invoice No."; code[20])
        {
            FieldClass = FlowField;
            //CalcFormula = lookup("Sales Line"."Document No." where("Shipment No." = field("No.")));
            CalcFormula = lookup("Sales Invoice Header"."No." where("Order No." = field("Order No.")));
        }
        field(50002; "Vendor No."; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Vendor No." where("No." = field("No.")));
        }
    }




    var
        myInt: Integer;
}