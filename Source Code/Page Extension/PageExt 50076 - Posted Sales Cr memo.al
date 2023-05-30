pageextension 50076 PageExtPsdSalesCrMemo extends "Posted Sales Credit Memos"
{
    layout
    {
        addafter("NWTH Company Branch Code")
        {
            field("BIS Comment"; Rec."BIS Comment")
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