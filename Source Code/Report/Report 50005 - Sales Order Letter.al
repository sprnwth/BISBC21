report 50005 LetterofOrder
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'ฟอร์มซองจดหมาย';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }

            column(SellToCutomerName; "Sell-to Customer Name")
            {

            }
            column(ShipToCode; "Ship-to Code")
            {

            }
            column(ShipToName; "Ship-to Name")
            {

            }
            column(ShipToAddress; ShiptoAddress1)
            {

            }
            column(ShipToAddress2; ShiptoAddress2)
            {

            }
            column(ShipToCity; "Ship-to City")
            {

            }
            column(ShipToPostCode; "Ship-to Post Code")
            {

            }
            column(CompanyName; CompanyNameText)
            {

            }
            column(CompanyAdress1; CompanyInfo.Address)
            {

            }
            column(CompanyAdress2; CompanyInfo."Address 2")
            {

            }
            column(CompanyZipcode; CompanyInfo."Ship-to City")
            {

            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {

            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {

            }
            column(CompanyPic; CompanyInfo.Picture)
            {

            }
            column(CompCity; CompanyInfo.City)
            {

            }
            column(CompPostcode; CompanyInfo."Post Code")
            {

            }
            column(CompanyAddress; CompanyAddress)
            {

            }
            column(CompanyTaxID; CompanyInfo."VAT Registration No.")
            {

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                CompanyAddress := CompanyInfo.Address + ' '
                                   + CompanyInfo."Address 2"
                                   + CompanyInfo.City
                                   + CompanyInfo."Post Code";

                CompanyNameText := CompanyInfo.Name;

                //NWTH-STH 08052023
                IF EngFormSelector THEN begin
                    CompanyAddress := CompanyInfo."NWTH 2nd Address" + ' ' + CompanyInfo."NWTH 2nd Address 2" + ' ' + CompanyInfo."Post Code";


                    CompanyNameText := CompanyInfo."NWTH 2nd Name" + ' ' + CompanyInfo."NWTH 2nd Name 2";
                end;
                CustomerG.Reset();
                CustomerG.SetRange("No.", "Sell-to Customer No.");
                If CustomerG.FindFirst() then;
                //NWTTH-STH
                CalcFields("Ship-to Thambon", "Ship-to Amphur");
                Clear(ShiptoAddress1);
                Clear(ShiptoAddress2);
                If "Ship-to Code" <> '' then begin
                    ShiptoAddressG.Reset();
                    ShiptoAddressG.SetRange(Code, "Sales Header"."Ship-to Code");
                    ShiptoAddressG.SetRange("Customer No.", "Sales Header"."Sell-to Customer No.");
                    If ShiptoAddressG.FindFirst() then begin
                        ShiptoAddress1 := ShiptoAddressG.Address + ' ' + ShiptoAddressG.Thambon + ' ' + ShiptoAddressG.Amphur;
                        ShiptoAddress2 := ShiptoAddressG.City + ' ' + ShiptoAddressG."Post Code" + ' Tel . ' + ShiptoAddressG."Phone No.";
                    end;
                end Else begin
                    ShiptoAddress1 := CustomerG.Address + ' ' + CustomerG."NWTH Sub-District" + ' ' + CustomerG."NWTH District";
                    ShiptoAddress2 := CustomerG."NWTH Province" + ' ' + CustomerG."Post Code" + ' Tel . ' + CustomerG."Phone No.";
                end;

                // CalcFields("Ship-to Thambon", "Ship-to Amphur");
                // Clear(ShiptoAddress1);
                // Clear(ShiptoAddress2);

                // ShiptoAddress1 := ShiptoAddressG.Address + ' ' + ShiptoAddressG.Thambon + ' ' + ShiptoAddressG.Amphur;
                // ShiptoAddress2 := ShiptoAddressG.City + ' ' + ShiptoAddressG."Post Code" + ' ' + ShiptoAddressG."Receive Good Condition" + ' ' + ShiptoAddressG."Phone No.";



                // if "Ship-to Address" <> '' then
                //     ShiptoAddress1 += "Ship-to Address";

                // if "Ship-to Address 2" <> '' then
                //     ShiptoAddress1 += ' ' + "Ship-to Address 2";

                // if "Ship-to Thambon" <> '' then
                //     ShiptoAddress1 += ' ' + "Ship-to Thambon"
                // else
                //     ShiptoAddress1 += ' ' + CustomerG."NWTH Sub-District";

                // if "Ship-to Amphur" <> '' then
                //     ShiptoAddress1 += ' ' + "Ship-to Amphur"
                // else
                //     ShiptoAddress1 += ' ' + CustomerG."NWTH District";

                // if "Ship-to City" <> '' then
                //     Shiptoaddress2 := "Ship-to City";

                // if "Ship-to Post Code" <> '' then
                //     Shiptoaddress2 += ' ' + "Ship-to Post Code";

                //NWTH-STH


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
                    field(Engform; EngFormSelector)
                    {
                        Caption = 'English Format Form';

                    }
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
            LayoutFile = './Source Code/ReportLayout/letterSO.rdlc';
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        CompanyAddress: Text;
        CustomerG: Record Customer;
        ShiptoAddressG: Record "Ship-to Address";
        ShiptoAddress1: Text;
        Shiptoaddress2: Text;
        EngFormSelector: Boolean;
        CompanyNameText: Text[250];
    // SalesOrder: Record Com
}