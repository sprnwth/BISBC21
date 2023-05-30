pageextension 50036 PurchOrderBISExt extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
        addafter("Vendor Order No.")
        {
            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = All;

            }
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;

            }
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;

            }
           
        }

        // addafter(processing)
        // {

        // }

        // addafter("Area")
        // {
        //     group(Category_Category10)
        //     {
        //         action("XXX")
        //         {

        //         }
        //     }
        // }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        PagePO: Page "Purchase Order";
}