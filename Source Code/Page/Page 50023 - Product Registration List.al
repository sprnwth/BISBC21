page 50023 "Product Registration List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Product Registration";
    CardPageId = "Product Registration Card";
    Editable = false;

    layout
    {
        area(Content)
        {

            repeater(Group)
            {
                field("Date"; rec.Date)
                {
                }
                field(Status; Rec.Status)
                {

                }              
                field("Register Item No.";Rec."Register Item No.")
                {
                    
                }
                field("Product Name"; rec."Product Name")
                {
                }

                field("Supplier Code"; rec."Supplier Code")
                {
                }

                field("Default VAT Posting Group"; Rec."Default VAT Posting Group")
                {
                }

                field("Min. Order"; rec."Min. Order")
                {
                }

                field("Product L/T"; rec."Product L/T")
                {
                }

            }
        }
    }

    actions
    {
        area(Reporting)
        {

            action("ใบขึ้นทะเบียนสินค้าใหม่")
            {
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Register;

                trigger OnAction()
                var
                    ProdReg: Record "Product Registration";
                begin
                    ProdReg.Reset();
                    ProdReg.setrange("Register Item No.",Rec."Register Item No.");
                    Report.Run(Report::"Production Registration", true, true, ProdReg);
                end;
            }
        }
        area(Processing)
        {
            // group(Approval)
            // {
            //     action(Approve)
            //     {
            //         image = Approve;
            //         Promoted = true;
            //         PromotedCategory = Process;
            //         trigger OnAction()
            //         var
            //             ApprovalMgt: Codeunit "Approvals Mgmt.";
            //         begin
            //             ApprovalMgt.ApproveRecordApprovalRequest(Rec.RecordId);
            //         end;
            //     }
            //     action("Send Approval Request")
            //     {
            //         ApplicationArea = All;
            //         Image = SendApprovalRequest;
            //         Promoted = true;
            //         PromotedCategory = Process;
            //         trigger OnAction()
            //         var
            //             BISWorkflowEvent: Codeunit "BIS Workflow Event Handling";
            //         begin
            //             if BISWorkflowEvent.ProductRegisterFlowEnable(Rec) then
            //                 BISWorkflowEvent.OnSendProductforApproval(Rec);
            //         end;
            //     }
            //     action("Cancel Approval Request")
            //     {
            //         ApplicationArea = All;
            //         Image = CancelApprovalRequest;
            //         Promoted = true;
            //         PromotedCategory = Process;
            //         trigger OnAction()
            //         var
            //             BISWorkflowEvent: Codeunit "BIS Workflow Event Handling";
            //         begin
            //             BISWorkflowEvent.OnCancelProductforApproval(Rec);
            //         end;
            //     }
            // }
            action("Convert to Item")
            {

                trigger OnAction()
                var
                    MainBISCU: Codeunit "BIS Main Function";
                begin
                    MainBISCU.RegisterItem(Rec."Register Item No.");
                    //RegisterItem.RegisterItem(Rec."Draft No.");
                end;
            }
        }
    }

    var
        myInt: Integer;

}