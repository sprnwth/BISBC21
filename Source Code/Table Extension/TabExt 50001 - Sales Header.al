tableextension 50001 SalesHeaderBISExt extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "BIS Status"; Enum "Sales Header BIS Status")
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Release Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Release Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Interface Document"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "BIS Sales Person"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Saleperson Relation"."Sale Personcode" WHERE("Customer No." = FIELD("Sell-to Customer No."));

            trigger OnValidate()

            begin
                Validate("Salesperson Code", "BIS Sales Person");
            end;
        }
        field(50005; "Smart Sales Ref."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Sales Area"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Customer Area"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Ship-to Thambon"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address".Thambon where("Customer No." = Field("Sell-to Customer No."),
                                                                 Code = field("Ship-to Code")));

        }
        field(50009; "Ship-to Amphur"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address".Amphur where("Customer No." = Field("Sell-to Customer No."),
                                                                 Code = field("Ship-to Code")));
        }

        field(50010; "Invoice Discont by Percent"; Boolean)
        {
            
        }


    }

    procedure CheckCreditControlBIS() // Call this and go to event
    var
        NoCreditApprove: Boolean;
        OverDueApprove: Boolean;
        CheckReturnApprove: Boolean;
        ZeroOrder: Boolean;
        Customer: Record Customer;
        CreditLimit: Decimal;
        CustMaxDueDate: Query "Cust. Ledger Max Due Date";
        MaxDueDate: Date;
        SalesSetup: Record "Sales & Receivables Setup";
        CheckLedgerStatus: Record "Check Ledger Status";
        CheckLedgerEntry: Record "Check Ledger Entry";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        SalesLine: Record "Sales Line";
    begin
        SalesSetup.get();
        SalesSetup.TestField("Max Overdue Date");
        Customer.get(Rec."Sell-to Customer No.");
        NoCreditApprove := Customer.CalcAvailableCredit() < 0;
        //Message('%1 1', customer.CalcAvailableCredit());

        CustMaxDueDate.SetRange(Customer_No, Rec."Sell-to Customer No.");
        CustMaxDueDate.SetFilter(Due_Date, '<%1', Today);
        CustMaxDueDate.SetFilter(Date_Filter, '..%1', Today);
        CustMaxDueDate.setrange(CustMaxDueDate.Open, true);
        CustMaxDueDate.Open();

        if CustMaxDueDate.Read() then begin
            MaxDueDate := CustMaxDueDate.MaxDue_Date;
            OverDueApprove := (Today - MaxDueDate) > SalesSetup."Max Overdue Date";
        end;

        // CheckLedgerStatus.Reset();
        // CheckLedgerStatus.setrange("Customer No.", Rec."Sell-to Customer No.");
        // //CheckLedgerStatus.SetAutoCalcFields(Status);
        // if CheckLedgerStatus.FindSet() then repeat
        // //CheckLedgerStatus.setrange(Status, CheckLedgerStatus.Status::Return);

        //     CheckReturnApprove := Not CheckLedgerStatus.IsEmpty;
        // until CheckLedgerStatus.Next() = 0;
        
        CheckReturnApprove := false;
        CheckLedgerEntry.Reset();
        CheckLedgerEntry.setrange("Bal. Account No.", "Sell-to Customer No.");
        CheckLedgerEntry.SetAutoCalcFields("Check Status");
        if CheckLedgerEntry.FindSet() then
            repeat                
                CheckReturnApprove := CheckLedgerEntry."Check Status" = CheckLedgerEntry."Check Status"::Return;
            until (CheckLedgerEntry.Next() = 0) or (CheckReturnApprove);

        SalesLine.Reset();
        SalesLine.setrange("Document Type", Rec."Document Type");
        SalesLine.setrange("Document No.", Rec."No.");
        SalesLine.CalcSums(Amount);
        ZeroOrder := SalesLine.Amount <= 0;

        if NoCreditApprove or OverDueApprove or CheckReturnApprove or ZeroOrder then
            OnNotPassCheckCreditControl()
        else
            OnPassCheckCreditControl();

    end;

    procedure GetApprovalRequestReason(var Reason1 : Text[30];
                                        var Reason2 : Text[30];
                                        Var Reason3 : Text[30];
                                        var Reason4 : Text[30]) // Call this and go to event
    var
        NoCreditApprove: Boolean;
        OverDueApprove: Boolean;
        CheckReturnApprove: Boolean;
        ZeroOrder: Boolean;
        Customer: Record Customer;
        CreditLimit: Decimal;
        CustMaxDueDate: Query "Cust. Ledger Max Due Date";
        MaxDueDate: Date;
        SalesSetup: Record "Sales & Receivables Setup";
        CheckLedgerStatus: Record "Check Ledger Status";
        CheckLedgerEntry: Record "Check Ledger Entry";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        SalesLine: Record "Sales Line";
    begin
        SalesSetup.get();
        SalesSetup.TestField("Max Overdue Date");
        Customer.get(Rec."Sell-to Customer No.");
        NoCreditApprove := Customer.CalcAvailableCredit() < 0;
        //Message('%1 1', customer.CalcAvailableCredit());

        CustMaxDueDate.SetRange(Customer_No, Rec."Sell-to Customer No.");
        CustMaxDueDate.SetFilter(Due_Date, '<%1', Today);
        CustMaxDueDate.SetFilter(Date_Filter, '..%1', Today);
        CustMaxDueDate.setrange(CustMaxDueDate.Open, true);
        CustMaxDueDate.Open();

        if CustMaxDueDate.Read() then begin
            MaxDueDate := CustMaxDueDate.MaxDue_Date;
            OverDueApprove := (Today - MaxDueDate) > SalesSetup."Max Overdue Date";
        end;

       
        
        CheckReturnApprove := false;
        CheckLedgerEntry.Reset();
        CheckLedgerEntry.setrange("Bal. Account No.", "Sell-to Customer No.");
        CheckLedgerEntry.SetAutoCalcFields("Check Status");
        if CheckLedgerEntry.FindSet() then
            repeat                
                CheckReturnApprove := CheckLedgerEntry."Check Status" = CheckLedgerEntry."Check Status"::Return;
            until (CheckLedgerEntry.Next() = 0) or (CheckReturnApprove);

        SalesLine.Reset();
        SalesLine.setrange("Document Type", Rec."Document Type");
        SalesLine.setrange("Document No.", Rec."No.");
        SalesLine.CalcSums(Amount);
        ZeroOrder := SalesLine.Amount <= 0;

        if NoCreditApprove then
            Reason1 := 'Not enough Credit';
        if OverDueApprove then
            Reason2 := 'Has Over invoices';
        if CheckReturnApprove then
            Reason3 := 'Has Return Check';
        if ZeroOrder then
            Reason4 := 'Zero Amount Order';

        // if NoCreditApprove or OverDueApprove or CheckReturnApprove or ZeroOrder then
        //     OnNotPassCheckCreditControl()
        // else
        //     OnPassCheckCreditControl();

    end;

    [IntegrationEvent(true, false)]
    local procedure OnPassCheckCreditControl()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnNotPassCheckCreditControl()
    begin
    end;
}