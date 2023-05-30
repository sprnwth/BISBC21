pageextension 50014 GenJnlBatch extends "General Journal Batches"
{
    layout
    {
        addafter(Description)
        {
            field("Ebanking Type"; Rec."Ebanking Type")
            {
                ApplicationArea = All;
            }
            field("Incl. status"; Rec."Incl. status")
            {
                ApplicationArea = All;
            }

        }
    }
}
