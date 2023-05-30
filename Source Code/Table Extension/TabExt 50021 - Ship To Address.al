tableextension 50021 ShiptoAddrBISExt extends "Ship-to Address"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Thambon"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Amphur"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Receive Good Condition"; Text[150])
        {
            Caption = 'เงื่อนไขรับสินค้า';
            DataClassification = ToBeClassified;
        }
        field(50003; "Default Code"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Customer: Record Customer;
                ShiptoAddress: Record "Ship-to Address";
            begin
                if Customer.get("Customer No.") then begin
                    Customer."Ship-to Code" := Code;
                    Customer.Modify(true);

                    ShiptoAddress.Reset();
                    ShiptoAddress.setrange("Customer No.", "Customer No.");
                    ShiptoAddress.ModifyAll("Default Code", false);
                end;

            end;
        }

    }

    var
        myInt: Integer;
}