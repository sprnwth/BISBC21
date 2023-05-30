// table 50104 CustomerApi
// {
//     Caption = 'Customer API';
//     DataCaptionFields = "No.", Name;
//     LookupPageID = "Customer Lookup";
//     fields
//     {
//         field(1; "No."; Code[20])
//         {
//             Caption = 'No.';
//         }
//         field(2; Name; Text[100])
//         {
//             Caption = 'Name';
//         }
//         field(3; "Search Name"; Code[100])
//         {
//             Caption = 'Search Name';
//         }
//         field(4; "Name 2"; Text[50])
//         {
//             Caption = 'Name 2';
//         } 
//         {
//             Caption = 'Address';
//         }
//         field(6; "Address 2"; Text[50])
//         {
//             Caption = 'Address 2';
//         }
//         field(7; City; Text[30])
//         {
//             Caption = 'City';
//         }
//         field(8; Contact; Text[100])
//         {
//             Caption = 'Contact';
//         }
//         field(9; "Phone No."; Text[30])
//         {
//             Caption = 'Phone No.';
//         }
//         field(10; "Telex No."; Text[20])
//         {
//             Caption = 'Telex No.';
//         }
//         field(11; "Document Sending Profile"; Code[20])
//         {
//             Caption = 'Document Sending Profile';
//         }
//         field(12; "Ship-to Code"; Code[10])
//         {
//             Caption = 'Ship-to Code';
//         }
//         field(14; "Our Account No."; Text[20])
//         {
//             Caption = 'Our Account No.';
//         }
//         field(15; "Territory Code"; Code[10])
//         {
//             Caption = 'Territory Code';
//         }
//         field(16; "Global Dimension 1 Code"; Code[20])
//         {
//             Caption = 'Global Dimension 1 Code';
//         }
//         field(17; "Global Dimension 2 Code"; Code[20])
//         {
//             Caption = 'Global Dimension 2 Code';
//         }
//         field(18; "Chain Name"; Code[10])
//         {
//             Caption = 'Chain Name';
//         }
//         field(19; "Budgeted Amount"; Decimal)
//         {
//             Caption = 'Budgeted Amount';
//         }
//         field(20; "Credit Limit (LCY)"; Decimal)
//         {
//             Caption = 'Credit Limit (LCY)';
//         }
//         field(21; "Customer Posting Group"; Code[20])
//         {
//             Caption = 'Customer Posting Group';
//         }
//         field(22; "Currency Code"; Code[10])
//         {
//             Caption = 'Currency Code';
//         }
//         field(23; "Customer Price Group"; Code[10])
//         {
//             Caption = 'Customer Price Group';
//         }
//         field(24; "Language Code"; Code[10])
//         {
//             Caption = 'Language Code';
//         }
//         field(26; "Statistics Group"; Integer)
//         {
//             Caption = 'Statistics Group';
//         }
//         field(27; "Payment Terms Code"; Code[10])
//         {
//             Caption = 'Payment Terms Code';
//         }
//         field(28; "Fin. Charge Terms Code"; Code[10])
//         {
//             Caption = 'Fin. Charge Terms Code';
//         }
//         field(29; "Salesperson Code"; Code[20])
//         {
//             Caption = 'Salesperson Code';
//         }
//         field(30; "Shipment Method Code"; Code[10])
//         {
//             Caption = 'Shipment Method Code';
//         }
//         field(31; "Shipping Agent Code"; Code[10])
//         {
//             Caption = 'Shipping Agent Code';
//         }
//         field(32; "Place of Export"; Code[20])
//         {
//             Caption = 'Place of Export';
//         }
//         field(33; "Invoice Disc. Code"; Code[20])
//         {
//             Caption = 'Invoice Disc. Code';
//         }
//         field(34; "Customer Disc. Group"; Code[20])
//         {
//             Caption = 'Customer Disc. Group';
//         }
//         field(35; "Country/Region Code"; Code[10])
//         {
//             Caption = 'Country/Region Code';
//         }
//         field(36; "Collection Method"; Code[20])
//         {
//             Caption = 'Collection Method';
//         }
//         field(37; Amount; Decimal)
//         {
//             Caption = 'Amount';
//         }
//         field(38; Comment; Boolean)
//         {
//             Caption = 'Comment';
//         }
//         field(39; Blocked; Enum "Customer Blocked")
//         {
//             Caption = 'Blocked';
//         }
//         field(40; "Invoice Copies"; Integer)
//         {
//             Caption = 'Invoice Copies';
//         }
//         field(41; "Last Statement No."; Integer)
//         {
//             Caption = 'Last Statement No.';
//         }
//         field(42; "Print Statements"; Boolean)
//         {
//             Caption = 'Print Statements';
//         }
//         field(45; "Bill-to Customer No."; Code[20])
//         {
//             Caption = 'Bill-to Customer No.';
//         }
//         field(46; Priority; Integer)
//         {
//             Caption = 'Priority';
//         }
//         field(47; "Payment Method Code"; Code[10])
//         {
//             Caption = 'Payment Method Code';
//         }
//         field(53; "Last Modified Date Time"; DateTime)
//         {
//             Caption = 'Last Modified Date Time';
//         }
//         field(54; "Last Date Modified"; Date)
//         {
//             Caption = 'Last Date Modified';
//         }
//         field(55; "Date Filter"; Date)
//         {
//             Caption = 'Date Filter';
//         }
//         field(56; "Global Dimension 1 Filter"; Code[20])
//         {
//             Caption = 'Global Dimension 1 Filter';
//         }
//         field(57; "Global Dimension 2 Filter"; Code[20])
//         {
//             Caption = 'Global Dimension 2 Filter';
//         }
//         field(58; Balance; Decimal)
//         {
//             Caption = 'Balance';
//         }
//         field(59; "Balance (LCY)"; Decimal)
//         {
//             Caption = 'Balance (LCY)';
//         }
//         field(60; "Net Change"; Decimal)
//         {
//             Caption = 'Net Change';
//         }
//         field(61; "Net Change (LCY)"; Decimal)
//         {
//             Caption = 'Net Change (LCY)';
//         }
//         field(62; "Sales (LCY)"; Decimal)
//         {
//             Caption = 'Sales (LCY)';
//         }
//         field(63; "Profit (LCY)"; Decimal)
//         {
//             Caption = 'Profit (LCY)';
//         }
//         field(64; "Inv. Discounts (LCY)"; Decimal)
//         {
//             Caption = 'Inv. Discounts (LCY)';
//         }
//         field(65; "Pmt. Discounts (LCY)"; Decimal)
//         {
//             Caption = 'Pmt. Discounts (LCY)';
//         }
//         field(66; "Balance Due"; Decimal)
//         {
//             Caption = 'Balance Due';
//         }
//         field(67; "Balance Due (LCY)"; Decimal)
//         {
//             Caption = 'Balance Due (LCY)';
//         }
//         field(69; Payments; Decimal)
//         {
//             Caption = 'Payments';
//         }
//         field(70; "Invoice Amounts"; Decimal)
//         {
//             Caption = 'Invoice Amounts';
//         }
//         field(71; "Cr. Memo Amounts"; Decimal)
//         {
//             Caption = 'Cr. Memo Amounts';
//         }
//         field(72; "Finance Charge Memo Amounts"; Decimal)
//         {
//             Caption = 'Finance Charge Memo Amounts';
//         }
//         field(74; "Payments (LCY)"; Decimal)
//         {
//             Caption = 'Payments (LCY)';
//         }
//         field(75; "Inv. Amounts (LCY)"; Decimal)
//         {
//             Caption = 'Inv. Amounts (LCY)';
//         }
//         field(76; "Cr. Memo Amounts (LCY)"; Decimal)
//         {
//             Caption = 'Cr. Memo Amounts (LCY)';
//         }
//         field(77; "Fin. Charge Memo Amounts (LCY)"; Decimal)
//         {
//             Caption = 'Fin. Charge Memo Amounts (LCY)';
//         }
//         field(78; "Outstanding Orders"; Decimal)
//         {
//             Caption = 'Outstanding Orders';
//         }
//         field(79; "Shipped Not Invoiced"; Decimal)
//         {
//             Caption = 'Shipped Not Invoiced';
//         }
//         field(80; "Application Method"; Enum "Application Method")
//         {
//             Caption = 'Application Method';
//         }
//         field(82; "Prices Including VAT"; Boolean)
//         {
//             Caption = 'Prices Including VAT';
//         }
//         field(83; "Location Code"; Code[10])
//         {
//             Caption = 'Location Code';
//         }
//         field(84; "Fax No."; Text[30])
//         {
//             Caption = 'Fax No.';
//         }
//         field(85; "Telex Answer Back"; Text[20])
//         {
//             Caption = 'Telex Answer Back';
//         }
//         field(86; "VAT Registration No."; Text[20])
//         {
//             Caption = 'VAT Registration No.';
//         }
//         field(87; "Combine Shipments"; Boolean)
//         {
//             Caption = 'Combine Shipments';
//         }
//         field(88; "Gen. Bus. Posting Group"; Code[20])
//         {
//             Caption = 'Gen. Bus. Posting Group';
//         }
//         field(89; Picture; BLOB)
//         {
//             Caption = 'Picture';
//             // ObsoleteReason = 'Replaced by Image field';
//             // ObsoleteState = Removed;
//             SubType = Bitmap;
//             // ObsoleteTag = '19.0';
//         }
//         field(90; GLN; Code[13])
//         {
//             Caption = 'GLN';
//         }
//         field(91; "Post Code"; Code[20])
//         {
//             Caption = 'Post Code';
//         }
//         field(92; County; Text[30])
//         {
//             Caption = 'County';
//         }
//         field(93; "EORI Number"; Text[40])
//         {
//             Caption = 'EORI Number';
//         }
//         field(95; "Use GLN in Electronic Document"; Boolean)
//         {
//             Caption = 'Use GLN in Electronic Documents';
//         }
//         field(97; "Debit Amount"; Decimal)
//         {
//             Caption = 'Debit Amount';
//         }
//         field(98; "Credit Amount"; Decimal)
//         {
//             Caption = 'Credit Amount';
//         }
//         field(99; "Debit Amount (LCY)"; Decimal)
//         {
//             Caption = 'Debit Amount (LCY)';
//         }
//         field(100; "Credit Amount (LCY)"; Decimal)
//         {
//             Caption = 'Credit Amount (LCY)';
//         }
//         field(102; "E-Mail"; Text[80])
//         {
//             Caption = 'Email';
//         }
//         field(103; "Home Page"; Text[80])
//         {
//             Caption = 'Home Page';
//         }
//         field(104; "Reminder Terms Code"; Code[10])
//         {
//             Caption = 'Reminder Terms Code';
//         }
//         field(105; "Reminder Amounts"; Decimal)
//         {
//             Caption = 'Reminder Amounts';
//         }
//         field(106; "Reminder Amounts (LCY)"; Decimal)
//         {
//             Caption = 'Reminder Amounts (LCY)';
//         }
//         field(107; "No. Series"; Code[20])
//         {
//             Caption = 'No. Series';
//         }
//         field(108; "Tax Area Code"; Code[20])
//         {
//             Caption = 'Tax Area Code';
//         }
//         field(109; "Tax Liable"; Boolean)
//         {
//             Caption = 'Tax Liable';
//         }
//         field(110; "VAT Bus. Posting Group"; Code[20])
//         {
//             Caption = 'VAT Bus. Posting Group';
//         }
//         field(111; "Currency Filter"; Code[10])
//         {
//             Caption = 'Currency Filter';
//         }
//         field(113; "Outstanding Orders (LCY)"; Decimal)
//         {
//             Caption = 'Outstanding Orders (LCY)';
//         }
//         field(114; "Shipped Not Invoiced (LCY)"; Decimal)
//         {
//             Caption = 'Shipped Not Invoiced (LCY)';
//         }
//         field(115; Reserve; Enum "Reserve Method")
//         {
//             Caption = 'Reserve';
//         }
//         field(116; "Block Payment Tolerance"; Boolean)
//         {
//             Caption = 'Block Payment Tolerance';
//         }
//         field(117; "Pmt. Disc. Tolerance (LCY)"; Decimal)
//         {
//             Caption = 'Pmt. Disc. Tolerance (LCY)';
//         }
//         field(118; "Pmt. Tolerance (LCY)"; Decimal)
//         {
//             Caption = 'Pmt. Tolerance (LCY)';
//         }
//         field(119; "IC Partner Code"; Code[20])
//         {
//             Caption = 'IC Partner Code';
//         }
//         field(120; Refunds; Decimal)
//         {
//             Caption = 'Refunds';
//         }
//         field(121; "Refunds (LCY)"; Decimal)
//         {
//             Caption = 'Refunds (LCY)';
//         }
//         field(122; "Other Amounts"; Decimal)
//         {
//             Caption = 'Other Amounts';
//         }
//         field(123; "Other Amounts (LCY)"; Decimal)
//         {
//             Caption = 'Other Amounts (LCY)';
//         }
//         field(124; "Prepayment %"; Decimal)
//         {
//             Caption = 'Prepayment %';
//         }
//         field(125; "Outstanding Invoices (LCY)"; Decimal)
//         {
//             Caption = 'Outstanding Invoices (LCY)';
//         }
//         field(126; "Outstanding Invoices"; Decimal)
//         {
//             Caption = 'Outstanding Invoices';
//         }
//         field(130; "Bill-to No. Of Archived Doc."; Integer)
//         {
//             Caption = 'Bill-to No. Of Archived Doc.';
//         }
//         field(131; "Sell-to No. Of Archived Doc."; Integer)
//         {
//             Caption = 'Sell-to No. Of Archived Doc.';
//         }
//         field(132; "Partner Type"; Enum "Partner Type")
//         {
//             Caption = 'Partner Type';
//         }
//         field(133; "Intrastat Partner Type"; Enum "Partner Type")
//         {
//             Caption = 'Intrastat Partner Type';
//         }
//         field(140; Image; Media)
//         {
//             Caption = 'Image';
//         }
//         field(150; "Privacy Blocked"; Boolean)
//         {
//             Caption = 'Privacy Blocked';
//         }
//         field(160; "Disable Search by Name"; Boolean)
//         {
//             Caption = 'Disable Search by Name';
//         }
//         field(288; "Preferred Bank Account Code"; Code[20])
//         {
//             Caption = 'Preferred Bank Account Code';
//         }
//         field(720; "Coupled to CRM"; Boolean)
//         {
//             Caption = 'Coupled to Dataverse';
//         }
//         field(840; "Cash Flow Payment Terms Code"; Code[10])
//         {
//             Caption = 'Cash Flow Payment Terms Code';
//         }
//         field(5049; "Primary Contact No."; Code[20])
//         {
//             Caption = 'Primary Contact No.';
//         }
//         field(5050; "Contact Type"; Enum "Contact Type")
//         {
//             Caption = 'Contact Type';
//         }
//         field(5061; "Mobile Phone No."; Text[30])
//         {
//             Caption = 'Mobile Phone No.';
//         }
//         field(5700; "Responsibility Center"; Code[10])
//         {
//             Caption = 'Responsibility Center';
//         }
//         field(5750; "Shipping Advice"; Enum "Sales Header Shipping Advice")
//         {
//             Caption = 'Shipping Advice';
//         }
//         field(5790; "Shipping Time"; DateFormula)
//         {
//             Caption = 'Shipping Time';
//         }
//         field(5792; "Shipping Agent Service Code"; Code[10])
//         {
//             Caption = 'Shipping Agent Service Code';
//         }
//         field(5900; "Service Zone Code"; Code[10])
//         {
//             Caption = 'Service Zone Code';
//         }
//         field(5902; "Contract Gain/Loss Amount"; Decimal)
//         {
//             Caption = 'Contract Gain/Loss Amount';
//         }
//         field(5903; "Ship-to Filter"; Code[10])
//         {
//             Caption = 'Ship-to Filter';
//         }
//         field(5910; "Outstanding Serv. Orders (LCY)"; Decimal)
//         {
//             Caption = 'Outstanding Serv. Orders (LCY)';
//         }
//         field(5911; "Serv Shipped Not Invoiced(LCY)"; Decimal)
//         {
//             Caption = 'Serv Shipped Not Invoiced(LCY)';
//         }
//         field(5912; "Outstanding Serv.Invoices(LCY)"; Decimal)
//         {
//             Caption = 'Outstanding Serv.Invoices(LCY)';
//         }
//         field(7000; "Price Calculation Method"; Enum "Price Calculation Method")
//         {
//             Caption = 'Price Calculation Method';
//         }
//         field(7001; "Allow Line Disc."; Boolean)
//         {
//             Caption = 'Allow Line Disc.';
//         }
//         field(7171; "No. of Quotes"; Integer)
//         {
//             Caption = 'No. of Quotes';
//         }
//         field(7172; "No. of Blanket Orders"; Integer)
//         {
//             Caption = 'No. of Blanket Orders';
//         }
//         field(7173; "No. of Orders"; Integer)
//         {
//             Caption = 'No. of Orders';
//         }
//         field(7174; "No. of Invoices"; Integer)
//         {
//             Caption = 'No. of Invoices';
//         }
//         field(7175; "No. of Return Orders"; Integer)
//         {
//             Caption = 'No. of Return Orders';
//         }
//         field(7176; "No. of Credit Memos"; Integer)
//         {
//             Caption = 'No. of Credit Memos';
//         }
//         field(7177; "No. of Pstd. Shipments"; Integer)
//         {
//             Caption = 'No. of Pstd. Shipments';
//         }
//         field(7178; "No. of Pstd. Invoices"; Integer)
//         {
//             Caption = 'No. of Pstd. Invoices';
//         }
//         field(7179; "No. of Pstd. Return Receipts"; Integer)
//         {
//             Caption = 'No. of Pstd. Return Receipts';
//         }
//         field(7180; "No. of Pstd. Credit Memos"; Integer)
//         {
//             Caption = 'No. of Pstd. Credit Memos';
//         }
//         field(7181; "No. of Ship-to Addresses"; Integer)
//         {
//             Caption = 'No. of Ship-to Addresses';
//         }
//         field(7182; "Bill-To No. of Quotes"; Integer)
//         {
//             Caption = 'Bill-To No. of Quotes';
//         }
//         field(7183; "Bill-To No. of Blanket Orders"; Integer)
//         {
//             Caption = 'Bill-To No. of Blanket Orders';
//         }
//         field(7184; "Bill-To No. of Orders"; Integer)
//         {
//             Caption = 'Bill-To No. of Orders';
//         }
//         field(7185; "Bill-To No. of Invoices"; Integer)
//         {
//             Caption = 'Bill-To No. of Invoices';
//         }
//         field(7186; "Bill-To No. of Return Orders"; Integer)
//         {
//             Caption = 'Bill-To No. of Return Orders';
//         }
//         field(7187; "Bill-To No. of Credit Memos"; Integer)
//         {
//             Caption = 'Bill-To No. of Credit Memos';
//         }
//         field(7188; "Bill-To No. of Pstd. Shipments"; Integer)
//         {
//             Caption = 'Bill-To No. of Pstd. Shipments';
//         }
//         field(7189; "Bill-To No. of Pstd. Invoices"; Integer)
//         {
//             Caption = 'Bill-To No. of Pstd. Invoices';
//         }
//         field(7190; "Bill-To No. of Pstd. Return R."; Integer)
//         {
//             Caption = 'Bill-To No. of Pstd. Return R.';
//         }
//         field(7191; "Bill-To No. of Pstd. Cr. Memos"; Integer)
//         {
//             Caption = 'Bill-To No. of Pstd. Cr. Memos';
//         }
//         field(7600; "Base Calendar Code"; Code[10])
//         {
//             Caption = 'Base Calendar Code';
//         }
//         field(7601; "Copy Sell-to Addr. to Qte From"; Enum "Contact Type")
//         {
//             Caption = 'Copy Sell-to Addr. to Qte From';
//         }
//         field(7602; "Validate EU Vat Reg. No."; Boolean)
//         {
//             Caption = 'Validate EU VAT Reg. No.';
//         }
//         field(8000; Id; Guid)
//         {
//             Caption = 'Id';
//         }
//         field(8001; "Currency Id"; Guid)
//         {
//             Caption = 'Currency Id';
//         }
//         field(8002; "Payment Terms Id"; Guid)
//         {
//             Caption = 'Payment Terms Id';
//         }
//         field(8003; "Shipment Method Id"; Guid)
//         {
//             Caption = 'Shipment Method Id';
//         }
//         field(8004; "Payment Method Id"; Guid)
//         {
//             Caption = 'Payment Method Id';
//         }
//         field(9003; "Tax Area ID"; Guid)
//         {
//             Caption = 'Tax Area ID';
//         }
//         field(9004; "Tax Area Display Name"; Text[100])
//         {
//             Caption = 'Tax Area Display Name';
//         }
//         field(9005; "Contact ID"; Guid)
//         {
//             Caption = 'Contact ID';
//         }
//         field(9006; "Contact Graph Id"; Text[250])
//         {
//             Caption = 'Contact Graph Id';
//         }
//         field(9007; "Image Upload"; Blob)
//         {
//             Caption = 'Contact Graph Id';
//         }
//     }

//     keys
//     {
//         key(Key1; "No.")
//         {
//             Clustered = true;
//         }
//     }

//     var
//         sdf: Record Customer;
// }
