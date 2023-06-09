// table 50103 "Sales Header API"
// {
//     Caption = 'Sales Header API';
//     DataCaptionFields = "No.", "Sell-to Customer Name";
//     LookupPageID = "Sales List";
//     Permissions = tabledata "Assemble-to-Order Link" = rmid,
//                   tabledata "Assembly Header" = m;

//     fields
//     {
//         field(1; "Document Type"; Enum "Sales Document Type")
//         {
//             Caption = 'Document Type';
//         }
//         field(2; "Sell-to Customer No."; Code[20])
//         {
//             Caption = 'Sell-to Customer No.';
//             TableRelation = Customer;
//         }
//         field(3; "No."; Code[20])
//         {
//             Caption = 'No.';

//         }
//         field(4; "Bill-to Customer No."; Code[20])
//         {
//             Caption = 'Bill-to Customer No.';
//             NotBlank = true;
//             TableRelation = Customer;
//         }
//         field(5; "Bill-to Name"; Text[100])
//         {
//             Caption = 'Bill-to Name';
//             TableRelation = Customer.Name;
//             ValidateTableRelation = false;

//         }
//         field(6; "Bill-to Name 2"; Text[50])
//         {
//             Caption = 'Bill-to Name 2';
//         }
//         field(7; "Bill-to Address"; Text[100])
//         {
//             Caption = 'Bill-to Address';
//         }
//         field(8; "Bill-to Address 2"; Text[50])
//         {
//             Caption = 'Bill-to Address 2';
//         }
//         field(9; "Bill-to City"; Text[30])
//         {
//             Caption = 'Bill-to City';
//             TableRelation = IF ("Bill-to Country/Region Code" = CONST('')) "Post Code".City
//             ELSE
//             IF ("Bill-to Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Bill-to Country/Region Code"));
//             //This property is currently not supported
//             //TestTableRelation = false;
//             ValidateTableRelation = false;

//         }
//         field(10; "Bill-to Contact"; Text[100])
//         {
//             Caption = 'Bill-to Contact';
//         }
//         field(11; "Your Reference"; Text[35])
//         {
//             Caption = 'Your Reference';
//         }
//         field(12; "Ship-to Code"; Code[10])
//         {
//             Caption = 'Ship-to Code';
//             TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("Sell-to Customer No."));
//         }
//         field(13; "Ship-to Name"; Text[100])
//         {
//             Caption = 'Ship-to Name';
//         }
//         field(14; "Ship-to Name 2"; Text[50])
//         {
//             Caption = 'Ship-to Name 2';
//         }
//         field(15; "Ship-to Address"; Text[100])
//         {
//             Caption = 'Ship-to Address';
//         }
//         field(16; "Ship-to Address 2"; Text[50])
//         {
//             Caption = 'Ship-to Address 2';
//         }
//         field(17; "Ship-to City"; Text[30])
//         {
//             Caption = 'Ship-to City';
//             TableRelation = IF ("Ship-to Country/Region Code" = CONST('')) "Post Code".City
//             ELSE
//             IF ("Ship-to Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Ship-to Country/Region Code"));
//             //This property is currently not supported
//             //TestTableRelation = false;
//             ValidateTableRelation = false;
//         }
//         field(18; "Ship-to Contact"; Text[100])
//         {
//             Caption = 'Ship-to Contact';
//         }
//         field(19; "Order Date"; Date)
//         {
//             AccessByPermission = TableData "Sales Shipment Header" = R;
//             Caption = 'Order Date';

//         }
//         field(20; "Posting Date"; Date)
//         {
//             Caption = 'Posting Date';
//         }
//         field(21; "Shipment Date"; Date)
//         {
//             Caption = 'Shipment Date';
//         }
//         field(22; "Posting Description"; Text[100])
//         {
//             Caption = 'Posting Description';
//         }
//         field(23; "Payment Terms Code"; Code[10])
//         {
//             Caption = 'Payment Terms Code';
//             TableRelation = "Payment Terms";
//         }
//         field(24; "Due Date"; Date)
//         {
//             Caption = 'Due Date';
//         }
//         field(25; "Payment Discount %"; Decimal)
//         {
//             Caption = 'Payment Discount %';
//             DecimalPlaces = 0 : 5;
//             MaxValue = 100;
//             MinValue = 0;

