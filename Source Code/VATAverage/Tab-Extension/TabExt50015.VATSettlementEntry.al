tableextension 50015 VATSettlementExt extends "NWTH Settlement Entry"
{

    fields
    {
        modify("Settlement No.")
        {
            TableRelation = "NWTH Settlement Card"."Settlement No.";
        }

        field(60100; "Credit Base"; Decimal)
        {
            Caption = 'Credit Base';
            DataClassification = ToBeClassified;
        }
        field(60101; "Original VAT Amount"; Decimal)
        {
            Caption = 'Original VAT Amount';
            DataClassification = ToBeClassified;
        }
        field(60102; "Remark"; Text[100])
        {
            Caption = 'Remark';
            DataClassification = ToBeClassified;
        }
        field(60103; TaxDate; Date)
        {
            Caption = 'TaxDate';
            DataClassification = ToBeClassified;
        }
        modify("Customer/Vendor No.")
        {
            trigger OnAfterValidate()
            var
                Customer: Record Customer;
                Vendor: Record Vendor;
            begin
                if "VAT Type" = "VAT Type"::Purchase then begin
                    if Vendor.get("Customer/Vendor No.") then begin
                        "Customer/Vendor Name" := vendor.Name;
                        "VAT Registration No." := Vendor."VAT Registration No.";
                        "NWTH Branch Code" := Vendor."NWTH Branch Code";
                    end;
                end else
                    if "VAT Type" = "VAT Type"::Sale then begin
                        if Customer.get("Customer/Vendor No.") then begin
                            "Customer/Vendor Name" := customer.Name;
                            "VAT Registration No." := Customer."VAT Registration No.";
                            "NWTH Branch Code" := Customer."NWTH Branch Code";
                        end;
                    end;
            end;
        }


    }

    keys
    {
        key(key7; TaxDate)
        {


        }
        key(Key8; "Settlement No.", "Document Date", "Document No.")
        {

        }
        key(Key9; "Settlement No.", "Document Date", "External Document No.")
        {

        }
        key(Key10; "Settlement No.", "Posting Date", "Document No.")
        {

        }

    }
    var
        myInt: Integer;
}