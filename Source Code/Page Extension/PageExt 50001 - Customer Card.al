pageextension 50001 CustomerBISExt extends "Customer Card"
{

    layout
    {
        addafter(General)
        {
            group(BIS)
            {
                field("Force NON VAT Sale"; Rec."Force NON VAT Sale")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        VATProd: Record "VAT Product Posting Group";
                    begin
                        VATProd.setrange("Default NON VAT Sale", true);
                        VATProd.FindFirst();
                    end;
                }
                field("Registered Date"; Rec."Registered Date")
                {
                    ApplicationArea = All;

                }
                field("Customer Capacity"; Rec."Customer Capacity")
                {
                    ApplicationArea = All;
                }
                field("Business Type"; Rec."Business Type")
                {
                    ApplicationArea = All;

                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;

                }
                field("Reference Number"; Rec."Reference Number")
                {
                    ApplicationArea = All;

                }
                field("Item Group Type"; Rec."Item Group Type")
                {
                    ApplicationArea = All;

                }
                field("Est. Monthly Sales"; Rec."Est. Monthly Sales")
                {
                    ApplicationArea = All;

                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = All;

                }
                field("Customer Chain Code"; Rec."Customer Chain Code")
                {
                    ApplicationArea = All;

                }
                field(Authorization; Rec.Authorization)
                {
                    ApplicationArea = All;

                }
                field("Personal ID"; Rec."Personal ID")
                {
                    ApplicationArea = All;

                }
                field("Customer Type"; Rec."Customer Type")
                {
                    ApplicationArea = All;

                }
            }
        }

        // Add changes to page layout here
        addafter(ShowMap)
        {

            field(Latitude; Rec.Latitude)
            {
                ApplicationArea = All;
                DecimalPlaces = 6 : 6;
            }
            field(Longtitue; Rec.Longtitue)
            {
                ApplicationArea = All;
                DecimalPlaces = 6 : 6;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Customer")
        {
            action("Send Registration Request")
            {
                ApplicationArea = All;
                Image = GetEntries;


                trigger OnAction()
                var
                    url: Text;
                    Customer: Record Customer;

                    Email: Codeunit Email;
                    EmailMessage: Codeunit "Email Message";
                    TempBlob: Codeunit "Temp Blob";
                    InStr: Instream;
                    OutStr: OutStream;
                    ReportParameters: Text;
                    CustomerRegister: Record "Customer Registration";
                    RecRef: RecordRef;
                begin
                    Customer.reset;
                    CUstomer.SetFilter("No.", Rec."No.");
                    url := system.GetUrl(
                                              DefaultClientType::Web,
                                              CompanyName,
                                              ObjectType::Page,
                                              Page::"Customer Card",
                                              Customer,
                                              True);


                    TempBlob.CreateOutStream(OutStr);
                    CustomerRegister.reset;
                    CustomerRegister.setrange("Customer No.", Rec."No.");
                    if CustomerRegister.FindFirst() then begin
                        RecRef.Open(Database::"Customer Registration");
                        //RecRef.GetBySystemId(CustomerRegister.SystemId);
                        RecRef.GetTable(CustomerRegister);
                        Report.SaveAs(Report::"Customer Information", ReportParameters, ReportFormat::Pdf, OutStr, RecRef);
                        TempBlob.CreateInStream(InStr);

                        EmailMessage.Create('spr@naviworld-asia.com', 'Customer Registration', 'Customer Registration');
                        EmailMessage.AddAttachment('Customer ' + Rec."No." + '.pdf', 'PDF', InStr);
                        EmailMessage.AppendToBody(url);
                        // Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                        //Message('Email sent successfully.');
                        Email.OpenInEditorModally(EmailMessage);
                    end else
                        error('No Registration Record');
                end;
            }
            action("Combine Address 2")
            {
                ApplicationArea = All;
                Image = CollapseAll;
                trigger OnAction()
                var
                    BISCU: Codeunit "BIS Main Function";
                    Customer: Record Customer;
                begin
                    Customer.get(Rec."No.");
                    BISCU.MakeCustAddressFromWHTAddress(
                                      Customer."NWTH Building Name",
                                      Customer."NWTH Room No.",
                                      Customer."NWTH Floor No.",
                                      Customer."NWTH Address No.",
                                      Customer."NWTH Village No.",
                                      Customer."NWTH Village Name",
                                      Customer."NWTH Alley",
                                      Customer."NWTH Road",
                                      Customer."NWTH Sub-District",
                                      Customer."NWTH District",
                                      Customer."NWTH Province",
                                      Customer.Address,
                                      Customer."Address 2",
                                      true
                                      );
                    Customer.Modify(true);
                    Message('Update Address');
                end;
            }
            action("Saleperson Relation")
            {
                ApplicationArea = All;
                Image = SalesPerson;
                trigger OnAction()
                var
                    CustSaleRel: Record "Customer Saleperson Relation";
                begin
                    CustSaleRel.setrange("Customer no.", Rec."No.");
                    page.RunModal(0, CustSaleRel);
                end;
            }
            action("Customer Registration")
            {
                ApplicationArea = All;
                image = Registered;
                Caption = 'ขึ้นทะเบียนลูกค้า';
                trigger OnAction()
                var
                    custRegistered: Record "Customer Registration";
                    CustRegisteredPage: Page "Register Customer Card";
                begin
                    custRegistered.Reset();
                    custRegistered.setrange("Customer No.", Rec."No.");
                    CustRegisteredPage.SetTableView(custRegistered);
                    CustRegisteredPage.RunModal();
                end;
            }

            action(CusInformation)
            {
                caption = 'ข้อมูลขึ้นทะเบียนลูกค้า';
                ApplicationArea = All;
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
                    RegisterCus.SetRange("Customer No.", Rec."No.");
                    If RegisterCus.FindFirst() then
                        Report.Run(Report::"Customer Information", true, true, RegisterCus)
                    else
                        Error('No Registration data');
                end;
            }
        }
    }


    var
        myInt: Integer;
}