//         }
//         field(26; "Pmt. Discount Date"; Date)
//         {
//             Caption = 'Pmt. Discount Date';
//         }
//         field(27; "Shipment Method Code"; Code[10])
//         {
//             Caption = 'Shipment Method Code';
//             TableRelation = "Shipment Method";
//         }
//         field(28; "Location Code"; Code[10])
//         {
//             Caption = 'Location Code';
//             TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
//         }
//         field(29; "Shortcut Dimension 1 Code"; Code[20])
//         {
//             CaptionClass = '1,2,1';
//             Caption = 'Shortcut Dimension 1 Code';
//             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
//                                                           Blocked = CONST(false));
//         }
//         field(30; "Shortcut Dimension 2 Code"; Code[20])
//         {
//             CaptionClass = '1,2,2';
//             Caption = 'Shortcut Dimension 2 Code';
//             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
//                                                           Blocked = CONST(false));
//         }
//         field(31; "Customer Posting Group"; Code[20])
//         {
//             Caption = 'Customer Posting Group';
//             TableRelation = "Customer Posting Group";
//         }
//         field(32; "Currency Code"; Code[10])
//         {
//             Caption = 'Currency Code';
//             TableRelation = Currency;
//         }
//         field(33; "Currency Factor"; Decimal)
//         {
//             Caption = 'Currency Factor';
//             DecimalPlaces = 0 : 15;
//             Editable = false;
//             MinValue = 0;
//         }
//         field(34; "Customer Price Group"; Code[10])
//         {
//             Caption = 'Customer Price Group';
//             TableRelation = "Customer Price Group";
//         }
//         field(35; "Prices Including VAT"; Boolean)
//         {
//             Caption = 'Prices Including VAT';
//         }
//         field(37; "Invoice Disc. Code"; Code[20])
//         {
//             AccessByPermission = TableData "Cust. Invoice Disc." = R;
//             Caption = 'Invoice Disc. Code';

//         }
//         field(40; "Customer Disc. Group"; Code[20])
//         {
//             Caption = 'Customer Disc. Group';
//             TableRelation = "Customer Discount Group";
//         }
//         field(41; "Language Code"; Code[10])
//         {
//             Caption = 'Language Code';
//             TableRelation = Language;
//         }
//         field(43; "Salesperson Code"; Code[20])
//         {
//             Caption = 'Salesperson Code';
//             TableRelation = "Salesperson/Purchaser";
//         }
//         field(45; "Order Class"; Code[10])
//         {
//             Caption = 'Order Class';
//         }
//         field(46; Comment; Boolean)
//         {
//             Caption = 'Comment';
//         }
//         field(47; "No. Printed"; Integer)
//         {
//             Caption = 'No. Printed';
//             Editable = false;
//         }
//         field(51; "On Hold"; Code[3])
//         {
//             Caption = 'On Hold';
//         }
//         field(52; "Applies-to Doc. Type"; Enum "Gen. Journal Document Type")
//         {
//             Caption = 'Applies-to Doc. Type';
//         }
//         field(53; "Applies-to Doc. No."; Code[20])
//         {
//             Caption = 'Applies-to Doc. No.';
//         }
//         field(55; "Bal. Account No."; Code[20])
//         {
//             Caption = 'Bal. Account No.';
//         }
//         field(56; "Recalculate Invoice Disc."; Boolean)
//         {
//             Caption = 'Recalculate Invoice Disc.';
//         }
//         field(57; Ship; Boolean)
//         {
//             Caption = 'Ship';
//             Editable = false;
//         }
//         field(58; Invoice; Boolean)
//         {
//             Caption = 'Invoice';
//         }
//         field(59; "Print Posted Documents"; Boolean)
//         {
//             Caption = 'Print Posted Documents';
//         }
//         field(60; Amount; Decimal)
//         {
//             Caption = 'Amount';
//         }
//         field(61; "Amount Including VAT"; Decimal)
//         {
//             Caption = 'Amount Including VAT';
//         }
//         field(62; "Shipping No."; Code[20])
//         {
//             Caption = 'Shipping No.';
//         }
//         field(63; "Posting No."; Code[20])
//         {
//             Caption = 'Posting No.';
//         }
//         field(64; "Last Shipping No."; Code[20])
//         {
//             Caption = 'Last Shipping No.';
//             Editable = false;
//             TableRelation = "Sales Shipment Header";
//         }
//         field(65; "Last Posting No."; Code[20])
//         {
//             Caption = 'Last Posting No.';
//             Editable = false;
//             TableRelation = "Sales Invoice Header";
//         }
//         field(66; "Prepayment No."; Code[20])
//         {
//             Caption = 'Prepayment No.';
//         }
//         field(67; "Last Prepayment No."; Code[20])
//         {
//             Caption = 'Last Prepayment No.';
//             TableRelation = "Sales Invoice Header";
//         }
//         field(68; "Prepmt. Cr. Memo No."; Code[20])
//         {
//             Caption = 'Prepmt. Cr. Memo No.';
//         }
//         field(69; "Last Prepmt. Cr. Memo No."; Code[20])
//         {
//             Caption = 'Last Prepmt. Cr. Memo No.';
//             TableRelation = "Sales Cr.Memo Header";
//         }
//         field(70; "VAT Registration No."; Text[20])
//         {
//             Caption = 'VAT Registration No.';
//         }
//         field(71; "Combine Shipments"; Boolean)
//         {
//             Caption = 'Combine Shipments';
//         }
//         field(73; "Reason Code"; Code[10])
//         {
//             Caption = 'Reason Code';
//             TableRelation = "Reason Code";
//         }
//         field(74; "Gen. Bus. Posting Group"; Code[20])
//         {
//             Caption = 'Gen. Bus. Posting Group';
//             TableRelation = "Gen. Business Posting Group";
//         }
//         field(75; "EU 3-Party Trade"; Boolean)
//         {
//             Caption = 'EU 3-Party Trade';
//         }
//         field(76; "Transaction Type"; Code[10])
//         {
//             Caption = 'Transaction Type';
//             TableRelation = "Transaction Type";

