table 50006 "Customer Registration"
{
    DataClassification = ToBeClassified;
    Caption = 'Customer Registration';

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No.';
            TableRelation = Customer;
            NotBlank = true;
        }

        field(3; "For Company"; text[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Company;
            Caption = 'For Company';
        }
        field(4; "Registration Type"; Enum "Product Registration Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Registration Type';
        }

        field(6; "Initial"; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'คำนำหน้า';
            TableRelation = Salutation;
        }
        field(7; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'ชื่อ';
        }
        field(8; "Last Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'นามสกุล';
        }
        field(9; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'วันเดือนปีเกิด';
        }
        field(10; "Personal ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'เลขที่บัตรประชาชน';
        }
        field(11; "Moo"; Code[3])
        {
            DataClassification = ToBeClassified;
            Caption = 'หมู่';
        }
        field(12; "Soi"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'ซอย';
        }
        field(13; "Street"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'ถนน';
        }
        field(14; Thumbon; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'ตำบล';
        }
        field(15; "Amphur"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'อำเภอ';
        }
        field(16; "Province"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'จังหวัด';
        }
        field(17; "Post Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'รหัสไปรษณีย์';
        }
        field(18; "Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone No.';
        }
        field(19; "Email"; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'Email';
        }
        field(20; "Company Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'ชื่อบริษัท';
        }
        field(21; "VAT Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'VAT Registration No.';
        }
        field(22; Branch; Code[5])
        {
            DataClassification = ToBeClassified;
            Caption = 'สาขา';
        }
        field(23; "Open Time"; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'เวลาเปิดทำการ';
        }
        field(24; "Receiving Time"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'เวลารับสินค้า';
        }
        field(25; "Shipping Address 1"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipping Address 1';
        }
        field(26; "Shipping Address 2"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipping Address 2';
        }
        field(27; "Ship and Billing"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'ส่งสินค้าพร้อมวางบิล';
        }
        field(28; "Billing Date"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Billing Date';
        }
        field(29; "Billing Time"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Billing Time';
        }
        field(30; "Cash"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'เงินสด';
        }
        field(31; "Check"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'เช็ค';
        }
        field(32; "Check Date"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'วันที่รับเช็ค';
        }
        field(33; "Check Time"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'เวลารับเช็ค';
        }
        field(34; "Bank Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Name';
        }
        field(35; "Bank Branch"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Branch';
        }
        field(36; "Bank Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Account No.';
        }
        field(37; "Item Group Type"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'กลุ่มปศุสัตว์';
            TableRelation = ItemgroupType;
        }
        field(38; "Live Stock OTH"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'กลุ่มปศุสัตว์อื่นๆ';
        }
        field(39; "Customer Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'ประเภทธุรกิจ';
            TableRelation = customerType;
        }
        field(40; "Est. Consuming"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'ประมาณการใช้สินค้าต่อเดือน';
        }
        field(41; "Credit Term"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Credit Term';
            TableRelation = "Payment Terms";
        }
        field(42; "Credit Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Credit Limit';
        }
        field(43; "Address No."; Text[10])
        {
            DataClassification = ToBeClassified;
            caption = 'เลขที่ตั้ง';
        }
        field(44; "Floor No."; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'ชั้น';
        }
        field(45; "Village Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'หมู่บ้าน';
        }
        field(46; lattitude; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(47; longtitude; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(48; genbus; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group";
        }
        field(49; custPostingGroup; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group";
        }
        field(50; vatbus; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";
        }
        field(51; "Transfer"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'โอนเงิน';
        }
        field(52; "Ship and Billing Every"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'วางบิลทุกวัน';
        }
        field(53; "No Ship and Billing"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'ไม่มีการวางบิล';
        }



        //ประเภท
        field(54; "Customer Business Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = customerbusinessType;
            Caption = 'ประเภทธุรกิจลูกค้า';
        }


        field(50164; "Breeding Amt"; Integer)
        {
            DataClassification = ToBeClassified;
            caption = 'จำนวนแม่พันธ์สุกร';
        }

        field(50165; "Pig Amnt"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'จำนวนสุกร';
        }



        field(50167; "Broiler Amnt"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'จำนวนไก่เนื้อ';
        }


        field(50169; "Layer Chicken Amnt"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'จำนวนไก่ไข่';
        }



        field(50171; "Fish Type"; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'พันธ์ปลา';
        }

        field(50172; "Fish Amnt"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'จำนวนปลา';
        }

        field(50186; "Duck Amnt"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'จำนวนเป็ด';
        }

        field(50188; "Cow Amnt"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'จำนวนวัว';
        }

        field(50190; "Other Animal Amnt"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'จำนวนสัตว์อื่นๆ';
        }
        field(50191; "Other Animal name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'สัตว์อื่นๆ';
        }

        field(50192; "LiveStockDescription"; Text[50])
        {
            Caption = 'ชื่อกลุ่มปศุสัตว์';
            FieldClass = FlowField;
            CalcFormula = lookup(ItemgroupType.Description where(Code = field("Item Group Type")));

        }
        field(50193; "CustomerBusTypeDesc"; Text[50])
        {
            Caption = 'ชื่อประเภทธุรกิจลูกค้า';
            FieldClass = FlowField;
            CalcFormula = lookup(customerbusinessType.Description where(Code = field("Customer Business Type")));
        }

        field(50194; "CustomerTypeDesc"; Text[50])
        {
            Caption = 'ชื่อประเภทธุรลูกค้า';
            FieldClass = FlowField;
            CalcFormula = lookup(customerType.Description where(Code = field("Customer Type")));
        }


        field(50176; "Other Pet Group text"; Text[50])
        {
            DataClassification = ToBeClassified;
        }


        field(50184; "Trade Credit"; code[10]) //Day
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms";

        }
        field(50195; Fax; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50196; "Salesperson"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }



    }

    keys
    {
        key(Key1; "Customer No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        "For Company" := CompanyName;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}