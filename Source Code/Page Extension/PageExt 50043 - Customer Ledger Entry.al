pageextension 50043 CustLedgerEnExt extends "Customer Ledger Entries"
{
    layout
    {
        addafter("NWTH Check-Collecting Date")
        {
            field("Cheque No."; Rec."Cheque No.")
            {
                ApplicationArea = All;
            }
            field("Cheque Date"; Rec."Cheque Date")
            {
                ApplicationArea = All;
            }

            field("Cheque Bank Name"; Rec."Cheque Bank Name")
            {
                ApplicationArea = All;
            }
            field("Cheque Branch Name"; Rec."Cheque Branch Name")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}