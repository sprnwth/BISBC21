page 50024 "Product Registration Card"
{
    PageType = Card;
    SourceTable = "Product Registration";

    layout
    {
        area(Content)
        {
            group("Item")
            {
                field("Date"; rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("Register Item No."; Rec."Register Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'เลขขึ้นทะเบียนชั่วคราว';
                }
                field("Item Nos."; Rec."Item Nos.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()

                    begin
                        Rec.AssistEdit();
                    end;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;

                }


                field("Supplier Code"; rec."Supplier Code")
                {
                    ApplicationArea = All;
                }

            }

            group("ข้อมูลผู้ผลิตสินค้า")
            {
                field("New Product"; rec."New Product")
                {
                    ApplicationArea = All;
                }

                field("Revised"; rec.Revise)
                {
                    ApplicationArea = All;
                }


                /////////////////////////////////////////////////

                group("  ")
                {
                    field("Domestic"; rec.Domestic)
                    {
                        ApplicationArea = All;
                        Caption = 'ผู้ขายในประเทศ';
                    }

                    field("Export"; rec.Export)
                    {
                        ApplicationArea = All;
                        Caption = 'ผู้ขายต่างประเทศ';
                    }

                    field("B2C"; rec.B2C)
                    {
                        ApplicationArea = All;
                        Caption = 'ซื้อขายระหว่างประเทศ';
                    }
                }

                /////////////////////////////////////////////////


                field("E-Mail"; rec."Supplier Email")
                {
                    ApplicationArea = All;
                    Caption = 'E-Mail';
                }



                field("Supplier Phone"; rec."Supplier Phone")
                {
                    ApplicationArea = All;
                    Caption = 'Phone No';
                }

                field("Supplier Fax"; rec."Supplier Fax")
                {
                    ApplicationArea = All;
                    Caption = 'Fax No';
                }

            }

            group("ข้อมูลสินค้า")
            {

                /////////////////////////////////////////////////
                field("Product Name"; rec."Product Name")
                {
                    ApplicationArea = All;
                    Caption = 'ชื่อสินค้าทางการตลาด';
                }

                /////////////////////////////////////////////////

                group("ประเภทสินค้า")
                {
                    field("Item Goods Type"; Rec."Item Goods Type")
                    {
                        Caption = 'ประเภทสินค้า';
                        ApplicationArea = All;

                    }
                    field("Item Brand"; Rec."Item Brand")
                    {
                        Caption = 'Brand';
                        ApplicationArea = All;
                    }


                }

                /////////////////////////////////////////////////

                group("หมวดสินค้า")
                {
                    field("หมวดสินค้าหลัก"; Rec.MainCategory)
                    {
                        ApplicationArea = All;
                        Caption = 'หมวดสินค้าหลัก';
                    }

                    field("หมวดสินค้าย่อย"; Rec.SubCategory)
                    {
                        ApplicationArea = All;
                        Caption = 'หมวดสินค้าย่อย';
                    }
                }

                /////////////////////////////////////////////////

                group("ลักษณะสินค้า")
                {
                    field("Item Tracking Code"; Rec."Item Tracking Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'ลักษณะสินค้า';
                    }


                    field("COther text"; Rec."COther text")
                    {
                        ApplicationArea = All;
                        Caption = 'รายละเอียดอื่นๆ';
                        Editable = false;
                    }
                }

                /////////////////////////////////////////////////
                group(" ")
                {
                    field("UOM"; Rec.UOM) //option
                    {
                        ApplicationArea = All;
                        Caption = 'ขนาดบรรจุ (Invoice)';
                    }
                    field("Base UOM Name"; Rec."Base UOM Name")
                    {
                        ApplicationArea = All;

                    }
                    field("Purch. UOM"; Rec."Purch. UOM")
                    {
                        ApplicationArea = All;
                    }
                    field("Purch. UOM Name"; Rec."Purch. UOM Name")
                    {
                        ApplicationArea = All;

                    }
                    field("Sales. UOM"; Rec."Sales. UOM")
                    {
                        ApplicationArea = All;

                    }
                    field("Sales. UOM Name"; Rec."Sales. UOM Name")
                    {
                        ApplicationArea = All;

                    }

                    field("Expired Date"; Rec."Expired Date")
                    {
                        ApplicationArea = All;
                        Caption = 'อายุเก็บรักษา';
                    }
                }

            }

            group("เงื่อนไขการซื้อ")
            {

                /////////////////////////////////////////////////
                field("Default VAT Posting Group"; Rec."Default VAT Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'สินค้า VAT %';
                }


                /////////////////////////////////////////////////

                field("Credit"; Rec.Credit)
                {
                    ApplicationArea = All;
                    Caption = 'เครดิต';
                }

                field("Delivery Term"; Rec."Delivery Term")
                {
                    ApplicationArea = All;
                    Caption = 'เงื่อนไขการส่งมอบ';
                }

                field("Min. Order"; Rec."Min. Order")
                {
                    ApplicationArea = All;
                }

                field("Product L/T"; Rec."Product L/T")
                {
                    ApplicationArea = All;
                    Caption = 'L\T การผลิต';
                }

                field("BuyCond Other"; Rec."BuyCond Other")
                {
                    ApplicationArea = All;
                    Caption = 'อื่นๆ';
                }
            }

            group("ข้อมูลสินค้า (Secretary)")
            {
                group("กลุ่มสินค้า")
                {
                    field("Gen. Product Posting Group"; Rec."Gen. Product Posting Group")
                    {
                        ApplicationArea = All;
                        Caption = 'กลุ่มสินค้า (Product Type)';
                        ToolTip = 'Gen. Product';
                    }
                    field("Inventory Posting Group"; Rec."Inventory Posting Group")
                    {
                        ApplicationArea = All;

                    }

                }
            }

            group("Product for BIS Group")
            {
                group("สินค้า บริษ้ท")
                {
                    field("Company Name"; Rec."Company Name")
                    {
                        ApplicationArea = All;

                    }

                }

                group("Attachment : เอกสารประกอบ") //(ถ้าไม่มีโปรดอธิบาย)
                {
                    field("Image"; Rec.Image)
                    {
                        ApplicationArea = All;
                        Caption = 'รูปภาพ สินค้า หรือ แคทตาล็อก';
                    }

                    field("MSDS/COA"; Rec."MSDS/COA")
                    {
                        ApplicationArea = All;
                    }


                    field("Register"; Rec.Register)
                    {
                        ApplicationArea = All;
                        Caption = 'ใบทะเบียน';
                    }


                    field("Production Information"; Rec."Production Information")
                    {
                        ApplicationArea = All;
                    }



                    field("Attachment Other"; Rec."Attachment Other")
                    {
                        ApplicationArea = All;
                        Caption = 'อื่นๆ (ฉลาก)';
                    }



                }
            }

            // group("ส่วนที่ 2 พนักงานขาย")
            // {
            //     group("รายละเอียดผลิตภัณฑ์ที่ขาย")
            //     {
            //         group("กลุ่มปศุสัตว์")
            //         {
            //             field("Meteral"; Rec.Meteral)
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'วัตถุดิบ';
            //             }

            //             field("Vaccine"; Rec.Vaccine)
            //             {
            //                 ApplicationArea = All;
            //             }

            //             field("Food Supplements"; Rec."Food Supplements")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'สารเสริม';
            //             }

            //             field("Granulated Feed"; Rec."Granulated Feed")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'อาหารเม็ด';
            //             }

            //             field("Other Livestock Group"; Rec."Other Livestock Group")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'อื่นๆ ระบุ';
            //             }

            //             // field("      "; Rec."Other Livestock Group text")
            //             // {
            //             //     ApplicationArea = All;
            //             // }
            //         }

            //         group("ประเภท")
            //         {
            //             field("Pig"; Rec.Pig)
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'สุกร';
            //             }

            //             field("Breeding Mom Amnt"; Rec."Breeding Mom Amnt")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'จำนวนแม่พันธุ์ (ตัว)';
            //             }

            //             field("Pig Amnt"; Rec."Pig Amnt")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'จำนวนประชากรหมู (ตัว)';
            //             }

            //             field("Broiler"; Rec.Broiler)
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'ไก่เนื้อ';
            //             }

            //             field("Broiler Amnt"; Rec."Broiler Amnt")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'จำนวน (ตัว)';
            //             }

            //             field("Layer Chicken"; Rec."Layer Chicken")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'ไก่ไข่';
            //             }

            //             field("Layer Chicken Amnt"; Rec."Layer Chicken Amnt")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'จำนวน (ตัว)';
            //             }

            //             field("Fish"; Rec.Fish)
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'ปลา';
            //             }

            //             field("Fish Type"; Rec."Fish Type")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'พันธุ์ปลา';
            //             }

            //             field("Fish Amnt"; Rec."Fish Amnt")
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'จำนวน (กระชัง/บ่อ)';
            //             }
            //         }
            //     }

            //     group("กลุ่มสัตว์เลี้ยง")
            //     {
            //         field("Product for Pet"; Rec."Product for Pet")
            //         {
            //             ApplicationArea = All;
            //             Caption = 'ผลิตภัณฑ์-อาหารสำหรับสัตว์เลี้ยง/วัคซีน';
            //         }

            //         field("Blood test machine"; Rec."Blood test machine")
            //         {
            //             ApplicationArea = All;
            //             Caption = 'เครื่องตรวจเลือด';
            //         }

            //         field("Other Pet Group"; Rec."Other Pet Group")
            //         {
            //             ApplicationArea = All;
            //             Caption = 'อื่นๆ ระบุ';
            //         }

            //         // field("       "; Rec."Other Pet Group text")
            //         // {
            //         //     ApplicationArea = All;
            //         // }

            //     }


            //     group("ประเภทธุรกิจ")
            //     {
            //         field("Hospital"; Rec.Hospital)
            //         {
            //             ApplicationArea = All;
            //             Caption = 'โรงพยาบาลสัตว์';
            //         }

            //         field("Clinic"; Rec.Clinic)
            //         {
            //             ApplicationArea = All;
            //             Caption = 'คลินิก';
            //         }

            //         field("Pet Shop"; Rec."Pet Shop")
            //         {
            //             ApplicationArea = All;
            //             Caption = 'เพ็ทชอป';
            //         }

            //         field("Hospital Station"; Rec."Hospital Station")
            //         {
            //             ApplicationArea = All;
            //             Caption = 'สถานพยาบาล';
            //         }

            //         field("Government"; Rec.Government)
            //         {
            //             ApplicationArea = All;
            //             Caption = 'หน่วยงานราชการ';
            //         }

            //         field("Layman"; Rec.Layman)
            //         {
            //             ApplicationArea = All;
            //             Caption = 'บุคคลธรรมดา';
            //         }

            //         field("Product use per month"; Rec."Product use per month")
            //         {
            //             ApplicationArea = All;
            //             Caption = 'ประมาณการใช้สินค้า/เดือน';
            //         }

            //         field("Trade Credit"; Rec."Trade Credit")
            //         {
            //             ApplicationArea = All;
            //             Caption = 'เครดิตการค้า (วัน)';
            //         }
            //     }

            // }

        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(50100),
                                    "No." = FIELD("Register Item No.");
            }
        }
    }

    actions
    {
        area(Reporting)
        {

            action("ใบขึ้นทะเบียนสินค้าใหม่")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Register;

                trigger OnAction()
                var
                    ProdReg: Record "Product Registration";
                begin
                    ProdReg.Reset();
                    ProdReg.setrange("Register Item No.", Rec."Register Item No.");
                    Report.Run(Report::"Production Registration", true, true, ProdReg);
                end;
            }

        }
        area(Processing)
        {
            action("Convert to Item")
            {
                ApplicationArea = All;
                Image = Change;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    MainBISCU: Codeunit "BIS Main Function";
                begin
                    MainBISCU.RegisterItem(Rec."Register Item No.");
                    //RegisterItem.RegisterItem(Rec."Draft No.");
                end;
            }

        }
    }

    var
        myInt: Integer;

    //CustomerInfo: Record Customer;
}