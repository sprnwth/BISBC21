page 50043 PaymentTermsAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'paymentTermsAPI';
    DelayedInsert = true;
    EntityName = 'bispaymentterm';
    EntitySetName = 'bispaymentterms';
    PageType = API;
    SourceTable = "Payment Terms";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(dueDateCalculation; Rec."Due Date Calculation")
                {
                    Caption = 'Due Date Calculation';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}