//         }
//         field(77; "Transport Method"; Code[10])
//         {
//             Caption = 'Transport Method';
//             TableRelation = "Transport Method";
//         }
//         field(78; "VAT Country/Region Code"; Code[10])
//         {
//             Caption = 'VAT Country/Region Code';
//             TableRelation = "Country/Region";
//         }
//         field(79; "Sell-to Customer Name"; Text[100])
//         {
//             Caption = 'Sell-to Customer Name';
//             TableRelation = Customer.Name;
//             ValidateTableRelation = false;
//         }
//         field(80; "Sell-to Customer Name 2"; Text[50])
//         {
//             Caption = 'Sell-to Customer Name 2';
//         }
//         field(81; "Sell-to Address"; Text[100])
//         {
//             Caption = 'Sell-to Address';

//         }
//         field(82; "Sell-to Address 2"; Text[50])
//         {
//             Caption = 'Sell-to Address 2';

//         }
//         field(83; "Sell-to City"; Text[30])
//         {
//             Caption = 'Sell-to City';
//             TableRelation = IF ("Sell-to Country/Region Code" = CONST('')) "Post Code".City
//             ELSE
//             IF ("Sell-to Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Sell-to Country/Region Code"));
//             //This property is currently not supported
//             //TestTableRelation = false;
//             ValidateTableRelation = false;
//         }
//         field(84; "Sell-to Contact"; Text[100])
//         {
//             Caption = 'Sell-to Contact';
//         }
//         field(85; "Bill-to Post Code"; Code[20])
//         {
//             Caption = 'Bill-to Post Code';
//             TableRelation = "Post Code";
//             //This property is currently not supported
//             //TestTableRelation = false;
//             ValidateTableRelation = false;

//         }
//         field(86; "Bill-to County"; Text[30])
//         {
//             CaptionClass = '5,1,' + "Bill-to Country/Region Code";
//             Caption = 'Bill-to County';
//         }
//         field(87; "Bill-to Country/Region Code"; Code[10])
//         {
//             Caption = 'Bill-to Country/Region Code';
//             TableRelation = "Country/Region";
//         }
//         field(88; "Sell-to Post Code"; Code[20])
//         {
//             Caption = 'Sell-to Post Code';
//             TableRelation = IF ("Sell-to Country/Region Code" = CONST('')) "Post Code"
//             ELSE
//             IF ("Sell-to Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Sell-to Country/Region Code"));
//             //This property is currently not supported
//             //TestTableRelation = false;
//             ValidateTableRelation = false;

