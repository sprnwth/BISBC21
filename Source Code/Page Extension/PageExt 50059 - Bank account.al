pageextension 50059 PageExtBankAccount extends "Bank Account Card"
{
    layout
    {
        addafter("Home Page")
        {
            field("SMS Language"; Rec."SMS Language")
            {
                ApplicationArea = all;
                Editable = true;
                Importance = Promoted;
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