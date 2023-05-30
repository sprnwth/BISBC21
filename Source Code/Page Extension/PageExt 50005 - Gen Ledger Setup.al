pageextension 50005 GenLedgerSetupBISExt extends "General Ledger Setup"
{
    layout
    {
        
        // Add changes to page layout here
        addafter("Bank Account Nos.")
        {
            field("Check Return G/L Account No.";Rec."Check Return G/L Account No.")
            {
                ApplicationArea = All;
                
            }
            field("Check Change G/L Account No.";Rec."Check Change G/L Account No.")
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