//         }
//         field(89; "Sell-to County"; Text[30])
//         {
//             CaptionClass = '5,1,' + "Sell-to Country/Region Code";
//             Caption = 'Sell-to County';
//         }
//         field(90; "Sell-to Country/Region Code"; Code[10])
//         {
//             Caption = 'Sell-to Country/Region Code';
//             TableRelation = "Country/Region";

//         }
//         field(91; "Ship-to Post Code"; Code[20])
//         {
//             Caption = 'Ship-to Post Code';
//             TableRelation = IF ("Ship-to Country/Region Code" = CONST('')) "Post Code"
//             ELSE
//             IF ("Ship-to Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Ship-to Country/Region Code"));
//             //This property is currently not supported
//             //TestTableRelation = false;
//             ValidateTableRelation = false;

//         }
//         field(92; "Ship-to County"; Text[30])
//         {
//             CaptionClass = '5,1,' + "Ship-to Country/Region Code";
//             Caption = 'Ship-to County';
//         }
//         field(93; "Ship-to Country/Region Code"; Code[10])
//         {
//             Caption = 'Ship-to Country/Region Code';
//             TableRelation = "Country/Region";
//         }
//         field(94; "Bal. Account Type"; enum "Payment Balance Account Type")
//         {
//             Caption = 'Bal. Account Type';
//         }
//         field(97; "Exit Point"; Code[10])
//         {
//             Caption = 'Exit Point';
//             TableRelation = "Entry/Exit Point";
//             ;
//         }
//         field(98; Correction; Boolean)
//         {
//             Caption = 'Correction';
//         }
//         field(99; "Document Date"; Date)
//         {
//             Caption = 'Document Date';

//         }
//         field(100; "External Document No."; Code[35])
//         {
//             Caption = 'External Document No.';

//         }
//         field(101; "Area"; Code[10])
//         {
//             Caption = 'Area';
//             TableRelation = Area;

//         }
//         field(102; "Transaction Specification"; Code[10])
//         {
//             Caption = 'Transaction Specification';
//             TableRelation = "Transaction Specification";

//         }
//         field(104; "Payment Method Code"; Code[10])
//         {
//             Caption = 'Payment Method Code';
//             TableRelation = "Payment Method";
//         }
//         field(105; "Shipping Agent Code"; Code[10])
//         {
//             AccessByPermission = TableData "Shipping Agent Services" = R;
//             Caption = 'Shipping Agent Code';
//             TableRelation = "Shipping Agent";

//         }
//         field(106; "Package Tracking No."; Text[30])
//         {
//             Caption = 'Package Tracking No.';
//         }
//         field(107; "No. Series"; Code[20])
//         {
//             Caption = 'No. Series';
//             Editable = false;
//             TableRelation = "No. Series";
//         }
//         field(108; "Posting No. Series"; Code[20])
//         {
//             Caption = 'Posting No. Series';
//             TableRelation = "No. Series";

//         }
//         field(109; "Shipping No. Series"; Code[20])
//         {
//             Caption = 'Shipping No. Series';
//             TableRelation = "No. Series";

//         }
//         field(114; "Tax Area Code"; Code[20])
//         {
//             Caption = 'Tax Area Code';
//             TableRelation = "Tax Area";
//             ValidateTableRelation = false;

//         }
//         field(115; "Tax Liable"; Boolean)
//         {
//             Caption = 'Tax Liable';

//         }
//         field(116; "VAT Bus. Posting Group"; Code[20])
//         {
//             Caption = 'VAT Bus. Posting Group';
//             TableRelation = "VAT Business Posting Group";

