// page 40009797 "VAT Entry"
// {
//     ApplicationArea = All;
//     Caption = 'VAT Entry';
//     PageType = List;
//     SourceTable = "VAT Entry";
//     Permissions = tabledata "VAT Entry" = rim;
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
//                 field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
//                 }
//                 field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
//                 {
//                     ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     ToolTip = 'Specifies the VAT entry''s posting date.';
//                 }
//                 field("Document No."; Rec."Document No.")
//                 {
//                     ToolTip = 'Specifies the document number on the VAT entry.';
//                 }
//                 field("Document Type"; Rec."Document Type")
//                 {
//                     ToolTip = 'Specifies the document type that the VAT entry belongs to.';
//                 }
//                 field("Type"; Rec."Type")
//                 {
//                     ToolTip = 'Specifies the type of the VAT entry.';
//                 }
//                 field(Base; Rec.Base)
//                 {
//                     ToolTip = 'Specifies the amount that the VAT amount (the amount shown in the Amount field) is calculated from.';
//                 }
//                 field(Amount; Rec.Amount)
//                 {
//                     ToolTip = 'Specifies the amount of the VAT entry in LCY.';
//                 }
//                 field("VAT Calculation Type"; Rec."VAT Calculation Type")
//                 {
//                     ToolTip = 'Specifies how VAT will be calculated for purchases or sales of items with this particular combination of VAT business posting group and VAT product posting group.';
//                 }
//                 field("Bill-to/Pay-to No."; Rec."Bill-to/Pay-to No.")
//                 {
//                     ToolTip = 'Specifies the number of the bill-to customer or pay-to vendor that the entry is linked to.';
//                 }
//                 field("EU 3-Party Trade"; Rec."EU 3-Party Trade")
//                 {
//                     ToolTip = 'Specifies if the transaction is related to trade with a third party within the EU.';
//                 }
//                 field("User ID"; Rec."User ID")
//                 {
//                     ToolTip = 'Specifies the value of the User ID field.';
//                 }
//                 field("Source Code"; Rec."Source Code")
//                 {
//                     ToolTip = 'Specifies the value of the Source Code field.';
//                 }
//                 field("Reason Code"; Rec."Reason Code")
//                 {
//                     ToolTip = 'Specifies the value of the Reason Code field.';
//                 }
//                 field("Closed by Entry No."; Rec."Closed by Entry No.")
//                 {
//                     ToolTip = 'Specifies the number of the VAT entry that has closed the entry, if the VAT entry was closed with the Calc. and Post VAT Settlement batch job.';
//                 }
//                 field(Closed; Rec.Closed)
//                 {
//                     ToolTip = 'Specifies whether the VAT entry has been closed by the Calc. and Post VAT Settlement batch job.';
//                 }
//                 field("Country/Region Code"; Rec."Country/Region Code")
//                 {
//                     ToolTip = 'Specifies the country/region of the address.';
//                 }
//                 field("Internal Ref. No."; Rec."Internal Ref. No.")
//                 {
//                     ToolTip = 'Specifies the internal reference number for the line.';
//                 }
//                 field("Transaction No."; Rec."Transaction No.")
//                 {
//                     ToolTip = 'Specifies the value of the Transaction No. field.';
//                 }
//                 field("Unrealized Amount"; Rec."Unrealized Amount")
//                 {
//                     ToolTip = 'Specifies the unrealized VAT amount for this line if you use unrealized VAT.';
//                 }
//                 field("Unrealized Base"; Rec."Unrealized Base")
//                 {
//                     ToolTip = 'Specifies the unrealized base amount if you use unrealized VAT.';
//                 }
//                 field("Remaining Unrealized Amount"; Rec."Remaining Unrealized Amount")
//                 {
//                     ToolTip = 'Specifies the amount that remains unrealized in the VAT entry.';
//                 }
//                 field("Remaining Unrealized Base"; Rec."Remaining Unrealized Base")
//                 {
//                     ToolTip = 'Specifies the amount of base that remains unrealized in the VAT entry.';
//                 }
//                 field("External Document No."; Rec."External Document No.")
//                 {
//                     ToolTip = 'Specifies the value of the External Document No. field.';
//                 }
//                 field("No. Series"; Rec."No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the No. Series field.';
//                 }
//                 field("Tax Area Code"; Rec."Tax Area Code")
//                 {
//                     ToolTip = 'Specifies the value of the Tax Area Code field.';
//                 }
//                 field("Tax Liable"; Rec."Tax Liable")
//                 {
//                     ToolTip = 'Specifies the value of the Tax Liable field.';
//                 }
//                 field("Tax Group Code"; Rec."Tax Group Code")
//                 {
//                     ToolTip = 'Specifies the value of the Tax Group Code field.';
//                 }
//                 field("Use Tax"; Rec."Use Tax")
//                 {
//                     ToolTip = 'Specifies the value of the Use Tax field.';
//                 }
//                 field("Tax Jurisdiction Code"; Rec."Tax Jurisdiction Code")
//                 {
//                     ToolTip = 'Specifies the value of the Tax Jurisdiction Code field.';
//                 }
//                 field("Tax Group Used"; Rec."Tax Group Used")
//                 {
//                     ToolTip = 'Specifies the value of the Tax Group Used field.';
//                 }
//                 field("Tax Type"; Rec."Tax Type")
//                 {
//                     ToolTip = 'Specifies the value of the Tax Type field.';
//                 }
//                 field("Tax on Tax"; Rec."Tax on Tax")
//                 {
//                     ToolTip = 'Specifies the value of the Tax on Tax field.';
//                 }
//                 field("Sales Tax Connection No."; Rec."Sales Tax Connection No.")
//                 {
//                     ToolTip = 'Specifies the value of the Sales Tax Connection No. field.';
//                 }
//                 field("Unrealized VAT Entry No."; Rec."Unrealized VAT Entry No.")
//                 {
//                     ToolTip = 'Specifies the value of the Unrealized VAT Entry No. field.';
//                 }
//                 field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
//                 }
//                 field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
//                 {
//                     ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
//                 }
//                 field("Additional-Currency Amount"; Rec."Additional-Currency Amount")
//                 {
//                     ToolTip = 'Specifies the amount of the VAT entry. The amount is in the additional reporting currency.';
//                 }
//                 field("Additional-Currency Base"; Rec."Additional-Currency Base")
//                 {
//                     ToolTip = 'Specifies the amount that the VAT amount is calculated from if you post in an additional reporting currency.';
//                 }
//                 field("Add.-Currency Unrealized Amt."; Rec."Add.-Currency Unrealized Amt.")
//                 {
//                     ToolTip = 'Specifies the value of the Add.-Currency Unrealized Amt. field.';
//                 }
//                 field("Add.-Currency Unrealized Base"; Rec."Add.-Currency Unrealized Base")
//                 {
//                     ToolTip = 'Specifies the value of the Add.-Currency Unrealized Base field.';
//                 }
//                 field("VAT Base Discount %"; Rec."VAT Base Discount %")
//                 {
//                     ToolTip = 'Specifies the value of the VAT Base Discount % field.';
//                 }
//                 field("Add.-Curr. Rem. Unreal. Amount"; Rec."Add.-Curr. Rem. Unreal. Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Add.-Curr. Rem. Unreal. Amount field.';
//                 }
//                 field("Add.-Curr. Rem. Unreal. Base"; Rec."Add.-Curr. Rem. Unreal. Base")
//                 {
//                     ToolTip = 'Specifies the value of the Add.-Curr. Rem. Unreal. Base field.';
//                 }
//                 field("VAT Difference"; Rec."VAT Difference")
//                 {
//                     ToolTip = 'Specifies the difference between the calculated VAT amount and a VAT amount that you have entered manually.';
//                 }
//                 field("Add.-Curr. VAT Difference"; Rec."Add.-Curr. VAT Difference")
//                 {
//                     ToolTip = 'Specifies, in the additional reporting currency, the VAT difference that arises when you make a correction to a VAT amount on a sales or purchase document.';
//                 }
//                 field("Ship-to/Order Address Code"; Rec."Ship-to/Order Address Code")
//                 {
//                     ToolTip = 'Specifies the address code of the ship-to customer or order-from vendor that the entry is linked to.';
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     ToolTip = 'Specifies the date when the related document was created.';
//                 }
//                 field("VAT Registration No."; Rec."VAT Registration No.")
//                 {
//                     ToolTip = 'Specifies the VAT registration number of the customer or vendor that the entry is linked to.';
//                 }
//                 field(Reversed; Rec.Reversed)
//                 {
//                     ToolTip = 'Specifies if the entry has been part of a reverse transaction.';
//                 }
//                 field("Reversed by Entry No."; Rec."Reversed by Entry No.")
//                 {
//                     ToolTip = 'Specifies the number of the correcting entry. If the field Specifies a number, the entry cannot be reversed again.';
//                 }
//                 field("Reversed Entry No."; Rec."Reversed Entry No.")
//                 {
//                     ToolTip = 'Specifies the number of the original entry that was undone by the reverse transaction.';
//                 }
//                 field("EU Service"; Rec."EU Service")
//                 {
//                     ToolTip = 'Specifies if this VAT entry is to be reported as a service in the periodic VAT reports.';
//                 }
//                 field("Base Before Pmt. Disc."; Rec."Base Before Pmt. Disc.")
//                 {
//                     ToolTip = 'Specifies the value of the Base Before Pmt. Disc. field.';
//                 }
//                 field("Journal Templ. Name"; Rec."Journal Templ. Name")
//                 {
//                     ToolTip = 'Specifies the value of the Journal Template Name field.';
//                 }
//                 field("Journal Batch Name"; Rec."Journal Batch Name")
//                 {
//                     ToolTip = 'Specifies the value of the Journal Batch Name field.';
//                 }
//                 field("Realized Amount"; Rec."Realized Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Realized Amount field.';
//                 }
//                 field("Realized Base"; Rec."Realized Base")
//                 {
//                     ToolTip = 'Specifies the value of the Realized Base field.';
//                 }
//                 field("Add.-Curr. Realized Amount"; Rec."Add.-Curr. Realized Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Add.-Curr. Realized Amount field.';
//                 }
//                 field("Add.-Curr. Realized Base"; Rec."Add.-Curr. Realized Base")
//                 {
//                     ToolTip = 'Specifies the value of the Add.-Curr. Realized Base field.';
//                 }
//                 field("G/L Acc. No."; Rec."G/L Acc. No.")
//                 {
//                     ToolTip = 'Specifies the value of the G/L Account No. field.';
//                 }
//                 field("VAT Reporting Date"; Rec."VAT Reporting Date")
//                 {
//                     ToolTip = 'Specifies the VAT date on the VAT entry. This is either the date that the document was created or posted, depending on your setting on the General Ledger Setup page.';
//                 }
//                 field("Credit Base"; Rec."Credit Base")
//                 {
//                     ToolTip = 'Specifies the value of the Credit Base field.';
//                 }
//                 field("Original VAT Amount"; Rec."Original VAT Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Original VAT Amount field.';
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
//                 field("NWTH Document Date"; Rec."NWTH Document Date")
//                 {
//                     ToolTip = 'Specifies the value of the Document Date field.';
//                 }
//                 field("NWTH Branch Code"; Rec."NWTH Branch Code")
//                 {
//                     ToolTip = 'Specifies the value of the Branch Code field.';
//                 }
//                 field("NWTH Vendor Invoice No."; Rec."NWTH Vendor Invoice No.")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Invoice No. field.';
//                 }
//                 field("NWTH Company Branch Code"; Rec."NWTH Company Branch Code")
//                 {
//                     ToolTip = 'Specifies the value of the Company Branch Code field';
//                 }
//                 field("NWTH Vendor No."; Rec."NWTH Vendor No.")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor No. field.';
//                 }
//                 field("NWTH Vendor Name"; Rec."NWTH Vendor Name")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Name field.';
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
