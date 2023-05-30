codeunit 50005 "BIS Function Email"
{
    trigger OnRun()
    begin

    end;

    procedure SendEasiestEMail()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create('swa@naviworld-asia.com', 'This is the subject', 'This is the body');
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEmailWithAttachment()
    var
        ReportExample: Report "Report Ori.Recept.Tax Invoice";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        InStr: Instream;
        OutStr: OutStream;
        ReportParameters: Text;
    begin
        ReportParameters := ReportExample.RunRequestPage();
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Report Ori.Recept.Tax Invoice", ReportParameters, ReportFormat::Pdf, OutStr);
        TempBlob.CreateInStream(InStr);

        EmailMessage.Create('swa@naviworld-asia.com', 'This is the subject', 'This is the body');
        EmailMessage.AddAttachment('FileName.pdf', 'PDF', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEmailWithPreviewWindow(DocNo: Code[20])
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        ReceiptReport: Report "Report Ori.Recept.Tax Invoice";
        TempBlob: Codeunit "Temp Blob";
        InStr: Instream;
        OutStr: OutStream;
        ReportParameters: Text;
        CustLedgerEntryL: Record "Cust. Ledger Entry";
        RecRef: RecordRef;
        CustomerL: Record Customer;
    begin

        TempBlob.CreateOutStream(OutStr);

        CustLedgerEntryL.Reset();
        CustLedgerEntryL.SetRange("Document No.", DocNo);
        CustLedgerEntryL.FindFirst();

        CustomerL.Reset();
        CustomerL.SetRange("No.", CustLedgerEntryL."Customer No.");
        If CustomerL.FindFirst() then;


        CustomerL.TestField("E-Mail");
        RecRef.GetTable(CustLedgerEntryL);
        ReceiptReport.SetTableView(CustLedgerEntryL);
        ReceiptReport.SaveAs(ReportParameters, ReportFormat::Pdf, OutStr, RecRef);

        TempBlob.CreateInStream(InStr);
        EmailMessage.Create(CustomerL."E-Mail"
        , ''
        , '');

        EmailMessage.AddAttachment('Original Receipt : ' + CustLedgerEntryL."Document No." + '_' + Format(Today()) + '.pdf', 'PDF', InStr);
        Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);

    end;

    // procedure SendEmailWithPreviewWindowHtmlFormatBody()
    // var
    //     Customer: Record Customer;
    //     Email: Codeunit Email;
    //     EmailMessage: Codeunit "Email Message";
    //     Body: Text;
    // begin
    //     Customer.FindFirst();
    //     Customer.CalcFields(Balance);
    //     Body := '<h3>TO MESSRS: ' + Customer.Name
    //             + '</h3>ATT : ACCOUNTING DEPARTMENT </br> </h3> <hr></br>Your current balance with us is:</br></br><strong>'
    //             + format(Customer.Balance) + '</strong></br></br><hr></br>Best regards,</br></br>Financial Department</br></br>Spain</br> <img src="https://businesscentralgeek.com/wp-content/uploads/2022/06/Imagen3.jpg" />';

    //     EmailMessage.Create('swa@naviworld-asia.com', 'This is the subject', Body, true);
    //     Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);
    // end;

    // procedure SendEMail()
    // var
    //     Email: Codeunit Email;
    //     EmailMessage: Codeunit "Email Message";
    //     Cancelled: Boolean;
    //     MailSent: Boolean;
    //     Selection: Integer;
    //     OptionsLbl: Label 'Send,Open Preview';
    //     ListTo: List of [Text];
    // begin
    //     Selection := Dialog.StrMenu(OptionsLbl);
    //     ListTo.Add('swa@naviworld-asia.com');
    //     EmailMessage.Create(ListTo, 'This is the subject', 'This is the body', true);
    //     Cancelled := false;
    //     if Selection = 1 then
    //         MailSent := Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    //     if Selection = 2 then begin

    //         MailSent := Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default) = Enum::"Email Action"::Sent;
    //         Cancelled := not MailSent;
    //     end;

    //     if (Selection <> 0) and not MailSent and not Cancelled then
    //         Error(GetLastErrorText());
    // end;



    var
        myInt: Integer;
        PostedSaleInvoice: Page "Sales Order List";
        PurchaseOrder: Page "Purchase Order";
        EmailEdit: Page 13;
        Sale: Page "Sales Order";
        Emaioool1: Codeunit Email;

}


