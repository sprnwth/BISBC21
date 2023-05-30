pageextension 50016 "Item Card" extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field("FDA No."; Rec."FDA No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Base Unit of Measure")
        {
            field("Base UOM Description"; Rec."Base UOM Description")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

        addafter("Sales Unit of Measure")
        {
            field("Sale UOM Description"; Rec."Sale UOM Description")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

        addafter("Purch. Unit of Measure")
        {
            field("Purch. UOM Description"; Rec."Purch. UOM Description")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

        addlast(Item)
        {
            field("Goods Type"; Rec."Goods Type")
            {
                ApplicationArea = All;

            }
            field(Brand; Rec.Brand)
            {
                ApplicationArea = All;

            }
            field("Sub Group 1"; Rec."Sub Group 1")
            {
                ApplicationArea = All;

            }
            field("Sub Grop 2"; Rec."Sub Grop 2")
            {
                ApplicationArea = All;

            }
        }
    }
    actions
    {
        addafter(Identifiers)
        {
            action("Product Registration")
            {
                ApplicationArea = All;
                Image = New;
                trigger OnAction()
                var
                    ProductRegisterRec: Record "Product Registration";
                    ProductRegister: Page "Product Registration List";
                begin
                    ProductRegisterRec.setrange("Item No.", Rec."No.");
                    ProductRegister.SetTableView(ProductRegisterRec);
                    ProductRegister.Run();
                end;
            }
        }
    }
}
