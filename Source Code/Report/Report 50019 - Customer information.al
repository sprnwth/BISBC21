report 50019 "Customer Information"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    dataset
    {
        dataitem("Registration BIS"; "Customer Registration")
        {
            column(Customer_No_; "Customer No.")
            {

            }
            column(CompanyInfo; CompanyInfo.Name)
            {

            }
            column(AddressNo; "Address No.")
            {
            }
            column(Agent; Agent)
            {
            }
            column(Amphur; Amphur)
            {
            }
            column(BankAccountNo; "Bank Account No.")
            {
            }
            column(BankBranch; "Bank Branch")
            {
            }
            column(BankName; "Bank Name")
            {
            }
            column(BillingDate; "Billing Date")
            {
            }
            column(BillingTime; "Billing Time")
            {
            }
            column(Bloodtestmachine; Bloodtestmachine)
            {
            }
            column(Branch; Branch)
            {
            }
            column(BreedingMomAmnt; "Breeding Amt")
            {
            }
            column(Broiler; Broiler)
            {
            }
            column(BroilerAmnt; "Broiler Amnt")
            {
            }
            column(BusinessType; '')
            {
            }
            column(Cash; Cash)
            {
            }
            column(Check; Check)
            {
            }
            column(CheckDate; "Check Date")
            {
            }
            column(CheckTime; "Check Time")
            {
            }
            column(Clinic; Clinic)
            {
            }
            column(Company; Company)
            {
            }
            column(Cow; Cow)
            {
            }
            column(CowAmnt; "Cow Amnt")
            {
            }
            column(CreditLimit; "Credit Limit")
            {
            }
            column(CreditTerm; "Credit Term")
            {
            }
            column(DateofBirth; "Date of Birth")
            {
            }
            column(Distributor; Distributor)
            {
            }
            column(DraftNo; '')
            {
            }
            column(Duck; Duck)
            {
            }
            column(DuckAmnt; "Duck Amnt")
            {
            }
            column(Email; Email)
            {
            }
            column(EstConsuming; "Est. Consuming")
            {
            }
            column(Farm; Farm)
            {
            }
            column(Feedmills; Feedmills)
            {
            }
            column(Fish; Fish)
            {
            }
            column(FishAmnt; "Fish Amnt")
            {
            }
            column(FishType; "Fish Type")
            {
            }
            column(FloorNo; "Floor No.")
            {
            }
            column(FoodSupplements; FoodSupplements)
            {
            }
            column(ForCompany; forcompany)
            {
            }
            column(Government; Government)
            {
            }
            column(GranulatedFeed; GranulatedFeed)
            {
            }
            column(Hospital; Hospital)
            {
            }
            column(HospitalStation; HospitalStation)
            {
            }
            column(IntheCompanyName; "Company Name")
            {
            }
            column(Initial; Initial)
            {
            }
            column(Integrate; Integrate)
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(LayerChicken; LayerChicken)
            {
            }
            column(LayerChickenAmnt; "Layer Chicken Amnt")
            {
            }
            column(Layman; Layman)
            {
            }
            column(LiveStock; '')
            {
            }
            column(LiveStockOTH; "Live Stock OTH")
            {
            }
            column(Meteral; Meteral)
            {
            }
            column(Moo; Moo)
            {
            }
            column(Name; Name)
            {
            }
            column(NoShipandBilling; "No Ship and Billing")
            {
            }

            column(OpenTime; "Open Time")
            {
            }
            column(OtherAmimals; OtherAmimals)
            {
            }
            column(OtherAniAmnt; "Other Animal Amnt")
            {
            }
            column(OtherAnimalname; "Other Animal name")
            {
            }
            column(OtherLivestockGroup; OtherLivestockGroup)
            {
            }
            column(OtherPetGroup; OtherPetGroup)
            {
            }
            column(PersonalID; "Personal ID")
            {
            }
            column(PetShop; PetShop)
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(Fax; Fax)
            {

            }
            column(Pig; Pig)
            {
            }
            column(PigAmnt; "Pig Amnt")
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(ProductforPet; ProductforPet)
            {
            }

            column(Productusepermonth; "Est. Consuming")
            {
            }
            column(Province; Province)
            {
            }
            column(ReceivingTime; "Receiving Time")
            {
            }
            column(RegistrationType; "Registration Type")
            {
            }
            column(ShipandBilling; "Ship and Billing")
            {
            }
            column(ShipandBillingEvery; "Ship and Billing Every")
            {
            }
            column(ShippingAddress1; "Shipping Address 1")
            {
            }
            column(ShippingAddress2; "Shipping Address 2")
            {
            }
            column(Soi; Soi)
            {
            }
            column(Street; Street)
            {
            }

            column(Thumbon; Thumbon)
            {
            }
            column(TradeCredit; "Trade Credit")
            {
            }
            column(Transfer; Transfer)
            {
            }
            column(VATRegistrationNo; "VAT Registration No.")
            {
            }
            column(Vaccine; Vaccine)
            {
            }
            column(VillageName; "Village Name")
            {
            }
            column(custPostingGroup; custPostingGroup)
            {
            }
            column(genbus; genbus)
            {
            }
            column(lattitude; lattitude)
            {
            }
            column(longtitude; longtitude)
            {
            }
            column(vatbus; vatbus)
            {
            }
            column(Customer_Type; CustomertypeG."BIS Code")
            {

            }
            column(Item_Product_Type; ItemGroupTypeG."BIS Code")
            {
            }
            column(Other_Pet_Group_text; "Other Pet Group text")
            {
            }
            column(Item_Group_Desc; LiveStockDescription)
            {

            }
            column(CustomerBusTypeDesc; CustomerBusTypeDesc)
            {

            }
            column(CustomerTypeDesc; CustomerTypeDesc)
            {

            }

            trigger OnPreDataItem()
            begin

            end;

            trigger OnAfterGetRecord()
            begin
                CalcFields(LiveStockDescription, CustomerBusTypeDesc, CustomerTypeDesc);

                //++
                // if companyRec.get("For Company") then begin
                //     CompanyInfo.ChangeCompany(companyRec.Name);
                //     CompanyInfo.get();
                //     case CompanyInfo."Code for Registration" of
                //         '01':
                //             forcompany := 'BIS';
                //         '02':
                //             forcompany := 'NIC';
                //         '03':
                //             forcompany := 'SIS';
                //         '04':
                //             forcompany := 'FAITH';
                //         '05':
                //             forcompany := 'PTK';
                //         '06':
                //             forcompany := 'PEX';
                //         '07':
                //             forcompany := 'QUEST';
                //     end;
                // end;
                //--
                CustomertypeG.Reset();
                CustomertypeG.SetRange(Code, "Customer Type");
                If not CustomertypeG.FindFirst() then
                    CustomertypeG.Init();

                ItemGroupTypeG.Reset();
                ItemGroupTypeG.SetRange(Code, "Item Group Type");
                If ItemGroupTypeG.FindFirst() then
                    ItemGroupTypeG.Init();
                // Message(ItemGroupTypeG.Code);

            end;
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            //LayoutFile = './Source Code/ReportLayout/Customer Information.docx';
            LayoutFile = './Source Code/ReportLayout/Customer Information1.rdlc';
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompanyInfo.get;
    end;

    var
        ItemGroupTypeG: Record ItemgroupType;
        CustomerBusinessTypeG: Record customerbusinessType;
        CustomertypeG: Record customerType;
        CompanyInfo: Record "Company Information";
        CompanyRec: Record Company;
        Agent: Boolean;
        Bloodtestmachine: Boolean;
        Broiler: Boolean;
        Clinic: Boolean;
        Company: Boolean;
        Cow: Boolean;
        Distributor: Boolean;
        Duck: Boolean;
        Farm: Boolean;
        Feedmills: Boolean;
        Fish: Boolean;
        FoodSupplements: Boolean;
        Government: Boolean;
        GranulatedFeed: Boolean;
        Hospital: Boolean;
        HospitalStation: Boolean;
        Integrate: Boolean;
        LayerChicken: Boolean;
        Layman: Boolean;
        LiveStock: Boolean;
        Meteral: Boolean;
        OtherAmimals: Boolean;
        OtherLivestockGroup: Boolean;
        OtherPetGroup: Boolean;
        PetShop: Boolean;
        Pig: Boolean;
        ProductforPet: Boolean;
        Vaccine: Boolean;
        forcompany: Code[10];

}