page 50036 "Check Status Control AP"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Check Ledger Entry";
    DeleteAllowed = false;
    SourceTableView = where("Bal. Account Type" = const(Vendor)
                        , "Entry Status" = filter(<> Voided & <> "Financially Voided")
                        , "Submit Cheque Control" = const(False));

    layout
    {
        area(Content)
        {
            group("Bank Account")
            {
                ShowCaption = false;
                field("Transfer Bank Account No."; BankAcc)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account No.';
                    TableRelation = "Bank Account";
                    Lookup = true;


                }
                field(ChangeStatusTo; ChangeStatusTo)
                {
                    Caption = 'Change Status to ';
                }

            }
            repeater(GroupName)
            {
                field("NWTH PDC Check Date"; Rec."NWTH PDC Check Date")
                {

                }
                field("Posting Date"; Rec."Posting Date")
                {

                }
                field("Check No."; Rec."Check No.")
                {

                }
                field("Check Date"; Rec."Check Date")
                {

                }
                field("Document No."; Rec."Document No.")
                {

                }
                field("Document Type"; Rec."Document Type")
                {

                }
                field(Amount; Rec.Amount)
                {

                }
                field("Bank Account No."; Rec."Bank Account No.")
                {

                }
                field("Check Status"; Rec."Check Status")
                {

                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {

                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {

                }
                field("Submit Cheque Control"; Rec."Submit Cheque Control")
                {

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
            action("Change Status")
            {
                Image = Status;

                trigger OnAction();
                var
                    FNCU: Codeunit FinanceCodeunit;
                    Selection: Integer;
                    CheckStatus: Label 'Passed,Return,Change';
                    CheckLedgerEntry: Record "Check Ledger Entry";
                begin


                    case
                        ChangeStatusTo of
                        ChangeStatusTo::Passed:
                            Begin
                                CurrPage.SetSelectionFilter(CheckLedgerEntry);
                                CheckLedgerEntry.SetAutoCalcFields("Check Status");
                                if CheckLedgerEntry.FindSet() then
                                    repeat
                                        CheckLedgerEntry.TestField("Check Status", CheckLedgerEntry."Check Status"::Printed);
                                        FNCU.ChangeCheckStatusToPassed(CheckLedgerEntry, BankAcc, CheckLedgerEntry."Bal. Account Type");
                                    until CheckLedgerEntry.Next() = 0;
                            End;
                        ChangeStatusTo::Return:
                            Begin
                                CurrPage.SetSelectionFilter(CheckLedgerEntry);
                                CheckLedgerEntry.SetAutoCalcFields("Check Status");
                                if CheckLedgerEntry.FindSet() then
                                    repeat
                                        CheckLedgerEntry.TestField("Check Status", CheckLedgerEntry."Check Status"::Passed);
                                        FNCU.ChangeCheckStatusToReturn(CheckLedgerEntry, BankAcc, CheckLedgerEntry."Bal. Account Type");
                                    until CheckLedgerEntry.Next() = 0;
                            End;
                        ChangeStatusTo::Change:
                            Begin
                                CurrPage.SetSelectionFilter(CheckLedgerEntry);
                                CheckLedgerEntry.SetAutoCalcFields("Check Status");
                                if CheckLedgerEntry.FindSet() then
                                    repeat
                                        CheckLedgerEntry.TestField("Check Status", CheckLedgerEntry."Check Status"::Return);
                                        FNCU.ChangeCheckStatusToChange(CheckLedgerEntry, BankAcc, CheckLedgerEntry."Bal. Account Type");
                                    until CheckLedgerEntry.Next() = 0;
                            End;

                    end;
                    message('Completed');
                end;
            }
        }
    }
    var
        BankAcc: Code[20];
        ChangeStatusTo: Enum "Check Ledger Status";
}