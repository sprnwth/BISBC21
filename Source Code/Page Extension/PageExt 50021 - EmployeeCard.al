pageextension 50021 "Employee Card" extends "Employee Card"
{
    layout
    {
        addafter(General)
        {
            group(BIS)
            {
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;

                }
                field(username; Rec.username)
                {
                    ApplicationArea = All;
                }
                field(Password; Rec.Password)
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                }
                field("SMS Language"; Rec."SMS Language")
                {
                       ApplicationArea = all;
                Editable = true;
                Importance = Promoted;
                }
            }
        }
        addafter("Employee Posting Group")
        {
            field("Payment Terms Code"; Rec."Payment Terms Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
