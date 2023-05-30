pageextension 50074 GLEntryPreviewExt extends "G/L Entries Preview"
{
    layout
    {
        // Add changes to page layout here
        addafter("Source Code")
        {
            field("Direct Customer No."; Rec."Direct Customer No.")
            {
                ApplicationArea = All;

            }
            field("Direct Vendor No."; Rec."Direct Vendor No.")
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