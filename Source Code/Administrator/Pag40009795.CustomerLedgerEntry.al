// page 40009795 "Customer Ledger Entry"
// {
//     ApplicationArea = All;
//     Caption = 'Customer Ledger Entry';
//     PageType = List;
//     SourceTable = "Cust. Ledger Entry";
//     Permissions = tabledata "Cust. Ledger Entry" = rim;
    
//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Entry No."; Rec."Entry No.")
//                 {
//                     ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
//                 }
//                 field("Customer No."; Rec."Customer No.")
//                 {
//                     ToolTip = 'Specifies the customer account number that the entry is linked to.';
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     ToolTip = 'Specifies the customer entry''s posting date.';
//                 }
//                 field("Document Type"; Rec."Document Type")
//                 {
//                     ToolTip = 'Specifies the document type that the customer entry belongs to.';
//                 }
//                 field("Document No."; Rec."Document No.")
//                 {
//                     ToolTip = 'Specifies the entry''s document number.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ToolTip = 'Specifies a description of the customer entry.';
//                 }
//                 field("Customer Name"; Rec."Customer Name")
//                 {
//                     ToolTip = 'Specifies the customer name that the entry is linked to.';
//                 }
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     ToolTip = 'Specifies the currency code for the amount on the line.';
//                 }
//                 field(Amount; Rec.Amount)
//                 {
//                     ToolTip = 'Specifies the amount of the entry.';
//                 }
//                 field("Remaining Amount"; Rec."Remaining Amount")
//                 {
//                     ToolTip = 'Specifies the amount that remains to be applied to before the entry has been completely applied.';
//                 }
//                 field("Original Amt. (LCY)"; Rec."Original Amt. (LCY)")
//                 {
//                     ToolTip = 'Specifies the amount that the entry originally consisted of, in LCY.';
//                 }
//                 field("Remaining Amt. (LCY)"; Rec."Remaining Amt. (LCY)")
//                 {
//                     ToolTip = 'Specifies the amount that remains to be applied to before the entry is totally applied to.';
//                 }
//                 field("Amount (LCY)"; Rec."Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the amount of the entry in LCY.';
//                 }
//                 field("Sales (LCY)"; Rec."Sales (LCY)")
//                 {
//                     ToolTip = 'Specifies the total net amount of sales to the customer in LCY.';
//                 }
//                 field("Profit (LCY)"; Rec."Profit (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Profit (LCY) field.';
//                 }
//                 field("Inv. Discount (LCY)"; Rec."Inv. Discount (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Inv. Discount (LCY) field.';
//                 }
//                 field("Sell-to Customer No."; Rec."Sell-to Customer No.")
//                 {
//                     ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
//                 }
//                 field("Customer Posting Group"; Rec."Customer Posting Group")
//                 {
//                     ToolTip = 'Specifies the customer''s market type to link business transactions to.';
//                 }
//                 field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
//                 {
//                     ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
//                 }
//                 field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
//                 {
//                     ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
//                 }
//                 field("Salesperson Code"; Rec."Salesperson Code")
//                 {
//                     ToolTip = 'Specifies the code for the salesperson whom the entry is linked to.';
//                 }
//                 field("User ID"; Rec."User ID")
//                 {
//                     ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
//                 }
//                 field("Source Code"; Rec."Source Code")
//                 {
//                     ToolTip = 'Specifies the source code that specifies where the entry was created.';
//                 }
//                 field("On Hold"; Rec."On Hold")
//                 {
//                     ToolTip = 'Specifies that the related entry represents an unpaid invoice for which either a payment suggestion, a reminder, or a finance charge memo exists.';
//                 }
//                 field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
//                 {
//                     ToolTip = 'Specifies the value of the Applies-to Doc. Type field.';
//                 }
//                 field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
//                 {
//                     ToolTip = 'Specifies the value of the Applies-to Doc. No. field.';
//                 }
//                 field(Open; Rec.Open)
//                 {
//                     ToolTip = 'Specifies whether the amount on the entry has been fully paid or there is still a remaining amount that must be applied to.';
//                 }
//                 field("Due Date"; Rec."Due Date")
//                 {
//                     ToolTip = 'Specifies the due date on the entry.';
//                 }
//                 field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
//                 {
//                     ToolTip = 'Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.';
//                 }
//                 field("Original Pmt. Disc. Possible"; Rec."Original Pmt. Disc. Possible")
//                 {
//                     ToolTip = 'Specifies the discount that the customer can obtain if the entry is applied to before the payment discount date.';
//                 }
//                 field("Pmt. Disc. Given (LCY)"; Rec."Pmt. Disc. Given (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Pmt. Disc. Given (LCY) field.';
//                 }
//                 field("Orig. Pmt. Disc. Possible(LCY)"; Rec."Orig. Pmt. Disc. Possible(LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Orig. Pmt. Disc. Possible (LCY) field.';
//                 }
//                 field(Positive; Rec.Positive)
//                 {
//                     ToolTip = 'Specifies if the entry to be applied is positive.';
//                 }
//                 field("Closed by Entry No."; Rec."Closed by Entry No.")
//                 {
//                     ToolTip = 'Specifies the value of the Closed by Entry No. field.';
//                 }
//                 field("Closed at Date"; Rec."Closed at Date")
//                 {
//                     ToolTip = 'Specifies the value of the Closed at Date field.';
//                 }
//                 field("Closed by Amount"; Rec."Closed by Amount")
//                 {
//                     ToolTip = 'Specifies the amount that the entry was finally applied to (closed) with.';
//                 }
//                 field("Applies-to ID"; Rec."Applies-to ID")
//                 {
//                     ToolTip = 'Specifies the ID of entries that will be applied to when you choose the Apply Entries action.';
//                 }
//                 field("Journal Templ. Name"; Rec."Journal Templ. Name")
//                 {
//                     ToolTip = 'Specifies the value of the Journal Template Name field.';
//                 }
//                 field("Journal Batch Name"; Rec."Journal Batch Name")
//                 {
//                     ToolTip = 'Specifies the value of the Journal Batch Name field.';
//                 }
//                 field("Reason Code"; Rec."Reason Code")
//                 {
//                     ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
//                 }
//                 field("Bal. Account Type"; Rec."Bal. Account Type")
//                 {
//                     ToolTip = 'Specifies the type of account that a balancing entry is posted to, such as BANK for a cash account.';
//                 }
//                 field("Bal. Account No."; Rec."Bal. Account No.")
//                 {
//                     ToolTip = 'Specifies the number of the general ledger, customer, vendor, or bank account that the balancing entry is posted to, such as a cash account for cash purchases.';
//                 }
//                 field("Transaction No."; Rec."Transaction No.")
//                 {
//                     ToolTip = 'Specifies the value of the Transaction No. field.';
//                 }
//                 field("Closed by Amount (LCY)"; Rec."Closed by Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Closed by Amount (LCY) field.';
//                 }
//                 field("Debit Amount"; Rec."Debit Amount")
//                 {
//                     ToolTip = 'Specifies the total of the ledger entries that represent debits.';
//                 }
//                 field("Credit Amount"; Rec."Credit Amount")
//                 {
//                     ToolTip = 'Specifies the total of the ledger entries that represent credits.';
//                 }
//                 field("Debit Amount (LCY)"; Rec."Debit Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the total of the ledger entries that represent debits, expressed in LCY.';
//                 }
//                 field("Credit Amount (LCY)"; Rec."Credit Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the total of the ledger entries that represent credits, expressed in LCY.';
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     ToolTip = 'Specifies the value of the Document Date field.';
//                 }
//                 field("External Document No."; Rec."External Document No.")
//                 {
//                     ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
//                 }
//                 field("Calculate Interest"; Rec."Calculate Interest")
//                 {
//                     ToolTip = 'Specifies the value of the Calculate Interest field.';
//                 }
//                 field("Closing Interest Calculated"; Rec."Closing Interest Calculated")
//                 {
//                     ToolTip = 'Specifies the value of the Closing Interest Calculated field.';
//                 }
//                 field("No. Series"; Rec."No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the No. Series field.';
//                 }
//                 field("Closed by Currency Code"; Rec."Closed by Currency Code")
//                 {
//                     ToolTip = 'Specifies the code of the currency of the entry that was applied to (and closed) this customer ledger entry.';
//                 }
//                 field("Closed by Currency Amount"; Rec."Closed by Currency Amount")
//                 {
//                     ToolTip = 'Specifies the amount that was finally applied to (and closed) this customer ledger entry.';
//                 }
//                 field("Adjusted Currency Factor"; Rec."Adjusted Currency Factor")
//                 {
//                     ToolTip = 'Specifies the value of the Adjusted Currency Factor field.';
//                 }
//                 field("Original Currency Factor"; Rec."Original Currency Factor")
//                 {
//                     ToolTip = 'Specifies the value of the Original Currency Factor field.';
//                 }
//                 field("Original Amount"; Rec."Original Amount")
//                 {
//                     ToolTip = 'Specifies the amount of the original entry.';
//                 }
//                 field("Remaining Pmt. Disc. Possible"; Rec."Remaining Pmt. Disc. Possible")
//                 {
//                     ToolTip = 'Specifies the remaining payment discount which can be received if the payment is made before the payment discount date.';
//                 }
//                 field("Pmt. Disc. Tolerance Date"; Rec."Pmt. Disc. Tolerance Date")
//                 {
//                     ToolTip = 'Specifies the latest date the amount in the entry must be paid in order for a payment discount tolerance to be granted.';
//                 }
//                 field("Max. Payment Tolerance"; Rec."Max. Payment Tolerance")
//                 {
//                     ToolTip = 'Specifies the maximum tolerated amount the entry can differ from the amount on the invoice or credit memo.';
//                 }
//                 field("Last Issued Reminder Level"; Rec."Last Issued Reminder Level")
//                 {
//                     ToolTip = 'Specifies the value of the Last Issued Reminder Level field.';
//                 }
//                 field("Accepted Payment Tolerance"; Rec."Accepted Payment Tolerance")
//                 {
//                     ToolTip = 'Specifies the value of the Accepted Payment Tolerance field.';
//                 }
//                 field("Accepted Pmt. Disc. Tolerance"; Rec."Accepted Pmt. Disc. Tolerance")
//                 {
//                     ToolTip = 'Specifies the value of the Accepted Pmt. Disc. Tolerance field.';
//                 }
//                 field("Pmt. Tolerance (LCY)"; Rec."Pmt. Tolerance (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Pmt. Tolerance (LCY) field.';
//                 }
//                 field("Amount to Apply"; Rec."Amount to Apply")
//                 {
//                     ToolTip = 'Specifies the amount to apply.';
//                 }
//                 field("IC Partner Code"; Rec."IC Partner Code")
//                 {
//                     ToolTip = 'Specifies the code of the intercompany partner that the transaction is related to if the entry was created from an intercompany transaction.';
//                 }
//                 field("Applying Entry"; Rec."Applying Entry")
//                 {
//                     ToolTip = 'Specifies the value of the Applying Entry field.';
//                 }
//                 field(Reversed; Rec.Reversed)
//                 {
//                     ToolTip = 'Specifies if the entry has been part of a reverse transaction.';
//                 }
//                 field("Reversed by Entry No."; Rec."Reversed by Entry No.")
//                 {
//                     ToolTip = 'Specifies the number of the correcting entry that replaced the original entry in the reverse transaction.';
//                 }
//                 field("Reversed Entry No."; Rec."Reversed Entry No.")
//                 {
//                     ToolTip = 'Specifies the number of the original entry that was undone by the reverse transaction.';
//                 }
//                 field(Prepayment; Rec.Prepayment)
//                 {
//                     ToolTip = 'Specifies if the related payment is a prepayment.';
//                 }
//                 field("Payment Reference"; Rec."Payment Reference")
//                 {
//                     ToolTip = 'Specifies the value of the Payment Reference field.';
//                 }
//                 field("Payment Method Code"; Rec."Payment Method Code")
//                 {
//                     ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
//                 }
//                 field("Applies-to Ext. Doc. No."; Rec."Applies-to Ext. Doc. No.")
//                 {
//                     ToolTip = 'Specifies the value of the Applies-to Ext. Doc. No. field.';
//                 }
//                 field("Recipient Bank Account"; Rec."Recipient Bank Account")
//                 {
//                     ToolTip = 'Specifies the bank account to transfer the amount to.';
//                 }
//                 field("Message to Recipient"; Rec."Message to Recipient")
//                 {
//                     ToolTip = 'Specifies the message exported to the payment file when you use the Export Payments to File function in the Payment Journal window.';
//                 }
//                 field("Exported to Payment File"; Rec."Exported to Payment File")
//                 {
//                     ToolTip = 'Specifies that the entry was created as a result of exporting a payment journal line.';
//                 }
//                 field("Dimension Set ID"; Rec."Dimension Set ID")
//                 {
//                     ToolTip = 'Specifies a reference to a combination of dimension values. The actual values are stored in the Dimension Set Entry table.';
//                 }
//                 field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 3, which is one of dimension codes that you set up in the General Ledger Setup window.';
//                 }
//                 field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 4, which is one of dimension codes that you set up in the General Ledger Setup window.';
//                 }
//                 field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 5, which is one of dimension codes that you set up in the General Ledger Setup window.';
//                 }
//                 field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 6, which is one of dimension codes that you set up in the General Ledger Setup window.';
//                 }
//                 field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 7, which is one of dimension codes that you set up in the General Ledger Setup window.';
//                 }
//                 field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
//                 {
//                     ToolTip = 'Specifies the code for Shortcut Dimension 8, which is one of dimension codes that you set up in the General Ledger Setup window.';
//                 }
//                 field("Direct Debit Mandate ID"; Rec."Direct Debit Mandate ID")
//                 {
//                     ToolTip = 'Specifies the direct-debit mandate that the customer has signed to allow direct debit collection of payments.';
//                 }
//                 field("Cheque Bank Name"; Rec."Cheque Bank Name")
//                 {
//                     ToolTip = 'Specifies the value of the Cheque Bank Name field.';
//                 }
//                 field("Cheque Branch Name"; Rec."Cheque Branch Name")
//                 {
//                     ToolTip = 'Specifies the value of the Cheque Branch Name field.';
//                 }
//                 field("Cheque No."; Rec."Cheque No.")
//                 {
//                     ToolTip = 'Specifies the value of the Cheque No. field.';
//                 }
//                 field("Cheque Date"; Rec."Cheque Date")
//                 {
//                     ToolTip = 'Specifies the value of the Cheque Date field.';
//                 }
//                 field("NWTH Billing Date"; Rec."NWTH Billing Date")
//                 {
//                     ToolTip = 'Specifies the value of the Billing Date field';
//                 }
//                 field("NWTH Billing No."; Rec."NWTH Billing No.")
//                 {
//                     ToolTip = 'Specifies the value of the Billing No. field';
//                 }
//                 field("NWTH Check-Collecting Date"; Rec."NWTH Check-Collecting Date")
//                 {
//                     ToolTip = 'Specifies the value of the Check-Collecting Date field';
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
