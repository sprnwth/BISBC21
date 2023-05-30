report 50026 EclReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'ECL Customer Aging';

    dataset
    {
        dataitem(DataItemName; "Cust. Ledger Entry")
        {

            column(SalespersonCode; Salespersons)
            {

            }
            column(EntryNo; "Entry No.")
            {

            }
            column(PostingDate; "Posting Date")
            {

            }
            column(DocumentType; "Document Type")
            {

            }
            column(DocumentNo; "Document No.")
            {

            }
            column(CustomerNo; "Customer No.")
            {

            }
            column(CustomerName; "Customer Name")
            {

            }
            column(Credit; Credit)
            {

            }
            column(DueDate; "Due Date")
            {

            }
            column(OriginalAmount; "Original Amount")
            {

            }
            column(pay; "Original Amount" - "Remaining Amount")
            {

            }
            column(RemainingAmount; "Remaining Amount")
            {

            }
            column(DateFilter; "Date Filter")
            {

            }
            column(Overdue; Overdue)
            {

            }
            column(Aging; Aging)
            {

            }
            column(EclPercent; EclPercent)
            {

            }
            column(EclRemainingAmount; EclRemainingAmount)
            {

            }
            column(FilterDate; FilterDate)
            {

            }

            // Trigger on preDataitem filter by FilterDateType and FilterDate
            trigger OnPreDataItem()
            begin
                //Filter Document type = Invoice, Credit Memo
                SetFilter("Document Type", '%1|%2', "Document Type"::"Invoice", "Document Type"::"Invoice");
                SetFilter(Open, 'Yes');

                // Filter by FilterDateType
                case FilterDateType of
                    FilterDateType::"Document date":
                        begin
                            SetFilter("Document date", '..%1', FilterDate);     // Filter by "Document date"
                        end;
                    FilterDateType::"Posting Date":
                        begin
                            SetFilter("Posting Date", '..%1', FilterDate);      // Filter by "Posting date"
                        end;
                    FilterDateType::"Due Date":
                        begin
                            SetFilter("Due Date", '..%1', FilterDate);          // Filter by "Due date"
                        end;
                end;
            end;
            // End trigger on preDataitem filter by FilterDateType and FilterDate

            // Trigger on validate data in the table
            trigger OnAfterGetRecord()
            var
                TableCustomer: Record Customer;
                TablePaymentTerm: Record "Payment Terms";
                TableSalespersons: Record "Salesperson/Purchaser";
                TableEcl: Record EclLevel;
                TableSalesInvoiceHeader: Record "Sales Invoice Header";
                EnumGenJournalDocumentType: Enum "Gen. Journal Document Type";
                SalesCrMemoHeader: Record "Sales Cr.Memo Header";
            begin
                // Check Credit by "Sales Invoice Header" -> "Payment Terms Code"
                if "Document No." <> '' then begin
                    case "Document Type" of
                        "Document Type"::Invoice:
                            begin
                                TableSalesInvoiceHeader.Reset();
                                TableSalesInvoiceHeader.SetRange("No.", "Document No.");
                                if (TableSalesInvoiceHeader.FindFirst()) then begin
                                    TablePaymentTerm.Reset();
                                    TablePaymentTerm.SetRange(Code, TableSalesInvoiceHeader."Payment Terms Code");
                                    if TablePaymentTerm.FindFirst() then begin
                                        Credit := Format(TablePaymentTerm."Due Date Calculation");
                                    end;
                                end;
                            end;
                        "Document Type"::"Credit Memo":
                            begin
                                SalesCrMemoHeader.Reset();
                                SalesCrMemoHeader.SetRange("No.", "Document No.");
                                if (SalesCrMemoHeader.FindFirst()) then begin
                                    TablePaymentTerm.Reset();
                                    TablePaymentTerm.SetRange(Code, SalesCrMemoHeader."Payment Terms Code");
                                    if TablePaymentTerm.FindFirst() then begin
                                        Credit := Format(TablePaymentTerm."Due Date Calculation");
                                    end;
                                end;
                            end;
                    end;
                end;
                // End check Credit by "Sales Invoice Header" -> "Payment Terms Code"

                // Get sales person
                if "Salesperson Code" <> '' then begin
                    TableSalespersons.Reset();
                    if TableSalespersons.get("Salesperson Code") then
                        if TableSalespersons.Name <> '' then begin
                            Salespersons := TableSalespersons.Name;
                        end;
                end;

                // Get Overdue
                if (FilterDate <> 0D) and ("Due Date" <> 0D) then begin
                    Overdue := FilterDate - "Due Date";

                    // Get Overdue
                    TableEcl.Reset();
                    TableEcl.SetFilter(Starting, '<=%1', Overdue);
                    TableEcl.SetFilter(Ending, '>=%1', Overdue);
                    if TableEcl.FindFirst() then begin
                        Aging := TableEcl.Aging;    // Set Aging
                        EclPercent := TableEcl.EclPercent;  // Set ECL%
                        EclRemainingAmount := ((TableEcl.EclPercent * "Remaining Amount") / 100);   // Set ECL% * Remaining Amount
                    end;
                end;
            end;
            // Trigger on validate data in the table
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                field(FilterDateType; FilterDateType)
                {
                    Caption = 'Date Type';
                    NotBlank = true;
                }
                field(FilterDate; FilterDate)
                {
                    Caption = 'Date';
                    NotBlank = true;
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }

        trigger OnOpenPage()
        begin
            if FilterDate = 0D then begin
                FilterDate := WorkDate;
            end;
        end;
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/BISEclReport.rdl';     // Report layout file
        }
    }

    var
        credit: Text;
        Salespersons: Text;
        Overdue: Integer;
        Aging: Decimal;
        EclPercent: Decimal;
        EclRemainingAmount: Decimal;
        FilterDateType: enum "ECL Date Filter";
        FilterDate: Date;
        pagePostedSalesInvoices: Page "Posted Sales Invoices";
        PageOrder: Report Order;
        PageOrderCard: Page "Purchase Order";
}