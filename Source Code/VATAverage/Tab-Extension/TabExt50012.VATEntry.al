tableextension 50012 VATEntryExt extends "VAT Entry"
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
      
    }

}
