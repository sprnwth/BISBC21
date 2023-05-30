report 50004 "Production Registration"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Production Registration"; "Product Registration")
        {
            RequestFilterFields = "Register Item No."; //, "Salesperson Code";

            column("Date"; Date)
            {

            }

            column(ProductNo; "Item No.")
            {

            }

            column(SupplierCode; "Supplier Code")
            {

            }

            column(NewProduct; "New Product")
            {

            }

            column(Revised; Revise)
            {

            }

            column(Domestic; Domestic)
            {

            }
            column(Export; Export)
            {

            }

            column(B2C; B2C)
            {

            }

            column(SupplierName; VendorG.Name) //spr
            {

            }

            column(EMail; "Supplier Email")
            {

            }

            column(SupplierAddress; '') //spr
            {

            }

            column(SupplierPhone; "Supplier Phone")
            {

            }

            column(SupplierFax; "Supplier Fax")
            {

            }

            column(ProductName; "Product Name")
            {

            }

            column(NewCategory; NewCategory)
            {

            }

            column(CoreCategory; CoreCategory)
            {

            }

            column(OEMCategory; OEMCategory)
            {

            }

            //หมวดสินค้าหลัก
            column(MainCategory; ItemSupgroup1.Description)
            {

            }
            //หมวดสินค้าย่อย
            column(SubCategory; ItemCatagory.Description)
            {

            }

            column(Normal; Normal)
            {

            }

            column(Lot; Lot)
            {

            }

            column(LotExpire; "LotExpire")
            {

            }

            column(LotSerial; "LotSerial")
            {

            }

            column(COther; COther)
            {

            }
            column(COther_text; "COther text")
            {

            }

            column(UOM_code; UOMBASE) //option
            {

            }

            column(Purch__UOM; UOMPurch) //option
            {

            }
            column(Purch__UOM_Name; "Purch. UOM Name") //option
            {

            }
            column(Sales__UOM; UOMSales)
            {

            }
            column(Sales__UOM_Name; "Sales. UOM Name")
            {

            }

            column(ExpiredDate; "Expired Date")
            {

            }

            column(VAT7; VAT7Mark)
            {

            }

            column(NOVAT7; VAT0Mark)
            {

            }

            /////////////////////////////////////////////////

            column("Credit"; Credit)
            {

            }

            column(DeliveryTerm; "Delivery Term")
            {

            }

            column(MinOrder; "Min. Order")
            {

            }

            column(ProductPerLot; "Product L/T")
            {

            }

            column(BuyCondOther; "BuyCond Other")
            {

            }

            column(Brand01; Item01)
            {

            }

            column(Brand02; Item02)
            {

            }

            column(Brand03; Item03)
            {

            }

            column(Brand04; Item04)
            {

            }

            column(Brand05; Item05)
            {

            }

            column(Brand06; Item06)
            {

            }

            column(Biosci; ComBio)
            {

            }

            column(Nutrition; ComNutri)
            {

            }

            column(ProTastKit; ComProTest)
            {

            }

            column(FeedAndIngredient; ComFitandin)
            {

            }

            column(SpecialIngredient; Comspecial)
            {

            }

            column(PetX; ComPedX)
            {

            }

            column(Image; Image)
            {

            }

            column(MSDSCOA; "MSDS/COA")
            {

            }

            column(Register; Register)
            {

            }

            column(ProductionInfo; "Production Information")
            {

            }

            column(AttachmentOther; "Attachment Other")
            {

            }
            column(VendorAddress; VendorG.Address + ' ' + VendorG."Address 2")
            {

            }
            column(VendorAddress2; VendorG.City + ' ' + VendorG."Post Code")
            {

            }
            column(customerChainName; customerChain.Description)
            {
            }
            column(ItemBrandType; ItemBrandType."BIS Code")
            {

            }
            // column(Meteral; Meteral)
            // {

            // }

            // column(Vaccine; Vaccine)
            // {

            // }

            // column(FoodSupplements; "Food Supplements")
            // {

            // }

            // column(GranulatedFeed; "Granulated Feed")
            // {

            // }

            // column(OtherLivestockGroup; "Other Livestock Group")
            // {

            // }

            // column(Pig; Pig)
            // {

            // }

            // column(BreedingMomAmnt; "Breeding Mom Amnt")
            // {

            // }

            // column(PigAmnt; "Pig Amnt")
            // {

            // }

            // column(Broiler; Broiler)
            // {

            // }

            // column(BroilerAmnt; "Broiler Amnt")
            // {

            // }

            // column(LayerChicken; "Layer Chicken")
            // {

            // }

            // column(LayerChickenAmnt; "Layer Chicken Amnt")
            // {

            // }

            // column(Fish; Fish)
            // {

            // }

            // column(FishType; "Fish Type")
            // {

            // }

            // column(FishAmnt; "Fish Amnt")
            // {

            // }

            // column(ProductForPet; "Product for Pet")
            // {

            // }

            // column(BloodTestMachine; "Blood test machine")
            // {

            // }

            // column(OtherPetGroup; "Other Pet Group")
            // {

            // }

            // column(Hospital; Hospital)
            // {

            // }

            // column(Clinic; Clinic)
            // {

            // }

            // column(PetShop; "Pet Shop")
            // {

            // }

            // column(HospitalStation; "Hospital Station")
            // {

            // }

            // column(Government; Government)
            // {

            // }

            // column(Layman; Layman)
            // {

            // }

            // column(ProductUsePerMonth; "Product use per month")
            // {

            // }

            // column(TradeCredit; "Trade Credit")
            // {

            // }

            // column(Datetext; Datetext)
            // {

            // }

            trigger OnAfterGetRecord()

            begin
                VAT7Mark := false;
                VAT0Mark := false;
                //Totaltext := NaviworldCore.FormatNoTextVoucher("Balance (LCY)");
                If Not VendorG.Get("Supplier Code") then
                    VendorG.Init();

                customerChain.Reset();
                customerChain.SetRange(Code, VendorG."Vendor Chain Code");
                If customerChain.FindFirst() then;


                "Production Registration".CalcFields("Base UOM Name", "Purch. UOM Name", "Sales. UOM Name");
                If UOM <> '' then
                    UOMBASE := UOM + ' (' + "Base UOM Name" + ')'
                Else
                    UOMBASE := '';

                If "Purch. UOM" <> '' then
                    UOMPurch := "Purch. UOM" + ' (' + "Purch. UOM Name" + ')'
                Else
                    UOMPurch := "Purch. UOM";

                If "Sales. UOM" <> '' then
                    UOMSales := "Sales. UOM" + ' (' + "Sales. UOM Name" + ')'
                Else
                    UOMSales := "Sales. UOM";



                VATProduct.Reset();
                VATProduct.setrange("VAT Prod. Posting Group", "Default VAT Posting Group");
                if VATProduct.FindFirst() then begin
                    VAT7Mark := VATProduct."VAT %" <> 0;
                    VAT0Mark := VATProduct."VAT %" = 0;
                end;

                GenProd.setrange(Code, "Gen. Product Posting Group");
                if GenProd.FindFirst() then begin
                    case GenProd."Code for Reg. Reporting" of
                        '01':
                            Item01 := true;
                        '02':
                            Item02 := true;
                        '03':
                            Item03 := true;
                        '04':
                            Item04 := true;
                        '05':
                            Item05 := true;
                        '06':
                            Item06 := true;

                    end;
                end;



                Case "Item Goods Type" of
                    "Item Goods Type"::New:
                        NewCategory := true;
                    "Item Goods Type"::Core:
                        CoreCategory := true;

                end;

                If ItemBrandType.Get("Item Brand") then;


                if ItemTrackingCode.get("Item Tracking Code") then begin
                    Case ItemTrackingCode."Code for Registration" of
                        'NORMAL':
                            Normal := true;
                        'LOT':
                            Lot := true;
                        'LOTEXPIRE':
                            LotExpire := true;
                        'LOTSERIAL':
                            LotSerial := true;
                    End;
                end;

                if companyRec.get("Company Name") then begin
                    CompanyInfo.ChangeCompany(companyRec.Name);
                    CompanyInfo.get();
                    case CompanyInfo."Code for Registration" of
                        '01':
                            ComBio := true;
                        '02':
                            ComNutri := true;
                        '03':
                            ComProTest := true;
                        '04':
                            ComFitandin := true;
                        '05':
                            Comspecial := true;
                        '06':
                            ComPedX := true;

                    end;
                end;
                If UnitOfMeasureSUB.Get(UOM) Then;
                If UnitOfMeasurePurch.Get("Purch. UOM") Then;
                If UnitOfMeasureSales.Get(UOM) Then;




                ItemSupgroup1.Reset();
                ItemSupgroup1.SetRange(Code, MainCategory);
                If ItemSupgroup1.FindFirst() then;

                If ItemCatagory.Get(SubCategory) then;



            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {

            }
        }

        actions
        {
            area(processing)
            {

            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/ReportProductRegistration.rdlc';
        }
    }

    trigger OnPreReport()

    begin

    end;

    var
        UOMBASE: Text;
        UOMPurch: Text;
        UOMSales: Text;
        customerChain: Record customerChain;
        ItemCatagory: Record "Item Category";
        ItemSupgroup1: Record Itemsubgroup1;
        UnitOfMeasureSUB: Record "Unit of Measure";
        UnitOfMeasurePurch: Record "Unit of Measure";
        UnitOfMeasureSales: Record "Unit of Measure";
        ItemTrackingCode: Record "Item Tracking Code";
        VendorG: Record Vendor;
        companyRec: Record Company;
        CompanyInfo: Record "Company Information";
        VATProduct: Record "VAT Posting Setup";
        GenProd: Record "Gen. Product Posting Group";
        ItemBrandType: Record Itembrand;
        VAT7Mark: Boolean;
        VAT0Mark: Boolean;
        Item01: Boolean;
        Item02: Boolean;
        Item03: Boolean;
        Item04: Boolean;
        Item05: Boolean;
        Item06: Boolean;


        ComBio: Boolean;
        ComNutri: Boolean;
        ComProTest: Boolean;
        ComFitandin: Boolean;
        Comspecial: Boolean;
        ComPedX: Boolean;

        NewCategory: Boolean;
        CoreCategory: Boolean;
        OEMCategory: Boolean;

        Normal: Boolean;
        Lot: Boolean;
        LotExpire: Boolean;
        LotSerial: Boolean;
        COther: Boolean;


}