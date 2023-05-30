tableextension 50057 SalesShipmentHeaderExt extends "Sales Shipment Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Invoice No."; code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Line"."Document No." where("Shipment No." = field("No.")));
            // CalcFormula = lookup("Sales Invoice Header"."No." where("Order No." = field("Order No.")));
        }
        field(50001; "Posted Invoice No."; code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Invoice Line"."Document No." where("Shipment No." = field("No.")));
            // CalcFormula = lookup("Sales Invoice Header"."No." where("Order No." = field("Order No.")));
        }
        field(50002; "Invoiced"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Sales Shipment Line" where("Document No." = field("No."),
                            Type = Const(Item), "Quantity Invoiced" = filter(1 ..)));
        }
    }

    var
        myInt: Integer;
}