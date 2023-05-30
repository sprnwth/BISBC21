pageextension 50015 "Item List" extends "Item List"
{
    layout
    {
        //Remove Unnessarry++
        modify("NWTH 2nd Description")
        {
            Visible = false;
        }
        modify("Unit Cost")
        {
            Visible = false;
        }
        modify("Production BOM No.")
        {
            Visible = false;
        }
        modify("Routing No.")
        {
            Visible = false;
        }
        modify("NWTH WHT Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Substitutes Exist")
        {
            Visible = false;
        }
        modify("Cost is Adjusted")
        {
            Visible = false;
        }
        modify("Search Description")
        {
            Visible = false;
        }
        modify("Default Deferral Template Code")
        {
            Visible = false;
        }
        modify(Type)
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
        //Remove Unnessarry--

        addafter("No.")
        {
            field("FDA No."; Rec."FDA No.")
            {
                ApplicationArea = All;

            }
        }
        //ADD BIS++
        addlast(Control1)
        {

            field(Grade; Rec.Grade)
            {
                ApplicationArea = All;

            }
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
        //ADD BIS--

    }
    actions
    {
        addafter(Reports)
        {

            action("Stock BIS")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Report.run(Report::"Stock BIS");
                end;
            }
            action("รายงานสินค้าและวัตถุดิบ")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    ItemByLot: Report "Item Movement By Lot";
                begin
                    ItemByLot.Run();
                end;
            }
            action("รายงานสินค้าที่กำลังหมดอายุ")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    ItemExpiredTerm: Report "Item Expiration Term";
                begin
                    ItemExpiredTerm.Run();
                end;
            }
            action("รายงานสินค้าไม่เคลื่อนไหว")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    ItemnoMovment: Report "Item Non Movement";
                begin
                    ItemnoMovment.Run();
                end;

            }
        }
        addafter("Item Register")
        {
            action("Product Registration")
            {
                ApplicationArea = All;
                Image = New;
                caption = 'ขึ้นทะเบียนสินค้า';
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
