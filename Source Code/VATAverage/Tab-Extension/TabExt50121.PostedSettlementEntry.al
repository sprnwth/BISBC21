tableextension 50121 TableExtension60121 extends "NWTH Posted Settlement Entry"
{
    fields
    {
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

    }
    keys
    {
        key(key7; TaxDate)
        {
        }
        key(Key8; "Settlement No.", "Document Date", "Document No.")
        {

        }
    }
    var
        myInt: Integer;
}