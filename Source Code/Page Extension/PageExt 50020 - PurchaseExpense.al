pageextension 50020 PurchaseExpense extends "NWTH Purchase Expense"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;

            }
        }
    }
}
