// page 50020 "Sales Header"
// {
//     ApplicationArea = All;
//     Caption = 'Sales Header';
//     PageType = List;
//     SourceTable = "Sales Header";
    
//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Document Type"; Rec."Document Type")
//                 {
//                     ToolTip = 'Specifies the value of the Document Type field.';
//                 }
//                 field("Sell-to Customer No."; Rec."Sell-to Customer No.")
//                 {
//                     ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';
//                 }
//                 field("No."; Rec."No.")
//                 {
//                     ToolTip = 'Specifies the number of the estimate.';
//                 }
//                 field("Bill-to Customer No."; Rec."Bill-to Customer No.")
//                 {
//                     ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
//                 }
//                 field("Bill-to Name"; Rec."Bill-to Name")
//                 {
//                     ToolTip = 'Specifies the customer to whom you will send the invoice, when different from the customer that you are selling to.';
//                 }
//                 field("Bill-to Name 2"; Rec."Bill-to Name 2")
//                 {
//                     ToolTip = 'Specifies the value of the Bill-to Name 2 field.';
//                 }
//                 field("Bill-to Address"; Rec."Bill-to Address")
//                 {
//                     ToolTip = 'Specifies the address of the customer that you will send the invoice to.';
//                 }
//                 field("Bill-to Address 2"; Rec."Bill-to Address 2")
//                 {
//                     ToolTip = 'Specifies an additional part of the billing address.';
//                 }
//                 field("Bill-to City"; Rec."Bill-to City")
//                 {
//                     ToolTip = 'Specifies the city of the billing address.';
//                 }
//                 field("Bill-to Contact"; Rec."Bill-to Contact")
//                 {
//                     ToolTip = 'Specifies the name of the contact person at the billing address';
//                 }
//                 field("Your Reference"; Rec."Your Reference")
//                 {
//                     ToolTip = 'Specifies the customer''s reference. The content will be printed on sales documents.';
//                 }
//                 field("Ship-to Code"; Rec."Ship-to Code")
//                 {
//                     ToolTip = 'Specifies the code for another shipment address than the customer''s own address, which is entered by default.';
//                 }
//                 field("Ship-to Name"; Rec."Ship-to Name")
//                 {
//                     ToolTip = 'Specifies the name that products on the sales document will be shipped to.';
//                 }
//                 field("Ship-to Name 2"; Rec."Ship-to Name 2")
//                 {
//                     ToolTip = 'Specifies the value of the Ship-to Name 2 field.';
//                 }
//                 field("Ship-to Address"; Rec."Ship-to Address")
//                 {
//                     ToolTip = 'Specifies the address that products on the sales document will be shipped to. By default, the field is filled with the value in the Address field on the customer card or with the value in the Address field in the Ship-to Address window.';
//                 }
//                 field("Ship-to Address 2"; Rec."Ship-to Address 2")
//                 {
//                     ToolTip = 'Specifies an additional part of the shipping address.';
//                 }
//                 field("Ship-to City"; Rec."Ship-to City")
//                 {
//                     ToolTip = 'Specifies the city of the shipping address.';
//                 }
//                 field("Ship-to Contact"; Rec."Ship-to Contact")
//                 {
//                     ToolTip = 'Specifies the name of the contact person at the address that products on the sales document will be shipped to.';
//                 }
//                 field("Order Date"; Rec."Order Date")
//                 {
//                     ToolTip = 'Specifies the date when the order was created.';
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
//                 }
//                 field("Shipment Date"; Rec."Shipment Date")
//                 {
//                     ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
//                 }
//                 field("Posting Description"; Rec."Posting Description")
//                 {
//                     ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
//                 }
//                 field("Payment Terms Code"; Rec."Payment Terms Code")
//                 {
//                     ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
//                 }
//                 field("Due Date"; Rec."Due Date")
//                 {
//                     ToolTip = 'Specifies when the sales invoice must be paid.';
//                 }
//                 field("Payment Discount %"; Rec."Payment Discount %")
//                 {
//                     ToolTip = 'Specifies the payment discount percentage that is granted if the customer pays on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
//                 }
//                 field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
//                 {
//                     ToolTip = 'Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.';
//                 }
//                 field("Shipment Method Code"; Rec."Shipment Method Code")
//                 {
//                     ToolTip = 'Specifies how items on the sales document are shipped to the customer.';
//                 }
//                 field("Location Code"; Rec."Location Code")
//                 {
//                     ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
//                 }
//                 field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
//                 }
//                 field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
//                 }
//                 field("Customer Posting Group"; Rec."Customer Posting Group")
//                 {
//                     ToolTip = 'Specifies the customer s market type to link business transactions to.';
//                 }
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     ToolTip = 'Specifies the currency that is used on the entry.';
//                 }
//                 field("Currency Factor"; Rec."Currency Factor")
//                 {
//                     ToolTip = 'Specifies the value of the Currency Factor field.';
//                 }
//                 field("Customer Price Group"; Rec."Customer Price Group")
//                 {
//                     ToolTip = 'Specifies the value of the Customer Price Group field.';
//                 }
//                 field("Prices Including VAT"; Rec."Prices Including VAT")
//                 {
//                     ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
//                 }
//                 field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
//                 {
//                     ToolTip = 'Specifies the value of the Invoice Disc. Code field.';
//                 }
//                 field("Customer Disc. Group"; Rec."Customer Disc. Group")
//                 {
//                     ToolTip = 'Specifies the value of the Customer Disc. Group field.';
//                 }
//                 field("Language Code"; Rec."Language Code")
//                 {
//                     ToolTip = 'Specifies the language to be used on printouts for this document.';
//                 }
//                 field("Salesperson Code"; Rec."Salesperson Code")
//                 {
//                     ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';
//                 }
//                 field("Order Class"; Rec."Order Class")
//                 {
//                     ToolTip = 'Specifies the value of the Order Class field.';
//                 }
//                 field(Comment; Rec.Comment)
//                 {
//                     ToolTip = 'Specifies the value of the Comment field.';
//                 }
//                 field("No. Printed"; Rec."No. Printed")
//                 {
//                     ToolTip = 'Specifies the value of the No. Printed field.';
//                 }
//                 field("On Hold"; Rec."On Hold")
//                 {
//                     ToolTip = 'Specifies the value of the On Hold field.';
//                 }
//                 field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
//                 {
//                     ToolTip = 'Specifies the type of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
//                 }
//                 field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
//                 {
//                     ToolTip = 'Specifies the number of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
//                 }
//                 field("Bal. Account No."; Rec."Bal. Account No.")
//                 {
//                     ToolTip = 'Specifies the value of the Bal. Account No. field.';
//                 }
//                 field("Recalculate Invoice Disc."; Rec."Recalculate Invoice Disc.")
//                 {
//                     ToolTip = 'Specifies the value of the Recalculate Invoice Disc. field.';
//                 }
//                 field(Ship; Rec.Ship)
//                 {
//                     ToolTip = 'Specifies the value of the Ship field.';
//                 }
//                 field(Invoice; Rec.Invoice)
//                 {
//                     ToolTip = 'Specifies the value of the Invoice field.';
//                 }
//                 field("Print Posted Documents"; Rec."Print Posted Documents")
//                 {
//                     ToolTip = 'Specifies the value of the Print Posted Documents field.';
//                 }
//                 field(Amount; Rec.Amount)
//                 {
//                     ToolTip = 'Specifies the total amount on the sales invoice excluding VAT.';
//                 }
//                 field("Amount Including VAT"; Rec."Amount Including VAT")
//                 {
//                     ToolTip = 'Specifies the total amount on the sales invoice including VAT.';
//                 }
//                 field("Shipping No."; Rec."Shipping No.")
//                 {
//                     ToolTip = 'Specifies the value of the Shipping No. field.';
//                 }
//                 field("Posting No."; Rec."Posting No.")
//                 {
//                     ToolTip = 'Specifies the value of the Posting No. field';
//                 }
//                 field("Last Shipping No."; Rec."Last Shipping No.")
//                 {
//                     ToolTip = 'Specifies the value of the Last Shipping No. field.';
//                 }
//                 field("Last Posting No."; Rec."Last Posting No.")
//                 {
//                     ToolTip = 'Specifies the value of the Last Posting No. field.';
//                 }
//                 field("Prepayment No."; Rec."Prepayment No.")
//                 {
//                     ToolTip = 'Specifies the value of the Prepayment No. field.';
//                 }
//                 field("Last Prepayment No."; Rec."Last Prepayment No.")
//                 {
//                     ToolTip = 'Specifies the value of the Last Prepayment No. field.';
//                 }
//                 field("Prepmt. Cr. Memo No."; Rec."Prepmt. Cr. Memo No.")
//                 {
//                     ToolTip = 'Specifies the value of the Prepmt. Cr. Memo No. field.';
//                 }
//                 field("Last Prepmt. Cr. Memo No."; Rec."Last Prepmt. Cr. Memo No.")
//                 {
//                     ToolTip = 'Specifies the value of the Last Prepmt. Cr. Memo No. field.';
//                 }
//                 field("VAT Registration No."; Rec."VAT Registration No.")
//                 {
//                     ToolTip = 'Specifies the value of the VAT Registration No. field.';
//                 }
//                 field("Combine Shipments"; Rec."Combine Shipments")
//                 {
//                     ToolTip = 'Specifies whether the order will be included when you use the Combine Shipments function.';
//                 }
//                 field("Reason Code"; Rec."Reason Code")
//                 {
//                     ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the document.';
//                 }
//                 field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
//                 }
//                 field("EU 3-Party Trade"; Rec."EU 3-Party Trade")
//                 {
//                     ToolTip = 'Specifies if the transaction is related to trade with a third party within the EU.';
//                 }
//                 field("Transaction Type"; Rec."Transaction Type")
//                 {
//                     ToolTip = 'Specifies the type of transaction that the document represents, for the purpose of reporting to INTRASTAT.';
//                 }
//                 field("Transport Method"; Rec."Transport Method")
//                 {
//                     ToolTip = 'Specifies the transport method, for the purpose of reporting to INTRASTAT.';
//                 }
//                 field("VAT Country/Region Code"; Rec."VAT Country/Region Code")
//                 {
//                     ToolTip = 'Specifies the value of the VAT Country/Region Code field.';
//                 }
//                 field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
//                 {
//                     ToolTip = 'Specifies the customer''s name.';
//                 }
//                 field("Sell-to Customer Name 2"; Rec."Sell-to Customer Name 2")
//                 {
//                     ToolTip = 'Specifies the value of the Sell-to Customer Name 2 field.';
//                 }
//                 field("Sell-to Address"; Rec."Sell-to Address")
//                 {
//                     ToolTip = 'Specifies the address where the customer is located.';
//                 }
//                 field("Sell-to Address 2"; Rec."Sell-to Address 2")
//                 {
//                     ToolTip = 'Specifies additional address information.';
//                 }
//                 field("Sell-to City"; Rec."Sell-to City")
//                 {
//                     ToolTip = 'Specifies the address city.';
//                 }
//                 field("Sell-to Contact"; Rec."Sell-to Contact")
//                 {
//                     ToolTip = 'Specifies the name of the contact person at the customer.';
//                 }
//                 field("Bill-to Post Code"; Rec."Bill-to Post Code")
//                 {
//                     ToolTip = 'Specifies the postal code of the billing address.';
//                 }
//                 field("Bill-to County"; Rec."Bill-to County")
//                 {
//                     ToolTip = 'Specifies the state, province or county of the address.';
//                 }
//                 field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
//                 {
//                     ToolTip = 'Specifies the country/region code of the customer''s billing address.';
//                 }
//                 field("Sell-to Post Code"; Rec."Sell-to Post Code")
//                 {
//                     ToolTip = 'Specifies the postal code.';
//                 }
//                 field("Sell-to County"; Rec."Sell-to County")
//                 {
//                     ToolTip = 'Specifies the address county.';
//                 }
//                 field("Sell-to Country/Region Code"; Rec."Sell-to Country/Region Code")
//                 {
//                     ToolTip = 'Specifies the country/region code of the customer''s main address.';
//                 }
//                 field("Ship-to Post Code"; Rec."Ship-to Post Code")
//                 {
//                     ToolTip = 'Specifies the postal code of the shipping address.';
//                 }
//                 field("Ship-to County"; Rec."Ship-to County")
//                 {
//                     ToolTip = 'Specifies the state, province or county of the address.';
//                 }
//                 field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
//                 {
//                     ToolTip = 'Specifies the country/region of the shipping address.';
//                 }
//                 field("Bal. Account Type"; Rec."Bal. Account Type")
//                 {
//                     ToolTip = 'Specifies the value of the Bal. Account Type field.';
//                 }
//                 field("Exit Point"; Rec."Exit Point")
//                 {
//                     ToolTip = 'Specifies the point of exit through which you ship the items out of your country/region, for reporting to Intrastat.';
//                 }
//                 field(Correction; Rec.Correction)
//                 {
//                     ToolTip = 'Specifies the value of the Correction field.';
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     ToolTip = 'Specifies when the sales invoice was created.';
//                 }
//                 field("External Document No."; Rec."External Document No.")
//                 {
//                     ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
//                 }
//                 field("Area"; Rec."Area")
//                 {
//                     ToolTip = 'Specifies the country or region of origin for the purpose of Intrastat reporting.';
//                 }
//                 field("Transaction Specification"; Rec."Transaction Specification")
//                 {
//                     ToolTip = 'Specifies a specification of the document''s transaction, for the purpose of reporting to INTRASTAT.';
//                 }
//                 field("Payment Method Code"; Rec."Payment Method Code")
//                 {
//                     ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
//                 }
//                 field("Shipping Agent Code"; Rec."Shipping Agent Code")
//                 {
//                     ToolTip = 'Specifies which shipping agent is used to transport the items on the sales document to the customer.';
//                 }
//                 field("Package Tracking No."; Rec."Package Tracking No.")
//                 {
//                     ToolTip = 'Specifies the shipping agent''s package number.';
//                 }
//                 field("No. Series"; Rec."No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the No. Series field.';
//                 }
//                 field("Posting No. Series"; Rec."Posting No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the Posting No. Series field';
//                 }
//                 field("Shipping No. Series"; Rec."Shipping No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the Shipping No. Series field.';
//                 }
//                 field("Tax Area Code"; Rec."Tax Area Code")
//                 {
//                     ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';
//                 }
//                 field("Tax Liable"; Rec."Tax Liable")
//                 {
//                     ToolTip = 'Specifies if the sales invoice contains sales tax.';
//                 }
//                 field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
//                 }
//                 field(Reserve; Rec.Reserve)
//                 {
//                     ToolTip = 'Specifies the value of the Reserve field.';
//                 }
//                 field("Applies-to ID"; Rec."Applies-to ID")
//                 {
//                     ToolTip = 'Specifies the ID of entries that will be applied to when you choose the Apply Entries action.';
//                 }
//                 field("VAT Base Discount %"; Rec."VAT Base Discount %")
//                 {
//                     ToolTip = 'Specifies the value of the VAT Base Discount % field.';
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
//                 }
//                 field("Invoice Discount Calculation"; Rec."Invoice Discount Calculation")
//                 {
//                     ToolTip = 'Specifies the value of the Invoice Discount Calculation field.';
//                 }
//                 field("Invoice Discount Value"; Rec."Invoice Discount Value")
//                 {
//                     ToolTip = 'Specifies a discount amount that is deducted from the value of the Total Incl. VAT field, based on sales lines where the Allow Invoice Disc. field is selected. You can enter or change the amount manually.';
//                 }
//                 field("Send IC Document"; Rec."Send IC Document")
//                 {
//                     ToolTip = 'Specifies the value of the Send IC Document field.';
//                 }
//                 field("IC Status"; Rec."IC Status")
//                 {
//                     ToolTip = 'Specifies the value of the IC Status field.';
//                 }
//                 field("Sell-to IC Partner Code"; Rec."Sell-to IC Partner Code")
//                 {
//                     ToolTip = 'Specifies the value of the Sell-to IC Partner Code field.';
//                 }
//                 field("Bill-to IC Partner Code"; Rec."Bill-to IC Partner Code")
//                 {
//                     ToolTip = 'Specifies the value of the Bill-to IC Partner Code field.';
//                 }
//                 field("IC Direction"; Rec."IC Direction")
//                 {
//                     ToolTip = 'Specifies the value of the IC Direction field.';
//                 }
//                 field("Prepayment %"; Rec."Prepayment %")
//                 {
//                     ToolTip = 'Specifies the prepayment percentage to use to calculate the prepayment for sales.';
//                 }
//                 field("Prepayment No. Series"; Rec."Prepayment No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the Prepayment No. Series field.';
//                 }
//                 field("Compress Prepayment"; Rec."Compress Prepayment")
//                 {
//                     ToolTip = 'Specifies that prepayments on the sales order are combined if they have the same general ledger account for prepayments or the same dimensions.';
//                 }
//                 field("Prepayment Due Date"; Rec."Prepayment Due Date")
//                 {
//                     ToolTip = 'Specifies when the prepayment invoice for this sales order is due.';
//                 }
//                 field("Prepmt. Cr. Memo No. Series"; Rec."Prepmt. Cr. Memo No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the Prepmt. Cr. Memo No. Series field.';
//                 }
//                 field("Prepmt. Posting Description"; Rec."Prepmt. Posting Description")
//                 {
//                     ToolTip = 'Specifies the value of the Prepmt. Posting Description field.';
//                 }
//                 field("Prepmt. Pmt. Discount Date"; Rec."Prepmt. Pmt. Discount Date")
//                 {
//                     ToolTip = 'Specifies the last date the customer can pay the prepayment invoice and still receive a payment discount on the prepayment amount.';
//                 }
//                 field("Prepmt. Payment Terms Code"; Rec."Prepmt. Payment Terms Code")
//                 {
//                     ToolTip = 'Specifies the code that represents the payment terms for prepayment invoices related to the sales document.';
//                 }
//                 field("Prepmt. Payment Discount %"; Rec."Prepmt. Payment Discount %")
//                 {
//                     ToolTip = 'Specifies the payment discount percent granted on the prepayment if the customer pays on or before the date entered in the Prepmt. Pmt. Discount Date field.';
//                 }
//                 field("Quote No."; Rec."Quote No.")
//                 {
//                     ToolTip = 'Specifies the number of the sales quote that the sales order was created from. You can track the number to sales quote documents that you have printed, saved, or emailed.';
//                 }
//                 field("Quote Valid Until Date"; Rec."Quote Valid Until Date")
//                 {
//                     ToolTip = 'Specifies how long the quote is valid.';
//                 }
//                 field("Quote Sent to Customer"; Rec."Quote Sent to Customer")
//                 {
//                     ToolTip = 'Specifies date and time of when the quote was sent to the customer.';
//                 }
//                 field("Quote Accepted"; Rec."Quote Accepted")
//                 {
//                     ToolTip = 'Specifies whether the customer has accepted the quote or not.';
//                 }
//                 field("Quote Accepted Date"; Rec."Quote Accepted Date")
//                 {
//                     ToolTip = 'Specifies when the client accepted the quote.';
//                 }
//                 field("Job Queue Status"; Rec."Job Queue Status")
//                 {
//                     ToolTip = 'Specifies the status of a job queue entry or task that handles the posting of sales credit memos.';
//                 }
//                 field("Job Queue Entry ID"; Rec."Job Queue Entry ID")
//                 {
//                     ToolTip = 'Specifies the value of the Job Queue Entry ID field.';
//                 }
//                 field("Company Bank Account Code"; Rec."Company Bank Account Code")
//                 {
//                     ToolTip = 'Specifies the bank account to use for bank information when the document is printed.';
//                 }
//                 field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
//                 {
//                     ToolTip = 'Specifies the number of the incoming document that this sales document is created for.';
//                 }
//                 field("Last Email Sent Time"; Rec."Last Email Sent Time")
//                 {
//                     ToolTip = 'Specifies the value of the Last Email Sent Time field.';
//                 }
//                 field("Last Email Sent Status"; Rec."Last Email Sent Status")
//                 {
//                     ToolTip = 'Specifies the value of the Last Email Sent Status field.';
//                 }
//                 field("Sent as Email"; Rec."Sent as Email")
//                 {
//                     ToolTip = 'Specifies the value of the Sent as Email field.';
//                 }
//                 field("Last Email Notif Cleared"; Rec."Last Email Notif Cleared")
//                 {
//                     ToolTip = 'Specifies the value of the Last Email Notif Cleared field.';
//                 }
//                 field(IsTest; Rec.IsTest)
//                 {
//                     ToolTip = 'Specifies the value of the IsTest field.';
//                 }
//                 field("Sell-to Phone No."; Rec."Sell-to Phone No.")
//                 {
//                     ToolTip = 'Specifies the telephone number of the contact person that the sales document will be sent to.';
//                 }
//                 field("Sell-to E-Mail"; Rec."Sell-to E-Mail")
//                 {
//                     ToolTip = 'Specifies the email address of the contact person that the sales document will be sent to.';
//                 }
//                 field("Journal Templ. Name"; Rec."Journal Templ. Name")
//                 {
//                     ToolTip = 'Specifies the name of the journal template in which the sales header is to be posted.';
//                 }
//                 field("VAT Reporting Date"; Rec."VAT Reporting Date")
//                 {
//                     ToolTip = 'Specifies the date used to include entries on VAT reports in a VAT period. This is either the date that the document was created or posted, depending on your setting on the General Ledger Setup page.';
//                 }
//                 field("Work Description"; Rec."Work Description")
//                 {
//                     ToolTip = 'Specifies the value of the Work Description field.';
//                 }
//                 field("Amt. Ship. Not Inv. (LCY)"; Rec."Amt. Ship. Not Inv. (LCY)")
//                 {
//                     ToolTip = 'Specifies the sum, in LCY, for items that have been shipped but not yet been invoiced. The amount is calculated as Amount Including VAT x Qty. Shipped Not Invoiced / Quantity.';
//                 }
//                 field("Amt. Ship. Not Inv. (LCY) Base"; Rec."Amt. Ship. Not Inv. (LCY) Base")
//                 {
//                     ToolTip = 'Specifies the sum, in LCY, for items that have been shipped but not yet been invoiced. The amount is calculated as Amount Including VAT x Qty. Shipped Not Invoiced / Quantity.';
//                 }
//                 field("Dimension Set ID"; Rec."Dimension Set ID")
//                 {
//                     ToolTip = 'Specifies the value of the Dimension Set ID field.';
//                 }
//                 field("Payment Service Set ID"; Rec."Payment Service Set ID")
//                 {
//                     ToolTip = 'Specifies the value of the Payment Service Set ID field.';
//                 }
//                 field("Coupled to CRM"; Rec."Coupled to CRM")
//                 {
//                     ToolTip = 'Specifies that the sales order is coupled to an order in Dynamics 365 Sales.';
//                 }
//                 field("Direct Debit Mandate ID"; Rec."Direct Debit Mandate ID")
//                 {
//                     ToolTip = 'Specifies the direct-debit mandate that the customer has signed to allow direct debit collection of payments.';
//                 }
//                 field("Invoice Discount Amount"; Rec."Invoice Discount Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Invoice Discount Amount field.';
//                 }
//                 field("No. of Archived Versions"; Rec."No. of Archived Versions")
//                 {
//                     ToolTip = 'Specifies the number of archived versions for this document.';
//                 }
//                 field("Doc. No. Occurrence"; Rec."Doc. No. Occurrence")
//                 {
//                     ToolTip = 'Specifies the value of the Doc. No. Occurrence field.';
//                 }
//                 field("Campaign No."; Rec."Campaign No.")
//                 {
//                     ToolTip = 'Specifies the number of the campaign that the document is linked to.';
//                 }
//                 field("Sell-to Contact No."; Rec."Sell-to Contact No.")
//                 {
//                     ToolTip = 'Specifies the number of the contact person at the customer.';
//                 }
//                 field("Bill-to Contact No."; Rec."Bill-to Contact No.")
//                 {
//                     ToolTip = 'Specifies the number of the contact person at the billing address.';
//                 }
//                 field("Opportunity No."; Rec."Opportunity No.")
//                 {
//                     ToolTip = 'Specifies the number of the opportunity that the sales quote is assigned to.';
//                 }
//                 field("Sell-to Customer Templ. Code"; Rec."Sell-to Customer Templ. Code")
//                 {
//                     ToolTip = 'Specifies the code for the template to create a new customer';
//                 }
//                 field("Bill-to Customer Templ. Code"; Rec."Bill-to Customer Templ. Code")
//                 {
//                     ToolTip = 'Specifies the value of the Bill-to Customer Template Code field.';
//                 }
//                 field("Responsibility Center"; Rec."Responsibility Center")
//                 {
//                     ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
//                 }
//                 field("Shipping Advice"; Rec."Shipping Advice")
//                 {
//                     ToolTip = 'Specifies if the customer accepts partial shipment of orders.';
//                 }
//                 field("Shipped Not Invoiced"; Rec."Shipped Not Invoiced")
//                 {
//                     ToolTip = 'Specifies the value of the Shipped Not Invoiced field.';
//                 }
//                 field("Completely Shipped"; Rec."Completely Shipped")
//                 {
//                     ToolTip = 'Specifies whether all the items on the order have been shipped or, in the case of inbound items, completely received.';
//                 }
//                 field("Posting from Whse. Ref."; Rec."Posting from Whse. Ref.")
//                 {
//                     ToolTip = 'Specifies the value of the Posting from Whse. Ref. field.';
//                 }
//                 field(Shipped; Rec.Shipped)
//                 {
//                     ToolTip = 'Specifies the value of the Shipped field.';
//                 }
//                 field("Last Shipment Date"; Rec."Last Shipment Date")
//                 {
//                     ToolTip = 'Specifies the value of the Last Shipment Date field.';
//                 }
//                 field("Requested Delivery Date"; Rec."Requested Delivery Date")
//                 {
//                     ToolTip = 'Specifies the date that the customer has asked for the order to be delivered.';
//                 }
//                 field("Promised Delivery Date"; Rec."Promised Delivery Date")
//                 {
//                     ToolTip = 'Specifies the date that you have promised to deliver the order, as a result of the Order Promising function.';
//                 }
//                 field("Shipping Time"; Rec."Shipping Time")
//                 {
//                     ToolTip = 'Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.';
//                 }
//                 field("Outbound Whse. Handling Time"; Rec."Outbound Whse. Handling Time")
//                 {
//                     ToolTip = 'Specifies a date formula for the time it takes to get items ready to ship from this location. The time element is used in the calculation of the delivery date as follows: Shipment Date + Outbound Warehouse Handling Time = Planned Shipment Date + Shipping Time = Planned Delivery Date.';
//                 }
//                 field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
//                 {
//                     ToolTip = 'Specifies which shipping agent service is used to transport the items on the sales document to the customer.';
//                 }
//                 field("Late Order Shipping"; Rec."Late Order Shipping")
//                 {
//                     ToolTip = 'Specifies that the shipment of one or more lines has been delayed, or that the shipment date is before the work date.';
//                 }
//                 field(Receive; Rec.Receive)
//                 {
//                     ToolTip = 'Specifies the value of the Receive field.';
//                 }
//                 field("Return Receipt No."; Rec."Return Receipt No.")
//                 {
//                     ToolTip = 'Specifies the value of the Return Receipt No. field.';
//                 }
//                 field("Return Receipt No. Series"; Rec."Return Receipt No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the Return Receipt No. Series field.';
//                 }
//                 field("Last Return Receipt No."; Rec."Last Return Receipt No.")
//                 {
//                     ToolTip = 'Specifies the value of the Last Return Receipt No. field.';
//                 }
//                 field("Price Calculation Method"; Rec."Price Calculation Method")
//                 {
//                     ToolTip = 'Specifies the value of the Price Calculation Method field.';
//                 }
//                 field("Allow Line Disc."; Rec."Allow Line Disc.")
//                 {
//                     ToolTip = 'Specifies the value of the Allow Line Disc. field.';
//                 }
//                 field("Get Shipment Used"; Rec."Get Shipment Used")
//                 {
//                     ToolTip = 'Specifies the value of the Get Shipment Used field.';
//                 }
//                 field(Id; Rec.Id)
//                 {
//                     ToolTip = 'Specifies the value of the Id field.';
//                 }
//                 field("Assigned User ID"; Rec."Assigned User ID")
//                 {
//                     ToolTip = 'Specifies the ID of the user who is responsible for the document.';
//                 }
//                 field("BIS Status"; Rec."BIS Status")
//                 {
//                     ToolTip = 'Specifies the value of the BIS Status field.';
//                 }
//                 field("Release Date"; Rec."Release Date")
//                 {
//                     ToolTip = 'Specifies the value of the Release Date field.';
//                 }
//                 field("Release Time"; Rec."Release Time")
//                 {
//                     ToolTip = 'Specifies the value of the Release Time field.';
//                 }
//                 field("Interface Document"; Rec."Interface Document")
//                 {
//                     ToolTip = 'Specifies the value of the Interface Document field.';
//                 }
//                 field("BIS Sales Person"; Rec."BIS Sales Person")
//                 {
//                     ToolTip = 'Specifies the value of the BIS Sales Person field.';
//                 }
//                 field("Smart Sales Ref."; Rec."Smart Sales Ref.")
//                 {
//                     ToolTip = 'Specifies the value of the Smart Sales Ref. field.';
//                 }
//                 field("NWTH WHT Bus. Posting Group"; Rec."NWTH WHT Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the value of the WHT Bus. Posting Group field';
//                 }
//                 field("NWTH eTax Document Type"; Rec."NWTH eTax Document Type")
//                 {
//                     ToolTip = 'Specifies the value of the eTax Document Type field';
//                 }
//                 field("NWTH eTax Document Reason Code"; Rec."NWTH eTax Document Reason Code")
//                 {
//                     ToolTip = 'Specifies the value of the eTax Document Reason Code field';
//                 }
//                 field("NWTH eTax Reason Text"; Rec."NWTH eTax Reason Text")
//                 {
//                     ToolTip = 'Specifies the value of the eTax Reason Text field.';
//                 }
//                 field("NWTH Company Branch Code"; Rec."NWTH Company Branch Code")
//                 {
//                     ToolTip = 'Specifies the value of the Company Branch Code field';
//                 }
//                 field(SystemCreatedAt; Rec.SystemCreatedAt)
//                 {
//                     ToolTip = 'Specifies the value of the SystemCreatedAt field.';
//                 }
//                 field(SystemCreatedBy; Rec.SystemCreatedBy)
//                 {
//                     ToolTip = 'Specifies the value of the SystemCreatedBy field.';
//                 }
//                 field(SystemId; Rec.SystemId)
//                 {
//                     ToolTip = 'Specifies the value of the SystemId field.';
//                 }
//                 field(SystemModifiedAt; Rec.SystemModifiedAt)
//                 {
//                     ToolTip = 'Specifies the value of the SystemModifiedAt field.';
//                 }
//                 field(SystemModifiedBy; Rec.SystemModifiedBy)
//                 {
//                     ToolTip = 'Specifies the value of the SystemModifiedBy field.';
//                 }
//             }
//         }
//     }
// }