//         }
//         field(117; Reserve; Enum "Reserve Method")
//         {
//             AccessByPermission = TableData Item = R;
//             Caption = 'Reserve';
//             InitValue = Optional;
//         }
//         field(118; "Applies-to ID"; Code[50])
//         {
//             Caption = 'Applies-to ID';
//         }
//         field(119; "VAT Base Discount %"; Decimal)
//         {
//             Caption = 'VAT Base Discount %';
//             DecimalPlaces = 0 : 5;
//             MaxValue = 100;
//             MinValue = 0;
//         }
//         field(120; Status; Enum "Sales Document Status")
//         {
//             Caption = 'Status';
//             Editable = false;
//         }
//         field(121; "Invoice Discount Calculation"; Option)
//         {
//             Caption = 'Invoice Discount Calculation';
//             Editable = false;
//             OptionCaption = 'None,%,Amount';
//             OptionMembers = "None","%",Amount;
//         }
//         field(122; "Invoice Discount Value"; Decimal)
//         {
//             AutoFormatType = 1;
//             Caption = 'Invoice Discount Value';
//             Editable = false;
//         }
//         field(123; "Send IC Document"; Boolean)
//         {
//             Caption = 'Send IC Document';
//         }
//         field(124; "IC Status"; Enum "Sales Document IC Status")
//         {
//             Caption = 'IC Status';
//         }
//         field(125; "Sell-to IC Partner Code"; Code[20])
//         {
//             Caption = 'Sell-to IC Partner Code';
//             Editable = false;
//             TableRelation = "IC Partner";
//         }
//         field(126; "Bill-to IC Partner Code"; Code[20])
//         {
//             Caption = 'Bill-to IC Partner Code';
//             Editable = false;
//             TableRelation = "IC Partner";
//         }
//         field(129; "IC Direction"; Enum "IC Direction Type")
//         {
//             Caption = 'IC Direction';

//             trigger OnValidate()
//             begin
//                 if "IC Direction" = "IC Direction"::Incoming then
//                     "Send IC Document" := false;
//             end;
//         }
//         field(130; "Prepayment %"; Decimal)
//         {
//             Caption = 'Prepayment %';
//             DecimalPlaces = 0 : 5;
//             MaxValue = 100;
//             MinValue = 0;
//         }
//         field(131; "Prepayment No. Series"; Code[20])
//         {
//             Caption = 'Prepayment No. Series';
//             TableRelation = "No. Series";
//         }
//         field(132; "Compress Prepayment"; Boolean)
//         {
//             Caption = 'Compress Prepayment';
//             InitValue = true;
//         }
//         field(133; "Prepayment Due Date"; Date)
//         {
//             Caption = 'Prepayment Due Date';
//         }
//         field(134; "Prepmt. Cr. Memo No. Series"; Code[20])
//         {
//             Caption = 'Prepmt. Cr. Memo No. Series';
//             TableRelation = "No. Series";

//         }
//         field(135; "Prepmt. Posting Description"; Text[100])
//         {
//             Caption = 'Prepmt. Posting Description';
//         }
//         field(138; "Prepmt. Pmt. Discount Date"; Date)
//         {
//             Caption = 'Prepmt. Pmt. Discount Date';
//         }
//         field(139; "Prepmt. Payment Terms Code"; Code[10])
//         {
//             Caption = 'Prepmt. Payment Terms Code';
//             TableRelation = "Payment Terms";

//         }
//         field(140; "Prepmt. Payment Discount %"; Decimal)
//         {
//             Caption = 'Prepmt. Payment Discount %';
//             DecimalPlaces = 0 : 5;
//             MaxValue = 100;
//             MinValue = 0;

//         }
//         field(151; "Quote No."; Code[20])
//         {
//             Caption = 'Quote No.';
//             Editable = false;
//         }
//         field(152; "Quote Valid Until Date"; Date)
//         {
//             Caption = 'Quote Valid To Date';
//         }
//         field(153; "Quote Sent to Customer"; DateTime)
//         {
//             Caption = 'Quote Sent to Customer';
//             Editable = false;
//         }
//         field(154; "Quote Accepted"; Boolean)
//         {
//             Caption = 'Quote Accepted';

//         }
//         field(155; "Quote Accepted Date"; Date)
//         {
//             Caption = 'Quote Accepted Date';
//             Editable = false;
//         }
//         field(160; "Job Queue Status"; Option)
//         {
//             Caption = 'Job Queue Status';
//             Editable = false;
//             OptionCaption = ' ,Scheduled for Posting,Error,Posting';
//             OptionMembers = " ","Scheduled for Posting",Error,Posting;

