pageextension 50004 PaymentJournalBISExt extends "Payment Journal"
{
    layout
    {
        addfirst(Control1)
        {
            field(Status; Rec.Status)
            {
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
        }
        // Add changes to page layout here
        addafter("Recipient Bank Account")
        {
            field("Advice Mode"; Rec."Advice Mode")
            {
                ApplicationArea = All;
            }
            field("Charges For A/C of"; Rec."Charges For A/C of")
            {
                ApplicationArea = All;
            }
        }
        addafter("Payment Method Code")
        {
            field("Payment Terms Code"; Rec."Payment Terms Code")
            {
                ApplicationArea = All;

            }
            field("NWTH Customer Direct Jnl"; Rec."NWTH Customer Direct Jnl")
            {
                ApplicationArea = All;

            }
            field("NWTH Vendor Direct Jnl"; Rec."NWTH Vendor Direct Jnl")
            {
                ApplicationArea = All;

            }
        }
        addafter("NWTH Cheque No.")
        {
            field("Cheque Bank Name"; Rec."Cheque Bank Name")
            {
                ApplicationArea = All;
            }
            field("Cheque Branch Name"; Rec."Cheque Branch Name")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addbefore(SendApprovalRequest)
        {
            action("Reopen")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    GenJnlLine: Record "Gen. Journal Line";
                    RestrictedRecord: Record "Restricted Record";
                    AppMgt: codeunit "Approvals Mgmt.";
                    RecRestrictedMgt: codeunit "Record Restriction Mgt.";
                    RestrictUsageDetailsTxt: Label 'The restriction was imposed by the %1 workflow, %2.';
                begin
                    CurrPage.SetSelectionFilter(GenJnlLine);
                    if GenJnlLine.FindSet() then
                        repeat
                            GenJnlLine.Status := GenJnlLine.Status::Open;
                            GenJnlLine.modify();
                            RecRestrictedMgt.RestrictRecordUsage(GenJnlLine, STRSUBSTNO(RestrictUsageDetailsTxt, 'Reopen', 'Reopen'));
                        until GenJnlLine.Next() = 0;
                end;
            }
        }
        addafter(Reconcile)
        {
            action("Export Kbank")
            {
                Caption = 'Export Kbank';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    FinanceCU: Codeunit FinanceCodeunit;
                begin

                    FinanceCU.ExportKbankTextFile(Rec."Journal Template Name", Rec."Journal Batch Name");

                end;
            }
        }
    }

    var
        Page654: page 654;

    trigger OnAfterGetRecord()
    begin

    end;

    var

}