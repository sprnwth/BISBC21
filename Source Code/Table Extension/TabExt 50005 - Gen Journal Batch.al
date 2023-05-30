tableextension 50005 GenJnlBatchBISExt extends "Gen. Journal Batch"
{
    fields
    {
        field(50000; "Ebanking Type"; Enum "Product Ebanking")
        {
            DataClassification = ToBeClassified;
            Description = 'NWTH1.0';
        }
        field(50001; Status; Enum GenJnlStatus)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Incl. status"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}