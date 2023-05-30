pageextension 50006 CheckLedgerEntryBISEXT extends "Check Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Check No.")
        {
            field("Check Status"; Rec."Check Status")
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
            field("Submit Cheque Control"; Rec."Submit Cheque Control")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

    }


    actions
    {
        // Add changes to page actions here
        addafter("Chec&k")
        {
            action("Reopen Cheque Control")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CheckLedgerEntry: Record "Check Ledger Entry";
                begin
                    CheckLedgerEntry.get(Rec."Entry No.");
                    CheckLedgerEntry."Submit Cheque Control" := false;
                    CheckLedgerEntry.Modify();
                end;
            }
        }
    }

    var
        myInt: Integer;
}