page 50005 UpdateExtDocNoVLE
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Permissions = tabledata "VAT Entry" = m, tabledata "Vendor Ledger Entry" = m,
                    tabledata "G/L Entry" = m;

    SourceTable = "Vendor Ledger Entry";
    Editable = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;

                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    Editable = false;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Editable = true;
                    trigger OnValidate()
                    var
                        VATEntry: Record "VAT Entry";
                        GLEntry: Record "G/L Entry";
                    begin
                        VATEntry.Reset();
                        VATEntry.setrange("Document No.", Rec."Document No.");
                        VATEntry.setrange("Posting Date", Rec."Posting Date");
                        VATEntry.ModifyAll("External Document No.", Rec."External Document No.");

                        GLEntry.Reset();
                        GLEntry.setrange("Document No.", Rec."Document No.");
                        GLEntry.setrange("Posting Date", Rec."Posting Date");
                        GLEntry.modifyall("External Document No.", Rec."External Document No.");
                    end;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    Editable = false;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction();
                begin

                end;
            }
        }
    }
}