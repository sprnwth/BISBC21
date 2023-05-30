page 50010 ShiptoAddressAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'shiptoAPI';
    DelayedInsert = true;
    EntityName = 'bisshiptoaddress';
    EntitySetName = 'bisshiptoaddresses';
    PageType = API;
    SourceTable = "Ship-to Address";
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {

                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
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

                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }

                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                }

                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }

                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                }

                field(thambon; Rec.Thambon)
                {
                    Caption = 'Thambon';
                }
                field(amphur; Rec.Amphur)
                {
                    Caption = 'Amphur';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }

                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                }

                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                }


                field(receiveGoodCondition; Rec."Receive Good Condition")
                {
                    Caption = 'Receive Good Condition';
                }
                field(defaultcode; Rec."Default Code")
                {

                }

            }
        }
    }
}
