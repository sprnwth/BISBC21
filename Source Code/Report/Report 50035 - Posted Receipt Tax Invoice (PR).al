report 50035 "BIS Receipt Tax Invoice (P)"
{
    //
    DefaultLayout = RDLC;
    RDLCLayout = './Source Code/ReportLayout/PostedPrePrintRecieptTaxInvoice.rdl';
    Caption = 'Receipt Tax Invoice';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);
            RequestFilterFields = "No.";
            column(ReportCaption; ReportCaptionG)
            {
            }
            column(SaleSetup_ISO; SaleSetup."ISO for SI")
            {

            }
            column(CurrCode; CurrCode)
            {
            }
            column(HideLot; HideLot)
            {
            }
            column(CompanyInfo_Pic; CompanyInformationG.Picture)
            {
            }
            column(CompanyInfo_1; CompanyInfoG[1])
            {
            }
            column(CompanyInfo_2; CompanyInfoG[2])
            {
            }
            column(CompanyInfo_3; CompanyInfoG[3])
            {
            }
            column(CompanyInfo_4; CompanyInfoG[4])
            {
            }
            column(CompanyInfo_5; CompanyInfoG[5])
            {
            }
            column(CompanyInfo_6; CompanyInfoG[6])
            {
            }
            column(CompanyInfo_7; CompanyInfoG[7])
            {
            }
            column(CompanyInfo_8; CompanyInfoG[8])
            {
            }
            column(CompanyInfo_9; CompanyInfoG[9])
            {

            }

            column(ReportCaptionENG; ReportCaptionENGG)
            {

            }
            column(ReportLabelNameThai; ReportLabelNameThai)
            {

            }
            column(ReportLabelNameENG; ReportLabelNameENG)
            {

            }
            column(SaleInvH_CustomerNo; CustomerG."No.")
            {
            }
            column(SaleInvH_CustomerName; CustomerG.Name + ' ' + CustomerG."Name 2") //SWA
            {
            }
            column(SaleInvH_CustomerAddr1; CustomerG.Address + ' ' + CustomerG."Address 2")
            {
            }
            column(SaleInvH_CustomerAddr2; CustomerG."Post Code")
            {
            }
            column(Customer_VATNo; CustomerG."VAT Registration No.")
            {
            }
            column(SaleInvH_Phone; PhoneShip)
            {
            }
            column(SaleInvH_FAX; FAXShip)
            {

            }
            column(SaleInvH_No; "Sales Invoice Header"."No.")
            {
            }
            column(SaleINVNoL; "Sales Invoice Header"."No.")
            {

            }
            column(SaleInvH_DocDate; "Sales Invoice Header"."Posting Date")
            {
            }
            column(SaleInvH_ExtDocNo; "Sales Invoice Header"."External Document No.")
            {
            }
            column(SaleInvH_PaymentTerm; "Sales Invoice Header"."Payment Terms Code")
            {
            }
            column(SaleInvH_DueDate; "Sales Invoice Header"."Due Date")
            {
            }
            column(SalePerson_Name; SalesPersonG.Name)
            {
            }
            column(SaleTransport_Method; Agentrec.Name)
            {
            }
            column(SaleInvH_ShipToName; "Sales Invoice Header"."Ship-to Name")
            {
            }

            column(SaleInvH_ShipToAddr1; ShiptoAddress1) ///Revise
            {
            }
            column(SaleInvH_ShipToAddr2; ShiptoAddress2)///Revise
            {
            }
            column(SaleInvH_PostingDescp; "Sales Invoice Header"."Posting Description")
            {
            }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {

            }
            column(RefereanceWorkdesG; RefereanceWorkdesG)
            {

            }
            column(TotalAmt; Format("Sales Invoice Header"."Amount Including VAT", 0, '<Integer Thousand><Decimals,3>'))
            //AmountGenLCY := Format(("Gen. Journal Line"."Amount (LCY)"), 0, '<Integer Thousand><Decimals,3>')
            {
            }
            // column(TotalAmt; "Sales Invoice Header".Amount)
            // //AmountGenLCY := Format(("Gen. Journal Line"."Amount (LCY)"), 0, '<Integer Thousand><Decimals,3>')
            // {
            // }
            column(TotalAmtExcVAT; TotalAmtExcVATG)
            {
            }
            column(InvDiscoundAmt; Format("Sales Invoice Header"."Invoice Discount Amount", 0, '<Integer Thousand><Decimals,3>'))
            {
            }
            // column(InvDiscoundAmt; InvDiscountG1)
            // {
            // }
            column(LineAmountG1; Format(LineAmountG1, 0, '<Integer Thousand><Decimals,3>'))
            {
            }
            column(TotalAmtIncVAT; TotalAmtIncVATG)
            {
            }
            column(TotalVAT; VATAmountG)
            {
            }
            column(SumAmt; CustAmountG)
            {
            }
            column(PrepaymentAmt; PrepaymentAmtG)
            {
            }
            column(VATPercent; VATPercentG)
            {
            }
            column(TotalAmountTxt; TotalAmountTxt)
            {
            }
            column(BranchText; BranchText)
            {
            }
            column(BranchTextMain; BranchTextMain)
            {
            }
            column(SaleInvH_CustomerBranch; CustomerBranchG)
            {
            }
            column(ApprovedDate; ApprovedDate)
            {
            }
            column(BankName; BankName)
            {
            }
            column(BankAddress; BankAddress)
            {
            }
            column(SwiftCode; SwiftCode)
            {
            }
            column(AccountName; AccountName)
            {
            }
            column(AccountNo; AccountNo)
            {
            }
            column(Reason_Code; "Reason Code")
            {
            }
            column(BankBranch; BankBranch)
            {
            }
            column(SumQTY; SumQTY)
            {
            }
            column(UseSignature; UseSignature)
            {
            }
            column(SumNOVAT; Format(ABS(SumNOVAT), 0, '<Integer Thousand><Decimals,3>'))
            {
            }
            column(SumAllVAT; Format(ABS(SumAllVAT), 0, '<Integer Thousand><Decimals,3>'))
            {
            }
            column(VATAmountG; Format(ABS(VATAmountG), 0, '<Integer Thousand><Decimals,3>'))
            {

            }
            column(SalHDR_External_Document_No_; "External Document No.")
            {
            }
            column(DiscPercent; Format(Round(DiscPercent), 0, '<Integer Thousand><Decimals,3>'))
            {

            }
            column(RemarkWorkdes; RemarkWorkdes)
            {
            }
            column(HidePostingDate; HidePostingDate)
            {

            }
            column(ResponseText; Picture64)
            {

            }


            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE("Prepayment Line" = CONST(false));
                column(Document_No_; "Document No.")
                {

                }
                column(Line_No_; "Line No.")
                {

                }
                column(SaleInvL_ItemNo; ItemNoG)
                {
                }
                column(SaleInvL_Description; "Sales Invoice Line".Description)
                {
                }
                column(SaleInvL_UOMDesc; UOMDescription)
                {
                }
                column(SaleInvL_Qty; "Sales Invoice Line".Quantity)
                {
                }
                column(SaleInvL_LineAmount; "Sales Invoice Line"."Line Amount")
                {
                }
                column(Sale_Line_VAT; "Sales Invoice Line"."VAT %")
                {
                }
                column(SaleInvL_UnitPrice; "Sales Invoice Line"."Unit Price")
                {
                }
                column(SaleInvL_VAT; "Sales Invoice Line"."VAT %")
                {
                }
                column(Line_Discount__; "Line Discount Amount")
                {

                }
                column(Location_Code; Location.Name)
                {

                }
                column(RunNo; RunNoG)
                {
                }
                column(TotalAmountText; TotalAmountTxt)
                {
                }
                column(SaleInvL_DiscountAmt; "Sales Invoice Line"."Line Discount Amount")
                {
                }
                column(SaleInvL_Type; "Sales Invoice Line".Type)
                {
                }
                column(SalVatPerLine; "Sales Invoice Line"."VAT %")
                {

                }

                column(commentARR_1; commentARR[1])
                {

                }
                column(commentARR_2; commentARR[2])
                {

                }
                column(commentARR_3; commentARR[3])
                {
                }

                dataitem("Value Entry"; "Value Entry")
                {
                    DataItemTableView = sorting("Document No.");
                    DataItemLink = "Document No." = field("Document No."),
                                    "Document Line No." = Field("Line No."),
                                    "Item No." = field("No.");
                    column(Entry_No_; "Entry No.")
                    {

                    }
                    column(LotNo; LotNo)
                    {

                    }
                    column(SerialNo; SerialNo)
                    {

                    }
                    column(TrackingLineTxt; TrackingLineTxt)
                    {

                    }
                    trigger OnAfterGetRecord()
                    begin
                        LotNo := '';
                        SerialNo := '';
                        ExpDate := 0D;
                        WarrantyDate := 0D;
                        TrackingLineTxt := '';
                        if ItemLedgerEntry.get("Item Ledger Entry No.") then begin
                            LotNo := ItemLedgerEntry."Lot No.";
                            SerialNo := ItemLedgerEntry."Serial No.";
                            ExpDate := ItemLedgerEntry."Expiration Date";
                            WarrantyDate := ItemLedgerEntry."Warranty Date";
                        end;
                        if LotNo <> '' then
                            TrackingLineTxt := 'Lot : ' + LotNo;
                        if SerialNo <> '' then
                            if TrackingLineTxt <> '' then
                                TrackingLineTxt += TypeHelper.CRLFSeparator() + 'Serial : ' + SerialNo
                            else
                                TrackingLineTxt += 'Serial : ' + SerialNo;

                        if WarrantyDate <> 0D then
                            TrackingLineTxt += TypeHelper.CRLFSeparator() + 'Mfg Date :' + Format(WarrantyDate);

                        if ExpDate <> 0D then
                            TrackingLineTxt += TypeHelper.CRLFSeparator() + 'Exp. Date :' + Format(ExpDate);
                        if (LotNo = '') and (SerialNo = '') then
                            CurrReport.Skip();
                        If HideLot <> true then
                            CurrReport.Skip();

                    end;
                }


                trigger OnAfterGetRecord()
                var
                    i: Integer;
                begin
                    Clear(ItemNoG);
                    Clear(UOMDescription);
                    // LineNoG += 1;


                    LineAmountG1 += "Sales Invoice Line"."Line Amount";
                    if "Sales Invoice Line".Type = "Sales Invoice Line".Type::" " then
                        CurrReport.Skip();
                    if "Sales Invoice Line".Type <> "Sales Invoice Line".Type::" " then
                        RunNoG += 1;

                    if "Sales Invoice Line".Type <> "Sales Invoice Line".Type::" " then
                        ItemNoG := "Sales Invoice Line"."No.";



                    SaleshipmentLine.Reset();
                    SaleshipmentLine.SetRange("Document No.", "Sales Invoice Line"."Shipment No.");
                    SaleshipmentLine.SetRange("Line No.", "Sales Invoice Line"."Shipment Line No.");
                    If SaleshipmentLine.FindFirst() then;
                    Saleshipment.Reset();
                    Saleshipment.SetRange("No.", SaleshipmentLine."Document No.");
                    If Saleshipment.FindFirst() then;

                    Location.Reset();
                    Location.SetRange(Code, "Sales Invoice Line"."Location Code");
                    If Location.FindFirst() then;

                    //Message(Saleshipment."No.");

                    if SalesPersonG.Get(Saleshipment."Salesperson Code") then;
                    If Agentrec.Get(Saleshipment."Shipping Agent Code") then;

                    UnitOfMeasureG.Reset();
                    UnitOfMeasureG.SetRange(Code, "Sales Invoice Line"."Unit of Measure Code");
                    if UnitOfMeasureG.FindFirst() then
                        UOMDescription := UnitOfMeasureG.Description;

                    SaleInvLineG2.Reset();
                    SaleInvLineG2.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    If SaleInvLineG2.FindFirst() then begin
                        repeat
                            IF VATPostingSetupG.GET(SaleInvLineG2."VAT Bus. Posting Group", SaleInvLineG2."VAT Prod. Posting Group") THEN BEGIN
                                IF VATPostingSetupG."VAT %" <> 0 THEN
                                    VATPercentG := VATPostingSetupG."VAT %"
                                ELSE
                                    VATPercentG := 0;
                            end;
                        Until (SaleInvLineG2.Next() = 0) or (VATPercentG <> 0);

                    end;

                    if "Sales Invoice Line"."VAT %" = 0 then
                        TotalAmtExcVATG := TotalAmtExcVATG + "Sales Invoice Line".Amount
                    else begin
                        TotalAmtIncVATG := TotalAmtIncVATG + "Sales Invoice Line".Amount;

                    end;




                    CustAmountG := CustAmountG + "Sales Invoice Line".Amount;
                    AmountInclVATG += "Sales Invoice Line"."Amount Including VAT";
                    InvDiscoundAmtG := InvDiscoundAmtG + "Sales Invoice Line"."Inv. Discount Amount";
                    VATAmountG := VATAmountG + ("Sales Invoice Line"."Amount Including VAT" - "Sales Invoice Line".Amount);

                    TotalAmountTxt := NWTHLocalizedCoreG.FormatNoTextVoucher("Sales Invoice Header"."Amount Including VAT");

                    //Message(Format(TotalAmountTxt));
                    InvDiscoundAmtG := InvDiscoundAmtG;

                    //AmountGenLCY := Format(("Gen. Journal Line"."Amount (LCY)"), 0, '<Integer Thousand><Decimals,3>')

                    InvDiscountG1 := Format(("Sales Invoice Header"."Invoice Discount Amount"), 0, '<Integer Thousand><Decimals,3>');

                    SumQTY += "Sales Invoice Line".Quantity;
                    Clear(commentARR);
                    saleCommentLine.Reset();
                    saleCommentLine.SetRange("No.", "Document No.");
                    saleCommentLine.SetRange("Document Line No.", "Line No.");
                    saleCommentLine.SetRange("Document Type", saleCommentLine."Document Type"::"Posted Invoice");
                    If saleCommentLine.FindFirst() then begin
                        If saleCommentLine.Comment = '' then
                            CurrReport.Skip();
                        repeat
                            i += 1;
                            // LineNoG += 1;
                            commentARR[i] := saleCommentLine.Comment
                        until saleCommentLine.Next() = 0;
                    end;




                end;
            }

            trigger OnAfterGetRecord()
            var
                HttpClient: HttpClient;                 // Add new barcode 2023-05-29
                HttpResponse: HttpResponseMessage;      // Add new barcode 2023-05-29
                URL: Text;                              // Add new barcode 2023-05-29
                HttpClientHeader: HttpHeaders;
                httpRequest: HttpRequestMessage;
                HttpContentx: HttpContent;
                HttpRequestx: HttpRequestMessage;
            begin
                Clear(LineAmountG1);
                CustomerG.Reset();
                PaymentG.Reset();
                SalesPersonG.Reset();
                Clear(CustomerBranchG);
                CompanyInformationG.Get();
                CompanyInformationG.CalcFields(Picture);
                CompanyInfoG[1] := CompanyInformationG.Name + ' (HEAD OFFICE)';
                CompanyInfoG[2] := 'Address : ' + CompanyInformationG.Address + ' ' + CompanyInformationG."Address 2" + ' ' + CompanyInformationG.City + ' ' + CompanyInformationG."Post Code";
                CompanyInfoG[3] := CompanyInformationG."VAT Registration No.";
                CompanyInfoG[4] := CompanyInformationG."Phone No.";
                CompanyInfoG[5] := CompanyInformationG."Fax No.";
                CompanyInfoG[6] := CompanyInformationG."NWTH 2nd Name" + '(สำนักงานใหญ่) ';
                CompanyInfoG[7] := 'ที่อยู่ : ' + CompanyInformationG."NWTH 2nd Address" + ' ' + CompanyInformationG."NWTH 2nd Address 2" + ' ' + CompanyInformationG."Post Code";
                CompanyInfoG[8] := CompanyInformationG.Name;
                CompanyInfoG[9] := CompanyInformationG."NWTH 2nd Name";

                if ("NWTH Company Branch Code" <> '') and ("NWTH Company Branch Code" <> '00000') then
                    if NWTHCompanyBranchInfoG.Get("NWTH Company Branch Code") then begin
                        Clear(CompanyInfoG);
                        CompanyInfoG[1] := NWTHCompanyBranchInfoG.Name + 'Branch ' + "NWTH Company Branch Code";
                        CompanyInfoG[2] := 'Address : ' + NWTHCompanyBranchInfoG.Address + ' ' + NWTHCompanyBranchInfoG."Address 2" + ' ' + NWTHCompanyBranchInfoG.City + ' ' + NWTHCompanyBranchInfoG."Post Code";
                        CompanyInfoG[3] := NWTHCompanyBranchInfoG."VAT Registration No.";
                        CompanyInfoG[4] := NWTHCompanyBranchInfoG."Phone No.";
                        CompanyInfoG[5] := NWTHCompanyBranchInfoG."Fax No.";
                        CompanyInfoG[6] := NWTHCompanyBranchInfoG."NWTH 2nd Name" + ' สาขา ' + "NWTH Company Branch Code";
                        CompanyInfoG[7] := 'ที่อยู่ : ' + NWTHCompanyBranchInfoG."NWTH 2nd Address" + ' ' + NWTHCompanyBranchInfoG."NWTH 2nd Address 2" + ' ' + NWTHCompanyBranchInfoG."Post Code";
                        CompanyInfoG[8] := NWTHCompanyBranchInfoG.Name;
                        CompanyInfoG[9] := NWTHCompanyBranchInfoG."NWTH 2nd Name";
                    end;

                CustomerG1.Reset();
                CustomerG1.SetRange("No.", "Sales Invoice Header"."Sell-to Customer No.");
                If CustomerG1.FindFirst() then
                    If "Ship-to Code" <> '' then begin
                        ShiptoAddressG.Reset();
                        ShiptoAddressG.SetRange(Code, "Sales Invoice Header"."Ship-to Code");
                        ShiptoAddressG.SetRange("Customer No.", "Sales Invoice Header"."Sell-to Customer No.");
                        If ShiptoAddressG.FindFirst() then begin
                            ShiptoAddress1 := ShiptoAddressG.Address + ' ' + ShiptoAddressG.Thambon + ' ' + ShiptoAddressG.Amphur;
                            ShiptoAddress2 := ShiptoAddressG.City + ' ' + ShiptoAddressG."Post Code" + ' ' + ShiptoAddressG."Receive Good Condition";
                            PhoneShip := ShiptoAddressG."Phone No.";
                            FAXShip := ShiptoAddressG."Fax No.";
                        end;
                    end Else begin
                        ShiptoAddress1 := CustomerG1.Address + ' ' + CustomerG1."NWTH Sub-District" + ' ' + CustomerG1."NWTH District";
                        ShiptoAddress2 := CustomerG1."NWTH Province" + ' ' + CustomerG1."Post Code";
                        PhoneShip := CustomerG1."Phone No.";
                        FAXShip := CustomerG1."Fax No.";

                    end;



                "Sales Invoice Header".CalcFields(Amount);
                "Sales Invoice Header".CalcFields("Amount Including VAT");
                "Sales Invoice Header".CalcFields("Invoice Discount Amount");
                //Message('%1||%2', "Sales Invoice Header".Amount, "Sales Invoice Header"."Invoice Discount Amount");
                If "Sales Invoice Header"."Prices Including VAT" then
                    AmtSum := "Sales Invoice Header"."Amount Including VAT" + "Sales Invoice Header"."Invoice Discount Amount"
                Else
                    AmtSum := "Sales Invoice Header".Amount + "Sales Invoice Header"."Invoice Discount Amount";

                DiscPercent := ("Sales Invoice Header"."Invoice Discount Amount" / AmtSum) * 100;

                if PaymentG.Get("Payment Terms Code") then;




                RemarkWorkdes := GetWorkDescription();


                if CustomerG.Get("Bill-to Customer No.") then;

                BranchTextMain := '';
                if (CustomerG."NWTH Branch Code" = '') then
                    BranchTextMain := ''
                else
                    if (CustomerG."NWTH Branch Code" = '00000') then
                        BranchTextMain := '(สำนักงานใหญ่)'
                    else
                        BranchTextMain := 'Branch ' + CustomerG."NWTH Branch Code" + '';

                //RefereanceWorkdesG := GetWorkDescription();

                SaleHDR.Reset();
                SaleHDR.SetRange("No.", "Order No.");
                If SaleHDR.FindFirst() then
                    RefereanceWorkdesG := SaleHDR.GetWorkDescription();

                RunNoG := 0;
                IsCurrencyG := ("Currency Code" <> '');
                // CurrencyFactorG := 1;
                if IsCurrencyG then
                    // CurrencyFactorG := "Currency Factor";

                    PrepaymentAmtG := 0;
                if "Sales Invoice Header"."Order No." <> '' then begin
                    SaleInvHdG.Reset();
                    SaleInvHdG.SetRange("Prepayment Order No.", "Order No.");
                    if SaleInvHdG.FindFirst() then begin
                        SaleInvLineG.Reset();
                        SaleInvLineG.SetRange("Document No.", SaleInvHdG."No.");
                        if SaleInvLineG.FindFirst() then
                            repeat
                                PrepaymentAmtG := PrepaymentAmtG;// + SaleInvLineG."Amount Including VAT";
                            until SaleInvLineG.Next() = 0;
                    end;
                end;
                VarEntryG.Reset();
                VarEntryG.SetRange("Document No.", "Sales Invoice Header"."No.");
                If VarEntryG.FindSet() then begin
                    repeat
                        IF VATPostingSetupG.GET(VarEntryG."VAT Bus. Posting Group", VarEntryG."VAT Prod. Posting Group") THEN BEGIN
                            IF VATPostingSetupG."VAT %" <> 0 THEN
                                SumAllVAT += VarEntryG.Base
                            ELSE
                                SumNOVAT += VarEntryG.Base;
                        end;
                    until VarEntryG.Next() = 0;
                end;


                GLSetup.get();
                if "Currency Code" <> '' then
                    CurrCode := "Currency Code"
                else
                    CurrCode := GLSetup."LCY Code";

                if BankAcc.get(SelectBankG) then begin
                    BankName := BankAcc.Name;
                    BankAddress := BankAcc.Address;
                    SwiftCode := BankAcc."SWIFT Code";
                    AccountName := BankAcc."Name 2";
                    AccountNo := BankAcc."Bank Account No.";
                    BankBranch := BankAcc."Bank Branch No.";

                end;
                If HidePostingDate <> true then
                    "Sales Invoice Header"."Posting Date" := 0D;

                // contentHeaders.Add('company', CompanyInformationG."VAT Registration No.");
                // contentHeaders.Add('customer_no', "Sales Invoice Header"."Sell-to Customer No.");
                // contentHeaders.Add('customer_vat_regis_no', CustomerG1."VAT Registration No.");
                // contentHeaders.Add('total', Format("Sales Invoice Header"."Amount Including VAT" * 100, 0, 1));

                Picture64 := MakeRequest(CompanyInformationG."VAT Registration No.", "Sales Invoice Header"."Sell-to Customer No.", CustomerG1."VAT Registration No.", Format("Sales Invoice Header"."Amount Including VAT" * 100, 0, 1));
                Message(Picture64);

                // Add new barcode 2023-05-29
                // Picture64 := '';
                // URL := StrSubstNo('http://localhost:3000/qrcodegenerator?company=|%1' + CompanyInformationG."VAT Registration No." + '&customer_no=' + "Sales Invoice Header"."Sell-to Customer No." + '&customer_vat_regis_no=' + CustomerG1."VAT Registration No." + '&total=' + Format("Sales Invoice Header"."Amount Including VAT" * 100, 0, 1));

                // HttpClientHeader: HttpHeaders;
                // httpRequest: HttpRequestMessage;

                // HttpClientHeader.Add('company', CompanyInformationG."VAT Registration No.");
                // HttpClientHeader.Add('customer_no', "Sales Invoice Header"."Sell-to Customer No.");
                // HttpClientHeader.Add('customer_vat_regis_no', CustomerG1."VAT Registration No.");
                // HttpClientHeader.Add('total', Format("Sales Invoice Header"."Amount Including VAT" * 100, 0, 1));
                // HttpContentx.GetHeaders(HttpClientHeader);
                // URL.Content := HttpContentx;
                // Message(URL);
                // // HttpClientHeader.
                // IF HttpClient.Get(URL, HttpResponse) THEN BEGIN
                //     HttpResponse.Content.ReadAs(ResponseText);
                //     Picture64 := ResponseText;
                // END;
                // // End add new barcode 2023-05-29

            end;

            trigger OnPostDataItem()
            begin
                //TotalAmountTxt := NWTHLocalizedCoreG.FormatNoTextVoucher(GrandTotalG);

                //MESSAGE(TotalAmountTxt);
            end;
        }

    }
    requestpage
    {
        SaveValues = true;

        layout
        {

            area(content)
            {

                group(Option)
                {
                    field(HidePostingDate; HidePostingDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Posting Date';
                        Visible = true;
                        Enabled = true;
                        ToolTip = 'Enable Show Posting date.';
                    }
                    field(HideLot; HideLot)
                    {
                        Caption = 'Show LOT.';
                        Visible = true;
                        Enabled = true;
                        ApplicationArea = All;

                    }

                    field("Report Name"; ReportNameOption)
                    {
                        ShowCaption = true;
                        Visible = true;
                        Enabled = true;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the ReportName field.';
                        OptionCaption = 'Original Receipt/Tax Invoice,Original Receipt';

                    }

                    field("Type Document"; ReportNameG)
                    {
                        ShowCaption = true;
                        Visible = true;
                        Enabled = true;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the TypeCopy field.';
                        OptionCaption = 'Original Invoice,Copy Invoice';
                    }
                    // field(ReceiptTypeG; CashReceiptTypeG)
                    // {
                    //     ToolTip = 'Payment By';
                    //     Caption = 'Payment By';
                    //     ApplicationArea = All;
                    // }
                    field(SelectBank; SelectBankG)
                    {
                        ApplicationArea = All;
                        Visible = true;
                        Enabled = true;
                        TableRelation = "Bank Account";
                        ToolTip = 'Specifies the value of the SelectBank field.';
                        Caption = 'Select Bank';
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

    procedure MakeRequest(company: Text; customer_no: Text; customer_vat_regis_no: Text; total: Text) responseText: Text;
    var
        client: HttpClient;
        request: HttpRequestMessage;
        response: HttpResponseMessage;
        contentHeaders: HttpHeaders;
        content: HttpContent;
        payload: Text;
    begin
        // Add the payload to the content
        content.WriteFrom(payload);

        // Retrieve the contentHeaders associated with the content
        content.GetHeaders(contentHeaders);
        contentHeaders.Clear();
        contentHeaders.Add('company', '|' + company);
        contentHeaders.Add('customer_no', customer_no);
        contentHeaders.Add('customer_vat_regis_no', customer_vat_regis_no);
        contentHeaders.Add('total', total);

        // contentHeaders.Add('company', CompanyInformationG."VAT Registration No.");
        // contentHeaders.Add('customer_no', "Sales Invoice Header"."Sell-to Customer No.");
        // contentHeaders.Add('customer_vat_regis_no', CustomerG1."VAT Registration No.");
        // contentHeaders.Add('total', Format("Sales Invoice Header"."Amount Including VAT" * 100, 0, 1));

        // Assigning content to request.Content will actually create a copy of the content and assign it.
        // After this line, modifying the content variable or its associated headers will not reflect in 
        // the content associated with the request message
        request.Content := content;

        // URL := StrSubstNo('http://localhost:3000/qrcodegenerator?company=|%1' + CompanyInformationG."VAT Registration No." + '&customer_no=' + "Sales Invoice Header"."Sell-to Customer No." + '&customer_vat_regis_no=' + CustomerG1."VAT Registration No." + '&total=' + Format("Sales Invoice Header"."Amount Including VAT" * 100, 0, 1));

        request.SetRequestUri('http://localhost:3000/qrcodegenerator');
        request.Method := 'GET';

        client.Send(request, response);

        // Read the response content as json.
        response.Content().ReadAs(responseText);
    end;

    trigger OnPreReport()
    begin
        SaleSetup.Get();
        ReportCaptionG := ReportCaption1Txt;
        if ReportNameG = ReportNameG::"Copy Invoice" then
            ReportCaptionG := ReportCaption2Txt;

        ReportLabelNameThai := ReportLabel22Txt;
        ReportLabelNameENG := ReportLabel2Txt;
        If ReportNameOption = ReportNameOption::Invoice then begin
            ReportLabelNameThai := ReportLable23Txt;
            ReportLabelNameENG := ReportLabel3Txt;
        end;

        // MaxLineG := 28;
        CR := TypeHelper.CRLFSeparator()
    end;

    trigger OnInitReport()
    var
    // myInt: Integer;
    begin
        SelectBankG := 'B080';
        UseSignature := true;
        HideLot := false;
        HidePostingDate := true;

    end;

    var
        SaleSetup: Record "Sales & Receivables Setup";
        LocationName: Text;
        Location: Record Location;
        Saleshipment: Record "Sales Shipment Header";
        SaleshipmentLine: Record "Sales Shipment Line";
        PhoneShip: Text;
        FAXShip: Text;
        Agentrec: Record "Shipping Agent";
        TransportMethodG: Record "Transport Method";
        HidePostingDate: Boolean;
        HideLot: Boolean;
        CustomerG1: Record Customer;
        ShiptoAddressG: Record "Ship-to Address";
        ShiptoAddress1: Text;
        Shiptoaddress2: Text;

        RemarkWorkdes: Text;
        AmtSum: Decimal;
        DiscPercent: Decimal;
        VatpostingGroupG: Record "VAT Posting Setup";
        VarEntryG: Record "VAT Entry";
        SumAllVAT: Decimal;
        SumNOVAT: Decimal;
        DiscountPercent: Decimal;
        LineAmountG1: Decimal;
        InvDiscountG1: Text;
        TotalAmountG1: Text;

        UseSignature: Boolean;
        UserVerify: Record User;
        UserCreate: Record User;
        UsersetupAuthor: Record "User Setup";
        UsersetupVerify: Record "User Setup";
        UsersetupCreate: Record "User Setup";
        CompanyInformationG: Record "Company Information";
        NWTHCompanyBranchInfoG: Record "NWTH Company Branch";
        saleCommentLine: Record "Sales Comment Line";
        BankAcc: Record "Bank Account";
        BankNameG: Text[100];
        CustomerG: Record Customer;
        VATPostingSetupG: Record "VAT Posting Setup";
        PaymentG: Record "Payment Terms";
        SalesPersonG: Record "Salesperson/Purchaser";
        UnitOfMeasureG: Record "Unit of Measure";
        SaleInvHdG: Record "Sales Invoice Header";
        SaleInvLineG: Record "Sales Invoice Line";
        SaleInvLineG2: Record "Sales Invoice Line";
        GLSetup: Record "General Ledger Setup";
        NWTHLocalizedCoreG: Codeunit "NWTH Localized Core";
        CompanyInfoG: array[9] of Text;
        BankName: Text;
        BankAddress: Text;
        SwiftCode: Text;
        AccountName: Text;
        AccountNo: Text;
        BankBranch: Text;
        SumQTY: Decimal;
        commentARR: array[10] of Text[100];
        //ReportCaptionG: Text[250];
        ReportCaptionENGG: Text[250];
        SelectBankG: Code[20];
        RunNoG: Integer;
        ItemNoG: Code[20];
        TotalAmountTxt: Text;
        ReportNameG: Option "Original Invoice","Copy Invoice";
        ReportNameOption: Option "Invoice/Tax Invoice","Invoice";

        ReportCaption1Txt: Label 'Original/ต้นฉบับ';
        ReportCaption2Txt: Label 'COPY/สำเนา';

        ReportLabel2Txt: Label 'Original Receipt/Tax Invoice';
        ReportLabel3Txt: Text;
        ReportLabel22Txt: Label 'ต้นฉบับใบเสร็จรับ/ใบกำกับภาษี';
        ReportLable23Txt: Label 'Invoice/ใบแจ้งหนี้';

        ReportLabelNameThai: Text;
        ReportLabelNameENG: Text;
        ReportCaptionG: Text[250];
        TotalAmtExcVATG: Decimal;
        InvDiscoundAmtG: Decimal;
        VATPercentG: Decimal;
        VATAmountG: Decimal;
        CustAmountG: Decimal;
        IsCurrencyG: Boolean;
        AmountInclVATG: Decimal;
        TotalAmtIncVATG: Decimal;
        PrepaymentAmtG: Decimal;
        CustomerBranchG: Text;
        UOMDescription: Text[250];
        RefereanceWorkdesG: Text;
        BranchText: Text;
        BranchTextMain: Text;
        CurrCode: Code[10];
        ApprovedDate: Date;
        LotNo: Text;
        SerialNo: Text;
        TrackingLineTxt: Text;
        ExpDate: Date;
        WarrantyDate: Date;
        ItemLedgerEntry: Record "Item Ledger Entry";
        TypeHelper: Codeunit "Type Helper";
        Picture64: Text;        // Add new barcode 2023-05-29
        ResponseText: Text;     // Add new barcode 2023-05-29
        CR: Text[2];
        SaleHDR: Record "Sales Header";
}



