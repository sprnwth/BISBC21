pageextension 50032 PageExPostedCashReceiptJournal extends "NWTH Psd. Cash Rep. Journal"
{
    layout
    {
        // addafter("Posting Date")
        // {
        //     field("Source Code"; Rec."Source Code")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
    }

    actions
    {
        modify(NWTHPrintOriginalTaxInvoice)
        {
            Visible = false;
            Enabled = false;
        }
        // addafter("NWTHPrintOriginalTaxInvoice")
        // {
        //     // Action(SendEmail)
        //     // {
        //     //     ApplicationArea = All;
        //     //     Image = SendMail;
        //     //     Caption = 'Send Email';

        //     //     trigger OnAction();
        //     //     begin
        //     //         SendEmailWithAttachment();
        //     //     end;
        //     // }
        // }
        addafter(NWTHPrintVoucher)
        {
            action(NWTHPrintOriginalTaxInvoiceFIX)
            {
                ApplicationArea = NWTHLOC;
                Caption = 'Original Receipt / Tax Invoice';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Original Tax Invoice action';

                trigger OnAction()
                var
                    CustLedgerEntry: Record "Cust. Ledger Entry";
                    //CustLedergerApply: Record "Cust. Ledger Entry";
                    DetailCustLedger: Record "Detailed Cust. Ledg. Entry";
                    Number: Integer;
                    GLEntry: Record "G/L Entry";

                begin
                    //Commit();
                    CustLedgerEntry.Reset();
                    CustLedgerEntry.SetRange("Document No.", Rec."Document No.");
                    if CustLedgerEntry.FindFirst() then begin
                        DetailCustLedger.Reset();
                        DetailCustLedger.SetRange("Document No.", CustLedgerEntry."Document No.");
                        if DetailCustLedger.FindFirst() then begin
                            Number := DetailCustLedger.Count();
                            if Number > 1 then
                                REPORT.Run(REPORT::"Report Ori.Recept.Tax Invoice", true, false, CustLedgerEntry);
                            if Number = 1 then
                                REPORT.Run(REPORT::"Report Ori.Recept.Non Apply", true, false, CustLedgerEntry)
                        end;
                    end else begin
                        GLEntry.setrange("Document No.", Rec."Document No.");
                        REPORT.Run(REPORT::"Report Ori.Recept.Non Apply", true, false, GLEntry)
                    end;
                end;
            }
            // action(NWTHPrintOriginalTaxInvoiceDirect)
            // {
            //     ApplicationArea = NWTHLOC;
            //     Caption = 'Original Receipt / Tax Invoice (Direct)';
            //     Image = Print;
            //     Promoted = true;
            //     PromotedCategory = "Report";
            //     PromotedIsBig = true;
            //     ToolTip = 'Executes the Original Tax Invoice action';

            //     trigger OnAction()
            //     var
            //         CustLedgerEntry: Record "Cust. Ledger Entry";
            //         //CustLedergerApply: Record "Cust. Ledger Entry";
            //         DetailCustLedger: Record "Detailed Cust. Ledg. Entry";
            //         Number: Integer;
            //         GLEntry: Record "G/L Entry";

            //     begin
            //         Commit();
            //         CustLedgerEntry.Reset();
            //         CustLedgerEntry.SetRange("Document No.", Rec."Document No.");
            //         if CustLedgerEntry.FindFirst() then begin
            //             DetailCustLedger.Reset();
            //             DetailCustLedger.SetRange("Document No.", CustLedgerEntry."Document No.");
            //             if DetailCustLedger.FindFirst() then begin
            //                 Number := DetailCustLedger.Count();
            //                 if Number > 1 then
            //                     REPORT.Run(REPORT::"Report Ori.Recept.Tax Invoice", true, false, CustLedgerEntry);
            //                 if Number = 1 then
            //                     REPORT.Run(REPORT::"Report Ori.Recept.Non Apply", true, false, CustLedgerEntry)
            //             end;

            //     end;
            //}
            action("Email to Customer")
            {
                ApplicationArea = ALL;
                Image = Email;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;


                trigger OnAction()
                var

                    BISFunc3: Codeunit "BIS Function Email";
                    PostedDocument: Record "NWTH Posted Journal";
                begin
                    BISFunc3.SendEmailWithPreviewWindow(Rec."Document No.");
                end;
            }

        }
    }

    procedure SendEasiestEMail()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create('pch@naviworld-asia.com', 'This is the subject', 'This is the body');
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;
    // NWTH Psd.Cash Receipt VoucherT
    procedure SendEmailWithAttachment()
    var
        ReportExample: Report "NWTH Psd. Cash Receipt Voucher";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        InStr: Instream;
        OutStr: OutStream;
        ReportParameters: Text;
    begin
        ReportParameters := ReportExample.RunRequestPage();
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"NWTH Psd. Cash Receipt Voucher", ReportParameters, ReportFormat::Pdf, OutStr);
        TempBlob.CreateInStream(InStr);

        EmailMessage.Create('pch@naviworld-asia.com', 'Posted Cash Receipt Journal Report', 'Posted Cash Receipt Journal Report');
        EmailMessage.AddAttachment('NWTH PSD Cash Receipt Voucher.pdf', 'PDF', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        Message('Email sent successfully.');
    end;

    procedure SendEmailWithPreviewWindow()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create('pch@naviworld-asia.com', 'This is the subject', 'This is the body');
        Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEmailWithPreviewWindowHtmlFormatBody()
    var
        Customer: Record Customer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text;
    begin
        Customer.FindFirst();
        Customer.CalcFields(Balance);
        Body := '<h3>TO MESSRS: ' + Customer.Name + '</h3>ATT : ACCOUNTING DEPARTMENT </br> </h3> <hr></br>Your current balance with us is:</br></br><strong>' + format(Customer.Balance) + '</strong></br></br><hr></br>Best regards,</br></br>Financial Department</br></br>Spain</br> <img src="https://businesscentralgeek.com/wp-content/uploads/2022/06/Imagen3.jpg" />';

        EmailMessage.Create('pch@naviworld-asia.com', 'This is the subject', Body, true);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEMail()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Cancelled: Boolean;
        MailSent: Boolean;
        Selection: Integer;
        OptionsLbl: Label 'Send,Open Preview';
        ListTo: List of [Text];
    begin
        Selection := Dialog.StrMenu(OptionsLbl);
        ListTo.Add('alberto.soben@businesscentralgeek.com');
        EmailMessage.Create(ListTo, 'This is the subject', 'This is the body', true);
        Cancelled := false;
        if Selection = 1 then
            MailSent := Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        if Selection = 2 then begin

            MailSent := Email.OpenInEditorModally(
                EmailMessage, Enum::"Email Scenario"::Default) = Enum::"Email Action"::Sent;
            Cancelled := not MailSent;
        end;

        if (Selection <> 0) and not MailSent and not Cancelled then
            Error(GetLastErrorText());
    end;
}