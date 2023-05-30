pageextension 50101 "PageExt VAT Posting Setup List" extends "VAT Posting Setup"
{
    layout
    {
        addafter("Tax Category")
        {
            field("AVG. VAT %"; rec."AVG. VAT %")
            {
                ApplicationArea = all;
            }
            field("Of VAT %"; Rec."Of VAT %")
            {
                ApplicationArea = all;

            }
            field("AVG. VAT Starting Date"; Rec."AVG. VAT Starting Date")
            {
                ApplicationArea = all;
            }
            field("AVG. VAT Ending Date"; Rec."AVG. VAT Ending Date")
            {
                ApplicationArea = all;
            }
            field("Default NO VAT Code"; Rec."Default NO VAT Code")
            {
                ApplicationArea = all;
            }
            field("AVG Unclaim VAT";Rec."AVG Unclaim VAT")
            {
                ApplicationArea = All;
                Caption = 'AVG Unclaim Account';
               
            }
            field("AVG Claim Base Percent";Rec."AVG Claim Base Percent")
            {
                ApplicationArea = All;
                
                
            }
            field("AVG Unclaim Base Percent";Rec."AVG Unclaim Base Percent")
            {
                ApplicationArea = All;
                
            }
        }

    }
}
