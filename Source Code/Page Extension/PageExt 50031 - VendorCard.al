pageextension 50031 "Vendor Card" extends "Vendor Card"
{
    layout
    {
        addafter("Name 2")
        {
            field("Vendor Chain Code"; Rec."Vendor Chain Code")
            {
                ApplicationArea = All;

            }
            field("Personal ID"; Rec."Personal ID")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addafter("Ven&dor")
        {
            action("Make Address")
            {
                ApplicationArea = All;
                Image = CollapseAll;
                trigger OnAction()
                var
                    BISCU: Codeunit "BIS Main Function";
                    Vendor: Record Vendor;
                begin
                    Vendor.get(Rec."No.");

                    BISCU.MakeVendorAddressFromWHTAddress(
                                                      Vendor."NWTH Building Name",
                                                      Vendor."NWTH Room No.",
                                                      Vendor."NWTH Floor No.",
                                                      Vendor."NWTH Address No.",
                                                      Vendor."NWTH Village No.",
                                                      Vendor."NWTH Village Name",
                                                      Vendor."NWTH Alley",
                                                      Vendor."NWTH Road",
                                                      Vendor."NWTH Sub-District",
                                                      Vendor."NWTH District",
                                                      Vendor."NWTH Province",
                                                      Vendor.Address,
                                                      Vendor."Address 2",
                                                      true);
                    Vendor.Modify(true);
                    Message('Update Address');
                end;
            }
        }
    }
}
