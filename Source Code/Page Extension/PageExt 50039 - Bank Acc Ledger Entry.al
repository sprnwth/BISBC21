pageextension 50039 BankAccLedPageExt extends "Bank Account Ledger Entries"
{
    layout
    {
        addafter(Open)
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