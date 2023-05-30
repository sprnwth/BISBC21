page 50002 "Register Customer List"
{
    ApplicationArea = All;
    Caption = 'Customer Registration';
    PageType = List;
    SourceTable = "Customer Registration";
    UsageCategory = Lists;
    CardPageId = "Register Customer Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("For Company"; Rec."For Company")
                {
                    ToolTip = 'Specifies the value of the For Company field.';
                }
                field("Registration Type"; Rec."Registration Type")
                {
                    ToolTip = 'Specifies the value of the Registration Type field.';
                }
                field(Initial; Rec.Initial)
                {
                    ToolTip = 'Specifies the value of the Initial field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field("Personal ID"; Rec."Personal ID")
                {
                    ToolTip = 'Specifies the value of the Personal ID field.';
                }
                field(Moo; Rec.Moo)
                {
                    ToolTip = 'หมู่ที่';
                }
                field(Soi; Rec.Soi)
                {
                    ToolTip = 'ซอย';
                }
                field(Street; Rec.Street)
                {
                    ToolTip = 'ถนน';
                }
                field(Thumbon; Rec.Thumbon)
                {
                    ToolTip = 'ตำบล';
                }
                field(Amphur; Rec.Amphur)
                {
                    ToolTip = 'อำเภอ';
                }
                field(Province; Rec.Province)
                {
                    ToolTip = 'จังหวัด';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Company Name"; Rec."Company Name")
                {
                    ToolTip = 'ชื่อบริษัท';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ToolTip = 'Specifies the value of the VAT Registration No. field.';
                }
                field(Branch; Rec.Branch)
                {
                    ToolTip = 'Specifies the value of the Branch field.';
                }
                field("Open Time"; Rec."Open Time")
                {
                    ToolTip = 'เวลาเปิดทำการ';
                }
                field("Receiving Time"; Rec."Receiving Time")
                {
                    ToolTip = 'เวลารับของ';
                }
                field("Shipping Address 1"; Rec."Shipping Address 1")
                {
                    ToolTip = 'Specifies the value of the Shipping Address 1 field.';
                }
                field("Shipping Address 2"; Rec."Shipping Address 2")
                {
                    ToolTip = 'Specifies the value of the Shipping Address 2 field.';
                }
                field("Ship and Billing"; Rec."Ship and Billing")
                {
                    ToolTip = 'Specifies the value of the Ship and Billing field.';
                }
                field("Billing Date"; Rec."Billing Date")
                {
                    ToolTip = 'Specifies the value of the Billing Date field.';
                }
                field("Billing Time"; Rec."Billing Time")
                {
                    ToolTip = 'Specifies the value of the Billing Time field.';
                }
                field(Cash; Rec.Cash)
                {
                    ToolTip = 'รับเงินสด';
                }
                field(Check; Rec.Check)
                {
                    ToolTip = 'รับเช็ค';
                }
                field("Check Date"; Rec."Check Date")
                {
                    ToolTip = 'รับเช็ควันที่';
                }
                field("Check Time"; Rec."Check Time")
                {
                    ToolTip = 'รับเช็คเวลา';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ToolTip = 'ชื่อธนาคาร';
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                    ToolTip = 'สาขา';
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ToolTip = 'เลขบัญชี';
                }
                field("Item Group Type"; Rec."Item Group Type")
                {
                    ToolTip = 'Specifies the value of the กลุ่มปศุสัตว์ field.';
                }

                field("Customer Business Type"; Rec."Customer Business Type")
                {
                    ToolTip = 'Specifies the value of the Business Type field.';
                }

                field("Est. Consuming"; Rec."Est. Consuming")
                {
                    ToolTip = 'ประมาณการใช้สินค้า';
                }
                field("Credit Term"; Rec."Credit Term")
                {
                    ToolTip = 'Specifies the value of the Credit Term field.';
                }
                field("Credit Limit"; Rec."Credit Limit")
                {
                    ToolTip = 'Specifies the value of the Credit Limit field.';
                }
                field("Address No."; Rec."Address No.")
                {
                    ToolTip = 'Specifies the value of the Address No. field.';
                }
                field("Floor No."; Rec."Floor No.")
                {
                    ToolTip = 'Specifies the value of the Floor No. field.';
                }
                field("Village Name"; Rec."Village Name")
                {
                    ToolTip = 'Specifies the value of the Village Name field.';
                }
                field(lattitude; Rec.lattitude)
                {
                    ToolTip = 'Specifies the value of the lattitude field.';
                }
                field(longtitude; Rec.longtitude)
                {
                    ToolTip = 'Specifies the value of the longtitude field.';
                }
                field(genbus; Rec.genbus)
                {
                    ToolTip = 'Specifies the value of the genbus field.';
                }
                field(custPostingGroup; Rec.custPostingGroup)
                {
                    ToolTip = 'Specifies the value of the custPostingGroup field.';
                }
                field(vatbus; Rec.vatbus)
                {
                    ToolTip = 'Specifies the value of the vatbus field.';
                }
                field(Transfer; Rec.Transfer)
                {
                    ToolTip = 'Specifies the value of the Transfer field.';
                }
                field("Ship and Billing Every"; Rec."Ship and Billing Every")
                {
                    ToolTip = 'Specifies the value of the วางบิลทุกวัน field.';
                }
                field("No Ship and Billing"; Rec."No Ship and Billing")
                {
                    ToolTip = 'Specifies the value of the ไม่มีการวางบิล field.';
                }
                field("Trade Credit"; Rec."Trade Credit")
                {
                    ToolTip = 'Specifies the value of the Trade Credit field.';
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Update to Customer")
            {
                caption = 'Update Customer';
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    SalesINF: Codeunit SalesInterFace;
                begin
                    SalesINF.RegisterCustomer(Rec."Customer No.");
                    Message('Updated');
                end;
            }
            action(CusInformation)
            {
                caption = 'ข้อมูลขึ้นทะเบียนลูกค้า';
                Image = NewCustomer;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    RegisterCus: Record "Customer Registration";
                begin
                    RegisterCus.Reset();
                    RegisterCus.SetRange("Customer No.", Rec."Customer No.");
                    If RegisterCus.FindFirst() then
                        Report.Run(Report::"Customer Information", true, true, RegisterCus);
                end;
            }
        }
    }
}
