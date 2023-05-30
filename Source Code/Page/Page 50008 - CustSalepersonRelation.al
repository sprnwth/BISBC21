page 50008 "Cust Saleperson Relation"
{
    ApplicationArea = All;
    Caption = 'Cust Saleperson Relation';
    PageType = List;
    SourceTable = "Customer Saleperson Relation";
    UsageCategory = Lists;    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer no."; Rec."Customer no.")
                {
                    ToolTip = 'Specifies the value of the Customer no. field.';
                }
                field("Sale Personcode"; Rec."Sale Personcode")
                {
                    ToolTip = 'Specifies the value of the Sale Personcode field.';
                }
            }
        }
    }
}
