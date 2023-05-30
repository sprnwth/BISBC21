tableextension 50010 VATPostingSetup extends "VAT Posting Setup"
{
    fields
    {
        //ACC02   24.10.2020   SSI +
        field(60100; "AVG. VAT %"; Boolean)
        {
            Caption = 'AVG. VAT %';
            DataClassification = ToBeClassified;
        }
        field(60101; "AVG. VAT Starting Date"; Date)
        {
            Caption = 'AVG. VAT Starting Date';
            DataClassification = ToBeClassified;
        }
        field(60102; "AVG. VAT Ending Date"; Date)
        {
            Caption = 'AVG. VAT Ending Date';
            DataClassification = ToBeClassified;
        }
        field(60103; "Of VAT %"; Integer)
        {
            Caption = 'Of VAT %';
            DataClassification = ToBeClassified;
        }
        field(60104; "Default NO VAT Code"; Code[20])
        {
            Caption = 'Default NO VAT Code';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";
        }
        field(60105; "AVG Unclaim VAT"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        //ACC02   24.10.2020   SSI -
        field(60106; "AVG Claim Base Percent"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60107; "AVG Unclaim Base Percent"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}
