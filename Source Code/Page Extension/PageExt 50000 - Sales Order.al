pageextension 50000 SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter("Ship-to Address 2")
        {
            field("Ship-to Thambon"; Rec."Ship-to Thambon")
            {
                ApplicationArea = All;
                Importance = Additional;

            }
            field("Ship-to Amphur"; Rec."Ship-to Amphur")
            {
                ApplicationArea = All;
                Importance = Additional;

            }
        }

        // Add changes to page layout here
        addafter("External Document No.")
        {
            field("Sales Area"; Rec."Sales Area")
            {
                ApplicationArea = All;

            }
            field("Customer Area"; Rec."Customer Area")
            {
                ApplicationArea = All;

            }

            field("BIS Sales Person"; Rec."BIS Sales Person")
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
            field("Shipping No. Series"; Rec."Shipping No. Series")
            {
                ApplicationArea = All;
                Importance = Additional;

            }
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Release Date"; Rec."Release Date")
            {
                ApplicationArea = All;
                Importance = Additional;
                Editable = false;
            }
            field("Release Time"; Rec."Release Time")
            {
                ApplicationArea = All;
                Importance = Additional;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("F&unctions")
        {
            action("NWTH Admin VAT")
            {
                ApplicationArea = All;
                visible = false;
                trigger OnAction()
                var

                    SalesHeader: Record "Sales Header";
                    TempSalesLine: Record "Sales Line" temporary;
                    subtotal: Decimal;
                    vatbaseamt: Decimal;
                    VATAmount: Decimal;
                    InvDiscountPCT: Decimal;
                    InvDiscountAmount: Decimal;
                    totallineamt: Decimal;
                    OrdeIn: Codeunit "Document Totals";
                    SalesPost: Codeunit "Sales-Post";
                    TempVATAmountLine: Record "VAT Amount Line" temporary;
                    NonVATAmt: Decimal;
                begin
                    VATAmount := 0;
                    InvDiscountAmount := 0;
                    InvDiscountPCT := 0;
                    subtotal := 0;
                    vatbaseamt := 0;
                    totallineamt := 0;

                    Clear(TempSalesLine);
                    Clear(SalesPost);
                    TempVATAmountLine.DeleteAll();
                    TempSalesLine.DeleteAll();
                    SalesPost.GetSalesLines(Rec, TempSalesLine, 0);

                    TempSalesLine.CalcVATAmountLines(0, Rec, TempSalesLine, TempVATAmountLine);
                    TempSalesLine.UpdateVATOnLines(0, Rec, TempSalesLine, TempVATAmountLine);
                    vatbaseamt := TempVATAmountLine.GetTotalVATBase();

                    Message('%1 %2 %3 %4 %5',
                    TempVATAmountLine.GetTotalAmountInclVAT(),
                    TempVATAmountLine.GetTotalInvDiscBaseAmount(true, ''),
                    TempVATAmountLine.GetTotalLineAmount(true, ''),
                    TempVATAmountLine.Count
                    )


                end;
            }
            action("ฟอร์มจดหมาย (คลัง)")
            {
                ApplicationArea = All;
                image = Print;
                trigger OnAction()
                var
                    LetterReport: Report LetterofOrder;
                    SalesHdr: Record "Sales Header";
                begin
                    SalesHdr.SetRange("No.", Rec."No.");
                    LetterReport.SetTableView(SalesHdr);
                    LetterReport.Run();
                    //LetterReport.Run();
                end;
            }
            action("Test Credit Limit")
            {
                ApplicationArea = All;
                Visible = false;
                trigger OnAction()

                begin
                    //SaleSubcriber.FindCreditControlCondition(Rec."No.", Rec."Sell-to Customer No.");
                    Rec.CheckCreditControlBIS();
                end;
            }
        }
    }

    var
        myInt: Query "Item By Lot No. Item Ledg.";
}