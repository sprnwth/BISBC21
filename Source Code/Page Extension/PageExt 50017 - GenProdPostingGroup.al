pageextension 50017 GenProdPostingGroupBISExt extends "Gen. Product Posting Groups"
{
    layout
    {
        addafter(Description)
        {
            field("Code for Reg. Reporting";Rec."Code for Reg. Reporting")
            {
                ApplicationArea = All;
                
            }
        }
    }
}
