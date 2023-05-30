// page 40009791 "Vendor List"
// {
//     ApplicationArea = All;
//     Caption = 'Vendor List';
//     PageType = List;
//     SourceTable = Vendor;
    
//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("No."; Rec."No.")
//                 {
//                     ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
//                 }
//                 field(Name; Rec.Name)
//                 {
//                     ToolTip = 'Specifies the vendor''s name. You can enter a maximum of 30 characters, both numbers and letters.';
//                 }
//                 field("Search Name"; Rec."Search Name")
//                 {
//                     ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
//                 }
//                 field("Name 2"; Rec."Name 2")
//                 {
//                     ToolTip = 'Specifies an additional part of the name.';
//                 }
//                 field(Address; Rec.Address)
//                 {
//                     ToolTip = 'Specifies the vendor''s address.';
//                 }
//                 field("Address 2"; Rec."Address 2")
//                 {
//                     ToolTip = 'Specifies additional address information.';
//                 }
//                 field(City; Rec.City)
//                 {
//                     ToolTip = 'Specifies the vendor''s city.';
//                 }
//                 field(Contact; Rec.Contact)
//                 {
//                     ToolTip = 'Specifies the name of the person you regularly contact when you do business with this vendor.';
//                 }
//                 field("Phone No."; Rec."Phone No.")
//                 {
//                     ToolTip = 'Specifies the vendor''s telephone number.';
//                 }
//                 field("Telex No."; Rec."Telex No.")
//                 {
//                     ToolTip = 'Specifies the value of the Telex No. field.';
//                 }
//                 field("Our Account No."; Rec."Our Account No.")
//                 {
//                     ToolTip = 'Specifies your account number with the vendor, if you have one.';
//                 }
//                 field("Territory Code"; Rec."Territory Code")
//                 {
//                     ToolTip = 'Specifies the value of the Territory Code field.';
//                 }
//                 field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
//                 {
//                     ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
//                 }
//                 field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
//                 {
//                     ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
//                 }
//                 field("Budgeted Amount"; Rec."Budgeted Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Budgeted Amount field.';
//                 }
//                 field("Vendor Posting Group"; Rec."Vendor Posting Group")
//                 {
//                     ToolTip = 'Specifies the vendor''s market type to link business transactions made for the vendor with the appropriate account in the general ledger.';
//                 }
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     ToolTip = 'Specifies the currency code that is inserted by default when you create purchase documents or journal lines for the vendor.';
//                 }
//                 field("Language Code"; Rec."Language Code")
//                 {
//                     ToolTip = 'Specifies the language that is used when translating specified text on documents to foreign business partner, such as an item description on an order confirmation.';
//                 }
//                 field("Statistics Group"; Rec."Statistics Group")
//                 {
//                     ToolTip = 'Specifies the value of the Statistics Group field.';
//                 }
//                 field("Payment Terms Code"; Rec."Payment Terms Code")
//                 {
//                     ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
//                 }
//                 field("Fin. Charge Terms Code"; Rec."Fin. Charge Terms Code")
//                 {
//                     ToolTip = 'Specifies the code for the involved finance charges in case of late payment.';
//                 }
//                 field("Purchaser Code"; Rec."Purchaser Code")
//                 {
//                     ToolTip = 'Specifies which purchaser is assigned to the vendor.';
//                 }
//                 field("Shipment Method Code"; Rec."Shipment Method Code")
//                 {
//                     ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
//                 }
//                 field("Shipping Agent Code"; Rec."Shipping Agent Code")
//                 {
//                     ToolTip = 'Specifies the value of the Shipping Agent Code field.';
//                 }
//                 field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
//                 {
//                     ToolTip = 'Specifies the vendor''s invoice discount code. When you set up a new vendor card, the number you have entered in the No. field is automatically inserted.';
//                 }
//                 field("Country/Region Code"; Rec."Country/Region Code")
//                 {
//                     ToolTip = 'Specifies the country/region of the address.';
//                 }
//                 field(Comment; Rec.Comment)
//                 {
//                     ToolTip = 'Specifies the value of the Comment field.';
//                 }
//                 field(Blocked; Rec.Blocked)
//                 {
//                     ToolTip = 'Specifies which transactions with the vendor that cannot be processed, for example a vendor that is declared insolvent.';
//                 }
//                 field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
//                 {
//                     ToolTip = 'Specifies the number of a different vendor whom you pay for products delivered by the vendor on the vendor card.';
//                 }
//                 field(Priority; Rec.Priority)
//                 {
//                     ToolTip = 'Specifies the importance of the vendor when suggesting payments using the Suggest Vendor Payments function.';
//                 }
//                 field("Payment Method Code"; Rec."Payment Method Code")
//                 {
//                     ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
//                 }
//                 field("Last Modified Date Time"; Rec."Last Modified Date Time")
//                 {
//                     ToolTip = 'Specifies the value of the Last Modified Date Time field.';
//                 }
//                 field("Last Date Modified"; Rec."Last Date Modified")
//                 {
//                     ToolTip = 'Specifies when the vendor card was last modified.';
//                 }
//                 field(Balance; Rec.Balance)
//                 {
//                     ToolTip = 'Specifies the value of the Balance field.';
//                 }
//                 field("Balance (LCY)"; Rec."Balance (LCY)")
//                 {
//                     ToolTip = 'Specifies the total value of your completed purchases from the vendor in the current fiscal year. It is calculated from amounts excluding VAT on all completed purchase invoices and credit memos.';
//                 }
//                 field("Net Change"; Rec."Net Change")
//                 {
//                     ToolTip = 'Specifies the value of the Net Change field.';
//                 }
//                 field("Net Change (LCY)"; Rec."Net Change (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Net Change (LCY) field.';
//                 }
//                 field("Purchases (LCY)"; Rec."Purchases (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Purchases (LCY) field.';
//                 }
//                 field("Inv. Discounts (LCY)"; Rec."Inv. Discounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Inv. Discounts (LCY) field.';
//                 }
//                 field("Pmt. Discounts (LCY)"; Rec."Pmt. Discounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Pmt. Discounts (LCY) field.';
//                 }
//                 field("Balance Due"; Rec."Balance Due")
//                 {
//                     ToolTip = 'Specifies the value of the Balance Due field.';
//                 }
//                 field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
//                 {
//                     ToolTip = 'Specifies the total value of your unpaid purchases from the vendor in the current fiscal year. It is calculated from amounts excluding VAT on all open purchase invoices and credit memos.';
//                 }
//                 field(Payments; Rec.Payments)
//                 {
//                     ToolTip = 'Specifies the value of the Payments field.';
//                 }
//                 field("Invoice Amounts"; Rec."Invoice Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Invoice Amounts field.';
//                 }
//                 field("Cr. Memo Amounts"; Rec."Cr. Memo Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Cr. Memo Amounts field.';
//                 }
//                 field("Finance Charge Memo Amounts"; Rec."Finance Charge Memo Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Finance Charge Memo Amounts field.';
//                 }
//                 field("Payments (LCY)"; Rec."Payments (LCY)")
//                 {
//                     ToolTip = 'Specifies the sum of payments paid to the vendor.';
//                 }
//                 field("Inv. Amounts (LCY)"; Rec."Inv. Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Inv. Amounts (LCY) field.';
//                 }
//                 field("Cr. Memo Amounts (LCY)"; Rec."Cr. Memo Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Cr. Memo Amounts (LCY) field.';
//                 }
//                 field("Fin. Charge Memo Amounts (LCY)"; Rec."Fin. Charge Memo Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Fin. Charge Memo Amounts (LCY) field.';
//                 }
//                 field("Outstanding Orders"; Rec."Outstanding Orders")
//                 {
//                     ToolTip = 'Specifies the value of the Outstanding Orders field.';
//                 }
//                 field("Amt. Rcd. Not Invoiced"; Rec."Amt. Rcd. Not Invoiced")
//                 {
//                     ToolTip = 'Specifies the value of the Amt. Rcd. Not Invoiced field.';
//                 }
//                 field("Application Method"; Rec."Application Method")
//                 {
//                     ToolTip = 'Specifies how to apply payments to entries for this vendor.';
//                 }
//                 field("Prices Including VAT"; Rec."Prices Including VAT")
//                 {
//                     ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
//                 }
//                 field("Fax No."; Rec."Fax No.")
//                 {
//                     ToolTip = 'Specifies the vendor''s fax number.';
//                 }
//                 field("Telex Answer Back"; Rec."Telex Answer Back")
//                 {
//                     ToolTip = 'Specifies the value of the Telex Answer Back field.';
//                 }
//                 field("VAT Registration No."; Rec."VAT Registration No.")
//                 {
//                     ToolTip = 'Specifies the vendor''s VAT registration number.';
//                 }
//                 field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
//                 }
//                 field(GLN; Rec.GLN)
//                 {
//                     ToolTip = 'Specifies the vendor in connection with electronic document receiving.';
//                 }
//                 field("Post Code"; Rec."Post Code")
//                 {
//                     ToolTip = 'Specifies the postal code.';
//                 }
//                 field(County; Rec.County)
//                 {
//                     ToolTip = 'Specifies the state, province or county as a part of the address.';
//                 }
//                 field("EORI Number"; Rec."EORI Number")
//                 {
//                     ToolTip = 'Specifies the Economic Operators Registration and Identification number that is used when you exchange information with the customs authorities due to trade into or out of the European Union.';
//                 }
//                 field("Debit Amount"; Rec."Debit Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Debit Amount field.';
//                 }
//                 field("Credit Amount"; Rec."Credit Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Credit Amount field.';
//                 }
//                 field("Debit Amount (LCY)"; Rec."Debit Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Debit Amount (LCY) field.';
//                 }
//                 field("Credit Amount (LCY)"; Rec."Credit Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Credit Amount (LCY) field.';
//                 }
//                 field("E-Mail"; Rec."E-Mail")
//                 {
//                     ToolTip = 'Specifies the vendor''s email address.';
//                 }
//                 field("Home Page"; Rec."Home Page")
//                 {
//                     ToolTip = 'Specifies the vendor''s web site.';
//                 }
//                 field("Reminder Amounts"; Rec."Reminder Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Reminder Amounts field.';
//                 }
//                 field("Reminder Amounts (LCY)"; Rec."Reminder Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Reminder Amounts (LCY) field.';
//                 }
//                 field("No. Series"; Rec."No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the No. Series field.';
//                 }
//                 field("Tax Area Code"; Rec."Tax Area Code")
//                 {
//                     ToolTip = 'Specifies a tax area code for the company.';
//                 }
//                 field("Tax Liable"; Rec."Tax Liable")
//                 {
//                     ToolTip = 'Specifies if the customer is liable for sales tax.';
//                 }
//                 field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
//                 }
//                 field("Outstanding Orders (LCY)"; Rec."Outstanding Orders (LCY)")
//                 {
//                     ToolTip = 'Specifies the sum of outstanding orders (in LCY) to this vendor.';
//                 }
//                 field("Amt. Rcd. Not Invoiced (LCY)"; Rec."Amt. Rcd. Not Invoiced (LCY)")
//                 {
//                     ToolTip = 'Specifies the total invoice amount (in LCY) for the items you have received but not yet been invoiced for.';
//                 }
//                 field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
//                 {
//                     ToolTip = 'Specifies if the vendor allows payment tolerance.';
//                 }
//                 field("Pmt. Disc. Tolerance (LCY)"; Rec."Pmt. Disc. Tolerance (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Pmt. Disc. Tolerance (LCY) field.';
//                 }
//                 field("Pmt. Tolerance (LCY)"; Rec."Pmt. Tolerance (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Pmt. Tolerance (LCY) field.';
//                 }
//                 field("IC Partner Code"; Rec."IC Partner Code")
//                 {
//                     ToolTip = 'Specifies the vendor''s IC partner code, if the vendor is one of your intercompany partners.';
//                 }
//                 field(Refunds; Rec.Refunds)
//                 {
//                     ToolTip = 'Specifies the value of the Refunds field.';
//                 }
//                 field("Refunds (LCY)"; Rec."Refunds (LCY)")
//                 {
//                     ToolTip = 'Specifies the sum of refunds paid to the vendor.';
//                 }
//                 field("Other Amounts"; Rec."Other Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Other Amounts field.';
//                 }
//                 field("Other Amounts (LCY)"; Rec."Other Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Other Amounts (LCY) field.';
//                 }
//                 field("Prepayment %"; Rec."Prepayment %")
//                 {
//                     ToolTip = 'Specifies a prepayment percentage that applies to all orders for this vendor, regardless of the items or services on the order lines.';
//                 }
//                 field("Outstanding Invoices"; Rec."Outstanding Invoices")
//                 {
//                     ToolTip = 'Specifies the value of the Outstanding Invoices field.';
//                 }
//                 field("Outstanding Invoices (LCY)"; Rec."Outstanding Invoices (LCY)")
//                 {
//                     ToolTip = 'Specifies the sum of the vendor''s outstanding purchase invoices in LCY.';
//                 }
//                 field("Pay-to No. Of Archived Doc."; Rec."Pay-to No. Of Archived Doc.")
//                 {
//                     ToolTip = 'Specifies the value of the Pay-to No. Of Archived Doc. field.';
//                 }
//                 field("Buy-from No. Of Archived Doc."; Rec."Buy-from No. Of Archived Doc.")
//                 {
//                     ToolTip = 'Specifies the value of the Buy-from No. Of Archived Doc. field.';
//                 }
//                 field("Partner Type"; Rec."Partner Type")
//                 {
//                     ToolTip = 'Specifies if the vendor is a person or a company.';
//                 }
//                 field("Intrastat Partner Type"; Rec."Intrastat Partner Type")
//                 {
//                     ToolTip = 'Specifies for Intrastat reporting if the vendor is a person or a company.';
//                 }
//                 field(Image; Rec.Image)
//                 {
//                     ToolTip = 'Specifies the picture of the vendor, for example, a logo.';
//                 }
//                 field("Privacy Blocked"; Rec."Privacy Blocked")
//                 {
//                     ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
//                 }
//                 field("Disable Search by Name"; Rec."Disable Search by Name")
//                 {
//                     ToolTip = 'Specifies that you can change the vendor name on open purchase documents. The change applies only to the documents.';
//                 }
//                 field("Creditor No."; Rec."Creditor No.")
//                 {
//                     ToolTip = 'Specifies the number of the vendor.';
//                 }
//                 field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
//                 {
//                     ToolTip = 'Specifies the vendor bank account that will be used by default on payment journal lines for export to a payment bank file.';
//                 }
//                 field("Coupled to CRM"; Rec."Coupled to CRM")
//                 {
//                     ToolTip = 'Specifies that the vendor is coupled to an account in Dataverse.';
//                 }
//                 field("Cash Flow Payment Terms Code"; Rec."Cash Flow Payment Terms Code")
//                 {
//                     ToolTip = 'Specifies a payment term that will be used for calculating cash flow.';
//                 }
//                 field("Primary Contact No."; Rec."Primary Contact No.")
//                 {
//                     ToolTip = 'Specifies the primary contact number for the vendor.';
//                 }
//                 field("Mobile Phone No."; Rec."Mobile Phone No.")
//                 {
//                     ToolTip = 'Specifies the vendor''s mobile telephone number.';
//                 }
//                 field("Responsibility Center"; Rec."Responsibility Center")
//                 {
//                     ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
//                 }
//                 field("Location Code"; Rec."Location Code")
//                 {
//                     ToolTip = 'Specifies the warehouse location where items from the vendor must be received by default.';
//                 }
//                 field("Lead Time Calculation"; Rec."Lead Time Calculation")
//                 {
//                     ToolTip = 'Specifies a date formula for the amount of time it takes to replenish the item.';
//                 }
//                 field("Price Calculation Method"; Rec."Price Calculation Method")
//                 {
//                     ToolTip = 'Specifies the default price calculation method.';
//                 }
//                 field("No. of Pstd. Receipts"; Rec."No. of Pstd. Receipts")
//                 {
//                     ToolTip = 'Specifies the number of posted purchase receipts that exist for the vendor.';
//                 }
//                 field("No. of Pstd. Invoices"; Rec."No. of Pstd. Invoices")
//                 {
//                     ToolTip = 'Specifies the number of posted purchase invoices that exist for the vendor.';
//                 }
//                 field("No. of Pstd. Return Shipments"; Rec."No. of Pstd. Return Shipments")
//                 {
//                     ToolTip = 'Specifies the number of posted return shipments that exist for the vendor.';
//                 }
//                 field("No. of Pstd. Credit Memos"; Rec."No. of Pstd. Credit Memos")
//                 {
//                     ToolTip = 'Specifies the number of posted purchase credit memos that exist for the vendor.';
//                 }
//                 field("Pay-to No. of Orders"; Rec."Pay-to No. of Orders")
//                 {
//                     ToolTip = 'Specifies the number of posted orders that exist for the vendor.';
//                 }
//                 field("Pay-to No. of Invoices"; Rec."Pay-to No. of Invoices")
//                 {
//                     ToolTip = 'Specifies the amount that relates to invoices.';
//                 }
//                 field("Pay-to No. of Return Orders"; Rec."Pay-to No. of Return Orders")
//                 {
//                     ToolTip = 'Specifies how many return orders have been registered for the customer when the customer acts as the pay-to customer.';
//                 }
//                 field("Pay-to No. of Credit Memos"; Rec."Pay-to No. of Credit Memos")
//                 {
//                     ToolTip = 'Specifies the amount that relates to credit memos.';
//                 }
//                 field("Pay-to No. of Pstd. Receipts"; Rec."Pay-to No. of Pstd. Receipts")
//                 {
//                     ToolTip = 'Specifies the number of posted receipts that exist for the vendor.';
//                 }
//                 field("Pay-to No. of Pstd. Invoices"; Rec."Pay-to No. of Pstd. Invoices")
//                 {
//                     ToolTip = 'Specifies the amount that relates to posted invoices.';
//                 }
//                 field("Pay-to No. of Pstd. Return S."; Rec."Pay-to No. of Pstd. Return S.")
//                 {
//                     ToolTip = 'Specifies the number of posted return shipments that exist for the vendor.';
//                 }
//                 field("Pay-to No. of Pstd. Cr. Memos"; Rec."Pay-to No. of Pstd. Cr. Memos")
//                 {
//                     ToolTip = 'Specifies the amount that relates to credit memos.';
//                 }
//                 field("No. of Quotes"; Rec."No. of Quotes")
//                 {
//                     ToolTip = 'Specifies the number of purchase quotes that exist for the vendor.';
//                 }
//                 field("No. of Blanket Orders"; Rec."No. of Blanket Orders")
//                 {
//                     ToolTip = 'Specifies the number of purchase blanket orders that exist for the vendor.';
//                 }
//                 field("No. of Orders"; Rec."No. of Orders")
//                 {
//                     ToolTip = 'Specifies the number of purchase orders that exist for the vendor.';
//                 }
//                 field("No. of Invoices"; Rec."No. of Invoices")
//                 {
//                     ToolTip = 'Specifies the number of unposted purchase invoices that exist for the vendor.';
//                 }
//                 field("No. of Return Orders"; Rec."No. of Return Orders")
//                 {
//                     ToolTip = 'Specifies the number of purchase return orders that exist for the vendor.';
//                 }
//                 field("No. of Credit Memos"; Rec."No. of Credit Memos")
//                 {
//                     ToolTip = 'Specifies the number of unposted purchase credit memos that exist for the vendor.';
//                 }
//                 field("No. of Order Addresses"; Rec."No. of Order Addresses")
//                 {
//                     ToolTip = 'Specifies the value of the No. of Order Addresses field.';
//                 }
//                 field("Pay-to No. of Quotes"; Rec."Pay-to No. of Quotes")
//                 {
//                     ToolTip = 'Specifies the number of quotes that exist for the vendor.';
//                 }
//                 field("Pay-to No. of Blanket Orders"; Rec."Pay-to No. of Blanket Orders")
//                 {
//                     ToolTip = 'Specifies the number of blanket orders.';
//                 }
//                 field("No. of Incoming Documents"; Rec."No. of Incoming Documents")
//                 {
//                     ToolTip = 'Specifies incoming documents, such as vendor invoices in PDF or as image files, that you can manually or automatically convert to document records, such as purchase invoices. The external files that represent incoming documents can be attached at any process stage, including to posted documents and to the resulting vendor, customer, and general ledger entries.';
//                 }
//                 field("Base Calendar Code"; Rec."Base Calendar Code")
//                 {
//                     ToolTip = 'Specifies a customizable calendar for delivery planning that holds the vendor''s working days and holidays.';
//                 }
//                 field("Document Sending Profile"; Rec."Document Sending Profile")
//                 {
//                     ToolTip = 'Specifies the preferred method of sending documents to this vendor, so that you do not have to select a sending option every time that you post and send a document to the vendor. Documents to this vendor will be sent using the specified sending profile and will override the default document sending profile.';
//                 }
//                 field("Validate EU Vat Reg. No."; Rec."Validate EU Vat Reg. No.")
//                 {
//                     ToolTip = 'Specifies the value of the Validate EU VAT Reg. No. field.';
//                 }
//                 field(Id; Rec.Id)
//                 {
//                     ToolTip = 'Specifies the value of the Id field.';
//                 }
//                 field("Currency Id"; Rec."Currency Id")
//                 {
//                     ToolTip = 'Specifies the value of the Currency Id field.';
//                 }
//                 field("Payment Terms Id"; Rec."Payment Terms Id")
//                 {
//                     ToolTip = 'Specifies the value of the Payment Terms Id field.';
//                 }
//                 field("Payment Method Id"; Rec."Payment Method Id")
//                 {
//                     ToolTip = 'Specifies the value of the Payment Method Id field.';
//                 }
//                 field("Over-Receipt Code"; Rec."Over-Receipt Code")
//                 {
//                     ToolTip = 'Specifies the policy that will be used for the vendor if more items than ordered are received.';
//                 }
//                 field("Vendor Chain Code"; Rec."Vendor Chain Code")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Chain Code field.';
//                 }
//                 field("Personal ID"; Rec."Personal ID")
//                 {
//                     ToolTip = 'Specifies the value of the Personal ID field.';
//                 }
//                 field("Vendor Chain Name"; Rec."Vendor Chain Name")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Chain Name field.';
//                 }
//                 field("NWTH Branch Code"; Rec."NWTH Branch Code")
//                 {
//                     ToolTip = 'Specifies the value of the Branch Code field';
//                 }
//                 field("NWTH WHT Bus. Posting Group"; Rec."NWTH WHT Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the value of the WHT Bus. Posting Group field';
//                 }
//                 field("NWTH Building Name"; Rec."NWTH Building Name")
//                 {
//                     ToolTip = 'Specifies the value of the Building Name field';
//                 }
//                 field("NWTH Village Name"; Rec."NWTH Village Name")
//                 {
//                     ToolTip = 'Specifies the value of the Village Name field';
//                 }
//                 field("NWTH Room No."; Rec."NWTH Room No.")
//                 {
//                     ToolTip = 'Specifies the value of the Room No. field';
//                 }
//                 field("NWTH Floor No."; Rec."NWTH Floor No.")
//                 {
//                     ToolTip = 'Specifies the value of the Floor No. field';
//                 }
//                 field("NWTH Address No."; Rec."NWTH Address No.")
//                 {
//                     ToolTip = 'Specifies the value of the Address No. field';
//                 }
//                 field("NWTH Village No."; Rec."NWTH Village No.")
//                 {
//                     ToolTip = 'Specifies the value of the Village No. field';
//                 }
//                 field("NWTH Alley"; Rec."NWTH Alley")
//                 {
//                     ToolTip = 'Specifies the value of the Alley field';
//                 }
//                 field("NWTH Road"; Rec."NWTH Road")
//                 {
//                     ToolTip = 'Specifies the value of the Road field';
//                 }
//                 field("NWTH Sub-District"; Rec."NWTH Sub-District")
//                 {
//                     ToolTip = 'Specifies the value of the Sub-District field';
//                 }
//                 field("NWTH District"; Rec."NWTH District")
//                 {
//                     ToolTip = 'Specifies the value of the District field';
//                 }
//                 field("NWTH WHT Name"; Rec."NWTH WHT Name")
//                 {
//                     ToolTip = 'Specifies the value of the WHT Name field';
//                 }
//                 field("NWTH WHT Surname"; Rec."NWTH WHT Surname")
//                 {
//                     ToolTip = 'Specifies the value of the WHT Surname field';
//                 }
//                 field("NWTH Name Title"; Rec."NWTH Name Title")
//                 {
//                     ToolTip = 'Specifies the value of the Name Title field';
//                 }
//                 field("NWTH Petty Cash"; Rec."NWTH Petty Cash")
//                 {
//                     ToolTip = 'Specifies the value of the Petty Cash field';
//                 }
//                 field("NWTH Province"; Rec."NWTH Province")
//                 {
//                     ToolTip = 'Specifies the value of the Province field';
//                 }
//                 field("NWTH Address Text 1"; Rec."NWTH Address Text 1")
//                 {
//                     ToolTip = 'Specifies the value of the Address Text 1 field';
//                 }
//                 field("NWTH Address Text 2"; Rec."NWTH Address Text 2")
//                 {
//                     ToolTip = 'Specifies the value of the Address Text 2 field';
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
