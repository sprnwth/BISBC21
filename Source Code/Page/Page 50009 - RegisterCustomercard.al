page 50009 "Register Customer Card"
{
    ApplicationArea = All;
    Caption = 'Register Customer Card';
    PageType = Card;
    SourceTable = "Customer Registration";
    InsertAllowed = true;
    // DelayedInsert = true;
    layout
    {
        area(content)
        {
            Group(CompanyInformation)
            {
                Caption = 'Company Information';

                field("For Company"; Rec."For Company")
                {
                    ToolTip = 'Specifies the value of the For Company field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }

            }
            group(CustomerInformation)
            {
                Caption = 'Customer Information';

                field("Registration Type"; Rec."Registration Type")
                {
                    ToolTip = 'Specifies the value of the Registration Type field.';
                }
                field(genbus; Rec.genbus)
                {
                    ShowMandatory = true;
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(vatbus; Rec.vatbus)
                {
                    ShowMandatory = true;
                    Caption = 'Vat Bus. Posting Group';
                }
                field(custPostingGroup; Rec.custPostingGroup)
                {
                    ShowMandatory = true;
                    Caption = 'Customer Posting Group';
                }



                field(Initial; Rec.Initial)
                {
                    ToolTip = 'คำนำหน้า';
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


            }
            Group(ForCompany)
            {
                Caption = 'สั่งซื้อสินค้าในนาม(ชื่อ-ที่อยู่ในการเปิดใบกำกับภาษี)';
                field("Company Name"; Rec."Company Name")
                {
                    ToolTip = 'Specifies the value of the Company Name field.';
                }

            }
            Group(Address)
            {
                Caption = 'ชื่อ-ที่อยู่ในการเปิดใบกำกับภาษี';
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ToolTip = 'Specifies the value of the VAT Registration No. field.';
                }
                field(Branch; Rec.Branch)
                {
                    ToolTip = 'Specifies the value of the Branch field.';
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

                field(Moo; Rec.Moo)
                {
                    ToolTip = 'Specifies the value of the Moo field.';
                }
                field(Soi; Rec.Soi)
                {
                    ToolTip = 'Specifies the value of the Soi field.';
                }
                field(Street; Rec.Street)
                {
                    ToolTip = 'Specifies the value of the Street field.';
                }
                field(Thumbon; Rec.Thumbon)
                {
                    ToolTip = 'Specifies the value of the Thumbon field.';
                }
                field(Amphur; Rec.Amphur)
                {
                    ToolTip = 'Specifies the value of the Amphur field.';
                }
                field(Province; Rec.Province)
                {
                    ToolTip = 'Specifies the value of the Province field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Fax; Rec.Fax)
                {
                    ToolTip = 'Specifies the value of the Fax No. field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
            group(ConditionShipping)
            {
                Caption = 'เงื่อนไขการวางบิล/ชำระเงิน';

                field("Open Time"; Rec."Open Time")
                {
                    ToolTip = 'Specifies the value of the Open Time field.';
                }
                field("Receiving Time"; Rec."Receiving Time")
                {
                    ToolTip = 'Specifies the value of the Receiving Time field.';
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
                field("Ship and Billing Every"; Rec."Ship and Billing Every")
                {
                    ToolTip = 'Specifies the value of the Ship and Billing Every field.';
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
                    ToolTip = 'Specifies the value of the Cash field.';
                }
                field(Check; Rec.Check)
                {
                    ToolTip = 'Specifies the value of the Check field.';
                }
                field("Check Date"; Rec."Check Date")
                {
                    ToolTip = 'Specifies the value of the Check Date field.';
                }
                field("Check Time"; Rec."Check Time")
                {
                    ToolTip = 'Specifies the value of the Check Time field.';
                }
                field(Transfer; Rec.Transfer)
                {
                    ToolTip = 'Specifies the value of the Transfer field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                    ToolTip = 'Specifies the value of the Bank Branch field.';
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ToolTip = 'Specifies the value of the Bank Account No. field.';
                }
            }

            group("รายละเอียดผลิตภัณฑ์ที่ขาย")
            {
                group("Group Type")
                {
                    field("Item Group Type"; Rec."Item Group Type")
                    {
                        caption = 'Item Group Type';
                    }
                    field(LiveStockDescription; Rec.LiveStockDescription)
                    {
                        caption = 'คำอธิบาย';
                    }
                    field("Live Stock OTH"; Rec."Live Stock OTH")
                    {
                        Caption = 'อื่นๆระบุ';
                    }

                }
                group("Business Type")
                {
                    field("Customer Business Type"; Rec."Customer Business Type")
                    {
                        Caption = 'Customer Business Type';
                    }
                    field(CustomerBusTypeDesc; Rec.CustomerBusTypeDesc)
                    {
                        caption = 'คำอธิบาย';
                    }
                    field("Other Ani Amnt"; Rec."Other Animal Amnt")
                    {
                        Caption = 'จำนวน';
                    }
                }

            }

            group("ประเภทธุรกิจ")
            {
                field("Customer Type"; Rec."Customer Type")
                {
                    Caption = 'Customer Type';
                }

                field(CustomerTypeDesc; Rec.CustomerTypeDesc)
                {
                    caption = 'คำอธิบาย';
                }


                field("Est. Consuming"; Rec."Est. Consuming")
                {
                    Caption = 'ประมาณการใช้สินค้า/เดือน';
                }

                field("Trade Credit"; Rec."Trade Credit")
                {
                    Caption = 'เครดิตการค้า (วัน)';
                }

            }

        }
        area(Factboxes)
        {

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
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Rec."For Company" := CompanyName;
    end;
}
