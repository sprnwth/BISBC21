pageextension 50028 ShiptoCardExt extends "Ship-to Address"
{
    layout
    {
        // Add changes to page layout here
        addafter("Address 2")
        {
            field(Thambon; Rec.Thambon)
            {
                ApplicationArea = All;

            }
            field(Amphur; Rec.Amphur)
            {
                ApplicationArea = All;

            }
            field("Default Code"; Rec."Default Code")
            {
                ApplicationArea = All;
                trigger Onvalidate()
                var
                    Customer: Record Customer;
                begin
                    if Customer.get(Rec."Customer No.") then begin
                        Customer.validate("Ship-to Code", Rec.Code);
                        Customer.Modify(true);
                    end;
                end;
            }
            field("Receive Good Condition"; Rec."Receive Good Condition")
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