pageextension 50008 VendorLedgerEntryBISEXT extends "Vendor Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter(AppliedEntries)
        {
            action("Update External Document No.")
            {
                ApplicationArea = All;
                Image = UpdateDescription;
                trigger OnAction()
                begin
                    page.run(Page::UpdateExtDocNoVLE, Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}