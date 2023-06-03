codeunit 50001 FinanceCodeunit
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnBeforeDeleteEvent', '', true, true)]
    local procedure OnDeleteGenJnlLine(RunTrigger: Boolean; var Rec: Record "Gen. Journal Line")
    var
        RestRec: Record "Restricted Record";

    begin
        Restrec.setrange("Record ID", Rec.RecordId);
        if RestRec.findfirst then begin
            Rec.TestField(Status, Rec.Status::Open);
        end;

    end;

    procedure ChangeCheckStatusToPassed(CheckLedgerEntry: Record "Check Ledger Entry"; BankAccNo: Code[20]; BalType: Enum "Gen. Journal Account Type")
    var
        GenJournalLineL: Record "Gen. Journal Line";
        GenSetup: Record "General Ledger Setup";
        BankAcc: Record "Bank Account";
        NWTHThaiLocalizationSetupL: Record "NWTH Thai Localization Setup";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        CheckLedgerStatus: Record "Check Ledger Status";
        GenJnlPostLineL: Codeunit "Gen. Jnl.-Post Line";
        EntryNo: Integer;
        AmountToPost: Decimal;


    begin
        if CheckLedgerEntry."Check Status" = CheckLedgerEntry."Check Status"::Passed then
            exit;

        BankAcc.get(BankAccNo); //รับเข้าธนาคาร
        GenSetup.get();
        GenSetup.TestField("Check Change G/L Account No.");
        GenSetup.TestField("Check Return G/L Account No.");
        NWTHThaiLocalizationSetupL.get();
        NWTHThaiLocalizationSetupL.TestField("NWTH PDC Journal Template");
        NWTHThaiLocalizationSetupL.testfield("NWTH PDC Journal Batch");

        //GenJnlTemplate.get(NWTHThaiLocalizationSetupL."NWTH PDC Journal Template");
        GenJnlTemplate.get('GENERAL');

        CheckLedgerEntry.TestField("Bank Account No."); //รับล่วงหน้า PDC
        CheckLedgerEntry.TestField("NWTH PDC Check Date");
        GenJournalLineL.INIT;

        GenJournalLineL."Journal Template Name" := GenJnlTemplate.Name;
        GenJournalLineL."Journal Batch Name" := 'DEFAULT';
        GenJournalLineL."Document No." := CheckLedgerEntry."Document No.";
        GenJournalLineL."Posting Date" := CheckLedgerEntry."NWTH PDC Check Date";

        GenJournalLineL."Account Type" := GenJournalLineL."Account Type"::"Bank Account";
        GenJournalLineL."Account No." := BankAcc."No."; //ธนาคาร Dr

        GenJournalLineL."Bal. Account Type" := GenJournalLineL."Bal. Account Type"::"Bank Account";
        GenJournalLineL."Bal. Account No." := CheckLedgerEntry."Bank Account No."; // รับล่วงหน้า Cr

        if BalType = BalType::Customer then
            AmountToPost := ABS(CheckLedgerEntry.Amount)
        else
            if BalType = BalType::Vendor then
                AmountToPost := ABS(CheckLedgerEntry.Amount);

        GenJournalLineL.VALIDATE(Amount, AmountToPost);
        GenJournalLineL."Source Code" := GenJnlTemplate."Source Code";

        CLEAR(GenJnlPostLineL);
        GenJnlPostLineL.RunWithCheck(GenJournalLineL);

        EntryNo := 0;
        if CheckLedgerStatus.FindLast() then
            EntryNo := CheckLedgerStatus."Entry No.";
        EntryNo += 1;

        CheckLedgerStatus.Init();
        CheckLedgerStatus."Entry No." := EntryNo;
        CheckLedgerStatus."Check Ledger Entry No." := CheckLedgerEntry."Entry No.";
        CheckLedgerStatus.Status := CheckLedgerStatus.Status::Passed;
        CheckLedgerStatus."Bank Account No." := BankAcc."No.";
        CheckLedgerStatus.Insert(True);

    end;


    procedure ChangeCheckStatusToReturn(CheckLedgerEntry: Record "Check Ledger Entry"; BankAccNo: Code[20]; BalType: Enum "Gen. Journal Account Type")
    var
        GenJournalLineL: Record "Gen. Journal Line";
        GenSetup: Record "General Ledger Setup";
        BankAcc: Record "Bank Account";
        NWTHThaiLocalizationSetupL: Record "NWTH Thai Localization Setup";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        CheckLedgerStatus: Record "Check Ledger Status";
        GenJnlPostLineL: Codeunit "Gen. Jnl.-Post Line";
        EntryNo: Integer;
        LastBankNo: Code[20];
        AmountToPost: Decimal;
    begin

        if CheckLedgerEntry."Check Status" = CheckLedgerEntry."Check Status"::Return then
            exit;

        //BankAcc.get(BankAccNo); // Cr ธนาคาร

        GenSetup.get();
        GenSetup.TestField("Check Change G/L Account No.");
        GenSetup.TestField("Check Return G/L Account No.");
        NWTHThaiLocalizationSetupL.get();
        NWTHThaiLocalizationSetupL.TestField("NWTH PDC Journal Template");
        NWTHThaiLocalizationSetupL.testfield("NWTH PDC Journal Batch");
        GenJnlTemplate.get('GENERAL');


        CheckLedgerEntry.TestField("Bank Account No.");

        GenJournalLineL.INIT;
        GenJournalLineL."Journal Template Name" := GenJnlTemplate.Name;
        GenJournalLineL."Journal Batch Name" := 'DEFAULT';
        GenJournalLineL."Document No." := CheckLedgerEntry."Document No.";
        GenJournalLineL."Posting Date" := CheckLedgerEntry."NWTH PDC Check Date";
        GenJournalLineL."Account Type" := GenJournalLineL."Account Type"::"G/L Account";
        GenJournalLineL."Account No." := GenSetup."Check Return G/L Account No."; //Dr Check คืน

        CheckLedgerStatus.Reset();
        CheckLedgerStatus.setrange("Check Ledger Entry No.", CheckLedgerEntry."Entry No.");
        CheckLedgerStatus.setrange(Status, CheckLedgerStatus.Status::Passed);
        CheckLedgerStatus.FindLast();
        CheckLedgerStatus.TestField("Bank Account No.");
        LastBankNo := CheckLedgerStatus."Bank Account No.";

        GenJournalLineL."Bal. Account Type" := GenJournalLineL."Bal. Account Type"::"Bank Account";
        GenJournalLineL."Bal. Account No." := CheckLedgerStatus."Bank Account No.";

        if BalType = BalType::Customer then
            AmountToPost := ABS(CheckLedgerEntry.Amount)
        else
            if BalType = BalType::Vendor then
                AmountToPost := ABS(CheckLedgerEntry.Amount);

        GenJournalLineL.VALIDATE(Amount, AmountToPost);
        GenJournalLineL."Source Code" := GenJnlTemplate."Source Code";

        CLEAR(GenJnlPostLineL);
        GenJnlPostLineL.RunWithCheck(GenJournalLineL);

        EntryNo := 0;
        if CheckLedgerStatus.FindLast() then
            EntryNo := CheckLedgerStatus."Entry No.";
        EntryNo += 1;
        CheckLedgerStatus.Init();
        CheckLedgerStatus."Entry No." := EntryNo;
        CheckLedgerStatus."Check Ledger Entry No." := CheckLedgerEntry."Entry No.";
        CheckLedgerStatus.Status := CheckLedgerStatus.Status::Return;
        CheckLedgerStatus."Bank Account No." := LastBankNo;
        CheckLedgerStatus.Insert(True);

    end;

    procedure ChangeCheckStatusToChange(CheckLedgerEntry: Record "Check Ledger Entry"; BankAccNo: Code[20]; BalType: Enum "Gen. Journal Account Type")
    var
        GenJournalLineL: Record "Gen. Journal Line";
        GenSetup: Record "General Ledger Setup";
        BankAcc: Record "Bank Account";
        NWTHThaiLocalizationSetupL: Record "NWTH Thai Localization Setup";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        CheckLedgerStatus: Record "Check Ledger Status";
        GenJnlPostLineL: Codeunit "Gen. Jnl.-Post Line";
        EntryNo: Integer;
        AmountToPost: Decimal;
    begin

        if CheckLedgerEntry."Check Status" = CheckLedgerEntry."Check Status"::Change then
            exit;

        BankAcc.get(BankAccNo);
        GenSetup.get();
        GenSetup.TestField("Check Change G/L Account No.");
        GenSetup.TestField("Check Return G/L Account No.");
        NWTHThaiLocalizationSetupL.get();
        NWTHThaiLocalizationSetupL.TestField("NWTH PDC Journal Template");
        NWTHThaiLocalizationSetupL.testfield("NWTH PDC Journal Batch");
        GenJnlTemplate.get('GENERAL');

        CheckLedgerEntry.TestField("Bank Account No.");
        GenJournalLineL.INIT;
        GenJournalLineL."Journal Template Name" := GenJnlTemplate.Name;
        GenJournalLineL."Journal Batch Name" := 'DEFAULT';
        GenJournalLineL."Document No." := CheckLedgerEntry."Document No.";
        GenJournalLineL."Posting Date" := CheckLedgerEntry."NWTH PDC Check Date";
        GenJournalLineL."Account Type" := GenJournalLineL."Account Type"::"Bank Account";
        GenJournalLineL."Account No." := BankAcc."No.";
        GenJournalLineL."Bal. Account Type" := GenJournalLineL."Bal. Account Type"::"G/L Account";
        GenJournalLineL."Bal. Account No." := GenSetup."Check Change G/L Account No.";

        if BalType = BalType::Customer then
            AmountToPost := ABS(CheckLedgerEntry.Amount)
        else
            if BalType = BalType::Vendor then
                AmountToPost := ABS(CheckLedgerEntry.Amount);

        GenJournalLineL.VALIDATE(Amount, AmountToPost);
        GenJournalLineL."Source Code" := GenJnlTemplate."Source Code";

        CLEAR(GenJnlPostLineL);
        GenJnlPostLineL.RunWithCheck(GenJournalLineL);

        EntryNo := 0;
        if CheckLedgerStatus.FindLast() then
            EntryNo := CheckLedgerStatus."Entry No.";
        EntryNo += 1;

        CheckLedgerStatus.Init();
        CheckLedgerStatus."Entry No." := EntryNo;
        CheckLedgerStatus."Check Ledger Entry No." := CheckLedgerEntry."Entry No.";
        CheckLedgerStatus.Status := CheckLedgerStatus.Status::Change;
        CheckLedgerStatus."Bank Account No." := BankAcc."No.";
        CheckLedgerStatus.Insert(True);

    end;

    procedure ExportKbankTextFile(GenJnlTemplate: Code[10]; GenJnlBatch: Code[10])
    var
        GenJournalBatchL: Record "Gen. Journal Batch";
        GenJournalLine: Record "Gen. Journal Line";
        KbankDTC: Report "Kbank Export DTC";
        KbankFTL: Report "Kbank Export FTL";
        KbankFTR: Report "Kbank Export FTR";
        KbankPCT: Report "Kbank Export PCT";
        KbankMCL: Report "Kbank Smart MCL";
        KbankMCS: Report "Kbank Smart MCS";
    begin
        GenJournalBatchL.reset;
        GenJournalBatchL.setrange("Journal Template Name", GenJnlTemplate);
        GenJournalBatchL.setrange(Name, GenJnlBatch);
        GenJournalBatchL.findfirst;

        GenJournalLine.Reset();
        GenJournalLine.setrange("Journal Template Name", GenJnlTemplate);
        GenJournalLine.setrange("Journal Batch Name", GenJnlBatch);
        GenJournalBatchL.TestField("Ebanking Type");
        case GenJournalBatchL."Ebanking Type" of
            GenJournalBatchL."Ebanking Type"::DCT:
                begin
                    KbankDTC.SetTableView(GenJournalBatchL);
                    KbankDTC.SetTableView(GenJournalLine);
                    KbankDTC.Run();
                end;
            GenJournalBatchL."Ebanking Type"::FTL:
                begin
                    KbankFTL.SetTableView(GenJournalBatchL);
                    KbankDTC.SetTableView(GenJournalLine);
                    KbankFTL.Run();
                end;
            GenJournalBatchL."Ebanking Type"::FTR:
                begin
                    KbankFTR.SetTableView(GenJournalBatchL);
                    KbankDTC.SetTableView(GenJournalLine);
                    KbankFTR.Run();
                end;
            GenJournalBatchL."Ebanking Type"::PCT:
                begin
                    KbankPCT.SetTableView(GenJournalBatchL);
                    KbankDTC.SetTableView(GenJournalLine);
                    KbankPCT.Run();
                end;
            GenJournalBatchL."Ebanking Type"::MCL:
                begin
                    KbankMCL.SetTableView(GenJournalBatchL);
                    KbankDTC.SetTableView(GenJournalLine);
                    KbankMCL.Run();
                end;
            GenJournalBatchL."Ebanking Type"::MCS:
                begin
                    KbankMCS.SetTableView(GenJournalBatchL);
                    KbankDTC.SetTableView(GenJournalLine);
                    KbankMCS.Run();
                end;

            else
                Error('This is not a batch for export payment');
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitEmployeeLedgerEntry', '', true, true)]
    local procedure TransferFieldtoEmployeeLedgerEntry(GenJournalLine: Record "Gen. Journal Line"; var EmployeeLedgerEntry: Record "Employee Ledger Entry")
    begin

        EmployeeLedgerEntry."Due Date" := GenJournalLine."Due Date";
        EmployeeLedgerEntry."Document Date" := GenJournalLine."Document Date";
        EmployeeLedgerEntry."Payment Term Code" := GenJournalLine."Payment Terms Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostBankAccOnBeforeBankAccLedgEntryInsert', '', false, false)]
    local procedure CashCheckNameandBranchToBankLedgerEntry(BankAccount: Record "Bank Account"; GLRegister: Record "G/L Register"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; var NextTransactionNo: Integer; var TempGLEntryBuf: Record "G/L Entry")
    begin
        BankAccountLedgerEntry."Cheque Bank Name" := GenJournalLine."Cheque Bank Name";
        BankAccountLedgerEntry."Cheque Branch Name" := GenJournalLine."Cheque Branch Name";
        BankAccountLedgerEntry."Cheque No." := GenJournalLine."NWTH Cheque No.";
        BankAccountLedgerEntry."Cheque Date" := GenJournalLine."NWTH Cheque Date";
    end;

    [EventSubscriber(ObjectType::Table, 272, 'OnAfterCopyFromBankAccLedgEntry', '', false, false)]
    local procedure CashCheckNameandBranchToCheckLedgerEntry(BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; var CheckLedgerEntry: Record "Check Ledger Entry")
    begin
        CheckLedgerEntry."Cheque Bank Name" := BankAccountLedgerEntry."Cheque Bank Name";
        CheckLedgerEntry."Cheque Branch Name" := BankAccountLedgerEntry."Cheque Branch Name";


    end;

    [EventSubscriber(ObjectType::Table, 21, 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure CashCheckNameandBranchToCustedgerEntry(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgerEntry."Cheque Bank Name" := GenJournalLine."Cheque Bank Name";
        CustLedgerEntry."Cheque Branch Name" := GenJournalLine."Cheque Branch Name";
        CustLedgerEntry."Cheque No." := GenJournalLine."NWTH Cheque No.";
        CustLedgerEntry."Cheque Date" := GenJournalLine."NWTH Cheque Date";

    end;

    //GenJnl Set Pending
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure SetGenJnlToPending(RecRef: RecordRef; var IsHandled: Boolean; var Variant: Variant)
    var
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        Customer: Record Customer;
    begin
        // Message('In');
        RecRef.GetTable(Variant);
        Case RecRef.Number of
            Database::"Gen. Journal Line":
                begin
                    RecRef.SetTable(GenJnlLine);
                    GenJnlLine.Validate(Status, GenJnlLine.Status::Pending);
                    GenJnlLine.Modify(true);
                    Variant := GenJnlLine;
                end;
            Database::"Gen. Journal Batch":
                begin

                    RecRef.SetTable(GenJnlBatch);
                    GenJnlBatch.Validate(Status, GenJnlBatch.Status::Pending);
                    GenJnlBatch.Modify(true);
                    Variant := GenJnlBatch;
                end;
            //Block Customer
            Database::Customer:
                begin
                    //Message('In1');
                    RecRef.SetTable(Customer);
                    Customer.validate(Blocked, Customer.Blocked::All);
                    Customer.Modify(true);
                    Variant := GenJnlBatch;
                end;
        end;
        IsHandled := true;

    end;


    //GenJnl Set Release and Customer Card
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnBeforeReleaseDocument', '', true, true)]
    local procedure ReleaseGenJnlLine(var Variant: Variant)
    var
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        Customer: Record Customer;
        RecRef: RecordRef;
    begin
        ///Message('Ok11');
        RecRef.GetTable(Variant);
        Case RecRef.Number of

            Database::"Gen. Journal Line":
                begin
                    RecRef.SetTable(GenJnlLine);
                    GenJnlLine.Validate(Status, GenJnlLine.Status::Release);
                    GenJnlLine.Modify(true);
                end;
            Database::"Gen. Journal Batch":
                begin
                    RecRef.SetTable(GenJnlBatch);
                    GenJnlBatch.Validate(Status, GenJnlBatch.Status::Release);
                    GenJnlBatch.Modify(true);
                end;
            database::Customer: // Unblock Customer after Approve
                begin
                    //Message('Ok12');
                    RecRef.SetTable(Customer);
                    Customer.Validate(Blocked, Customer.Blocked::" ");
                    Customer.Modify(true);

                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OpenGenJnlLine(RecRef: RecordRef; var Handled: Boolean)
    var
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        Customer: Record Customer;
        RecRefL: RecordRef;
        RestrictRecord: Record "Restricted Record";
        RecRestrictedMgt: codeunit "Record Restriction Mgt.";
        RestrictUsageDetailsTxt: Label 'The restriction was imposed by the %1 workflow, %2.';
    begin
        Case RecRef.Number of
            Database::"Gen. Journal Line":
                begin
                    Handled := true;
                    RecRef.SetTable(GenJnlLine);

                    GenJnlLine.Validate(Status, GenJnlLine.Status::Open);
                    GenJnlLine.Modify(true);
                    RecRestrictedMgt.RestrictRecordUsage(GenJnlLine, STRSUBSTNO(RestrictUsageDetailsTxt, 'Reopen' + GenJnlLine."Document No.", 'Reopen'));
                end;
            Database::"Gen. Journal Batch":
                begin
                    Handled := true;
                    RecRef.SetTable(GenJnlBatch);

                    GenJnlBatch.Validate(Status, GenJnlBatch.Status::Open);
                    GenJnlBatch.Modify(true);
                    RecRestrictedMgt.RestrictRecordUsage(GenJnlBatch, STRSUBSTNO(RestrictUsageDetailsTxt, 'Reopen ' + GenJnlBatch.Name, 'Reopen'));
                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseGenJnlLine(RecRef: RecordRef; var Handled: Boolean)
    var
        Customer: Record Customer;
    begin
        //Message('Ok 21');
        Case RecRef.number of

            database::Customer: // Unblock Customer after Approve
                begin
                    //Message('Ok 22');
                    RecRef.SetTable(Customer);
                    Customer.Validate(Blocked, Customer.Blocked::" ");
                    Customer.Modify(true);

                End;
        End;


        Handled := (RecRef.Number = Database::"Gen. Journal Line")
                    or (RecRef.Number = database::"Gen. Journal Batch")
                    or (RecRef.Number = database::Customer);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', true, true)]
    local procedure CopySourcetoGL(AddCurrAmount: Decimal; Amount: Decimal; GenJournalLine: Record "Gen. Journal Line"; UseAddCurrAmount: Boolean; var CurrencyFactor: Decimal; var GLEntry: Record "G/L Entry"; var GLRegister: Record "G/L Register")
    begin
        GLEntry."Direct Vendor No." := GenJournalLine."NWTH Vendor Direct Jnl";
        GLEntry."Direct Customer No." := GenJournalLine."NWTH Customer Direct Jnl";

    end;

}