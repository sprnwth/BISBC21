codeunit 50006 "BIS Workflow Event Handling"
{
    trigger OnRun()
    begin

    end;

    procedure PassCheckCreditofCustomerCode(): Code[128]
    var
        myInt: Integer;
    begin
        Exit(UpperCase('PassCheckCreditofCustomer'));
    end;

    procedure NotPassCheckCreditofCustomerCode(): Code[128]
    var
        myInt: Integer;
    begin
        Exit(UpperCase('NotCheckCreditofCustomer'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    procedure PassCheckCustomerCredit()
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        WorkflowEventHandling.AddEventToLibrary(PassCheckCreditofCustomerCode(), Database::"Sales Header", 'BISCREDITPASS', 0, false);
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    procedure NotPassCheckCustomerCredit()
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        WorkflowEventHandling.AddEventToLibrary(NotPassCheckCreditofCustomerCode(), Database::"Sales Header", 'BISCREDITNOTPASS', 0, false);
    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnPassCheckCreditControl', '', true, true)]
    local procedure RunWorkflowOnPassCheckCreditControl(sender: Record "Sales Header")
    var
        WorkflowManagement: Codeunit "Workflow Management";

    begin
        WorkflowManagement.HandleEvent(PassCheckCreditofCustomerCode(), sender);
    end;


    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnNotPassCheckCreditControl', '', true, true)]
    local procedure RunWorkflowOnNotPassCheckCreditControl(sender: Record "Sales Header")
    var
        WorkflowManagement: Codeunit "Workflow Management";
    begin
        WorkflowManagement.HandleEvent(NotPassCheckCreditofCustomerCode(), sender);
    end;


    //Product Registration++
    // [IntegrationEvent(false, false)]
    // procedure OnSendProductforApproval(var ProductReg: Record "Product Registration")
    // begin

    // end;

    // [IntegrationEvent(false, false)]
    // procedure OnCancelProductforApproval(var ProductReg: Record "Product Registration")
    // begin

    // end;

    // //Handle Event
    // procedure runworkflowonsendproductApprovalCode(): Code[128]

    // begin
    //     exit(UpperCase('Runworkflowonsendproductapproval'));
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"BIS Workflow Event Handling", 'OnSendProductforApproval', '', true, true)]
    // local procedure RunWorkflowOnSendproductApproval(var ProductReg: Record "Product Registration")
    // var
    //     WorkflowManagement: Codeunit "Workflow Management";

    // begin
    //     WorkflowManagement.HandleEvent(runworkflowonsendproductApprovalCode(), ProductReg);
    // end;

    // procedure runworkflowoncancelproductApprovalCode(): Code[128]

    // begin
    //     exit(UpperCase('Runworkflowoncancelproductapproval'));
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"BIS Workflow Event Handling", 'OnCancelProductforApproval', '', true, true)]
    // local procedure RunWorkflowOnCancelproductApproval(var ProductReg: Record "Product Registration")
    // var
    //     WorkflowManagement: Codeunit "Workflow Management";

    // begin
    //     WorkflowManagement.HandleEvent(runworkflowoncancelproductApprovalCode(), ProductReg);
    // end;
    // //Handle Event--

    // //Add Event to Library++
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    // local procedure onaddProductRegEventtoLibrary()
    // var
    //     WorkflowEventHandling: Codeunit "Workflow Event Handling";
    //     SendProdRegAppTxt: Label 'Product Registration send to approval';
    //     CancelProdRegTxt: Label 'Product Registration is cancel.';
    // begin
    //     WorkflowEventHandling.AddEventToLibrary(runworkflowonsendproductApprovalCode(), Database::"Product Registration",
    //                                             SendProdRegAppTxt, 0, false);
    //     WorkflowEventHandling.AddEventToLibrary(runworkflowoncancelproductApprovalCode(), Database::"Product Registration",
    //                                             CancelProdRegTxt, 0, false);
    // end;
    // //Add Event to Library--

    // //Add Event to Deprecessor++
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    // local procedure OnAddProductRegEventPredecessorsToLibrary(EventFunctionName: Code[128])
    // var
    //     WorkflowEventHandling: Codeunit "Workflow Event Handling";
    // begin
    //     case
    //      EventFunctionName of
    //         runworkflowonsendproductApprovalCode: //sendapprove
    //             begin
    //                 WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode()
    //                                                     , runworkflowonsendproductApprovalCode());
    //             end;
    //         runworkflowoncancelproductApprovalCode: //cancel
    //             begin
    //                 WorkflowEventHandling.AddEventPredecessor(runworkflowoncancelproductApprovalCode(),
    //                                                             runworkflowonsendproductApprovalCode());
    //             end;
    //     end;
    // end;
    // //Add Event to deprecessor--

    // //Check Workflow Activate++
    // procedure ProductRegisterFlowEnable(var ProdReg: Record "Product Registration"): Boolean

    // begin
    //     if Not IsProductRegFlowEnable(ProdReg) then
    //         Error('No Workflow enable for Product Registration');
    //     Exit(True);
    // end;

    // procedure IsProductRegFlowEnable(var ProdReg: Record "Product Registration"): Boolean
    // var
    //     WorkflowMgt: Codeunit "Workflow Management";
    //     WorkflowEventHandling: Codeunit "Workflow Event Handling";
    // begin
    //     if ProdReg.Status <> ProdReg.Status::Open then
    //         Exit(False);
    //     exit(WorkflowMgt.CanExecuteWorkflow(ProdReg, runworkflowonsendproductApprovalCode()));

    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    // local procedure OnPopulateApprovalEntryArgument(var ApprovalEntryArgument: Record "Approval Entry"; var RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance")
    // var
    //     ProdReg: Record "Product Registration";
    // begin
    //     case
    //         RecRef.Number of
    //         Database::"Product Registration":
    //             begin
    //                 RecRef.SetTable(ProdReg);
    //                 ApprovalEntryArgument."Document No." := ProdReg."Register Item No.";
    //             end;
    //     end;
    // end;
    //Check Workflow Activate--

    //Product Registration--

    var
        myInt: Integer;
}