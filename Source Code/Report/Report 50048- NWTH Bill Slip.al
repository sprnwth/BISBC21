report 50048 "Bill Slip Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Source Code/ReportLayout/NWTH Bill Slip.rdlc';
    Caption = 'NWTH Bill Slip';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.") order(ascending);
            RequestFilterFields = "No.";
            column(CompanyInfoName; CompanyInfo.Name + ' ' + '(สำนักงานใหญ่)')
            {
            }
            column(CompanyInfoAdd; CompanyInfo.Address)
            {
            }
            column(CompanyInfoAdd2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_BankName; CompanyInfo."Bank Name")
            {

            }
            column(CompanyInfo_BankAccount; CompanyInfo."Bank Account No.")
            {

            }
            column(CompanyInfo_BankBranch; CompanyInfo."Bank Branch No.")
            {

            }
            column(CompanyInfoCity; CompanyInfo.City)
            {
            }
            column(CompanyInfoPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfoVATID; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(Cust_Vend_No; "Sales Invoice Header"."Bill-to Customer No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Addres; Addres)
            {
            }
            column(TAXID; TAXID)
            {
            }
            column(PhoneNo; PhoneNo)
            {
            }
            column(FaxNo; FaxNo)
            {
            }
            column(CaptionThai; CaptionThai)
            {

            }
            column(Remark; "Sales Invoice Header"."Reason Code")
            {
            }
            column(BillingNo; "Sales Invoice Header"."No.")
            {
            }
            column(BillingDate; "Sales Invoice Header"."Posting Date")
            {
            }
            column(PaymentTermDesc; PaymentCodeTextG)
            {
            }
            column(Remark_CaptionLbl; Remark_CaptionLbl)
            {
            }
            column(BankName_CaptionLbl; BankName_CaptionLbl)
            {
            }
            column(BankBranch_CaptionLbl; BankBranch_CaptionLbl)
            {
            }
            column(BankAccount_CaptionLbl; BankAccount_CaptionLbl)
            {
            }
            column(Btlling_CaptionLbl; Btlling_CaptionLbl)
            {
            }
            column(Date_CaptionLbl; Date_CaptionLbl)
            {
            }
            column(ExpDate_CaptionLbl; ExpDate_CaptionLbl)
            {
            }
            column(Appointment_CaptionLbl; Appointment_CaptionLbl)
            {
            }
            column(Text001; SlashLbl)
            {
            }
            column(Authorized_CaptionLbl; Authorized_CaptionLbl)
            {
            }
            column(CaptionG; CaptionG)
            {
            }
            column(AmountTextG1; AmountTextG1)
            {

            }
            column(TotalG1; TotalG1)
            {

            }
            column(RunNo; RunNo)
            {
            }
            column(InvNo; "Sales Invoice Header"."No.")
            {
            }
            column(InvDate; "Sales Invoice Header"."Document Date")
            {
            }
            column(DueDate; "Sales Invoice Header"."Due Date")
            {
            }
            column(Salesperson_Code; Salesperson.Name)
            {
            }
            column(Amt; ABS(DiscountAmountG))
            {
            }
            column(RemAmt; Abs(DiscountRemAmount))
            {
            }
            column(TotalAmt; Abs(TotalAmt))
            {
            }

            column(AmountTxt2; AmountTxt[1])
            {
            }
            column(LineNo; LineNo)
            {
            }
            column(PaymentDiscountTxt; PaymentDiscountTxt)
            {

            }
            column(PaymentDescriptionG; PaymentDescriptionG)
            {

            }
            column(ShowFooter1; ShowFooter)
            {
            }


            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) order(ascending) where(Number = filter(1 ..));
                column(Number; Number)
                {
                }
                column(TotalAmt2; TotalAmt)
                {
                }
                column(AmountTxt; AmountTxt[1] + AmountTxt[2])
                {
                }
                column(BlankText; BlankText)
                {

                }
                column(BlankAmount; BlankAmount)
                {

                }
                column(ShowFooter2; ShowFooter)
                {
                }


                trigger OnAfterGetRecord()
                begin
                    Clear(ShowFooter);
                    if Number = LastEmptyLine then
                        ShowFooter := true;

                    if LineNoMod = 0 then
                        CurrReport.Skip();

                    BlankText := '';
                    BlankAmount := 0;

                    AmountTextG1 := NWTHLocalizedCoreG.FormatNoTextVoucher(abs(TotalG1));
                    Check.FormatNoText(AmountTxt, TotalAmt, '');
                end;

                trigger OnPreDataItem()
                begin
                    Clear(LastEmptyLine);
                    if LineNo < MaxLineG then begin
                        LineNoMod := LineNo mod (MaxLineG - 1);
                        if LineNoMod < (MaxLineG - 1) then
                            LastEmptyLine := (MaxLineG - 1) - LineNo
                        else
                            LastEmptyLine := (MaxLineG - 1);
                    end else begin
                        LineNoMod := LineNo mod (MaxLineG - 1);
                        if LineNoMod < (MaxLineG - 1) then
                            if LineNoMod <> 0 then
                                LastEmptyLine := (MaxLineG - 1) - LineNoMod
                            else
                                LastEmptyLine := (MaxLineG - 2) - LineNoMod - 1;
                    end;
                    SetRange(Number, 0, LastEmptyLine);
                    if LineNoMod = 0 then
                        CurrReport.Skip();

                    // Clear(AmountTxt);
                    Clear(AmountTextG1);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields(Amount);
                CalcFields("Amount Including VAT");
                CalcFields("Remaining Amount");

                LineNo += 1;

                if "No." <> '' then
                    RunNo := 1;

                Clear(ShowFooter);
                if (LineNo mod (MaxLineG - 1)) = 0 then
                    ShowFooter := true;

                Clear(CaptionG);

                if CustRec.Get("Bill-to Customer No.") then begin
                    if VendRec."NWTH Branch Code" = '00000' then
                        BranchCodeGV := '(สนญ.)'
                    else
                        BranchCodeGV := '(สาขาที่ ' + CustRec."NWTH Branch Code" + ')';
                    CaptionG := Cust_CaptionLbl;
                    Name := CustRec.Name + '' + BranchCodeGV;
                    Addres := CustRec.Address + ' ' + CustRec."Address 2" + ' ' + CustRec.City + ' ' + CustRec."Post Code";
                    TAXID := CustRec."VAT Registration No.";
                    PhoneNo := CustRec."Phone No.";
                    FaxNo := CustRec."Fax No.";
                    CaptionThai := 'ใบวางบิล';

                end;

                if PaymentTerm.Get("Payment Terms Code") then
                    "Sales Invoice Header".CalcFields(Amount);

                if GetBillDateG <> 0D then
                    BillDateG := GetBillDateG
                else
                    BillDateG := "Posting Date";

                if EnablePaymentG = true then begin

                    if (BillDiscountG <> PaymentTerm."Discount %") and (BillDiscountG <> 0) then
                        PaymentTermValue := BillDiscountG / 100
                    else
                        PaymentTermValue := PaymentTerm."Discount %" / 100;

                    DiscountAmountG := (Amount * PaymentTermValue) - "Amount Including VAT";

                    if PaymentCodeG = '' then begin
                        PaymentCodeTextG := PaymentTerm.Code;
                        PaymentDiscountTxt := Format(PaymentTerm."Discount %") + ' %';
                        PaymentDescriptionG := PaymentTerm.Description;
                    end else begin
                        PaymentCodeTextG := PaymentCodeG;
                        PaymentDiscountTxt := Format(BillDiscountG) + ' %';
                        PaymentDescriptionG := BillDescriptionG;
                    end;


                    if "Remaining Amount" <> 0 then
                        DiscountRemAmount := DiscountAmountG
                    else
                        DiscountRemAmount := 0;
                end else begin
                    DiscountAmountG := "Amount Including VAT";
                    if "Remaining Amount" <> 0 then
                        DiscountRemAmount := DiscountAmountG
                    else
                        DiscountRemAmount := 0;

                    PaymentCodeTextG := PaymentTerm.Code;
                    PaymentDiscountTxt := Format(PaymentTerm."Discount %") + ' %';
                    PaymentDescriptionG := PaymentTerm.Description;
                end;


                TotalAmt := DiscountRemAmount;
                TotalG1 := abs(DiscountAmountG);

                Check.FormatNoText(AmountTxt, Abs("Sales Invoice Header".Amount), '');

                Salesperson.Reset();
                Salesperson.SetRange(Code, "Salesperson Code");
                if Salesperson.FindFirst() then;

            end;
        }
    }


    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {

                group(BillDate)
                {
                    Caption = 'Billing Date';
                    field(BillDateG; GetBillDateG)
                    {
                        ApplicationArea = all;
                        Caption = 'Billing Date';
                    }
                }

                group(Payment_Term)
                {
                    Caption = 'Payment Terms';
                    field(EnablePaymentG; EnablePaymentG)
                    {
                        ApplicationArea = all;
                        Caption = 'Enable Calculate Payment Terms';
                        trigger OnValidate()
                        var
                            myInt: Integer;
                        begin
                            if EnablePaymentG = false then begin
                                Clear(PaymentCodeG);
                                Clear(BillDiscountG);
                                Clear(BillDescriptionG);
                            end;
                        end;
                    }
                    group(PaymentDiscountDetail)
                    {
                        Caption = 'Payment Terms Detail';

                        field(PaymentCodeG; PaymentCodeG)
                        {
                            ApplicationArea = all;
                            Caption = 'Payment Terms Code';
                            TableRelation = "Payment Terms";

                            trigger OnValidate()
                            var
                                PaymentTermL: Record "Payment Terms";
                            begin
                                PaymentTermL.Get(PaymentCodeG);
                                BillDiscountG := PaymentTermL."Discount %";
                                BillDescriptionG := PaymentTermL.Description;
                            end;
                        }
                        field(BillDiscountG; BillDiscountG)
                        {
                            ApplicationArea = all;
                            Caption = 'Payment Terms Discount %';

                        }

                        field(BillDescriptionG; BillDescriptionG)
                        {
                            ApplicationArea = all;
                            Caption = 'Payment Terms Description';

                        }

                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    var
        PaymentTermL: Record "Payment Terms";
    begin
        MaxLineG := 11;
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.GET();
        CompanyInfo.CalcFields(Picture);
        Check.InitTextVariable();

    end;


    var
        CompanyInfo: Record "Company Information";
        CustRec: Record Customer;
        PaymentTerm: Record "Payment Terms";
        Salesperson: Record "Salesperson/Purchaser";
        VendRec: Record Vendor;
        Check: Report Check;
        NWTHLocalizedCoreG: Codeunit "NWTH Localized Core";
        TotalG1: Decimal;
        AmountTextG1: Text;
        ShowFooter: Boolean;
        EnablePaymentG: Boolean;
        EnableFixPayemntG: Boolean;
        PaymentTermValue: Decimal;
        TotalAmt: Decimal;
        DiscountAmountG: Decimal;
        DiscountRemAmount: Decimal;
        LastEmptyLine: Integer;
        LineNo: Integer;
        LineNoMod: Integer;
        MaxLineG: Integer;
        RunNo: Integer;
        SlashLbl: Label '__/__/__';
        Appointment_CaptionLbl: Label 'Appointment Date';
        Authorized_CaptionLbl: Label 'Authorized by_______________________';
        Date_CaptionLbl: Label 'Billing Date';
        Btlling_CaptionLbl: Label 'Billing Received by__________________________';
        Cust_CaptionLbl: Label 'Customer :';
        ExpDate_CaptionLbl: Label 'Exp. Cheque Received Date';
        Remark_CaptionLbl: Label 'Remark';
        Vendor_CaptionLbl: Label 'Vendor :';
        BankName_CaptionLbl: Label 'Bank Name :';
        BankBranch_CaptionLbl: Label 'Bank Branch No. :';
        BankAccount_CaptionLbl: Label 'Bank Account No. :';
        CaptionThai: Text;
        Addres: Text;
        FaxNo: Text;
        Name: Text;
        PhoneNo: Text;
        PaymentDiscountTxt: Text;
        TAXID: Text;
        CaptionG: Text[50];
        BlankText: Text;
        BlankAmount: Decimal;
        AmountTxt: array[2] of Text[250];
        BranchCodeG: Text;
        BranchCodeGV: Text;
        GetBillDateG: Date;
        BillDateG: Date;
        PaymentCodeG: code[20];
        PaymentCodeTextG: Text;
        BillDiscountG: Decimal;
        BillDescriptionG: Text;
        PaymentDescriptionG: Text;

}