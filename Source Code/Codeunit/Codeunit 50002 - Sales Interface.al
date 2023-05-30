codeunit 50002 SalesInterFace
{
    trigger OnRun()
    begin

    end;

    procedure TestAPIV4(TextInput: Code[20]): Text

    begin
        Exit(TextInput + ' Test ok');
    end;

    procedure registercustomer(customerno: Code[20]): Text
    var
        myInt: Integer;
        RegisterBIS: Record "Customer Registration";
        Customer: Record Customer;
        BISMainCU: Codeunit "BIS Main Function";
    begin
        RegisterBIS.get(customerno);
        if Not Customer.get(RegisterBIS."Customer No.") then begin
            exit('Customer Already Exist.');
            // Customer.Init();
            // Customer."No." := customerno;
            // Customer.insert(true);

            // //Phone Mail
            // Customer.validate(Blocked, Customer.Blocked::All);
            // Customer."Phone No." := RegisterBIS."Phone No.";
            // Customer."E-Mail" := RegisterBIS.Email;
            // Customer."Personal ID" := RegisterBIS."Personal ID";
            // Customer."VAT Registration No." := RegisterBIS."VAT Registration No.";
            // //Phone Mail

            // //WHT Address
            // Customer."NWTH Name Title" := RegisterBIS.Initial;
            // if RegisterBIS."Company Name" <> '' then
            //     Customer."NWTH WHT Name" := RegisterBIS."Company Name"
            // else begin
            //     Customer."NWTH WHT Name" := RegisterBIS.Name;
            //     Customer."NWTH WHT Surname" := RegisterBIS."Last Name";
            // end;

            // //Customer.Validate("NWTH Building Name", RegisterBIS);
            // Customer.Validate("NWTH Address No.", RegisterBIS."Address No.");
            // Customer.Validate("NWTH Floor No.", RegisterBIS."Floor No.");
            // Customer.Validate("NWTH Village No.", RegisterBIS.Moo);
            // Customer.Validate("NWTH Village Name", RegisterBIS."Village Name");
            // //Customer.Validate("NWTH Room No.", RoomNumber);

            // Customer.Validate("NWTH Alley", RegisterBIS.Soi);
            // Customer.Validate("NWTH Road", RegisterBIS.Street);

            // Customer.Validate("NWTH Sub-District", RegisterBIS.Thumbon);
            // Customer.Validate("NWTH District", RegisterBIS.Amphur);
            // Customer.Validate("NWTH Province", RegisterBIS.Province);
            // Customer.Validate("Post Code", RegisterBIS."Post Code");
            // Customer.Validate("NWTH Branch Code", RegisterBIS.Branch);
            // //WHT Address
            // Customer.modify(True);

        end else begin
            if RegisterBIS.Name <> '' then
                Customer.validate(Name, RegisterBIS.Initial + RegisterBIS.Name + ' ' + RegisterBIS."Last Name");
            if RegisterBIS."Company Name" <> '' then
                Customer.Validate(Name, RegisterBIS."Company Name");

            //Phone Mail
            Customer."Phone No." := RegisterBIS."Phone No.";
            Customer."E-Mail" := RegisterBIS.Email;
            Customer."Personal ID" := RegisterBIS."Personal ID";
            Customer."VAT Registration No." := RegisterBIS."VAT Registration No.";
            //Phone Mail

            //WHT Address
            Customer."NWTH Name Title" := RegisterBIS.Initial;
            if RegisterBIS."Company Name" <> '' then
                Customer."NWTH WHT Name" := RegisterBIS."Company Name"
            else begin
                Customer."NWTH WHT Name" := RegisterBIS.Name;
                Customer."NWTH WHT Surname" := RegisterBIS."Last Name";
            end;

            //Customer.Validate("NWTH Building Name", RegisterBIS);
            Customer.Validate("Registered Date", Today);
            customer.Validate("NWTH Building Name", '');
            Customer.Validate("NWTH Room No.", '');
            Customer.Validate("NWTH Floor No.", RegisterBIS."Floor No.");
            Customer.Validate("NWTH Address No.", RegisterBIS."Address No.");

            Customer.Validate("NWTH Village No.", RegisterBIS.Moo);
            Customer.Validate("NWTH Village Name", RegisterBIS."Village Name");
            //Customer.Validate("NWTH Room No.", RoomNumber);

            Customer.Validate("NWTH Alley", RegisterBIS.Soi);
            Customer.Validate("NWTH Road", RegisterBIS.Street);

            Customer.Validate("NWTH Sub-District", RegisterBIS.Thumbon);
            Customer.Validate("NWTH District", RegisterBIS.Amphur);
            Customer.Validate("NWTH Province", RegisterBIS.Province);
            Customer.Validate("Post Code", RegisterBIS."Post Code");
            Customer.Validate("NWTH Branch Code", RegisterBIS.Branch);
            customer.validate("Business Type", RegisterBIS."Customer Business Type");
            customer.validate("Customer Type", RegisterBIS."Customer Type");
            Customer.Validate("Item Group Type", RegisterBIS."Item Group Type");

            customer.Longtitue := RegisterBIS.longtitude;
            Customer.Latitude := RegisterBIS.lattitude;

            customer.Validate("Gen. Bus. Posting Group", RegisterBIS.genbus);
            Customer.Validate("VAT Bus. Posting Group", RegisterBIS.vatbus);
            Customer.Validate("Customer Posting Group", RegisterBIS.custPostingGroup);


            BISMainCU.MakeCustAddressFromWHTAddress(
                                       Customer."NWTH Building Name",
                                       Customer."NWTH Room No.",
                                       Customer."NWTH Floor No.",
                                       Customer."NWTH Address No.",
                                       customer."NWTH Village No.",
                                       customer."NWTH Village Name",
                                       customer."NWTH Alley",
                                       customer."NWTH Road",
                                       customer."NWTH Sub-District",
                                       customer."NWTH District",
                                       customer."NWTH Province",
                                       customer.Address,
                                       Customer."Address 2",
                                       false);
            //WHT Address

            Customer."Est. Monthly Sales" := RegisterBIS."Est. Consuming";
            Customer.validate("Payment Terms Code", RegisterBIS."Credit Term");
            Customer.Authorization := RegisterBIS.Name + ' ' + RegisterBIS."Last Name";
            Customer."Personal ID" := RegisterBIS."Personal ID";
            Customer.validate("Salesperson Code", RegisterBIS.Salesperson);

            Customer.modify(True);
            exit('Customer ' + Customer."No." + ' updated!')
        end;

    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order (Yes/No)", 'OnBeforeConfirmConvertToOrder', '', true, true)]
    // local procedure SkipConfirmCreateSO(SalesHeader: Record "Sales Header"; var IsHandled: Boolean; var Result: Boolean)
    // begin
    //     IsHandled := SalesHeader."Interface Document";

    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order (Yes/No)", 'OnBeforeShowCreatedOrder', '', true, true)]
    // local procedure SkipShowCreatedSO(var IsHandled: Boolean; var SalesHeader: Record "Sales Header")
    // begin
    //     IsHandled := SalesHeader."Interface Document";
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order", 'OnBeforeModifySalesOrderHeader', '', true, true)]
    // local procedure MarkasSOByInterface(SalesQuoteHeader: Record "Sales Header"; var SalesOrderHeader: Record "Sales Header")
    // begin
    //     SalesOrderHeader."Interface Document" := SalesQuoteHeader."Interface Document";
    // end;

    Procedure convertsqtoso(sqno: Code[20]): Text
    var
        SalesHeader: Record "Sales Header";
        SO: Record "Sales Header";
        SONo: Code[20];
        QuoteNo: Code[20];
        SQConvertToSO: Codeunit "Sales-Quote to Order";
        ReturnTxt: Label 'Quote %1 convert to Order %2';
        SQ: Page "Sales Quote";
    begin
        QuoteNO := sqno;
        SalesHeader.get(SalesHeader."Document Type"::Quote, SQNo);
        if SQConvertToSO.Run(SalesHeader) then begin
            SQConvertToSO.GetSalesOrderHeader(SO); //SO."No.";
            Exit(StrSubstNo(ReturnTxt, sqno, SO."No."));
        end else
            Exit('Cannot Convert ' + sqno);

    end;

    // procedure TransferSalesHerder(DocumentType: Code[20]; No: Code[20]): Text
    // var
    //     SalesDocumentType: Enum "Sales Document Type";
    // begin
    //     CallBisSalesHeaderFunctionCenter.TransferSalesHeaderDataApi(DocumentType, No);
    //     Exit(No);
    // end;

    procedure insertsalescomment(doctype: Text; docno: code[20]; cmt: Text)
    var
        SH: Record "Sales Header";
        salesdoctype: Enum "Sales Document Type";
    begin
        if doctype = 'Quote' then
            salesdoctype := salesdoctype::Quote
        else
            if doctype = 'Order' then
                salesdoctype := salesdoctype::Order
            else
                Error('Document Type :' + doctype + 'is wrong');

        SH.get(salesdoctype, docno);
        SH.SetWorkDescription(cmt);

    end;

    procedure insertinvoicediscount(doctype: Text; docno: code[20]; discpct: Decimal; discamt: Decimal)
    var
        salecalinvdiscountbytype: Codeunit "Sales - Calc Discount By Type";
        InvoiceDiscountAmount: Decimal;
        Currency: Record Currency;
        Amtallowed: Decimal;
        DocumentTotals: Codeunit "Document Totals";
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        salesdoctype: Enum "Sales Document Type";
    begin
        if doctype = 'Quote' then
            salesdoctype := salesdoctype::Quote
        else
            if doctype = 'Order' then
                salesdoctype := salesdoctype::Order
            else
                Error('Document Type :' + doctype + 'is wrong');

        SalesHeader.get(salesdoctype, docno);
        Currency.InitRoundingPrecision();

        if discpct <> 0 then begin
            SalesLine.SETRANGE("Document Type", salesdoctype);
            SalesLine.SETRANGE("Document No.", docno);
            SalesLine.SETRANGE("Allow Invoice Disc.", TRUE);
            SalesLine.CALCSUMS("Line Amount");
            Amtallowed := SalesLine."Line Amount";
            InvoiceDiscountAmount := ROUND(Amtallowed * discpct / 100, Currency."Amount Rounding Precision");
        end;

        if (discamt <> 0) and (InvoiceDiscountAmount <> 0) then
            if discamt <> InvoiceDiscountAmount then
                Error('Your Invoice Discount not match with Percentage');
        salecalinvdiscountbytype.ApplyInvDiscBasedOnAmt(InvoiceDiscountAmount, SalesHeader);

    end;

    procedure sendsotoapprove(docno: Code[20]): Text
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SalesHeader: Record "Sales Header";
        SalesHeader2: Record "Sales Header";
        ReturnText: Label 'Order %1 sent to approve';
    begin

        SalesHeader.get(SalesHeader."Document Type"::Order, docno);
        if ApprovalsMgmt.CheckSalesApprovalPossible(SalesHeader) then begin
            ApprovalsMgmt.OnSendSalesDocForApproval(SalesHeader);
            exit(StrSubstNo(ReturnText, SalesHeader."No."));
        end else
            exit('No workflow for sales order');

    end;

    procedure getlastdraftquoteno(SeriesDate: Date): Code[20]
    var
        NoSeriesMgt: codeunit NoSeriesManagement;
        NoSeries: Record "No. Series";
    begin
        if SeriesDate = 0D then
            Error('Series Date must specific');

        NoSeries.Reset();
        NoSeries.setrange("Draft Quote", true);
        NoSeries.FindFirst();
        Exit(NoSeriesMgt.GetNextNo(NoSeries.Code, SeriesDate, True));
    end;

    procedure getlastconfirmquoteno(SeriesDate: Date): Code[20]
    var
        NoSeriesMgt: codeunit NoSeriesManagement;
        NoSeries: Record "No. Series";
    begin
        if SeriesDate = 0D then
            Error('Series Date must specific');

        NoSeries.Reset();
        NoSeries.setrange("Confirm Quote", true);
        NoSeries.FindFirst();
        Exit(NoSeriesMgt.GetNextNo(NoSeries.Code, SeriesDate, True));
    end;

    // procedure getlastdraftorderno(SeriesDate: Date): Code[20]
    // var
    //     NoSeriesMgt: codeunit NoSeriesManagement;
    //     NoSeries: Record "No. Series";
    // begin
    //     if SeriesDate = 0D then
    //         Error('Series Date must specific');

    //     NoSeries.Reset();
    //     NoSeries.setrange("Draft Order");
    //     NoSeries.FindFirst();
    //     Exit(NoSeriesMgt.GetNextNo(NoSeries.Code, SeriesDate, True));
    // end;

    procedure getlastorderno(SeriesDate: Date): Code[20]
    var
        NoSeriesMgt: codeunit NoSeriesManagement;
        NoSeries: Record "No. Series";
    begin
        if SeriesDate = 0D then
            Error('Series Date must specific');

        NoSeries.Reset();
        NoSeries.setrange("Confirm Order", true);
        NoSeries.FindFirst();
        Exit(NoSeriesMgt.GetNextNo(NoSeries.Code, SeriesDate, True));
    end;

    var
        myInt: Page "Sales Order";
        CallBisSalesHeaderFunctionCenter: Codeunit BisFunctionCenter;
}