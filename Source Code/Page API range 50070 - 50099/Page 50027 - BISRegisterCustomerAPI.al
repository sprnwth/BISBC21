page 50027 BISRegisterCustomerAPI
{
    
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'bisRegisterCustomerAPI';
    DelayedInsert = true;
    EntityName = 'bisregistercustomer';
    EntitySetName = 'bisregistercustomers';
    PageType = API;
    SourceTable = "Customer Registration";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(salesperson;Rec.Salesperson)
                {
                                        
                }
                field(forCompany; Rec."For Company")
                {
                    Caption = 'For Company';
                }
                field(registrationType; Rec."Registration Type")
                {
                    Caption = 'Registration Type';
                }
                field(initial; Rec.Initial)
                {
                    Caption = 'คำนำหน้า';
                }
                field(name; Rec.Name)
                {
                    Caption = 'ชื่อ';
                }
                field(lastName; Rec."Last Name")
                {
                    Caption = 'นามสกุล';
                }
                
                field(dateOfBirth; Rec."Date of Birth")
                {
                    Caption = 'วันเดือนปีเกิด';
                }
                field(personalID; Rec."Personal ID")
                {
                    Caption = 'เลขที่บัตรประชาชน';
                }
                field(moo; Rec.Moo)
                {
                    Caption = 'หมู่';
                }
                field(soi; Rec.Soi)
                {
                    Caption = 'ซอย';
                }
                field(street; Rec.Street)
                {
                    Caption = 'ถนน';
                }
                field(thumbon; Rec.Thumbon)
                {
                    Caption = 'ตำบล';
                }
                field(amphur; Rec.Amphur)
                {
                    Caption = 'อำเภอ';
                }
                field(province; Rec.Province)
                {
                    Caption = 'จังหวัด';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'รหัสไปรษณีย์';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(email; Rec.Email)
                {
                    Caption = 'Email';
                }
                field(companyname; Rec."Company Name")
                {
                    Caption = 'ชื่อบริษัท';
                }
                field(addressNo; Rec."Address No.")
                {
                    Caption = 'เลขที่ตั้ง';
                }
                field(floorNo; Rec."Floor No.")
                {
                    Caption = 'ชั้น';
                }
                field(villageName; Rec."Village Name")
                {
                    Caption = 'หมู่บ้าน';
                }
                field(lattitude; Rec.lattitude)
                {
                    Caption = 'lattitude';
                }
                field(longtitude; Rec.longtitude)
                {
                    Caption = 'longtitude';
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                }
                field(branch; Rec.Branch)
                {
                    Caption = 'สาขา';
                }
                field(openTime; Rec."Open Time")
                {
                    Caption = 'เวลาเปิดทำการ';
                }
                field(receivingTime; Rec."Receiving Time")
                {
                    Caption = 'เวลารับสินค้า';
                }
                field(shippingAddress1; Rec."Shipping Address 1")
                {
                    Caption = 'Shipping Address 1';
                }
                field(shippingAddress2; Rec."Shipping Address 2")
                {
                    Caption = 'Shipping Address 2';
                }
                field(shipAndBilling; Rec."Ship and Billing")
                {
                    Caption = 'ส่งสินค้าพร้อมวางบิล';
                }
                field(billingDate; Rec."Billing Date")
                {
                    Caption = 'Billing Date';
                }
                field(billingTime; Rec."Billing Time")
                {
                    Caption = 'Billing Time';
                }
                field(cash; Rec.Cash)
                {
                    Caption = 'เงินสด';
                }
                field(check; Rec.Check)
                {
                    Caption = 'เช็ค';
                }
                field(checkDate; Rec."Check Date")
                {
                    Caption = 'วันที่รับเช็ค';
                }
                field(checkTime; Rec."Check Time")
                {
                    Caption = 'เวลารับเช็ค';
                }
                field(bankName; Rec."Bank Name")
                {
                    Caption = 'Bank Name';
                }
                field(bankBranch; Rec."Bank Branch")
                {
                    Caption = 'Bank Branch';
                }
                field(bankAccountNo; Rec."Bank Account No.")
                {
                    Caption = 'Bank Account No.';
                }
                field(itemgrouptype; Rec."Item Group Type")
                {
                    Caption = 'กลุ่มปศุสัตว์';
                }
                field(liveStockOTH; Rec."Live Stock OTH")
                {
                    Caption = 'กลุ่มปศุสัตว์อื่นๆ';
                }
                field(customerType; Rec."Customer Type")
                {
                    Caption = 'ประเภทธุรกิจ';
                }
                field(estConsuming; Rec."Est. Consuming")
                {
                    Caption = 'ประมาณการใช้สินค้าต่อเดือน';
                }
                field(creditTerm; Rec."Credit Term")
                {
                    Caption = 'Credit Term';
                }
                field(creditLimit; Rec."Credit Limit")
                {
                    Caption = 'Credit Limit';
                }

                field(genbus; Rec.genbus)
                {
                    Caption = 'genbus';
                }
                field(custPostingGroup; Rec.custPostingGroup)
                {
                    Caption = 'custPostingGroup';
                }
                field(vatbus; Rec.vatbus)
                {
                    Caption = 'vatbus';
                }
                field(transfer; Rec.Transfer)
                {
                    Caption = 'โอนเงิน';
                }
                field(shipAndBillingEvery; Rec."Ship and Billing Every")
                {
                    Caption = 'วางบิลทุกวัน';
                }
                field(noShipAndBilling; Rec."No Ship and Billing")
                {
                    Caption = 'ไม่มีการวางบิล';
                }

                //LiveStock
                field(customerBusinessType; Rec."Customer Business Type")
                {
                    Caption = 'ประเภทธุรกิจลูกค้า';
                }
                //Livestock--
                //customerbustype++
                field(breedingAmt; Rec."Breeding Amt")
                {
                    Caption = 'จำนวนแม่พันธ์สุกร';
                }
                field(pigAmnt; Rec."Pig Amnt")
                {
                    Caption = 'จำนวนสุกร';
                }
                field(broilerAmnt; Rec."Broiler Amnt")
                {
                    Caption = 'จำนวนไก่เนื้อ';
                }
                field(layerChickenAmnt; Rec."Layer Chicken Amnt")
                {
                    Caption = 'จำนวนไก่ไข่';
                }
                field(fishType; Rec."Fish Type")
                {
                    Caption = 'พันธ์ปลา';
                }
                field(fishAmnt; Rec."Fish Amnt")
                {
                    Caption = 'จำนวนปลา';
                }
                field(duckAmnt; Rec."Duck Amnt")
                {
                    Caption = 'จำนวนเป็ด';
                }
                field(cowAmnt; Rec."Cow Amnt")
                {
                    Caption = 'จำนวนวัว';
                }
                field(otherAnimalAmnt; Rec."Other Animal Amnt")
                {
                    Caption = 'จำนวนสัตว์อื่นๆ';
                }
                field(otherAnimalName; Rec."Other Animal name")
                {
                    Caption = 'สัตว์อื่นๆ';
                }
                field(otherPetGroupText; Rec."Other Pet Group text")
                {
                    Caption = 'Other Pet Group text';
                }
                //CustomerbusType--

                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
