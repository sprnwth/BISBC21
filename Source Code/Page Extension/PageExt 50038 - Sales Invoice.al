pageextension 50038 SalesInvBISExt extends "Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("Interface Document"; Rec."Interface Document")
            {
                ApplicationArea = All;

            }
        }
        addbefore("Salesperson Code")
        {
            field("BIS Sales Person"; Rec."BIS Sales Person")
            {
                ApplicationArea = All;

            }
        }
        addafter("External Document No.")
        {
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;

            }
            field("Posting No. Series"; Rec."Posting No. Series")
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