report 50042 "NWTH WHT50BIS Posted PE FIX"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Source Code/ReportLayout/NWTH WHT Certificates 50 BIS Posted PE.rdlc';
    Caption = 'NWTH WHT Certificate 50 BIS (Petty Cash)';
    Permissions = TableData "Purch. Inv. Line" = m, tabledata "NWTH WHT Entry" = m,
                    tabledata "Purch. Cr. Memo Line" = m;
    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = CONST(1));
            dataitem(VendorTemp; "NWTHWHT50BISPrintBuffer")
            {
                DataItemTableView = SORTING("Document Date", "Vendor No.");
                UseTemporary = true;
                dataitem(PaymentWHTEntryTempG; "NWTH Apply WHT Entry")
                {
                    DataItemTableView = SORTING("Original Document No.") ORDER(Ascending);
                    UseTemporary = true;

                    trigger OnAfterGetRecord()
                    begin
                        WHTBaseG := "Base (LCY)";
                        WHTAmountG := "Amount (LCY)" + "WHT Difference";

                        if "NWTH WHT Custom Address" = '' then begin
                            VendorG.Reset();
                            VendorG.Get("Bill-to/Pay-to No.");
                            if "Actual Vendor No." <> '' then
                                VendorG.Get("Actual Vendor No.");
                            if "WHT Report" <> "WHT Report"::"Por Ngor Dor 54" then
                                VendorG.TestField("VAT Registration No.");
                            IF VendorG."NWTH Branch Code" = '' then
                                VendorBranch := ''
                            Else
                                If VendorG."NWTH Branch Code" = '00000' then
                                    VendorBranch := '(สำนักงานใหญ่)'
                                else
                                    VendorBranch := '(สาขาที่ ' + VendorG."NWTH Branch Code" + ')';

                            if VendorG."NWTH Name Title" <> '' then
                                VendorNameG := VendorG."NWTH Name Title" + ' ' + VendorG."NWTH WHT Name" + ' ' + VendorG."NWTH WHT Surname" + ' ' + VendorBranch
                            else
                                VendorNameG := VendorG.Name + VendorG."Name 2";
                            if VendorG."NWTH Address Text 1" <> '' then
                                VendorAddressG := VendorG."NWTH Address Text 1" + ' ' + VendorG."NWTH Address Text 2" + ' ' + VendorG."Post Code"
                            else
                                VendorAddressG := VendorG.Address + ' ' + VendorG."Address 2" + ' ' + VendorG.City + ' ' + VendorG."Post Code";
                            SetVATRegistrationNo(VendorG."VAT Registration No.");
                        end else begin
                            NWTHWHTCustomAddressG.Reset();
                            NWTHWHTCustomAddressG.SetCurrentKey("No.");
                            NWTHWHTCustomAddressG.SetFilter("No.", "NWTH WHT Custom Address");
                            if NWTHWHTCustomAddressG.FindFirst() then;
                            if "WHT Report" <> "WHT Report"::"Por Ngor Dor 54" then
                                NWTHWHTCustomAddressG.TestField("VAT Registration No.");
                            VendorNameG := NWTHWHTCustomAddressG.Name + ' ' + NWTHWHTCustomAddressG."Name 2";
                            VendorAddressG := NWTHWHTCustomAddressG.Address + ' ' + NWTHWHTCustomAddressG."Address 2" + ' ' + NWTHWHTCustomAddressG."Post Code";
                            SetVATRegistrationNo(NWTHWHTCustomAddressG."VAT Registration No.");
                        end;

                        Clear(WHTReport);
                        case "WHT Report" of

                            "WHT Report"::"Por Ngor Dor 3":
                                WHTReport[1] := 'X';
                            "WHT Report"::"Por Ngor Dor 53":
                                WHTReport[2] := 'X';
                            "WHT Report"::"Por Ngor Dor 54":
                                WHTReport[3] := 'X';
                            "WHT Report"::"Por Ngor Dor 1":
                                WHTReport[4] := 'X';
                        end;
                        // case "WHT Report" of
                        //     "WHT Report"::"Por Ngor Dor 3":
                        //         WHTReport[1] := 'X';
                        //     "WHT Report"::"Por Ngor Dor 53":
                        //         WHTReport[2] := 'X';
                        //     "WHT Report"::"Por Ngor Dor 2":
                        //         WHTReport[3] := 'X';
                        // end;
                        // if "WHT Report" = "WHT Report"::"Por Ngor Dor 3" then
                        //     WHTReport[1] := 'X'
                        // else
                        //     if "WHT Report" = "WHT Report"::"Por Ngor Dor 53" then
                        //         WHTReport[2] := 'X'
                        //     else
                        //         If "WHT Report" = "WHT Report"::"Por Ngor Dor 54" then
                        //             WHTReport[3] := 'X';


                        WHTRevenueTypesG.Reset();
                        if WHTRevenueTypesG.Get("WHT Revenue Type") then
                            if WHTRevenueTypesG.Sequence > 0 then begin
                                PostingDateTxt[WHTRevenueTypesG.Sequence] := NWTHLocalizationCoreG.Date2ThaiDate(PaymentWHTEntryTempG."NWTH Document Date");
                                WHTBase[WHTRevenueTypesG.Sequence] += WHTBaseG;
                                WHTAmount[WHTRevenueTypesG.Sequence] += WHTAmountG;

                                TotalWHTBase += WHTBaseG;
                                TotalWHTAmount += WHTAmountG;
                                TotalWHTAmountTxt := NWTHLocalizationCoreG.FormatNoThaiText(TotalWHTAmount, false);

                                if not TempWHTRevenueTypesG.Get("WHT Revenue Type") then begin
                                    TempWHTRevenueTypesG.Init();
                                    TempWHTRevenueTypesG.TransferFields(WHTRevenueTypesG);
                                    TempWHTRevenueTypesG.Insert();

                                    if WHTRevenueTxt = '' then begin
                                        WHTRevenueTxt := WHTRevenueTypesG."NWTH Thai Description";
                                        MaxSeq := TempWHTRevenueTypesG.Sequence;
                                    end else
                                        if TempWHTRevenueTypesG.Sequence > MaxSeq then begin
                                            WHTRevenueTxt := WHTRevenueTypesG."NWTH Thai Description";
                                            MaxSeq := TempWHTRevenueTypesG.Sequence;
                                        end;
                                end;
                            end;

                        // ++ nch 08/04/2020 ++ //
                        DocumentDMY[1] := Date2DMY(PaymentWHTEntryTempG."NWTH Document Date", 1);
                        DocumentDMY[2] := Date2DMY(PaymentWHTEntryTempG."NWTH Document Date", 2);

                        case DocumentDMY[2] of
                            1:
                                DocumentMonthText := 'มกราคม';
                            2:
                                DocumentMonthText := 'กุมภาพันธ์';
                            3:
                                DocumentMonthText := 'มีนาคม';
                            4:
                                DocumentMonthText := 'เมษายน';
                            5:
                                DocumentMonthText := 'พฤษภาคม';
                            6:
                                DocumentMonthText := 'มิถุนายน';
                            7:
                                DocumentMonthText := 'กรกฎาคม';
                            8:
                                DocumentMonthText := 'สิงหาคม';
                            9:
                                DocumentMonthText := 'กันยายน';
                            10:
                                DocumentMonthText := 'ตุลาคม';
                            11:
                                DocumentMonthText := 'พฤศจิกายน ';
                            12:
                                DocumentMonthText := 'ธันวาคม';
                        end;

                        DocumentDMY[3] := Date2DMY(PaymentWHTEntryTempG."NWTH Document Date", 3);
                        if Date2DMY(PaymentWHTEntryTempG."NWTH Document Date", 3) < 2500 then
                            DocumentDMY[3] += 543;
                        // -- nch 08/04/2020 -- //
                    end;

                    trigger OnPreDataItem()
                    begin
                        Reset();

                        SetRange(PaymentWHTEntryTempG."Original Document No.", DocumentNoG);
                        // ++ nch 07/04/2020 ++ //
                        //SETRANGE(PaymentWHTEntryTempG."NWTH WHT Term", WHTTermG);
                        SetRange(PaymentWHTEntryTempG."Actual Vendor No.", VendorTemp."Vendor No.");
                        SetRange(PaymentWHTEntryTempG."NWTH Document Date", VendorTemp."Document Date");
                        // -- nch 07/04/2020 -- //

                        Clear(TotalWHTBase);
                        Clear(TotalWHTAmount);
                        Clear(TotalWHTAmountTxt);
                        Clear(WHTBase);
                        Clear(WHTAmount);
                        Clear(PostingDateTxt);
                        Clear(VendorG);
                        Clear(VendorId);

                        MaxSeq := 0;
                    end;
                }
                dataitem(PrintData; "Integer")
                {
                    DataItemTableView = SORTING(Number) ORDER(Ascending);
                    column(FullUsername; User."Full Name")
                    {
                    }
                    column(Payer; User."Full Name")
                    {

                    }
                    column(PageNumber; PrintData.Number)
                    {
                    }
                    column(HeadingTxt; HeadingTxt)
                    {
                    }
                    column(DocumentNo_TempWHTEntry; DocumentNoG)
                    {
                    }
                    column(WHTCertificateNo_TempWHTEntry; WHTCertificateG)
                    {
                    }
                    column(WHTReportLineNo_TempWHTEntry; WHTReportLineG)
                    {
                    }
                    column(CompanyId_1; CompanyId[1])
                    {
                    }
                    column(CompanyId_2; CompanyId[2])
                    {
                    }
                    column(CompanyId_3; CompanyId[3])
                    {
                    }
                    column(CompanyId_4; CompanyId[4])
                    {
                    }
                    column(CompanyId_5; CompanyId[5])
                    {
                    }
                    column(CompanyId_6; CompanyId[6])
                    {
                    }
                    column(CompanyId_7; CompanyId[7])
                    {
                    }
                    column(CompanyId_8; CompanyId[8])
                    {
                    }
                    column(CompanyId_9; CompanyId[9])
                    {
                    }
                    column(CompanyId_10; CompanyId[10])
                    {
                    }
                    column(CompanyId_11; CompanyId[11])
                    {
                    }
                    column(CompanyId_12; CompanyId[12])
                    {
                    }
                    column(CompanyId_13; CompanyId[13])
                    {
                    }
                    column(Company_Name; CompanyNameG)
                    {
                    }
                    // column(Company_Name2; CompanyInformationG."Name 2")
                    // {
                    // }
                    column(Company_Address; CompanyAddressG)
                    {
                    }
                    column(VendorId_1; VendorId[1])
                    {
                    }
                    column(VendorId_2; VendorId[2])
                    {
                    }
                    column(VendorId_3; VendorId[3])
                    {
                    }
                    column(VendorId_4; VendorId[4])
                    {
                    }
                    column(VendorId_5; VendorId[5])
                    {
                    }
                    column(VendorId_6; VendorId[6])
                    {
                    }
                    column(VendorId_7; VendorId[7])
                    {
                    }
                    column(VendorId_8; VendorId[8])
                    {
                    }
                    column(VendorId_9; VendorId[9])
                    {
                    }
                    column(VendorId_10; VendorId[10])
                    {
                    }
                    column(VendorId_11; VendorId[11])
                    {
                    }
                    column(VendorId_12; VendorId[12])
                    {
                    }
                    column(VendorId_13; VendorId[13])
                    {
                    }
                    column(Vendor_Name; VendorNameG)
                    {
                    }
                    column(Vendor_Address; VendorAddressG)
                    {
                    }
                    column(WHTReport1; WHTReport[4])
                    {

                    }
                    column(WHTReport3; WHTReport[1])
                    {
                    }
                    column(WHTReport53; WHTReport[2])
                    {
                    }
                    column(WHTReport54; WHTReport[3])
                    {
                    }
                    column(PostingDate_1; PostingDateTxt[1])
                    {
                    }
                    column(PostingDate_2; PostingDateTxt[2])
                    {
                    }
                    column(PostingDate_3; PostingDateTxt[3])
                    {
                    }
                    column(PostingDate_4; PostingDateTxt[4])
                    {
                    }
                    column(PostingDate_5; PostingDateTxt[5])
                    {
                    }
                    column(PostingDate_6; PostingDateTxt[6])
                    {
                    }
                    column(PostingDate_7; PostingDateTxt[7])
                    {
                    }
                    column(PostingDate_8; PostingDateTxt[8])
                    {
                    }
                    column(PostingDate_9; PostingDateTxt[9])
                    {
                    }
                    column(PostingDate_10; PostingDateTxt[10])
                    {
                    }
                    column(PostingDate_11; PostingDateTxt[11])
                    {
                    }
                    column(PostingDate_12; PostingDateTxt[12])
                    {
                    }
                    column(PostingDate_13; PostingDateTxt[13])
                    {
                    }
                    column(PostingDate_14; PostingDateTxt[14])
                    {
                    }
                    column(PostingDate_15; PostingDateTxt[15])
                    {
                    }
                    column(PostingDate_16; PostingDateTxt[16])
                    {
                    }
                    column(PostingDate_17; PostingDateTxt[17])
                    {
                    }
                    column(PostingDate_18; PostingDateTxt[18])
                    {
                    }
                    column(WHTBase_1; WHTBase[1])
                    {
                    }
                    column(WHTBase_2; WHTBase[2])
                    {
                    }
                    column(WHTBase_3; WHTBase[3])
                    {
                    }
                    column(WHTBase_4; WHTBase[4])
                    {
                    }
                    column(WHTBase_5; WHTBase[5])
                    {
                    }
                    column(WHTBase_6; WHTBase[6])
                    {
                    }
                    column(WHTBase_7; WHTBase[7])
                    {
                    }
                    column(WHTBase_8; WHTBase[8])
                    {
                    }
                    column(WHTBase_9; WHTBase[9])
                    {
                    }
                    column(WHTBase_10; WHTBase[10])
                    {
                    }
                    column(WHTBase_11; WHTBase[11])
                    {
                    }
                    column(WHTBase_12; WHTBase[12])
                    {
                    }
                    column(WHTBase_13; WHTBase[13])
                    {
                    }
                    column(WHTBase_14; WHTBase[14])
                    {
                    }
                    column(WHTBase_15; WHTBase[15])
                    {
                    }
                    column(WHTBase_16; WHTBase[16])
                    {
                    }
                    column(WHTBase_17; WHTBase[17])
                    {
                    }
                    column(WHTBase_18; WHTBase[18])
                    {
                    }
                    column(WHTAmount_1; WHTAmount[1])
                    {
                    }
                    column(WHTAmount_2; WHTAmount[2])
                    {
                    }
                    column(WHTAmount_3; WHTAmount[3])
                    {
                    }
                    column(WHTAmount_4; WHTAmount[4])
                    {
                    }
                    column(WHTAmount_5; WHTAmount[5])
                    {
                    }
                    column(WHTAmount_6; WHTAmount[6])
                    {
                    }
                    column(WHTAmount_7; WHTAmount[7])
                    {
                    }
                    column(WHTAmount_8; WHTAmount[8])
                    {
                    }
                    column(WHTAmount_9; WHTAmount[9])
                    {
                    }
                    column(WHTAmount_10; WHTAmount[10])
                    {
                    }
                    column(WHTAmount_11; WHTAmount[11])
                    {
                    }
                    column(WHTAmount_12; WHTAmount[12])
                    {
                    }
                    column(WHTAmount_13; WHTAmount[13])
                    {
                    }
                    column(WHTAmount_14; WHTAmount[14])
                    {
                    }
                    column(WHTAmount_15; WHTAmount[15])
                    {
                    }
                    column(WHTAmount_16; WHTAmount[16])
                    {
                    }
                    column(WHTAmount_17; WHTAmount[17])
                    {
                    }
                    column(WHTAmount_18; WHTAmount[18])
                    {
                    }
                    column(TotalWHTBase; TotalWHTBase)
                    {
                    }
                    column(TotalWHTAmount; TotalWHTAmount)
                    {
                    }
                    column(TotalWHTAmountTxt; TotalWHTAmountTxt)
                    {
                    }
                    column(WHTRevenueTxt; WHTRevenueTxt)
                    {
                    }
                    column(DocumentDate_Day; DocumentDMY[1])
                    {
                    }
                    column(DocumentDate_Month; DocumentMonthText)
                    {
                    }
                    column(DocumentDate_Year; DocumentDMY[3])
                    {
                    }
                    column(WHTSeq; WHTTermG)
                    {
                    }
                    column(NWTH_Document_Date; PaymentWHTEntryTempG."NWTH Document Date")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        HeadingTxt := Heading[Number];
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, CopyPagesG);
                    end;
                }

                trigger OnAfterGetRecord()
                var
                    PurchaseLineL: Record "Purchase Line";
                    PurchInvLineL: Record "Purch. Inv. Line";
                    PurchCrMemoLineL: Record "Purch. Cr. Memo Line";
                //PaymentTermTxtL: Text;
                begin
                    // ++ nch 07/04/2020 ++ //
                    //ActualVendorNoG := COPYSTR("Global Dimension 1 Code",1,STRLEN("Global Dimension 1 Code") - 2); // COPYSTR("No.",1,STRLEN("No.") - 2)
                    //PaymentTermTxtL := COPYSTR("Global Dimension 1 Code",STRLEN("Global Dimension 1 Code")); // COPYSTR("No.",STRLEN("No."))
                    // -- nch 07/04/2020 -- //
                    //EVALUATE(WHTTermG,PaymentTermTxtL);

                    WHTTermG := PaymentWHTEntryTempG."NWTH WHT Term";

                    PaymentWHTEntryTempG.Reset();
                    PaymentWHTEntryTempG.SetRange("Original Document No.", DocumentNoG);
                    PaymentWHTEntryTempG.SetRange("Actual Vendor No.", "Vendor No.");
                    PaymentWHTEntryTempG.SetRange("NWTH Document Date", "Document Date");
                    //PaymentWHTEntryTempG.SETRANGE("NWTH WHT Term",WHTTermG);
                    if PaymentWHTEntryTempG.FindFirst() then begin
                        WHTCertificateG := PaymentWHTEntryTempG."WHT Certificate No.";
                        WHTReportLineG := PaymentWHTEntryTempG."WHT Report Line No";

                        if not WHTPostingSetupG.Get(PaymentWHTEntryTempG."WHT Bus. Posting Group", PaymentWHTEntryTempG."WHT Prod. Posting Group") then
                            CurrReport.skip;

                        if (not PrintPreviewsG) and (WHTCertificateG = '') then begin
                            WHTPostingSetupG.TestField("NWTH WHT Cert. Nos.");
                            WHTCertificateG := NoSeriesManagementG.GetNextNo(WHTPostingSetupG."NWTH WHT Cert. Nos.", WorkDate(), true);

                            WHTPostingSetupG.TestField("WHT Report Line No. Series");
                            WHTReportLineG := NoSeriesManagementG.GetNextNo(WHTPostingSetupG."WHT Report Line No. Series", WorkDate(), true);

                            PaymentWHTEntryTempG.ModifyAll("WHT Certificate No.", WHTCertificateG, true);
                            PaymentWHTEntryTempG.ModifyAll("WHT Report Line No", WHTReportLineG, true);
                            //PaymentWHTEntryTempG.MODIFYALL("NWTH WHT Term",WHTTermG);
                            PaymentWHTEntryTempG.ModifyAll("NWTH Modified", true);
                        end;

                        repeat
                            if (not PrintPreviewsG) and (WHTCertificateG <> '') then
                                if PostedPrintG then begin
                                    WHTEntryG.Reset();
                                    WHTEntryG.SetCurrentKey("Document No.", "Posting Date");
                                    WHTEntryG.SetRange("Document No.", DocumentNoG);
                                    WHTEntryG.SetRange("Document Type", WHTEntryG."Document Type"::Payment);
                                    WHTEntryG.SetRange("NWTH Ref. Document No.", TempPurchInvLineG."Document No.");
                                    WHTEntryG.SetRange("NWTH Ref. Line No.", TempPurchInvLineG."Line No.");
                                    if WHTEntryG.FindFirst() then begin
                                        WHTEntryG."WHT Certificate No." := WHTCertificateG;
                                        WHTEntryG."WHT Report Line No" := WHTReportLineG;
                                        //WHTEntryG."NWTH WHT Term" := WHTTermG;
                                        WHTEntryG.Modify();
                                        //WHT Log
                                        FNSub.WHTLog(WHTEntryG."Document No.",
                                                     0,
                                                     WHTEntryG."Posting Date",
                                                     WHTEntryG."Document Date",
                                                     Database::"NWTH WHT Entry",
                                                     WHTCertificateG,
                                                     WHTReportLineG,
                                                     WHTEntryG."Entry No.",
                                                     WHTEntryG."Bill-to/Pay-to No.");
                                        //WHT Log

                                        PurchInvLineL.Reset();
                                        PurchInvLineL.SetCurrentKey("Document No.", "Line No.");
                                        PurchInvLineL.SetRange("Document No.", PaymentWHTEntryTempG."NWTH Ref. Document No.");
                                        PurchInvLineL.SetRange("Line No.", PaymentWHTEntryTempG."NWTH Ref. Line No.");
                                        if PurchInvLineL.FindFirst() then begin
                                            PurchInvLineL."NWTH WHT Certificate No." := WHTCertificateG;
                                            PurchInvLineL."NWTH WHT Report Line No" := WHTReportLineG;
                                            //PurchInvLineL."NWTH WHT Term" := WHTTermG;
                                            PurchInvLineL.Modify();
                                            //WHT Log
                                            FNSub.WHTLog(PurchInvLineL."Document No.",
                                                         PurchInvLineL."Line No.",
                                                         PurchInvLineL."Posting Date",
                                                         PurchInvLineL."NWTH Document Date",
                                                         Database::"Purch. Inv. Line",
                                                         WHTCertificateG,
                                                         WHTReportLineG,
                                                         0,
                                                         PurchInvLineL."NWTH Vendor No.");
                                            //WHT Log
                                        end else begin
                                            PurchCrMemoLineL.Reset();
                                            PurchCrMemoLineL.SetCurrentKey("Document No.", "Line No.");
                                            PurchCrMemoLineL.SetRange("Document No.", PaymentWHTEntryTempG."NWTH Ref. Document No.");
                                            PurchCrMemoLineL.SetRange("Line No.", PaymentWHTEntryTempG."NWTH Ref. Line No.");
                                            if PurchCrMemoLineL.FindFirst() then begin
                                                PurchCrMemoLineL."NWTH WHT Certificate No." := WHTCertificateG;
                                                PurchCrMemoLineL."NWTH WHT Report Line No" := WHTReportLineG;
                                                //PurchCrMemoLineL."NWTH WHT Term" := WHTTermG;
                                                PurchCrMemoLineL.Modify();
                                                //WHT Log
                                                FNSub.WHTLog(PurchCrMemoLineL."Document No.",
                                                             PurchCrMemoLineL."Line No.",
                                                             PurchCrMemoLineL."Posting Date",
                                                             PurchCrMemoLineL."NWTH Document Date",
                                                             Database::"Purch. Cr. Memo Line",
                                                             WHTCertificateG,
                                                             WHTReportLineG,
                                                             0,
                                                             PurchCrMemoLineL."NWTH Vendor No.");
                                                //WHT Log
                                            end;
                                        end;
                                    end;
                                end else begin
                                    PurchaseLineL.Reset();
                                    PurchaseLineL.SetCurrentKey("Document Type", "Document No.", "Line No.");
                                    PurchaseLineL.SetRange("Document No.", PaymentWHTEntryTempG."NWTH Ref. Document No.");
                                    PurchaseLineL.SetRange("Line No.", PaymentWHTEntryTempG."NWTH Ref. Line No.");
                                    if PurchaseLineL.FindFirst() then begin
                                        PurchaseLineL."NWTH WHT Certificate No." := WHTCertificateG;
                                        PurchaseLineL."NWTH WHT Report Line No" := WHTReportLineG;
                                        //PurchaseLineL."NWTH WHT Term" := WHTTermG;
                                        PurchaseLineL.Modify();
                                        //WHT Log
                                        FNSub.WHTLog(PurchaseLineL."Document No.",
                                                     PurchaseLineL."Line No.",
                                                     0D,
                                                     PurchaseLineL."NWTH Document Date",
                                                     Database::"Purchase Line",
                                                     WHTCertificateG,
                                                     WHTReportLineG,
                                                     0,
                                                     PurchaseLineL."NWTH Vendor No.");
                                        //WHT Log
                                    end;
                                end;
                        until PaymentWHTEntryTempG.Next() = 0;
                    end;
                    // if TempGenJnlLineG."NWTH Company Branch Code" <> '' then
                    //if NWTHCompanyBranchG.Get(TempGenJnlLineG."NWTH Company Branch Code") then begin
                    //         for I := 1 to StrLen(NWTHCompanyBranchG."VAT Registration No.") do
                    //             CompanyId[I] := CopyStr(NWTHCompanyBranchG."VAT Registration No.", I, 1);
                    //NWTHAddressMgr.GetCompanyBranchNameAddress(NWTHCompanyBranchG, CompanyNameG, CompanyAddressG);
                    //     end;
                end;

                trigger OnPostDataItem()
                begin
                    // PaymentWHTEntryTempG.RESET;
                    // IF PaymentWHTEntryTempG.FINDSET THEN REPEAT
                    //  MESSAGE('%1 ok %2',PaymentWHTEntryTempG."Actual Vendor No.",PaymentWHTEntryTempG."NWTH Document Date");
                    // UNTIL PaymentWHTEntryTempG.NEXT = 0;
                end;

                trigger OnPreDataItem()
                begin
                    Reset();
                end;
            }

            trigger OnAfterGetRecord()
            var
                EntryNoL: Integer;
                //OptionL: Option "1","2","3","4";
                OptionL: Integer;
                //GroupL: Integer;
                VendorRunningL: Integer;
            // DocumentDateL: Date;
            // VerdorL: Text;
            // VerdorInsertL: Boolean;
            begin
                TempPurchInvLineG.Reset();
                if TempPurchInvLineG.FindFirst() then
                    Clear(VendorRunningL);
                if not PrintPreviewsG then
                    BISMainFunction.UpdateWHTCerEXP(TempPurchInvLineG."Document No.");
                //NWTHAddressMgr.UpdateWHTCerEXP(TempPurchInvLineG."Document No.");
                repeat
                    if (TempPurchInvLineG."NWTH Vendor No." <> '') or (TempPurchInvLineG."NWTH WHT Custom Address" <> '') then begin

                        if TempPurchInvLineG."NWTH Vendor No." <> '' then begin
                            if not VendorTemp.Get(TempPurchInvLineG."NWTH Vendor No.", TempPurchInvLineG."NWTH Document Date") then begin
                                VendorTemp.Init();
                                VendorTemp."Vendor No." := TempPurchInvLineG."NWTH Vendor No.";
                                VendorTemp."Document Date" := TempPurchInvLineG."NWTH Document Date";
                                VendorTemp.Insert();
                            end;
                        end else
                            if TempPurchInvLineG."NWTH WHT Custom Address" <> '' then
                                if not VendorTemp.Get(TempPurchInvLineG."NWTH WHT Custom Address", TempPurchInvLineG."NWTH Document Date") then begin
                                    VendorTemp.Init();
                                    VendorTemp."Vendor No." := TempPurchInvLineG."NWTH WHT Custom Address";
                                    VendorTemp."Document Date" := TempPurchInvLineG."NWTH Document Date";
                                    VendorTemp.Insert();
                                end;


                        EntryNoL += 1;
                        PaymentWHTEntryTempG.Init();
                        PaymentWHTEntryTempG."NWTH Document Date" := VendorTemp."Document Date";
                        PaymentWHTEntryTempG."Entry No." := EntryNoL;
                        PaymentWHTEntryTempG."Original Document No." := TempPurchInvLineG."Document No.";

                        // ++ nch 07/04/2020 ++ //
                        OptionL := PaymentWHTEntryTempG."NWTH WHT Term";

                        // -- nch 07/04/2020 -- //

                        PaymentWHTEntryTempG."Actual Vendor No." := TempPurchInvLineG."NWTH Vendor No.";
                        PaymentWHTEntryTempG."Bill-to/Pay-to No." := TempPurchInvLineG."NWTH Vendor No.";
                        PaymentWHTEntryTempG."WHT Bus. Posting Group" := TempPurchInvLineG."NWTH WHT Bus. Posting Group";
                        PaymentWHTEntryTempG."WHT Prod. Posting Group" := TempPurchInvLineG."NWTH WHT Prod. Posting Group";
                        //spr add if
                        if WHTPostingSetupG.Get(TempPurchInvLineG."NWTH WHT Bus. Posting Group", TempPurchInvLineG."NWTH WHT Prod. Posting Group") then;

                        PaymentWHTEntryTempG."WHT Report" := WHTPostingSetupG."WHT Report";
                        PaymentWHTEntryTempG."WHT Revenue Type" := WHTPostingSetupG."Revenue Type";
                        PaymentWHTEntryTempG.Base := TempPurchInvLineG."Line Amount";
                        PaymentWHTEntryTempG.Amount := TempPurchInvLineG."NWTH WHT Amount";
                        PaymentWHTEntryTempG."WHT Difference" := TempPurchInvLineG."NWTH WHT Difference";
                        PaymentWHTEntryTempG."NWTH Ref. Document No." := TempPurchInvLineG."Document No.";
                        PaymentWHTEntryTempG."NWTH Ref. Line No." := TempPurchInvLineG."Line No.";
                        PaymentWHTEntryTempG."WHT Certificate No." := TempPurchInvLineG."NWTH WHT Certificate No.";
                        PaymentWHTEntryTempG."WHT Report Line No" := TempPurchInvLineG."NWTH WHT Report Line No";
                        PaymentWHTEntryTempG.Validate("NWTH WHT Term", TempPurchInvLineG."NWTH WHT Term");
                        PaymentWHTEntryTempG."NWTH WHT Custom Address" := TempPurchInvLineG."NWTH WHT Custom Address";

                        if PaymentWHTEntryTempG."Actual Vendor No." = '' then begin
                            PaymentWHTEntryTempG.TestField("NWTH WHT Custom Address");
                            PaymentWHTEntryTempG."Actual Vendor No." := PaymentWHTEntryTempG."NWTH WHT Custom Address";
                        end;
                        //spr
                        if PurchInvHdr.get(TempPurchInvLineG."Document No.") then begin
                            if PurchInvHdr."Currency Factor" <> 0 then begin
                                PaymentWHTEntryTempG."Base (LCY)" := Round(PaymentWHTEntryTempG.Base / PurchInvHdr."Currency Factor");
                                PaymentWHTEntryTempG."Amount (LCY)" := Round(PaymentWHTEntryTempG."Amount (LCY)" / PurchInvHdr."Currency Factor");
                            end;
                        end;
                        //spr
                        PaymentWHTEntryTempG.Insert();
                    end;

                // ++ nch 07/04/2020 ++ //
                //IF VerdorInsertL THEN IF VendorTemp.INSERT THEN;
                // -- nch 07/04/2020 -- //

                until TempPurchInvLineG.Next() = 0;
                //NWTHAddressMgr.GetCompanyBranchNameAddress(NWTHCompanyBranchG, CompanyNameG, CompanyAddressG);

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("WHT Certificate Report")
                {
                    Caption = '';
                    group("Para1.1")
                    {
                        Caption = 'Welcome to NaviWorld Core Add-In';
                        group("Para1.1.1")
                        {
                            Caption = '';
                            InstructionalText = 'WHT Certificate 50 BIS Report support for Thai Goverment. This report have to print out and sent to vendor.';
                        }
                    }
                    group("Para1.3")
                    {
                        Caption = 'Print Preview';
                        InstructionalText = 'Print preview, the system won''t generate the WHT Certificate number series. (In case, that WHT Cetificate never print before)';
                        field(PrintPreviewG; PrintPreviewsG)
                        {
                            Caption = 'Print Preview';
                            ApplicationArea = all;
                            ToolTip = 'Specifies the value of the Print Preview field';
                        }
                    }
                    group("Para1.4")
                    {
                        Caption = 'Number of Copies';
                        InstructionalText = 'Normally the system will printed 4 pages, you can redeuce the number of page here.';
                        field(CopyPageG; CopyPagesG)
                        {
                            Caption = 'Number of Copies';
                            ApplicationArea = all;
                            ToolTip = 'Specifies the value of the Number of Copies field';
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
    begin
        Heading[1] := '(สำหรับผู้ถูกหักภาษี ณ ที่จ่าย ใช้แนบพร้อมกับแบบแสดงรายการภาษี)';
        Heading[2] := '(สำหรับผู้ถูกหักภาษี ณ ที่จ่าย เก็บไว้เป็นหลักฐาน)';
        Heading[3] := '(สำหรับผู้ถูกหักภาษี ณ ที่จ่าย เก็บไว้เป็นหลักฐานในการออกใบแทน)';
        Heading[4] := '(สำหรับผู้ถูกหักภาษี ณ ที่จ่าย เก็บไว้เป็นหลักฐานในการออกใบแทน)';

        // Heading[3] := '(สำหรับฝ่ายบัญชี)';//'(สำหรับผู้ถูกหักภาษี ณ ที่จ่าย เก็บไว้เป็นหลักฐานในการออกใบแทน)';
        // Heading[4] := '(สำหรับผู้ออกหนังสือรับรองการหักภาษี ณ ที่จ่าย)';//'(สำหรับผู้ถูกหักภาษี ณ ที่จ่าย เก็บไว้เป็นหลักฐานในการออกใบแทน)';
        NWTHLocalizationSetupG.Get();
        PrintPreviewsG := NWTHLocalizationSetupG."NWTH Default As Preview";
        CopyPagesG := 4;
    end;

    trigger OnPreReport()
    begin
        CompanyInformationG.GET();
        CompanyInformationG.TestField("VAT Registration No.");
        for I := 1 to StrLen(CompanyInformationG."VAT Registration No.") do
            CompanyId[I] := CopyStr(CompanyInformationG."VAT Registration No.", I, 1);

        NWTHAddressMgr.GetCompanyNameAddress(CompanyInformationG, CompanyNameG, CompanyAddressG);
        User.Reset();
        User.setrange("User Name", UserId);
        User.FindFirst();
        User.TestField("Full Name");
    end;

    var
        VendorG: Record Vendor;
        CompanyInformationG: Record "Company Information";
        WHTRevenueTypesG: Record "NWTH WHT Revenue Types";
        WHTPostingSetupG: Record "NWTH WHT Posting Setup";
        WHTEntryG: Record "NWTH WHT Entry";
        NWTHWHTCustomAddressG: Record "NWTH WHT Custom Address";
        NWTHLocalizationSetupG: Record "NWTH Thai Localization Setup";
        TempWHTRevenueTypesG: Record "NWTH WHT Revenue Types" temporary;
        TempPurchInvLineG: Record "Purch. Inv. Line" temporary;
        NWTHLocalizationCoreG: Codeunit "NWTH Localized Core";
        NWTHCompanyBranchG: Record "NWTH Company Branch";
        NoSeriesManagementG: Codeunit NoSeriesManagement;
        HeadingTxt: Text;
        Heading: array[4] of Text;
        DocumentDMY: array[3] of Integer;
        CompanyId: array[50] of Code[1];
        VendorId: array[50] of Code[1];
        I: Integer;
        WHTReport: array[4] of Code[1];
        WHTBase: array[18] of Decimal;
        WHTAmount: array[18] of Decimal;
        TotalWHTBase: Decimal;
        TotalWHTAmount: Decimal;
        TotalWHTAmountTxt: Text;
        WHTRevenueTxt: Text;
        WHTCertificateG: Code[20];
        WHTReportLineG: Code[20];
        DocumentMonthText: Text;
        PrintPreviewsG: Boolean;
        DocumentNoG: Text;
        WHTBaseG: Decimal;
        WHTAmountG: Decimal;
        WHTTermG: Option "1","2","3","4";
        CopyPagesG: Integer;
        PostingDateTxt: array[18] of Text;
        VendorNameG: Text;
        VendorAddressG: Text;
        VendorBranch: Text;
        PostedPrintG: Boolean;
        FullUserName: Text;
        MaxSeq: Integer;
        CompanyNameG: Text;
        CompanyName2G: Text;
        CompanyAddressG: Text;
        NWTHAddressMgr: Codeunit "NWTH AddressManagement fix";
        BISMainFunction: Codeunit "BIS Main Function";
        FNSub: Codeunit FinanceSubscriberLOCFix;
        PurchInvHdr: Record "Purch. Inv. Header";
        UserName: Code[50];
        User: Record User;
    //[Scope('Internal')]
    procedure SetPostedPrint(PostedPrintP: Boolean)
    begin
        PostedPrintG := PostedPrintP;
    end;

    local procedure SetVATRegistrationNo(Vat: Text[20])
    begin
        for I := 1 to StrLen(Vat) do
            VendorId[I] := CopyStr(Vat, I, 1);
    end;


    procedure InitialDocument(DocumentNoP: Text)
    begin
        DocumentNoG := DocumentNoP;
    end;


    procedure SetPurchInvLine(PurchaseLineP: Record "Purch. Inv. Line")
    begin
        TempPurchInvLineG.Init();
        TempPurchInvLineG := PurchaseLineP;
        TempPurchInvLineG.Insert();
    end;
}

