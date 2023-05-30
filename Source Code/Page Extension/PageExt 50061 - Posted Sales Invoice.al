pageextension 50061 PageExPostedSalesInvoiceCard extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addbefore("&Invoice")
        {
            // action("Daily Report")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Daily Report';
            //     Ellipsis = true;
            //     Image = Print;
            //     ToolTip = 'Print an order confirmation. A report request window opens where you can specify what to include on the print-out.';
            //     trigger OnAction()
            //     var

            //     begin
            //         Rec.Reset();
            //         Rec.SetRange("No.", Rec."No.");
            //         If Rec.FindFirst() then;
            //         Report.Run(Report::DailyInvoiceReport, true, true, Rec);
            //     end;
            // }
            action(NWTHRecieptTaxInvoiceExtra)
            {
                Caption = 'Reciept Tax Invoice (Pre-print form)';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                ApplicationArea = NWTHLOC;
                ToolTip = 'Print Reciept Tax Invoice';
                trigger OnAction()
                var
                    SalesInvoiceHeaderL: Record "Sales Invoice Header";

                begin
                    SalesInvoiceHeaderL := Rec;
                    CurrPage.SetSelectionFilter(SalesInvoiceHeaderL);
                    // REPORT.Run(Report::"BIS Receipt Tax Invoice", true, false, SalesInvoiceHeaderL);
                    REPORT.Run(Report::"BIS Receipt Tax Invoice (P)", true, false, SalesInvoiceHeaderL);
                end;
            }

        }

        addfirst(Reporting)
        {
            action("Billing Slip")
            {
                Caption = 'Billing Slip Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesInvoiceHeaderL: Record "Sales Invoice Header";

                begin
                    SalesInvoiceHeaderL := Rec;
                    CurrPage.SetSelectionFilter(SalesInvoiceHeaderL);
                    // REPORT.Run(Report::"BIS Receipt Tax Invoice", true, false, SalesInvoiceHeaderL);
                    REPORT.Run(Report::"Bill Slip Report", true, false, SalesInvoiceHeaderL);
                end;
            }
        }

        // Add changes to page actions here
    }

    var
        tableUser: Record User;
}