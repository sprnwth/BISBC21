// page 40009798 WHTEntry
// {
//     ApplicationArea = All;
//     Caption = 'WHTEntry';
//     PageType = List;
//     SourceTable = "NWTH WHT Entry";
//     Permissions = tabledata "NWTH WHT Entry" = rimd;
    
//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Entry No."; Rec."Entry No.")
//                 {
//                     ToolTip = 'Specifies an auto-generated unique key for every transaction in this table.';
//                 }
//                 field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies that the value is assigned from Gen. Bus. Posting Group in the Sales/Purchase/Journal transaction.';
//                 }
//                 field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
//                 {
//                     ToolTip = 'Specifies the value is assigned from Gen. Prod. Posting Group in the Sales/Purchase/Journal transaction.';
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     ToolTip = 'Specifies the date when the original entry was posted.';
//                 }
//                 field("Document No."; Rec."Document No.")
//                 {
//                     ToolTip = 'Specifies the document number of the original transaction.';
//                 }
//                 field("Document Type"; Rec."Document Type")
//                 {
//                     ToolTip = 'Specifies the value is assigned from Document Type in the Sales/Purchase/Journal transaction.';
//                 }
//                 field(Base; Rec.Base)
//                 {
//                     ToolTip = 'Specifies the calculated withholding tax base amount.';
//                 }
//                 field(Amount; Rec.Amount)
//                 {
//                     ToolTip = 'Specifies the calculated withholding tax amount.';
//                 }
//                 field("WHT Calculation Type"; Rec."WHT Calculation Type")
//                 {
//                     ToolTip = 'Specifies the withholding tax (WHT) calculation type.';
//                 }
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     ToolTip = 'Specifies that the value of Specifies that this field is assigned from Currency Code in the Sales/Purchase/Journal transaction.';
//                 }
//                 field("Bill-to/Pay-to No."; Rec."Bill-to/Pay-to No.")
//                 {
//                     ToolTip = 'Specifies the number of the Bill-to Customer or Pay-to Vendor that the entry is linked to.';
//                 }
//                 field("User ID"; Rec."User ID")
//                 {
//                     ToolTip = 'Specifies the ID of the user that is associated with the entry.';
//                 }
//                 field("Source Code"; Rec."Source Code")
//                 {
//                     ToolTip = 'Specifies the source code that is linked to the WHT entry.';
//                 }
//                 field("Reason Code"; Rec."Reason Code")
//                 {
//                     ToolTip = 'Specifies the reason code for the entry.';
//                 }
//                 field("Closed by Entry No."; Rec."Closed by Entry No.")
//                 {
//                     ToolTip = 'Specifies the entry number of the WHT entry that has been applied to (that has closed) the entry.';
//                 }
//                 field(Closed; Rec.Closed)
//                 {
//                     ToolTip = 'Specifies that the entry has been closed for transactions.';
//                 }
//                 field("Country/Region Code"; Rec."Country/Region Code")
//                 {
//                     ToolTip = 'Specifies the country code for the customer or vendor that the WHT entry is linked to.';
//                 }
//                 field("Transaction No."; Rec."Transaction No.")
//                 {
//                     ToolTip = 'Specifies the transaction number assigned to the entry.';
//                 }
//                 field("Unrealized Amount"; Rec."Unrealized Amount")
//                 {
//                     ToolTip = 'Specifies the withholding tax amount in the original currency that will be realized during payment as calculated during the posting of the document.';
//                 }
//                 field("Unrealized Base"; Rec."Unrealized Base")
//                 {
//                     ToolTip = 'Specifies the base amount in the original currency that the WHT Amount was calculated from.';
//                 }
//                 field("Remaining Unrealized Amount"; Rec."Remaining Unrealized Amount")
//                 {
//                     ToolTip = 'Specifies the calculated remaining WHT amount.';
//                 }
//                 field("Remaining Unrealized Base"; Rec."Remaining Unrealized Base")
//                 {
//                     ToolTip = 'Specifies the calculated remaining base amount.';
//                 }
//                 field("External Document No."; Rec."External Document No.")
//                 {
//                     ToolTip = 'Specifies the external document number for this entry.';
//                 }
//                 field("Transaction Type"; Rec."Transaction Type")
//                 {
//                     ToolTip = 'Specifies the source of the transaction.';
//                 }
//                 field("No. Series"; Rec."No. Series")
//                 {
//                     ToolTip = 'Specifies the number series that the document number on this entry belongs to.';
//                 }
//                 field("Unrealized WHT Entry No."; Rec."Unrealized WHT Entry No.")
//                 {
//                     ToolTip = 'Specifies the number of the original WHT entry with the unrealized WHT amount.';
//                 }
//                 field("WHT Bus. Posting Group"; Rec."WHT Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the WHT Business Posting group code that was used when the entry was posted.';
//                 }
//                 field("WHT Prod. Posting Group"; Rec."WHT Prod. Posting Group")
//                 {
//                     ToolTip = 'Specifies the WHT Product Posting group code that was used when the entry was posted.';
//                 }
//                 field("Base (LCY)"; Rec."Base (LCY)")
//                 {
//                     ToolTip = 'Specifies the Base Amount in LCY of the WHT, which is realized during this transaction.';
//                 }
//                 field("Amount (LCY)"; Rec."Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the WHT Amount in LCY of the WHT, which is realized during this transaction.';
//                 }
//                 field("Unrealized Amount (LCY)"; Rec."Unrealized Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the withholding tax amount that will be realized during payment as calculated during the posting of the document.';
//                 }
//                 field("Unrealized Base (LCY)"; Rec."Unrealized Base (LCY)")
//                 {
//                     ToolTip = 'Specifies the base amount in your currency that the WHT Amount was calculated from.';
//                 }
//                 field("WHT %"; Rec."WHT %")
//                 {
//                     ToolTip = 'Specifies the withholding tax percent used for calculations during this transaction.';
//                 }
//                 field("Rem Unrealized Amount (LCY)"; Rec."Rem Unrealized Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the Remaining Unrealized Amount in LCY left for a particular transaction is stored.';
//                 }
//                 field("Rem Unrealized Base (LCY)"; Rec."Rem Unrealized Base (LCY)")
//                 {
//                     ToolTip = 'Specifies the Remaining Unrealized Base in LCY left for a particular transaction is stored.';
//                 }
//                 field("WHT Difference"; Rec."WHT Difference")
//                 {
//                     ToolTip = 'Specifies the difference between the Unrealized and Realized WHT.';
//                 }
//                 field("Ship-to/Order Address Code"; Rec."Ship-to/Order Address Code")
//                 {
//                     ToolTip = 'Specifies the address of the entry.';
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     ToolTip = 'Specifies the Document Date from the applied WHT Entry is stored for applying the WHT Entry table.';
//                 }
//                 field("Actual Vendor No."; Rec."Actual Vendor No.")
//                 {
//                     ToolTip = 'Specifies the Actual Vendor No. from which Invoices or Journals is copied.';
//                 }
//                 field("WHT Certificate No."; Rec."WHT Certificate No.")
//                 {
//                     ToolTip = 'Specifies an auto-generated no. based on the no. series.';
//                 }
//                 field("Void Check"; Rec."Void Check")
//                 {
//                     ToolTip = 'Specifies that this field is marked internally if the transactions have been reversed due to voiding of checks.';
//                 }
//                 field("Original Document No."; Rec."Original Document No.")
//                 {
//                     ToolTip = 'Specifies the original document no. from the Invoice or Journal is assigned to this field.';
//                 }
//                 field("Void Payment Entry No."; Rec."Void Payment Entry No.")
//                 {
//                     ToolTip = 'Specifies the entry no. of the WHT Entry, which has been voided, with this transaction.';
//                 }
//                 field("WHT Report Line No"; Rec."WHT Report Line No")
//                 {
//                     ToolTip = 'Specifies an auto-generated field based on the no. series defined in the WHT Posting Setup for a particular WHT Report Type.';
//                 }
//                 field("WHT Report"; Rec."WHT Report")
//                 {
//                     ToolTip = 'Specifies that this field is assigned from WHT Posting Setup based on WHT Business and WHT Product Posting Group.';
//                 }
//                 field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
//                 {
//                     ToolTip = 'Specifies the value of the Applies-to Doc. Type field.';
//                 }
//                 field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
//                 {
//                     ToolTip = 'Specifies the value of the Applies-to Doc. No. field.';
//                 }
//                 field("Applies-to Entry No."; Rec."Applies-to Entry No.")
//                 {
//                     ToolTip = 'Specifies the value of the Applies-to Entry No. field.';
//                 }
//                 field("WHT Revenue Type"; Rec."WHT Revenue Type")
//                 {
//                     ToolTip = 'Specifies the value of the WHT Revenue Type field.';
//                 }
//                 field(Settled; Rec.Settled)
//                 {
//                     ToolTip = 'Specifies the value of the Settled field.';
//                 }
//                 field("Payment Amount"; Rec."Payment Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Payment Amount field.';
//                 }
//                 field("Reversed by Entry No."; Rec."Reversed by Entry No.")
//                 {
//                     ToolTip = 'Specifies the value of the Reversed by Entry No. field.';
//                 }
//                 field("Reversed Entry No."; Rec."Reversed Entry No.")
//                 {
//                     ToolTip = 'Specifies the value of the Reversed Entry No. field.';
//                 }
//                 field(Reversed; Rec.Reversed)
//                 {
//                     ToolTip = 'Specifies the value of the Reversed field.';
//                 }
//                 field("Rem Realized Amount"; Rec."Rem Realized Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Rem Realized Amount field.';
//                 }
//                 field("Rem Realized Amount (LCY)"; Rec."Rem Realized Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Rem Realized Amount (LCY) field.';
//                 }
//                 field("Rem Realized Base"; Rec."Rem Realized Base")
//                 {
//                     ToolTip = 'Specifies the value of the Rem Realized Base field.';
//                 }
//                 field("Rem Realized Base (LCY)"; Rec."Rem Realized Base (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Rem Realized Base (LCY) field.';
//                 }
//                 field(Prepayment; Rec.Prepayment)
//                 {
//                     ToolTip = 'Specifies the value of the Prepayment field.';
//                 }
//                 field("Pymt. Disc. Diff. Base"; Rec."Pymt. Disc. Diff. Base")
//                 {
//                     ToolTip = 'Specifies the value of the Pymt. Disc. Diff. Base field.';
//                 }
//                 field("Pymt. Disc. Diff. Amount"; Rec."Pymt. Disc. Diff. Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Pymt. Disc. Diff. Amount field.';
//                 }
//                 field("NWTH Ref. Document No."; Rec."NWTH Ref. Document No.")
//                 {
//                     ToolTip = 'Specifies the value of the Reference No. field';
//                 }
//                 field("NWTH Ref. Line No."; Rec."NWTH Ref. Line No.")
//                 {
//                     ToolTip = 'Specifies the value of the Reference Line No. field';
//                 }
//                 field("NWTH Currency Factor"; Rec."NWTH Currency Factor")
//                 {
//                     ToolTip = 'Specifies the value of the Currency Factor field.';
//                 }
//                 field("NWTH Modified"; Rec."NWTH Modified")
//                 {
//                     ToolTip = 'Specifies the value of the Modified field.';
//                 }
//                 field("NWTH Ref. Document Type"; Rec."NWTH Ref. Document Type")
//                 {
//                     ToolTip = 'Specifies the value of the Ref. Document Type field.';
//                 }
//                 field("NWTH Submit"; Rec."NWTH Submit")
//                 {
//                     ToolTip = 'Specifies the value of the Submit field.';
//                 }
//                 field("NWTH Ignore"; Rec."NWTH Ignore")
//                 {
//                     ToolTip = 'Specifies the value of the Ignore field.';
//                 }
//                 field("NWTH Pending"; Rec."NWTH Pending")
//                 {
//                     ToolTip = 'Specifies the value of the Pending field.';
//                 }
//                 field("NWTH WHT Term"; Rec."NWTH WHT Term")
//                 {
//                     ToolTip = 'Specifies the value of the WHT Term field.';
//                 }
//                 field("NWTH Reverse G/L Account No."; Rec."NWTH Reverse G/L Account No.")
//                 {
//                     ToolTip = 'Specifies the value of the Reverse G/L Account No. field.';
//                 }
//                 field("NWTH Global Dimension 1 Code"; Rec."NWTH Global Dimension 1 Code")
//                 {
//                     ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
//                 }
//                 field("NWTH Global Dimension 2 Code"; Rec."NWTH Global Dimension 2 Code")
//                 {
//                     ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
//                 }
//                 field("NWTH Company Branch Code"; Rec."NWTH Company Branch Code")
//                 {
//                     ToolTip = 'Specifies the value of the Company Branch Code field';
//                 }
//                 field("NWTH WHT Custom Address"; Rec."NWTH WHT Custom Address")
//                 {
//                     ToolTip = 'Specifies the value of the WHT Custom Address field.';
//                 }
//                 field("NWTH WHT Expense Amount"; Rec."NWTH WHT Expense Amount")
//                 {
//                     ToolTip = 'Specifies the value of the WHT Expense Amount field.';
//                 }
//                 field("NWTH WHT Exp. Amount (LCY)"; Rec."NWTH WHT Exp. Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the WHT Expense Amount (LCY) field.';
//                 }
//                 field("NWTH Dimension Set ID"; Rec."NWTH Dimension Set ID")
//                 {
//                     ToolTip = 'Specifies the value of the Dimension Set ID field.';
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