//             trigger OnLookup()
//             var
//                 JobQueueEntry: Record "Job Queue Entry";
//             begin
//                 if "Job Queue Status" = "Job Queue Status"::" " then
//                     exit;
//                 JobQueueEntry.ShowStatusMsg("Job Queue Entry ID");
//             end;
//         }
//         field(161; "Job Queue Entry ID"; Guid)
//         {
//             Caption = 'Job Queue Entry ID';
//             Editable = false;
//         }
//         field(163; "Company Bank Account Code"; Code[20])
//         {
//             Caption = 'Company Bank Account Code';
//             TableRelation = "Bank Account" where("Currency Code" = FIELD("Currency Code"));
//         }
//         field(165; "Incoming Document Entry No."; Integer)
//         {
//             Caption = 'Incoming Document Entry No.';
//             TableRelation = "Incoming Document";

//         }
//         field(166; "Last Email Sent Time"; DateTime)
//         {
//             Caption = 'Last Email Sent Time';
//         }
//         field(167; "Last Email Sent Status"; Text[80])
//         {
//             Caption = 'Last Email Sent Status';
//         }
//         field(168; "Sent as Email"; Boolean)
//         {
//             Caption = 'Sent as Email';
// #if CLEAN21
//             ObsoleteState = Removed;
//             ObsoleteTag = '24.0';
// #else
//             ObsoleteState = Pending;
//             ObsoleteTag = '21.0';
// #endif
//         }
//         field(169; "Last Email Notif Cleared"; Boolean)
//         {
//             Caption = 'Last Email Notif Cleared';
// #if CLEAN21
//             ObsoleteState = Removed;
//             ObsoleteTag = '24.0';
// #else
//             ObsoleteState = Pending;
//             ObsoleteTag = '21.0';
// #endif
//         }
//         field(170; IsTest; Boolean)
//         {
//             Caption = 'IsTest';
//             Editable = false;
//         }
//         field(171; "Sell-to Phone No."; Text[30])
//         {
//             Caption = 'Sell-to Phone No.';
//             ExtendedDatatype = PhoneNo;

//         }
//         field(172; "Sell-to E-Mail"; Text[80])
//         {
//             Caption = 'Email';
//             ExtendedDatatype = EMail;

//             trigger OnValidate()
//             var
//                 MailManagement: Codeunit "Mail Management";
//             begin
//                 if "Sell-to E-Mail" = '' then
//                     exit;
//                 MailManagement.CheckValidEmailAddresses("Sell-to E-Mail");
//             end;
//         }
//         field(175; "Payment Instructions Id"; Integer)
//         {
//             Caption = 'Payment Instructions Id';
//             TableRelation = "O365 Payment Instructions";
//             ObsoleteReason = 'Microsoft Invoicing is not supported in Business Central';
//             ObsoleteState = Removed;
//             ObsoleteTag = '21.0';
//         }
//         field(178; "Journal Templ. Name"; Code[10])
//         {
//             Caption = 'Journal Template Name';
//             TableRelation = "Gen. Journal Template" WHERE(Type = FILTER(Sales));
//         }
//         field(179; "VAT Reporting Date"; Date)
//         {
//             Caption = 'VAT Date';
//             Editable = false;
//         }
//         field(200; "Work Description"; BLOB)
//         {
//             Caption = 'Work Description';
//         }
//         field(300; "Amt. Ship. Not Inv. (LCY)"; Decimal)
//         {
//             Caption = 'Amount Shipped Not Invoiced (LCY) Incl. VAT';
//         }
//         field(301; "Amt. Ship. Not Inv. (LCY) Base"; Decimal)
//         {
//             Caption = 'Amount Shipped Not Invoiced (LCY)';
//         }
//         field(480; "Dimension Set ID"; Integer)
//         {
//             Caption = 'Dimension Set ID';
//             Editable = false;
//             TableRelation = "Dimension Set Entry";
//         }
//         field(600; "Payment Service Set ID"; Integer)
//         {
//             Caption = 'Payment Service Set ID';
//         }
//         field(720; "Coupled to CRM"; Boolean)
//         {
//             Caption = 'Coupled to Dynamics 365 Sales';
//             Editable = false;
//         }
//         field(1200; "Direct Debit Mandate ID"; Code[35])
//         {
//             Caption = 'Direct Debit Mandate ID';
//             TableRelation = "SEPA Direct Debit Mandate" WHERE("Customer No." = FIELD("Bill-to Customer No."),
//                                                                Closed = CONST(false),
//                                                                Blocked = CONST(false));
//         }
//         field(1305; "Invoice Discount Amount"; Decimal)
//         {
//             Caption = 'Invoice Discount Amount';
//         }
//         field(5043; "No. of Archived Versions"; Integer)
//         {
//             Caption = 'No. of Archived Versions';
//         }
//         field(5048; "Doc. No. Occurrence"; Integer)
//         {
//             Caption = 'Doc. No. Occurrence';
//         }
//         field(5050; "Campaign No."; Code[20])
//         {
//             Caption = 'Campaign No.';
//             TableRelation = Campaign;
//         }
//         field(5051; "Sell-to Customer Template Code"; Code[10])
//         {
//             Caption = 'Sell-to Customer Template Code';
//             ObsoleteReason = 'Will be removed with other functionality related to "old" templates. Replaced by "Sell-to Customer Templ. Code".';
//             ObsoleteState = Removed;
//             ObsoleteTag = '21.0';
//         }
//         field(5052; "Sell-to Contact No."; Code[20])
//         {
//             Caption = 'Sell-to Contact No.';
//             TableRelation = Contact;
//         }
//         field(5053; "Bill-to Contact No."; Code[20])
//         {
//             Caption = 'Bill-to Contact No.';
//             TableRelation = Contact;

