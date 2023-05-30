report 50099 "Input VAT AVG"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Source Code/VATAverage/Report/Layout/InputVATAVG.rdlc';
    Caption = 'Settlement VAT Purchase Report';

    dataset
    {
        dataitem("NWTH Settlement Entry"; "NWTH Settlement Entry")
        {
            DataItemTableView = SORTING("Settlement No.", "Entry No.") ORDER(Ascending) WHERE(Submit = CONST(true));
            RequestFilterFields = "Settlement No.", "Posting Date", "VAT Bus. Posting Group", "VAT Prod. Posting Group", "NWTH Company Branch Code";

            trigger OnAfterGetRecord()
            var
                VATBase: Decimal;
                VATAmount: Decimal;
            begin

                if "Actual External Document No." <> '' then
                    "External Document No." := "Actual External Document No.";

                if "External Document No." = '' then
                    "External Document No." := "Actual External Document No.";

                TempVATWHTSettlementEntry.Reset;
                if VATWHTSettlementCard."VAT Type" = VATWHTSettlementCard."VAT Type"::Purchase then begin
                    TempVATWHTSettlementEntry.SetRange("External Document No.", "External Document No.");
                    TempVATWHTSettlementEntry.SetRange("Customer/Vendor No.", "Customer/Vendor No.");
                end else begin
                    //SSW
                    TempVATWHTSettlementEntry.SetRange("Document No.", "Document No.");
                    //TempVATWHTSettlementEntry.setrange("VAT Prod. Posting Group", "VAT Prod. Posting Group");
                    //SSW

                end;
                if VatPostingSetUp.get("VAT Bus. Posting Group", "VAT Prod. Posting Group") then;
                if TempVATWHTSettlementEntry.FindFirst() then begin
                    if ("Document Type" = "Document Type"::" ") or ("Document Type" = "Document Type"::Invoice) or ("Document Type" = "Document Type"::Payment) then begin
                        TempVATWHTSettlementEntry."Base (LCY)" += "Base (LCY)";
                        TempVATWHTSettlementEntry."Amount (LCY)" += "Amount (LCY)";
                        TempVATWHTSettlementEntry."Original VAT Amount" += "Original VAT Amount";
                        TempVATWHTSettlementEntry."Credit Base" += "Credit Base";

                    end else
                        if "Document Type" = "Document Type"::"Credit Memo" then begin
                            TempVATWHTSettlementEntry."Base (LCY)" += "Base (LCY)";
                            TempVATWHTSettlementEntry."Amount (LCY)" += "Amount (LCY)";
                            TempVATWHTSettlementEntry."Original VAT Amount" += "Original VAT Amount";
                            TempVATWHTSettlementEntry."Credit Base" += "Credit Base";
                        end;
                    TempVATWHTSettlementEntry.Modify;
                end else begin

                    TempVATWHTSettlementEntry.Init;
                    TempVATWHTSettlementEntry.TransferFields("NWTH Settlement Entry");

                    TempVATWHTSettlementEntry."Base (LCY)" := 0;
                    TempVATWHTSettlementEntry."Amount (LCY)" := 0;
                    TempVATWHTSettlementEntry."Original VAT Amount" := 0;
                    TempVATWHTSettlementEntry."Credit Base" := 0;

                    if ("Document Type" = "Document Type"::" ") or ("Document Type" = "Document Type"::Invoice) or ("Document Type" = "Document Type"::Payment) then begin
                        TempVATWHTSettlementEntry."Base (LCY)" := "Base (LCY)";
                        TempVATWHTSettlementEntry."Amount (LCY)" := "Amount (LCY)";
                        TempVATWHTSettlementEntry."Original VAT Amount" := "Original VAT Amount";
                        TempVATWHTSettlementEntry."Credit Base" := "Credit Base";
                    end else
                        if "Document Type" = "Document Type"::"Credit Memo" then begin
                            TempVATWHTSettlementEntry."Base (LCY)" := "Base (LCY)";
                            TempVATWHTSettlementEntry."Amount (LCY)" := "Amount (LCY)";
                            TempVATWHTSettlementEntry."Original VAT Amount" := "Original VAT Amount";
                            TempVATWHTSettlementEntry."Credit Base" := "Credit Base";
                        end;


                    TempVATWHTSettlementEntry.Insert;
                end;
            end;

            trigger OnPreDataItem()
            begin
                VATWHTSettlementCard.Reset;

                VATWHTSettlementCard.SetRange("Settlement No.", GetFilter("Settlement No."));


                If VATWHTSettlementCard.FINDFIRST then begin

                    NWTHCompanyBranchG.RESET;
                    NWTHCompanyBranchG.SETFILTER(Code, VATWHTSettlementCard."NWTH Company Branch Filter");
                    if (VATWHTSettlementCard."NWTH Company Branch Filter" = '00000') or (VATWHTSettlementCard."NWTH Company Branch Filter" = '') then Begin

                        HQBranch[1] := 'P';
                        HQBranch[2] := '';
                        ComNameG := CompanyInfo.Name;
                        ComVATRegG := CompanyInfo."VAT Registration No.";
                        ComAddressG := CompanyInfo.Address + ' ' + CompanyInfo."Address 2" + ' ' + CompanyInfo.City + ' ' + CompanyInfo."Post Code";
                        ComPhoneG := 'โทร. ' + CompanyInfo."Phone No.";
                        ComFaxG := 'แฟกซ์. ' + CompanyInfo."Fax No.";
                    end else begin
                        if NWTHCompanyBranchG.Get(VATWHTSettlementCard."NWTH Company Branch Filter") then begin

                            HQBranch[1] := '';
                            HQBranch[2] := 'P';
                            BranchName := NWTHCompanyBranchG."Branch No.";
                            ComNameG := NWTHCompanyBranchG.Name;
                            ComVATRegG := NWTHCompanyBranchG."VAT Registration No.";
                            ComAddressG := NWTHCompanyBranchG.Address + ' ' + NWTHCompanyBranchG."Address 2" + ' ' + NWTHCompanyBranchG.City + ' ' + NWTHCompanyBranchG."Post Code";
                            ComPhoneG := 'โทร. ' + NWTHCompanyBranchG."Phone No.";
                            ComFaxG := 'แฟกซ์. ' + NWTHCompanyBranchG."Fax No.";
                        End;

                    End;
                end;
                //Branch Header 

                if VATWHTSettlementCard.Find('-') then;

                case VATWHTSettlementCard."Submit Month" of
                    VATWHTSettlementCard."Submit Month"::"01":
                        ForMonth := 'มกราคม';
                    VATWHTSettlementCard."Submit Month"::"02":
                        ForMonth := 'กุมภาพันธ์';
                    VATWHTSettlementCard."Submit Month"::"03":
                        ForMonth := 'มีนาคม';
                    VATWHTSettlementCard."Submit Month"::"04":
                        ForMonth := 'เมษายน';
                    VATWHTSettlementCard."Submit Month"::"05":
                        ForMonth := 'พฤษภาคม';
                    VATWHTSettlementCard."Submit Month"::"06":
                        ForMonth := 'มิถุนายน';
                    VATWHTSettlementCard."Submit Month"::"07":
                        ForMonth := 'กรกฎาคม';
                    VATWHTSettlementCard."Submit Month"::"08":
                        ForMonth := 'สิงหาคม';
                    VATWHTSettlementCard."Submit Month"::"09":
                        ForMonth := 'กันยายน';
                    VATWHTSettlementCard."Submit Month"::"10":
                        ForMonth := 'ตุลาคม';
                    VATWHTSettlementCard."Submit Month"::"11":
                        ForMonth := 'พฤศจิกายน';
                    VATWHTSettlementCard."Submit Month"::"12":
                        ForMonth := 'ธันวาคม';
                end;
                //,มกราคม,กุมภาพันธ์,มีนาคม,เมษายน,พฤษภาคม,มิถุนายน,กรกฎาคม,สิงหาคม,กันยายน,ตุลาคม,พฤศจิกายน,ธันวาคม
            end;
        }
        dataitem(LoopLine; "Integer")
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending);
            column(HQBranch_1; HQBranch[1])
            {
            }
            column(HQBranch_2; HQBranch[2])
            {
            }
            column(BranchName_2; BranchName)
            {
            }
            column(PageNo; PageNo)
            {
            }
            column(HeaderTxt; HeaderTxt)
            {
            }
            column(CompanyInfo_Name; ComNameG)
            {
            }
            column(CompanyInfo_VAT_Registration_No_; ComVATRegG)
            {
            }
            column(CompanyInfo_Address; ComAddressG)
            {
            }
            column(CompanyInfo_Phone_No; ComPhoneG)
            {
            }
            column(CompanyInfo_Fax_No; ComFaxG)
            {
            }
            column(TaxNoCaption; TaxNoCaption)
            {
            }
            column(ForMonth; MonthText + ForMonth + '  ' + ForYear)
            {
            }
            column(PrintDate; PrintDate)
            {
            }
            column(NoCaption; NoCaption)
            {
            }
            column(DateCaption; DateCaption)
            {
            }
            column(InvoiceNoCaption; InvoiceNoCaption)
            {
            }
            column(DocumentNoCaption; DocumentNoCaption)
            {
            }
            column(TaxInvNoCaption; TaxInvNoCaption)
            {
            }
            column(BranchCaption; BranchCaption)
            {
            }
            column(VATBaseCaption; VATBaseCaption)
            {
            }
            column(VatBase7Caption; VatBase7Caption)
            {
            }
            column(VATAmountCaption; VATAmountCaption)
            {
            }
            column(TotalCaption; TotalCaption)
            {
            }
            column(TotalCaption2; TotalCaption2)
            {
            }
            column(GrandTotalCaption; GrandTotalCaption)
            {
            }
            column(CompanyCaption; CompanyCaption)
            {
            }
            column(AddessCaption; AddessCaption)
            {
            }
            column(BranchCaption2; BranchCaption2)
            {
            }
            column(BranchNoCaption; BranchNoCaption)
            {
            }
            column(No; No)
            {
            }
            column(TaxInvDate; TaxInvDateTxt)
            {
            }
            column(InvoiceNo; InvoiceNo)
            {
            }
            column(DocumentNo; DocumentNo)
            {
            }
            column(CustVendorName; CustVendorName)
            {
            }
            column(VATRegisterNo; VATRegisterNo)
            {
            }
            column(BigBranch; BigBranch)
            {
            }
            column(BranchNo; BranchNo)
            {
            }
            column(ColumnTxt; ColumnTxt)
            {
            }
            column(GroupVATBase; GroupVATBase)
            {
            }
            column(GroupVAT7Base; GroupVAT7Base)
            {
            }
            column(GroupVATAmount; GroupVATAmount)
            {
            }
            column(GroupVATCredit; GroupVATCredit)
            {
            }
            column(GroupVATAmountCredit; GroupVATAmountCredit)
            {
            }
            column(GroupVATAmountPurchCr; GroupVATAmountPurchCr)
            {
            }
            column(TotalVATBase; TotalVATBase)
            {
            }
            column(TotalVATBase7; TotalVATBase7)
            {
            }
            column(TotalVATAmount; TotalVATAmount)
            {
            }
            column(TotalVATCredit; TotalVATCredit)
            {
            }
            column(TotalVATAmountCredit; TotalVATAmountCredit)
            {
            }
            column(TotalVATAmountPurchCr; TotalVATAmountPurchCr)
            {
            }
            column(TODAY; Today)
            {
            }
            column(TodayTxt; TodayTxt)
            {
            }
            column(SubTotal; SubTotal)
            {
            }
            column(GroupVatBaseAmtPerPage; GroupVatBaseAmtPerPage)
            {
            }
            column(GroupVatBase7AmtPerPage; GroupVatBase7AmtPerPage)
            {
            }
            column(GroupAmountPerPage; GroupAmountPerPage)
            {
            }
            column(GroupVATCreditPerPage; GroupVATCreditPerPage)
            {
            }
            column(GroupVatBaseAmtNoVatPerPage; GroupVatBaseAmtNoVatPerPage)
            {
            }
            column(GroupVATAmountCreditPerPage; GroupVATAmountCreditPerPage)
            {
            }
            column(GroupVATAmountPurchCrPerPage; GroupVATAmountPurchCrPerPage)
            {
            }
            column(VATAmountCreditCaption; VATAmountCreditCaption)
            {
            }
            column(VATAmountPerCreditCaption; VATAmountPerCreditCaption)
            {
            }
            column(VATAmountPurchaseCaption; VATAmountPurchaseCaption)
            {
            }
            column(VATAmountNoCreditCaption; VATAmountNoCreditCaption)
            {
            }
            column(VATAmountNoPerCreditCaption; VATAmountNoPerCreditCaption)
            {
            }
            column(VATAmountNoPurchaseCaption; VATAmountNoPurchaseCaption)
            {
            }
            dataitem(ShowGroup; "Integer")
            {
                DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = FILTER(1 .. 2));

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, 1);
                    if SubTotal then
                        SetRange(Number, 1, 2);
                end;
            }

            trigger OnAfterGetRecord()
            var
                SalesInvHeader: Record "Sales Invoice Header";
                SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                YearThai: Text[10];
            begin
                if Number > 1 then
                    if TempVATWHTSettlementEntry.Next = 0 then;

                //Start Header - Section
                if VATWHTSettlementCard."VAT Type" = VATWHTSettlementCard."VAT Type"::Purchase then begin
                    HeaderTxt := TitlePurch;
                    ColumnTxt := ColumnPurch1;
                end else
                    if VATWHTSettlementCard."VAT Type" = VATWHTSettlementCard."VAT Type"::Sale then begin
                        HeaderTxt := TitleSales;
                        ColumnTxt := ColumnSales1;
                    end;

                ForYear := NWTHLocalizationCore.GetFormatYearYYYY(FormatDate, VATWHTSettlementCard."To Date");

                if VATWHTSettlementCard."VAT Type" = VATWHTSettlementCard."VAT Type"::Purchase then begin
                    InvoiceNo := TempVATWHTSettlementEntry."External Document No.";
                    DocumentNo := TempVATWHTSettlementEntry."Document No.";
                end else begin
                    InvoiceNo := TempVATWHTSettlementEntry."Document No.";
                    DocumentNo := TempVATWHTSettlementEntry."External Document No.";
                end;

                //swa++
                TaxInvDate := TempVATWHTSettlementEntry."Document Date";

                // if TempVATWHTSettlementEntry."Actual Posting Date Temp" = 0D then
                //     TaxInvDate := TempVATWHTSettlementEntry."Document Date"
                // else
                //     TaxInvDate := TempVATWHTSettlementEntry."Actual Posting Date Temp";

                //swa--

                //TaxInvDate := TempVATWHTSettlementEntry."Document Date";

                TaxInvDateTxt := NWTHLocalizationCore.GetFormatDateDDMMYYYY(FormatDate, TaxInvDate);

                VATRegisterNo := TempVATWHTSettlementEntry."VAT Registration No.";

                Clear(BigBranch);
                Clear(BranchNo);

                BranchNo := TempVATWHTSettlementEntry."NWTH Branch Code";
                if ((BranchNo = '') or (BranchNo = '00000')) then begin
                    BigBranch := 'สนญ.'; //TODO Mutiple Language
                    BranchNo := '';
                end;

                CustVendorName := TempVATWHTSettlementEntry."Customer/Vendor Name";

                GroupVAT7Base := 0;
                GroupVATBase := 0;
                GroupVATCredit := 0;
                GroupVATAmount := 0;

                GroupVATBase := TempVATWHTSettlementEntry."Base (LCY)"; // VAT BASE 1

                If TempVATWHTSettlementEntry."Original VAT Amount" <> 0 then
                    GroupVAT7Base := TempVATWHTSettlementEntry."Original VAT Amount" // Vat AVG Purchase 2
                else
                    GroupVAT7Base := TempVATWHTSettlementEntry."Amount (LCY)";

                If TempVATWHTSettlementEntry."Credit Base" <> 0 then
                    GroupVATCredit := TempVATWHTSettlementEntry."Credit Base" // Credit Base 3
                else
                    GroupVATCredit := TempVATWHTSettlementEntry."Base (LCY)";

                GroupVATAmount := TempVATWHTSettlementEntry."Amount (LCY)"; // Amount 4

                GroupVATAmountCredit := GroupVATBase - GroupVATCredit;//TempVATWHTSettlementEntry."Base (LCY)" - TempVATWHTSettlementEntry."Credit Base";// VAT Credit Amount

                GroupVATAmountPurchCr := GroupVAT7Base - GroupVATAmount;//TempVATWHTSettlementEntry."Original VAT Amount" - TempVATWHTSettlementEntry."Amount (LCY)";

                TotalVATBase += GroupVATBase;
                TotalVATBase7 += GroupVAT7Base;
                TotalVATAmount += GroupVATAmount;
                TotalVATCredit += GroupVATCredit;
                TotalVATAmountCredit += GroupVATAmountCredit;
                TotalVATAmountPurchCr += GroupVATAmountPurchCr;

                No += 1;

                if CountLineNo = 0 then begin
                    Clear(GroupVatBaseAmtPerPage);
                    Clear(GroupVatBase7AmtPerPage);
                    Clear(GroupAmountPerPage);
                    Clear(GroupVatBaseAmtNoVatPerPage);
                    Clear(GroupVATCreditPerPage);
                    Clear(GroupVATAmountCreditPerPage);
                    Clear(GroupVATAmountPurchCrPerPage);
                end;

                SubTotal := false;
                CountLineNo += 1;
                if (CountLineNo = 28) or (TempVATWHTSettlementEntry.Count = LoopLine.Number) then begin
                    CountLineNo := 0;
                    SubTotal := true;
                end;
                GroupVatBaseAmtPerPage += GroupVATBase;
                GroupVatBase7AmtPerPage += GroupVAT7Base;
                GroupAmountPerPage += GroupVATAmount;
                GroupVATCreditPerPage += GroupVATCredit;
                GroupVatBaseAmtNoVatPerPage += GroupVATBase + GroupVATAmount;
                GroupVATAmountCreditPerPage += GroupVATBase - GroupVATCredit;
                GroupVATAmountPurchCrPerPage += GroupVAT7Base - GroupVATAmount;
            end;

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, 1);

                TempVATWHTSettlementEntry.Reset;
                if SortingTypeG = SortingTypeG::"Posting Date" then
                    TempVATWHTSettlementEntry.SetCurrentKey("Settlement No.", "Document No.", "Entry No.")
                else
                    if SortingTypeG = SortingTypeG::"Document Date" then
                        TempVATWHTSettlementEntry.SetCurrentKey("Settlement No.", "Document No.", "Entry No.")
                    else
                        if VATWHTSettlementCard."VAT Type" = VATWHTSettlementCard."VAT Type"::Purchase then
                            //LL++
                            /*
                            //LL-
                            TempVATWHTSettlementEntry.SETCURRENTKEY("Settlement No.","External Document No.","Posting Date","Entry No.")
                            //LL++
                            */
                    TempVATWHTSettlementEntry.SetCurrentKey("Settlement No.", "External Document No.", "Document Date", "Entry No.")
                        //LL--
                        else
                            TempVATWHTSettlementEntry.SetCurrentKey("Settlement No.", "Document No.", "Posting Date", "Entry No.");


                if TempVATWHTSettlementEntry.Count > 0 then
                    SetRange(Number, 1, TempVATWHTSettlementEntry.Count);

                if TempVATWHTSettlementEntry.Find('-') then;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Option)
                {
                    field(FormatYear; FormatDate)
                    {
                        Caption = 'Format Year';
                        OptionCaption = 'B.E.,A.D.';
                    }
                    field(SortingType; SortingTypeG)
                    {
                        Caption = 'Sorting';
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
    begin
        GlobalLanguage(1054);
    end;

    trigger OnPreReport()
    var
        TodayThai: Text[10];
    begin
        CompanyInfo.Get;
        FormatAddr.Company(CompanyAddr, CompanyInfo);
        TodayTxt := NWTHLocalizationCore.GetFormatDateDDMMYYYY(FormatDate, Today);
    end;

    var
        //--Page Header
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[10] of Text[50];
        FormatAddr: Codeunit "Format Address";
        TitlePurch: Label 'รายงานภาษีซื้อ';
        TitleSales: Label 'รายงานภาษีขาย';
        ColumnPurch1: Label 'ชื่อผู้ขายสินค้า/ผู้ให้บริการ';
        ColumnSales1: Label 'ชื่อผู้ซื้อสินค้า/ผู้รับบริการ';
        HeaderTxt: Text[50];
        ColumnTxt: Text[50];
        ForMonth: Text[50];
        ForYear: Text[10];
        No: Integer;
        InvoiceNo: Code[35];
        DocumentNo: Code[35];
        Vendor: Record Vendor;
        Customer: Record Customer;
        CustVendorName: Text[250];
        VATRegisterNo: Code[20];
        BranchNo: Code[10];
        TaxInvDate: Date;
        TaxInvDateTxt: Text[50];
        ShowOutput: Boolean;
        TempInvoiceNo: Code[20];
        TempDocumentNo: Code[20];
        //--Group VAT Line 
        GroupVATBase: Decimal;
        GroupVAT7Base: Decimal;
        GroupVATAmount: Decimal;
        GroupVATCredit: Decimal;
        GroupVATAmountCredit: Decimal;
        GroupVATAmountPurchCr: Decimal;

        //--Group VAT Total
        TotalVATBase: Decimal;
        TotalVATBase7: Decimal;
        TotalVATAmount: Decimal;
        TotalVATCredit: Decimal;
        TotalVATAmountCredit: Decimal;
        TotalVATAmountPurchCr: Decimal;

        //--Per Page Total
        GroupVatBaseAmtPerPage: Decimal;
        GroupVatBase7AmtPerPage: Decimal;
        GroupAmountPerPage: Decimal;
        GroupVATCreditPerPage: Decimal;
        GroupVatBaseAmtNoVatPerPage: Decimal;
        GroupVATAmountCreditPerPage: Decimal;
        GroupVATAmountPurchCrPerPage: Decimal;

        //--Caption Header
        PageNo: Label 'หน้าที่';
        TaxNoCaption: Label 'เลขประจำตัวผู้เสียภาษี : ';
        PrintDate: Label 'พิมพ์วันที่';
        NoCaption: Label 'ลำดับที่';
        DateCaption: Label 'ว/ด/ป';
        InvoiceNoCaption: Label 'เลขที่ใบ กำกับภาษี';
        DocumentNoCaption: Label 'เลขที่เอกสาร';
        TaxInvNoCaption: Label 'เลขประจำตัวผู้เสียภาษี';
        BranchCaption: Label 'หมายเลขสาขา';
        VATBaseCaption: Label 'มูลค่าสินค้า / บริการทั้งหมดตามใบกำกับภาษี';
        VatBase7Caption: Label 'ภาษีมูลค่าเพิ่มทั้งหมดตามใบกำกับภาษี';
        VATAmountCaption: Label 'ภาษีมูลค่าเพิ่ม';

        VATAmountPerCreditCaption: Label 'ภาษีซื้อเฉลี่ยตามที่มีสิทธินำไปเครดิต';
        VATAmountCreditCaption: Label 'จำนวนเงิน';
        VATAmountPurchaseCaption: Label 'ภาษีซื้อ';

        VATAmountNoPerCreditCaption: Label 'ภาษีซื้อเฉลี่ยที่ไม่สามารถเครดิตได้';
        VATAmountNoCreditCaption: Label 'จำนวนเงิน';
        VATAmountNoPurchaseCaption: Label 'ภาษีซื้อ';

        TotalCaption: Label 'รวมเงิน';
        TotalCaption2: Label 'รวม';
        MonthText: Label 'ประจำเดือน : ';
        FormatDate: Option "B.E.","A.D.";
        TodayTxt: Text[50];

        CountLineNo: Integer;
        SubTotal: Boolean;
        GrandTotalCaption: Label 'รวมสุทธิ';
        CompanyCaption: Label 'ชื่อสถานที่ประกอบการ :';
        AddessCaption: Label 'ที่อยู่ :';
        BranchCaption2: Label 'สำนักงานใหญ่';
        BranchNoCaption: Label 'สาขา';

        //--Table Global
        BigBranch: Text[20];
        HQBranch: array[2] of Text[1];
        BranchName: Text[30];
        VATWHTSettlementCard: Record "NWTH Settlement Card";
        VatPostingSetUp: Record "VAT Posting Setup";
        NextVATWHTSettlementEntry: Record "NWTH Settlement Entry";
        VATEntryG: Record "VAT Entry";
        TempVATEntryG: Record "VAT Entry" temporary;
        TempVATWHTSettlementEntry: Record "NWTH Settlement Entry" temporary;


        VATWHTEntry: Record "NWTH Settlement Entry";
        NWTHLocalizationCore: Codeunit "NWTH Localized Core";
        SortingTypeG: Option "Posting Date","Document No.","Document Date";
        NWTHCompanyBranchG: Record "NWTH Company Branch";

        ComNameG: Text;
        ComAddressG: Text;
        ComPhoneG: Text;
        ComFaxG: Text;
        ComVATRegG: Text;
}