page 50034 PageItemsMissingGroup
{
    Caption = 'Items Missing Group';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Item;
    SourceTableView = where(
        "Inventory Posting Group" = filter(= ''),
        "Gen. Prod. Posting Group" = filter(= ''),
        "VAT Prod. Posting Group" = filter(= '')

    );

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Item No."; Rec."No.")
                {

                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {

                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {

                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print';
                Ellipsis = true;
                Image = Print;
                ToolTip = 'Print an order confirmation. A report request window opens where you can specify what to include on the print-out.';

                trigger OnAction()
                var

                begin
                    Message('XXXs');
                    Report.Run(Report::ItemsMissingGroup, true, true, Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        if (Rec."Inventory Posting Group" = '') or
       (Rec."Gen. Prod. Posting Group" = '') or
       (Rec."VAT Prod. Posting Group" = '') then;
    end;

    var
        DocAt : Page "Document Attachment Details";
        myInt: Integer;
        Pagex: Page "Sales Order List";
        GetCustomer: Record Customer;
        GetBankAccount: Record "Bank Account";
        GetFixedAssets: Record "Fixed Asset";
        GetpageCustomerCard: Page "Customer Card";
        GetpageCustomer: Page "Customer List";
        GetTableItems: Record Item;
        GetTableUnit: Record "Unit of Measure";
        GetTableItemUnit: Record "Item Unit of Measure";
        GetPTableParen: Record "Document Attachment";
        GetTenantMedia: Record "Tenant Media";
        GetTableSalesHeader: Record "Sales Header";
        GetTableApproval: Record "Approval Entry";
        GetPageApproval: Page "Requests to Approve";
        GetPageSalesQuotes: Page "AAD Application Card";
        GetPagePurchaseInvoice: Record "Purchase Header";
    // GetObject5003: Page
}