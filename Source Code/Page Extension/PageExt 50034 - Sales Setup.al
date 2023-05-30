pageextension 50034 SalesSetupBISExt extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Allow Document Deletion Before")
        {
            field("Max Overdue Date"; Rec."Max Overdue Date")
            {
                ApplicationArea = All;
            }
            field("Autoblock after create"; Rec."Autoblock after create")
            {
                ApplicationArea = All;
            }
            field("Force Sales Person by Rel."; Rec."Force Sales Person by Rel.")
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