//         }
//         field(5054; "Bill-to Customer Template Code"; Code[10])
//         {
//             Caption = 'Bill-to Customer Template Code';
//             ObsoleteReason = 'Will be removed with other functionality related to "old" templates. Replaced by "Bill-to Customer Templ. Code".';
//             ObsoleteState = Removed;
//             ObsoleteTag = '21.0';
//         }
//         field(5055; "Opportunity No."; Code[20])
//         {
//             Caption = 'Opportunity No.';
//         }
//         field(5056; "Sell-to Customer Templ. Code"; Code[20])
//         {
//             Caption = 'Sell-to Customer Template Code';
//             TableRelation = "Customer Templ.";
//         }
//         field(5057; "Bill-to Customer Templ. Code"; Code[20])
//         {
//             Caption = 'Bill-to Customer Template Code';
//             TableRelation = "Customer Templ.";

//         }
//         field(5700; "Responsibility Center"; Code[10])
//         {
//             Caption = 'Responsibility Center';
//             TableRelation = "Responsibility Center";
//         }
//         field(50101; "Shipping Advice"; Decimal)
//         {
//             Caption = 'Shipping Advice';
//         }
//         field(5751; "Shipped Not Invoiced"; Boolean)
//         {
//             Caption = 'Shipped Not Invoiced';
//         }
//         field(5752; "Completely Shipped"; Boolean)
//         {
//             Caption = 'Completely Shipped';
//         }
//         field(5753; "Posting from Whse. Ref."; Integer)
//         {
//             AccessByPermission = TableData Location = R;
//             Caption = 'Posting from Whse. Ref.';
//         }
//         field(5754; "Location Filter"; Code[10])
//         {
//             Caption = 'Location Filter';
//             FieldClass = FlowFilter;
//             TableRelation = Location;
//         }
//         field(5755; Shipped; Boolean)
//         {
//             Caption = 'Shipped';
//         }
//         field(5756; "Last Shipment Date"; Date)
//         {
//             CalcFormula = Lookup("Sales Shipment Header"."Shipment Date" WHERE("No." = FIELD("Last Shipping No.")));
//             Caption = 'Last Shipment Date';
//             FieldClass = FlowField;
//         }
//         field(5790; "Requested Delivery Date"; Date)
//         {
//             Caption = 'Requested Delivery Date';

//         }
//         field(5791; "Promised Delivery Date"; Date)
//         {
//             AccessByPermission = TableData "Order Promising Line" = R;
//             Caption = 'Promised Delivery Date';
//         }
//         field(5792; "Shipping Time"; DateFormula)
//         {
//             AccessByPermission = TableData "Sales Shipment Header" = R;
//             Caption = 'Shipping Time';
//         }
//         field(5793; "Outbound Whse. Handling Time"; DateFormula)
//         {
//             AccessByPermission = TableData "Warehouse Shipment Header" = R;
//             Caption = 'Outbound Whse. Handling Time';
//         }
//         field(5794; "Shipping Agent Service Code"; Code[10])
//         {
//             Caption = 'Shipping Agent Service Code';
//             TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));

