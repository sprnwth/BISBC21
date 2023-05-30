pageextension 50027 CustomerListBISExt extends "Customer List"
{
    layout
    {

        // Add changes to page layout here
        modify("Payment Terms Code")
        {
            Visible = true;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = true;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = true;
        }
        modify(Blocked)
        {
            Visible = true;
        }

        addafter("Phone No.")
        {
            // field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code") //Customer Area
            // {
            //     ApplicationArea = All;
            // }
            field(Longtitue; Rec.Longtitue)
            {
                ApplicationArea = All;
            }
            field(Latitude; Rec.Latitude)
            {
                ApplicationArea = All;
            }
            field("Registered Date"; Rec."Registered Date")
            {
                ApplicationArea = All;
            }
            field("Business Type"; Rec."Business Type")
            {
                ApplicationArea = All;
            }
            field(Grade; Rec.Grade)
            {
                ApplicationArea = All;
            }
            field("Reference Number"; Rec."Reference Number")
            {
                ApplicationArea = All;
            }
            field("Item Group Type"; Rec."Item Group Type")
            {
                ApplicationArea = All;
            }
            field("Est. Monthly Sales"; Rec."Est. Monthly Sales")
            {
                ApplicationArea = All;
            }
            field("Reference No."; Rec."Reference No.")
            {
                ApplicationArea = All;
            }
            field("Customer Chain Code"; Rec."Customer Chain Code")
            {
                ApplicationArea = All;
            }
            field(Authorization; Rec.Authorization)
            {
                ApplicationArea = All;
            }
            field("Personal ID"; Rec."Personal ID")
            {
                ApplicationArea = All;
            }
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(Reports)
        {
            action("การ์ดลูกหนี้")
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                var
                    CustomerCredit: Report "Customer Credit";
                begin
                    CustomerCredit.Run();
                end;
            }
        }
    }

}