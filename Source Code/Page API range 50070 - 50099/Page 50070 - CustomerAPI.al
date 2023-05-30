page 50070 CustomerBISAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'customerBISAPI';
    DelayedInsert = true;
    EntityName = 'biscustomer';
    EntitySetName = 'biscustomers';
    PageType = API;
    SourceTable = Customer;
    ODataKeyFields = SystemId;
    // ModifyAllowed = true;
    // InsertAllowed = true;
    // DeleteAllowed = true;
    // Editable = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }

                field(nwthSubDistrict; Rec."NWTH Sub-District")
                {
                    Caption = 'Thambol';
                }
                field(nwthDistrict; Rec."NWTH District")
                {
                    Caption = 'Amphur';
                }
                field(nwthProvince; Rec."NWTH Province")
                {
                    Caption = 'Province';
                }
                field(postcode; Rec."Post Code")
                {

                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                }
                field(nwthWHTBusPostingGroup; Rec."NWTH WHT Bus. Posting Group")
                {
                    Caption = 'Thai WHT Business Posting Group';
                }
                field(nwthBuildingName; Rec."NWTH Building Name")
                {
                    Caption = 'Building Name';
                }
                field(nwthVillageName; Rec."NWTH Village Name")
                {
                    Caption = 'Village Name';
                }
                field(nwthBranchCode; Rec."NWTH Branch Code")
                {
                    Caption = 'Thai Branch Code';
                }
                field(nwthRoomNo; Rec."NWTH Room No.")
                {
                    Caption = 'Room No.';
                }
                field(nwthFloorNo; Rec."NWTH Floor No.")
                {
                    Caption = 'Floor No.';
                }
                field(nwthAddressNo; Rec."NWTH Address No.")
                {
                    Caption = 'Address No.';
                }
                field(nwthVillageNo; Rec."NWTH Village No.")
                {
                    Caption = 'Village No.';
                }
                field(nwthAlley; Rec."NWTH Alley")
                {
                    Caption = 'Soi';
                }
                field(nwthRoad; Rec."NWTH Road")
                {
                    Caption = 'Road';
                }
                field(nwthWHTName; Rec."NWTH WHT Name")
                {
                    Caption = 'WHT Name';
                }
                field(nwthWHTSurname; Rec."NWTH WHT Surname")
                {
                    Caption = 'WHT Surname';
                }
                field(nwthNameTitle; Rec."NWTH Name Title")
                {
                    Caption = 'Name Title';
                }
                field(personalID; Rec."Personal ID")
                {
                    Caption = 'Personal ID';
                }
                field(latitude; Rec.Latitude)
                {
                    Caption = 'Latitude';
                }
                field(longitude; Rec.Longtitue)
                {
                    Caption = 'Longtitue';
                }
                field(grade; Rec.Grade)
                {
                    Caption = 'Grade';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {

                }
                field(registeredDate; Rec."Registered Date")
                {
                    Caption = 'Registered Date';
                }
                field(custproducttype; Rec."Item Group Type")
                {
                    Caption = 'Item group Type';
                }
                field(estMonthlySales; Rec."Est. Monthly Sales")
                {
                    Caption = 'Est. Monthly Sales';
                }
                field(customerChainCode; Rec."Customer Chain Code")
                {
                    Caption = 'Customer Chain Code';
                }
                field(customerCapacity; Rec."Customer Capacity")
                {
                    Caption = 'Customer Capacity';
                }
                field(referenceNo; Rec."Reference No.")
                {
                    Caption = 'Reference No.';
                }
                field(customerChainName; Rec."Customer Chain Name")
                {
                    Caption = 'Customer Chain Name';
                }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    Editable = false;
                }
                field(customertype; Rec."Customer Type")
                {

                }

                field(businesstype; Rec."Business Type")
                {

                }
                field(creditlimit; Rec."Credit Limit (LCY)")
                {

                }
                field(balancelcy; Rec."Balance (LCY)")
                {

                }
                field(remaincredit; Rec."Credit Limit (LCY)" - Rec."Balance (LCY)")
                {

                }
                field(pricesincludingvat; Rec."Prices Including VAT")
                {

                }
                field(forcenonvatsale; Rec."Force NON VAT Sale")
                {

                }
                field(systemid; Rec.SystemId)
                {

                }
            }
        }
    }

    trigger OnInsertRecord(BelowRec: Boolean): Boolean
    begin
        Rec.Blocked := rec.Blocked::All;
    end;
}