//         }
//         field(5795; "Late Order Shipping"; Boolean)
//         {
//             Caption = 'Late Order Shipping';
//         }
//         field(5796; "Date Filter"; Date)
//         {
//             Caption = 'Date Filter';
//             FieldClass = FlowFilter;
//         }
//         field(5800; Receive; Boolean)
//         {
//             Caption = 'Receive';
//         }
//         field(5801; "Return Receipt No."; Code[20])
//         {
//             Caption = 'Return Receipt No.';
//         }
//         field(5802; "Return Receipt No. Series"; Code[20])
//         {
//             Caption = 'Return Receipt No. Series';
//             TableRelation = "No. Series";
//         }
//         field(5803; "Last Return Receipt No."; Code[20])
//         {
//             Caption = 'Last Return Receipt No.';
//             Editable = false;
//             TableRelation = "Return Receipt Header";
//         }
//         field(5100; "Price Calculation Method"; Decimal)
//         {
//             Caption = 'Price Calculation Method';
//         }
//         field(7001; "Allow Line Disc."; Boolean)
//         {
//             Caption = 'Allow Line Disc.';
//         }
//         field(7200; "Get Shipment Used"; Boolean)
//         {
//             Caption = 'Get Shipment Used';
//             Editable = false;
//         }
//         field(8000; Id; Guid)
//         {
//             Caption = 'Id';
//             ObsoleteState = Pending;
//             ObsoleteReason = 'This functionality will be replaced by the systemID field';
//             ObsoleteTag = '15.0';
//         }
//         field(9000; "Assigned User ID"; Code[50])
//         {
//             Caption = 'Assigned User ID';
//             DataClassification = EndUserIdentifiableInformation;
//             TableRelation = "User Setup";
//         }
//         field(9001; "Upload Attachment"; Media)
//         {
//             Caption = 'Upload Attachment';
//         }
//         field(9002; "Transfer Status"; Media)
//         {
//             Caption = 'Transfer Status';
//         }
//         field(9003; TransferStatus; Text[100])
//         {
//             Caption = 'Transfer Status';
//         }
//     }

//     keys
//     {
//         key(Key1; "Document Type", "No.")
//         {
//             Clustered = true;
//         }
//         key(Key2; "No.", "Document Type")
//         {
//         }
//         key(Key3; "Document Type", "Sell-to Customer No.")
//         {
//         }
//         key(Key4; "Document Type", "Bill-to Customer No.")
//         {
//         }
//         key(Key5; "Document Type", "Combine Shipments", "Bill-to Customer No.", "Currency Code", "EU 3-Party Trade", "Dimension Set ID", "Journal Templ. Name")
//         {
//         }
//         key(Key6; "Sell-to Customer No.", "External Document No.")
//         {
//         }
//         key(Key7; "Document Type", "Sell-to Contact No.")
//         {
//         }
//         key(Key8; "Bill-to Contact No.")
//         {
//         }
//         key(Key9; "Incoming Document Entry No.")
//         {
//         }
//         key(Key10; "Document Date")
//         {
//         }
//         key(Key11; "Shipment Date", Status, "Location Code", "Responsibility Center")
//         {
//         }
//         key(Key12; "Salesperson Code")
//         {
//         }
//         key(Key13; SystemModifiedAt)
//         {
//         }
//     }

//     fieldgroups
//     {
//         fieldgroup(DropDown; "No.", "Sell-to Customer Name", Amount, "Sell-to Contact", "Amount Including VAT")
//         {
//         }
//         fieldgroup(Brick; "No.", "Sell-to Customer Name", Amount, "Sell-to Contact", "Amount Including VAT")
//         {
//         }
//     }

//     // trigger OnInsert()
//     // var
//     //     TableSalesHeaderApi: Record "Sales Header API";
//     //     TableSalesHeaderCheck: Record "Sales Header";
//     // begin
//     //     // TableSalesHeaderApi.SetRange("No.", Rec."No.");
//     //     Message('XXX');
//     // end;
// }
