tableextension 50056 VATProdPostingGroupExt extends "VAT Product Posting Group"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Default NON VAT Sale"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    
    var
        myInt: Integer;
}