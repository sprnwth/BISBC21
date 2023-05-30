codeunit 50007 "BIS Event Respond"
{
    procedure CheckCreditControlNotPassCode(): code[128];
    begin
        Exit(UpperCase('CheckCreditControlNotPass'));
    end;

    procedure CheckCreditControlNotPassFunction(SalesHeader: Record "Sales Header")
    begin
        SalesHeader.CheckCreditControlBIS();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', true, true)]
    local procedure AddMyWorkflowResponsesToLibrary()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        WorkflowResponseHandling.AddResponseToLibrary(CheckCreditControlNotPassCode(), Database::"Sales Header", 'BIS Credit Control Respond', 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', true, true)]
    procedure ExecuteMyWorkflowResponses(ResponseWorkflowStepInstance: Record "Workflow Step Instance"; var ResponseExecuted: Boolean; var Variant: Variant; xVariant: Variant)
    var
        WorkflowResponse: record "Workflow Response";
    begin
        if WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") then
            case WorkflowResponse."Function Name" of
                CheckCreditControlNotPassCode:
                    BEGIN
                        CheckCreditControlNotPassFunction(Variant);
                        ResponseExecuted := TRUE;
                    END;
            END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure AddMyworkflowEventOnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowEventHandling: codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        Case ResponseFunctionName of
            CheckCreditControlNotPassCode():
                WorkflowResponseHandling.AddResponsePredecessor(CheckCreditControlNotPassCode(), WorkflowEventHandling.RunWorkflowOnSendSalesDocForApprovalCode());
        End
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure AddWorkflowEventHierarchiesToLibrary(EventFunctionName: Code[128])
    var
        WorkflowEventHandling: codeunit "Workflow Event Handling";
        SalesHeader: Record "Sales Header";
        CreditControlEvent: Codeunit "BIS Workflow Event Handling";
    begin
        Case EventFunctionName of
            CreditControlEvent.PassCheckCreditofCustomerCode():
                begin

                    WorkflowEventHandling.AddEventPredecessor(CheckCreditControlNotPassCode(), WorkflowEventHandling.RunWorkflowOnSendSalesDocForApprovalCode());
                    WorkflowEventHandling.AddEventPredecessor(CheckCreditControlNotPassCode(), CreditControlEvent.NotPassCheckCreditofCustomerCode());
                    WorkflowEventHandling.AddEventPredecessor(CheckCreditControlNotPassCode(), CreditControlEvent.PassCheckCreditofCustomerCode());
                end;
            CreditControlEvent.NotPassCheckCreditofCustomerCode():
                begin

                    WorkflowEventHandling.AddEventPredecessor(CheckCreditControlNotPassCode(), WorkflowEventHandling.RunWorkflowOnSendSalesDocForApprovalCode());
                    WorkflowEventHandling.AddEventPredecessor(CheckCreditControlNotPassCode(), CreditControlEvent.NotPassCheckCreditofCustomerCode());
                    WorkflowEventHandling.AddEventPredecessor(CheckCreditControlNotPassCode(), CreditControlEvent.PassCheckCreditofCustomerCode());
                end;
        End
    end;

    //Product Register++
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    // local procedure OnOpenProductRegister(RecRef: RecordRef; var Handled: Boolean)
    // var
    //     ProdReg: Record "Product Registration";
    // begin
    //     Case
    //         RecRef.Number of
    //         Database::"Product Registration":
    //             begin
    //                 RecRef.SetTable(ProdReg);
    //                 ProdReg.Status := ProdReg.Status::Open;
    //                 ProdReg.Modify();
    //                 Handled := true;
    //             end;
    //     End;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    // local procedure OnReleaseProductRegister(RecRef: RecordRef; var Handled: Boolean)
    // var
    //     ProdReg: Record "Product Registration";
    // begin
    //     Case
    //         RecRef.Number of
    //         Database::"Product Registration":
    //             begin
    //                 RecRef.SetTable(ProdReg);
    //                 ProdReg.Status := ProdReg.Status::Release;
    //                 ProdReg.Modify();
    //                 Handled := true;
    //             end;
    //     End;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    // local procedure OnPendingProductRegister(RecRef: RecordRef; var IsHandled: Boolean; var Variant: Variant)
    // var
    //     ProdReg: Record "Product Registration";
    // begin
    //     Case
    //         RecRef.Number of
    //         Database::"Product Registration":
    //             begin
    //                 RecRef.SetTable(ProdReg);
    //                 ProdReg.Status := ProdReg.Status::"Pending Approval";
    //                 ProdReg.Modify();
    //                 IsHandled := true;
    //             end;
    //     End;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    // local procedure OnAddProductRegWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    // var
    //     WorkflowRespondHandling: Codeunit "Workflow Response Handling";
    //     BISWorkflowEvent: Codeunit "BIS Workflow Event Handling";
    // begin
    //     case
    //         ResponseFunctionName of
    //         WorkflowRespondHandling.SetStatusToPendingApprovalCode():
    //             begin
    //                 WorkflowRespondHandling.AddResponsePredecessor(WorkflowRespondHandling.SetStatusToPendingApprovalCode()
    //                                         , BISWorkflowEvent.runworkflowonsendproductApprovalCode());
    //             end;
    //         WorkflowRespondHandling.SendApprovalRequestForApprovalCode():
    //             begin
    //                 WorkflowRespondHandling.AddResponsePredecessor(WorkflowRespondHandling.SendApprovalRequestForApprovalCode()
    //                                    , BISWorkflowEvent.runworkflowonsendproductApprovalCode());
    //             end;

    //         WorkflowRespondHandling.CancelAllApprovalRequestsCode():
    //             begin
    //                 WorkflowRespondHandling.AddResponsePredecessor(WorkflowRespondHandling.CancelAllApprovalRequestsCode()
    //                                 , BISWorkflowEvent.runworkflowoncancelproductApprovalCode());
    //             end;
    //         WorkflowRespondHandling.OpenDocumentCode():
    //             begin
    //                 WorkflowRespondHandling.AddResponsePredecessor(WorkflowRespondHandling.OpenDocumentCode()
    //                                 , BISWorkflowEvent.runworkflowoncancelproductApprovalCode());
    //             end;
    //     end;
    // end;
    // //Product Register--

    // //Setup Product Register by Code ++
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
    // local procedure OnAddProdRegWorkflowCategoriesToLibrary()
    // begin
    //     WorkflowSetup.InsertWorkflowCategory(ProdRegCatgoryTxt, ProdRegCategoryDescTxt);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', true, true)]
    // local procedure OnAfterInsertApprovalsTableRelations()
    // var
    //     AppEntry: Record "Approval Entry";
    // begin
    //     WorkflowSetup.InsertTableRelation(Database::"Product Registration", 2, Database::"Approval Entry",
    //                                     AppEntry.FieldNo("Record ID to Approve"));
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowTableRelationsToLibrary', '', false, false)]
    // local procedure AddWorkflowTableRelationsToLibrary()
    // var
    //     WorkflowSetup: Codeunit "Workflow Setup";
    // begin
    //     WorkflowSetup.InsertTableRelation(Database::"Product Registration", 2, Database::"Approval Entry", 2);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    // local procedure OnInsertWorkflowTemplates()
    // begin
    //     InsertProdRegTemplate();
    // end;

    // local procedure InsertProdRegTemplate()
    // var
    //     Workflow: Record Workflow;
    // begin
    //     WorkflowSetup.InsertWorkflowTemplate(Workflow, ProdRegWorkflowCodeTxt, ProdRegworkflowDescTxt, ProdRegCatgoryTxt);
    //     InsertProdRegApprovalWorkflowDetails(Workflow);
    //     WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
    // end;

    // local procedure InsertProdRegApprovalWorkflowDetails(var workflow: Record Workflow)
    // var
    //     workflowstepagrument: Record "Workflow Step Argument";
    //     BlankDateFormula: DateFormula;
    //     BISWorkflowEvent: Codeunit "BIS Workflow Event Handling";
    //     WorkflowRespondHandling: Codeunit "Workflow Response Handling";
    //     ProdReg: Record "Product Registration";
    // begin
    //     WorkflowSetup.InitWorkflowStepArgument(workflowstepagrument,
    //     workflowstepagrument."Approver Type"::Approver, workflowstepagrument."Approver Limit Type"::"Specific Approver",
    //     0, '', BlankDateFormula, true);

    //     WorkflowSetup.InsertDocApprovalWorkflowSteps(
    //             workflow,
    //             BuildProdRegCondition(ProdReg.Status::Open),
    //             BISWorkflowEvent.runworkflowonsendproductApprovalCode(),
    //             BuildProdRegCondition(ProdReg.Status::"Pending Approval"),
    //             BISWorkflowEvent.runworkflowoncancelproductApprovalCode(),
    //             workflowstepagrument,
    //             TRUE
    //     );
    // end;

    // local procedure BuildProdRegCondition(StatusV: enum "Product Register Status"): Text
    // var
    //     ProdReg: Record "Product Registration";
    // begin
    //     ProdReg.SetRange(Status, StatusV);
    //     Exit(StrSubstNo(ProdRegCondTxt, WorkflowSetup.Encode(ProdReg.GetView(false))));
    // end;

    // //Setup Product Register by Code --

    // //Access Page++
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', true, true)]
    // local procedure OnAfterGetProdRegPageID(RecordRef: RecordRef; var PageID: Integer)
    // begin
    //     Case RecordRef.Number of
    //         Database::"Product Registration":
    //             begin
    //                 PageID := Page::"Product Registration Card"
    //             end;

    //     end;
    // end;
    //Access Page--
    var
        WorkflowSetup: Codeunit "Workflow Setup";
        ProdRegCatgoryTxt: Label 'PRODREG';
        ProdRegCategoryDescTxt: Label 'Product Register';
        ProdRegWorkflowCodeTxt: Label 'PRODREGISTER';
        ProdRegworkflowDescTxt: Label 'Product Register Workflow';
        ProdRegCondTxt: Label '<?xml version = “1.0” encoding=”utf-8” standalone=”yes”?><ReportParameters><DataItems><DataItem name=”Claim”>%1</DataItem></DataItems></ReportParameters>';

}