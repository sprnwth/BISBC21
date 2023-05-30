pageextension 50105 PurchExpSubformExt extends "NWTH Purch. Expense Subform"
{
    layout
    {
        // Add changes to page layout here

        modify(Quantity)
        {
            trigger OnAfterValidate()

            begin
                CurrPage.SaveRecord();
                CurrPage.Update();
            end;
        }
        modify("Direct Unit Cost")
        {
            trigger OnAfterValidate()

            begin
                CurrPage.SaveRecord();
                CurrPage.Update();
            end;
        }

        moveafter("No."; "Gen. Bus. Posting Group")
        moveafter("Gen. Bus. Posting Group"; "Gen. Prod. Posting Group")
        //movebefore("Gen. Prod. Posting Group"; "No.")
        addafter("No.")
        {
          
            field("Salvage Value"; Rec."Salvage Value")
            {
                ApplicationArea = All;
                Editable = true;
            }
        }


    }

    actions
    {
        // Add changes to page actions here
        // addlast("F&unctions")
        // {
        //     action("Refresh")
        //     {
        //         ApplicationArea = All;
        //         Promoted = true;
        //         Image = Refresh;
        //         trigger OnAction()
        //         begin
        //             DeltaUpdateTotals();
        //             CurrPage.Activate();
        //             CurrPage.Update();;                    
        //         end;
        //     }
        // }
    }

    var
        myInt: Integer;
}