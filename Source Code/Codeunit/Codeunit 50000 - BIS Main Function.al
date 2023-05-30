///<summary>
///BIS Main Functional
///</summary>

codeunit 50000 "BIS Main Function"
{
    trigger OnRun()
    begin

    end;

    ///<summary>
    ///Combine Address from WHT Address for Vendor Card
    ///</summary>
    procedure MakeVendorAddressFromWHTAddress(
                                        Building: Text;
                                        Room: Text;
                                        Floor: Text;
                                        AddressNo: Text;
                                        VillageNo: Text;
                                        VillageName: Text;
                                        Alley: Text;
                                        Road: Text;
                                        subDisctrict: Text;
                                        District: Text;
                                        Province: Text;
                                        var Address1: Text[100];
                                        Var Address2: Text[50];
                                        ReqConfirm: Boolean
    )
    var
        Vendor: Record Vendor;

    begin

        if (Address1 <> '') or (Address2 <> '') then
            if ReqConfirm then
                if not confirm('กรุณายืนยันการเปลี่ยนที่อยู่') then
                    Exit;

        if Building <> '' then
            Address1 += Building;
        if Room <> '' then
            Address1 += ' ' + Room;
        if Floor <> '' then
            Address1 += ' ' + Floor;
        if AddressNo <> '' then
            Address1 += ' ' + AddressNo;
        if VillageNo <> '' then
            Address1 += ' ' + VillageNo;
        if VillageName <> '' then
            Address1 += ' ' + VillageName;
        if Alley <> '' then
            Address1 += ' ' + Alley;
        if Alley <> '' then
            Address1 += ' ' + Alley;

        if subDisctrict <> '' then
            Address2 += ' ' + subDisctrict;
        if District <> '' then
            Address2 += ' ' + District;
        if Province <> '' then
            Address2 += ' ' + Province;

        // Vendor.get(VendorNo);
        // Vendor.Validate(Address, Address1);
        // Vendor.Validate("Address 2", Address2);
        // Vendor.Validate("Post Code", PostCode);
        // Vendor.Modify(true)

    end;

    procedure MakeCustAddressFromWHTAddress(
                                            Building: Text;
                                            Room: Text;
                                            Floor: Text;
                                            AddressNo: Text;
                                            VillageNo: Text;
                                            VillageName: Text;
                                            Alley: Text;
                                            Road: Text;
                                            subDisctrict: Text;
                                            District: Text;
                                            Province: Text;
                                            var Address1: Text[100];
                                            var Address2: Text[50];
                                            ReqConfirm: Boolean
                                            )
    var
        Customer: Record Customer;

    begin

        if (Address1 <> '') or (Address2 <> '') then
            if ReqConfirm then
                if not confirm('กรุณายืนยันการเปลี่ยนที่อยู่') then
                    Exit;

        if Building <> '' then
            Address1 += Building;
        if Room <> '' then
            Address1 += ' ' + Room;
        if Floor <> '' then
            Address1 += ' ' + Floor;
        if AddressNo <> '' then
            Address1 += ' ' + AddressNo;
        if VillageNo <> '' then
            Address1 += ' ' + VillageNo;
        if VillageName <> '' then
            Address1 += ' ' + VillageName;
        if Alley <> '' then
            Address1 += ' ' + Alley;
        if Alley <> '' then
            Address1 += ' ' + Alley;

        if subDisctrict <> '' then
            Address2 += ' ' + subDisctrict;
        if District <> '' then
            Address2 += ' ' + District;
        if Province <> '' then
            Address2 += ' ' + Province;

        // Customer.get(CustNo);
        // Customer.Validate(Address, Address1);
        // Customer.Validate("Address 2", Address2);
        // Customer.Validate("Post Code", PostCode);
        // Customer.Modify(true)

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", 'OnBeforeSendEmail', '', true, true)]
    local procedure BeforeSendEmail(EmailDocName: Text[250];
                                    EmailScenario: Enum "Email Scenario";
                                    SenderUserID: Code[50];
                                    var EmailSentSuccesfully: Boolean;
                                    var HideDialog: Boolean;
                                    var IsFromPostedDoc: Boolean;
                                    var IsHandled: Boolean;
                                    var PostedDocNo: Code[20];
                                    var ReportUsage: Integer;
                                    var TempEmailItem: Record "Email Item")
    var
        Notif: Codeunit "Notification Entry Dispatcher";
        InstrVar: InStream;
        OutstreamVar: OutStream;
        RecRef: RecordRef;
        RepForm: ReportFormat;
        TempBlob: Codeunit "Temp Blob";
        SourceTableList: List of [Integer];
        SourceIDList: List of [Guid];
        SourceRelationTypeList: List of [Integer];
        Customer: Record Customer;
        NoOfRec: Integer;
        i: Integer;
        RegisterCustomer: Record "Customer Registration";

    begin

        // TempEmailItem.GetSourceDocuments(SourceTableList, SourceIDList, SourceRelationTypeList);
        // NoOfRec := SourceIDList.Count;
        // if NoOfRec < 1 then
        //     Exit;

        // for i := 1 to NoOfRec do begin
        //     Customer.GetBySystemId(SourceIDList.get(i));
        //     if RegisterCustomer.get(Customer."No.") then begin
        //         RecRef.Open(Database::"Customer Registration");
        //         RecRef.GetBySystemId(RegisterCustomer.SystemId);
        //         TempBlob.CreateOutStream(OutstreamVar);
        //         Report.SaveAs(Report::"Customer Register",
        //                         '',
        //                         RepForm::Pdf,
        //                         OutstreamVar);
        //         TempBlob.CreateInStream(InstrVar);
        //         TempEmailItem.AddAttachment(InstrVar, Customer."No." + '.pdf');
        //         RecRef.Close();

        //     end;
        // end;

    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterOnInsert', '', true, true)]
    local procedure OnAfterInsertCustomer(var Customer: Record Customer; xCustomer: Record Customer)
    var
        SaleSetup: Record "Sales & Receivables Setup";
    begin
        SaleSetup.Get();
        if SaleSetup."Autoblock after create" then begin
            Customer.validate(Blocked, Customer.Blocked::All);
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Salesperson Code', true, true)]
    local procedure CheckRelationofCustomerandSaleperson(CurrFieldNo: Integer; var Rec: Record Customer; var xRec: Record Customer)
    var
        CustSaleRelation: Record "Customer Saleperson Relation";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.get();
        if not SalesSetup."Force Sales Person by Rel." then
            exit;
        CustSaleRelation.Reset();
        CustSaleRelation.get(Rec."No.", Rec."Salesperson Code");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Salesperson Code', true, true)]
    local procedure CheckRelationofCustomerandSalepersonSH(CurrFieldNo: Integer; var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        CustSaleRelation: Record "Customer Saleperson Relation";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.get();
        if not SalesSetup."Force Sales Person by Rel." then
            exit;
        if REc."Salesperson Code" = '' then
            Exit;
        CustSaleRelation.Reset();
        CustSaleRelation.get(Rec."Sell-to Customer No.", Rec."Salesperson Code");
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterReleaseATOs', '', true, true)]
    local procedure StampDateTimeRelease(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var SalesLine: Record "Sales Line")
    begin
        SalesHeader."Release Date" := today;
        SalesHeader."Release Time" := Time;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnReopenOnBeforeSalesHeaderModify', '', true, true)]
    local procedure ClearReleaseDateTime(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."Release Date" := 0D;
        SalesHeader."Release Time" := 0T;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterGetPostingNoSeriesCode', '', true, true)]
    local procedure ShowPostingNoForPurchQuote(PurchaseHeader: Record "Purchase Header"; var PostingNos: Code[20])
    var
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        if PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Quote then
            exit;
        PurchSetup.Get();
        PurchSetup.TestField("Order Nos.");
        PostingNos := PurchSetup."Order Nos.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterGetPostingNoSeriesCode', '', true, true)]
    local procedure ShowPostingNoForSalesQuote(SalesHeader: Record "Sales Header"; var PostingNos: Code[20])
    var
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Quote then
            exit;
        SalesSetup.Get();
        SalesSetup.TestField("Order Nos.");
        PostingNos := SalesSetup."Order Nos.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterGetNoSeriesCode', '', true, true)]
    local procedure GetNoSeriesFromQuote(PurchSetup: Record "Purchases & Payables Setup"; var NoSeriesCode: Code[20]; var PurchHeader: Record "Purchase Header")
    var
        PQ: Record "Purchase Header";
        ThaiLocSetup: Record "NWTH Thai Localization Setup";
    begin
        ThaiLocSetup.Get();
        if not ThaiLocSetup."NWTH Set Only Posting Nos." then
            exit;
        if PurchHeader."Document Type" <> PurchHeader."Document Type"::Order then
            exit;
        if PQ.get(PQ."Document Type"::Quote, PurchHeader."Quote No.") then begin
            NoSeriesCode := PQ."Posting No. Series";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterAccountNoOnValidateGetEmployeeAccount', '', true, true)]
    local procedure ValidateEmployee(var Employee: Record Employee; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine.Validate("Payment Terms Code", Employee."Payment Terms Code");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterAccountNoOnValidateGetEmployeeBalAccount', '', true, true)]
    local procedure ValidateBalEmployee(var Employee: Record Employee; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine.Validate("Payment Terms Code", Employee."Payment Terms Code");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostEmployeeOnBeforeEmployeeLedgerEntryInsert', '', true, true)]
    local procedure AddDueDate(var EmployeeLedgerEntry: Record "Employee Ledger Entry"; var GenJnlLine: Record "Gen. Journal Line")
    var
        PaymentTerm: Record "Payment Terms";
        DueDate: Date;
    begin
        if PaymentTerm.get(GenJnlLine."Payment Terms Code") then begin
            if format(PaymentTerm."Due Date Calculation") <> '' then
                DueDate := CalcDate(PaymentTerm."Due Date Calculation", GenJnlLine."Document Date")
            else
                DueDate := GenJnlLine."Document Date";
            EmployeeLedgerEntry."Document Date" := GenJnlLine."Document Date";
            EmployeeLedgerEntry."Due Date" := DueDate;
        end;
    end;

    //++[PAR] Add Reason Code 03.04.2023
    [EventSubscriber(ObjectType::Table, Database::"Transfer Shipment Header", 'OnAfterCopyFromTransferHeader', '', true, true)]
    local procedure AddReasonCodeToTransferShipmentHeader(var TransferShipmentHeader: Record "Transfer Shipment Header"; TransferHeader: Record "Transfer Header")
    begin
        TransferShipmentHeader."Reason Code" := TransferHeader."Reason Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Receipt Header", 'OnAfterCopyFromTransferHeader', '', true, true)]
    local procedure AddReasonCodeToTransferReceiptHeader(TransferHeader: Record "Transfer Header"; var TransferReceiptHeader: Record "Transfer Receipt Header")
    begin
        TransferReceiptHeader."Reason Code" := TransferHeader."Reason Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", 'OnAfterCreateRcptLineFromTransLine', '', true, true)]
    local procedure AddReasonCodeToWarehouseReceiptLine(TransferLine: Record "Transfer Line"; var WarehouseReceiptLine: Record "Warehouse Receipt Line"; WarehouseReceiptHeader: Record "Warehouse Receipt Header")
    var
        TransferOrderL: Record "Transfer Header";
        WarehouseReceiptHeaderL: Record "Warehouse Receipt Header";
    begin
        TransferOrderL.Reset();
        TransferOrderL.SetRange("No.", WarehouseReceiptLine."Source No.");
        if TransferOrderL.FindFirst() then;

        WarehouseReceiptHeaderL.Reset();
        WarehouseReceiptHeaderL.SetRange("No.", WarehouseReceiptLine."No.");
        if WarehouseReceiptHeaderL.FindFirst() then begin
            WarehouseReceiptHeaderL."Reason Code" := TransferOrderL."Reason Code";
            WarehouseReceiptHeaderL.Modify();
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", 'OnAfterCreateShptLineFromTransLine', '', true, true)]
    local procedure AddReasonCodeToWarehouseShipmentHeader(TransferHeader: Record "Transfer Header"; TransferLine: Record "Transfer Line"; var WarehouseShipmentLine: Record "Warehouse Shipment Line"; WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    var
        TransferOrderL: Record "Transfer Header";
        WarehouseShipmentHeaderL: Record "Warehouse Shipment Header";
    begin
        TransferOrderL.Reset();
        TransferOrderL.SetRange("No.", WarehouseShipmentLine."Source No.");
        if TransferOrderL.FindFirst() then;

        WarehouseShipmentHeaderL.Reset();
        WarehouseShipmentHeaderL.SetRange("No.", WarehouseShipmentLine."No.");
        if WarehouseShipmentHeaderL.FindFirst() then begin
            WarehouseShipmentHeaderL."Reason Code" := TransferOrderL."Reason Code";
            WarehouseShipmentHeaderL.Modify();
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnBeforePostedWhseShptHeaderInsert', '', true, true)]
    local procedure AddReasonCodeToPostedWarehouseShpt(var PostedWhseShipmentHeader: Record "Posted Whse. Shipment Header"; WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    begin
        PostedWhseShipmentHeader."Reason Code" := WarehouseShipmentHeader."Reason Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", 'OnBeforePostedWhseRcptHeaderInsert', '', true, true)]
    local procedure AddReasonCodeToPostedWarehouseRecpt(var PostedWhseReceiptHeader: Record "Posted Whse. Receipt Header"; WarehouseReceiptHeader: Record "Warehouse Receipt Header")
    begin
        PostedWhseReceiptHeader."Reason Code" := WarehouseReceiptHeader."Reason Code";
    end;

    //--[PAR] Add Reason Code 03.04.2023

    procedure InvDataConsolidation()
    var
        ItemLedgerEntryConsol: Page "Consolidate Item ledger Entry";
        ValueEntryConso: Page "Consolidate Value Entry";
        PurchLine: Page "Consolidate Purchase Lines";

    begin
        if confirm('Consolidation will take several minites') then begin
            ItemLedgerEntryConsol.ConsolidateDATAITL(False);
            ValueEntryConso.ConsolidateDATAValueEntry(False);
            PurchLine.ConsolidateDATAPurchaseLines(False);
        end;

    end;

    procedure RegisterItem(ItemNo: Code[20])
    var
        ProductRegistration: Record "Product Registration";
        Item: Record Item;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DocumentAttached: Record "Document Attachment";
        ItemUOMPurch: Record "Item Unit of Measure";
        ItemUOMSale: Record "Item Unit of Measure";
    begin
        ProductRegistration.Reset();
        ProductRegistration.setrange("Register Item No.", ItemNo);
        ProductRegistration.FindFirst();
        ProductRegistration.TestField(Status, ProductRegistration.Status::Release);

        Item.Init();
        Item."No. Series" := ProductRegistration."Item Nos.";
        Item."No." := NoSeriesMgt.GetNextNo(ProductRegistration."Item Nos.", 0D, True);
        Item.Insert(true);

        ItemUOMPurch.Init();
        ItemUOMPurch."Item No." := Item."No.";
        ItemUOMPurch.Code := ProductRegistration."Purch. UOM";
        ItemUOMSale.Init();
        ItemUOMSale."Item No." := Item."No.";
        ItemUOMSale.Code := ProductRegistration."Sales. UOM";
        ItemUOMSale.Insert(true);

        Item.Validate(Description, ProductRegistration."Product Name");
        Item.Validate("Gen. Prod. Posting Group", ProductRegistration."Gen. Product Posting Group");
        Item.Validate("Item Tracking Code", ProductRegistration."Item Tracking Code");
        Item.validate("VAT Prod. Posting Group", ProductRegistration."Default VAT Posting Group");

        Item.validate("Sub Group 1", ProductRegistration.MainCategory);
        Item.Validate("Item Category Code", ProductRegistration.SubCategory);
        Item.Validate("Inventory Posting Group", ProductRegistration."Inventory Posting Group");
        Item.Validate("Base Unit of Measure", ProductRegistration.UOM);
        Item.Validate("Purch. Unit of Measure", ItemUOMPurch.Code);
        Item.Validate("Sales Unit of Measure", ItemUOMSale.Code);
        Item.Validate(Type, Item.Type::Inventory);
        Item.validate("Vendor No.", ProductRegistration."Supplier Code");
        Item.Modify(true);

        ProductRegistration."Item No." := Item."No.";
        ProductRegistration.Modify(true);
        Message('Register %1', ProductRegistration."Item No.");

    end;

    //Branch
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', true, true)]
    local procedure InsertBranchCode(RunTrigger: Boolean; var Rec: Record "Sales Header")
    begin
        if rec."NWTH Company Branch Code" <> '' then begin
            Rec.validate("Shortcut Dimension 2 Code", Rec."NWTH Company Branch Code");
            Rec.Modify(true);
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'NWTH Company Branch Code', true, true)]
    local procedure ValidateBranchDim(CurrFieldNo: Integer; var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    begin
        Rec.validate("Shortcut Dimension 2 Code", Rec."NWTH Company Branch Code");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterInsertEvent', '', true, true)]
    local procedure InsertPurchBranchCode(RunTrigger: Boolean; var Rec: Record "Purchase Header")
    begin
        if rec."NWTH Company Branch Code" <> '' then begin
            Rec.validate("Shortcut Dimension 2 Code", Rec."NWTH Company Branch Code");
            Rec.Modify(true);
        end;
    end;

    // ++ Add Return Reason Code
    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order", 'OnBeforeActionEvent', 'Post', true, true)]
    local procedure AddReasonCodeForSalesInvoice(var Rec: Record "Sales Header")
    var
        SalesReturnLineL: Record "Sales Line";
    begin
        SalesReturnLineL.Reset();
        SalesReturnLineL.SetRange("Document Type", SalesReturnLineL."Document Type"::"Return Order");
        SalesReturnLineL.SetRange("Document No.", Rec."No.");
        if SalesReturnLineL.FindSet() then begin
            repeat
                if SalesReturnLineL.Type <> SalesReturnLineL.Type::" " then
                    if SalesReturnLineL."Return Reason Code" = '' then
                        Error('Return reason code must to be have a value in line %1 item %2', SalesReturnLineL."Line No.", SalesReturnLineL."No.");

            until SalesReturnLineL.Next() = 0;
        end;

    end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Cr.Memo Line", 'OnAfterInitFromSalesLine', '', true, true)]
    // local procedure AddReasonCodeForSalesCrMemos(var SalesCrMemoLine: Record "Sales Cr.Memo Line"; SalesCrMemoHeader: Record "Sales Cr.Memo Header"; SalesLine: Record "Sales Line")
    // begin
    //     SalesCrMemoLine."Return Reason Code" := SalesLine."Return Reason Code";
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", 'OnAfterInitFromSalesLine', '', true, true)]
    // local procedure AddReasonCodeForSalesShipment(var SalesShptLine: Record "Sales Shipment Line"; SalesShptHeader: Record "Sales Shipment Header"; SalesLine: Record "Sales Line")
    // begin
    //     SalesShptLine."Return Reason Code" := SalesLine."Return Reason Code";
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Return Receipt Line", 'OnAfterInitFromSalesLine', '', true, true)]
    // local procedure AddReasonCodeForReturnReceipt(var ReturnRcptLine: Record "Return Receipt Line"; ReturnRcptHeader: Record "Return Receipt Header"; SalesLine: Record "Sales Line")
    // begin
    //     ReturnRcptLine."Return Reason Code" := SalesLine."Return Reason Code";
    // end;

    // -- Add Return Reason Code

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'NWTH Company Branch Code', true, true)]
    local procedure ValidatePurchBranchDim(CurrFieldNo: Integer; var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    begin
        Rec.validate("Shortcut Dimension 2 Code", Rec."NWTH Company Branch Code");
    end;

    //WHT++
    procedure UpdateWHTCerEXP(DocNo: Code[20])
    var
        UpdateCerQuery: Query UpdateCertificate;
        WHTPostingSetupG: Record "NWTH WHT Posting Setup";
        NoSeriesManagementG: Codeunit NoSeriesManagement;
        WHTCertificateG: Code[20];
        WHTReportLineG: Code[20];
        WHTEntryG: Record "NWTH WHT Entry";
        PurchInvLine: Record "Purch. Inv. Line";
        DocDate: Date;
        VendorNo: Code[20];
        WHTCustom: Code[20];

    begin
        WHTEntryG.Reset();
        WHTEntryG.SetRange("Document No.", DocNo);
        WHTEntryG.setrange("Document Type", WHTEntryG."Document Type"::Payment);
        if WHTEntryG.IsEmpty then
            Error('Realized WHT Does not exist');

        WHTEntryG.Reset();
        WHTEntryG.SetRange("Document No.", DocNo);
        WHTEntryG.setrange("Document Type", WHTEntryG."Document Type"::Payment);
        WHTEntryG.setfilter("WHT Certificate No.", '<>%1', '');
        if not WHTEntryG.IsEmpty then
            Error('Certification has been updated');

        UpdateCerQuery.SetRange(UpdateCerQuery.Document_No_, DocNo);
        UpdateCerQuery.Open();
        while UpdateCerQuery.Read() do begin

            WHTCertificateG := '';
            WHTReportLineG := '';
            DocDate := 0D;
            VendorNo := '';

            PurchInvLine.Reset();
            PurchInvLine.setrange("Document No.", DocNo);
            PurchInvLine.setrange("NWTH Document Date", UpdateCerQuery.NWTH_Document_Date);
            if UpdateCerQuery.NWTH_Vendor_No_ <> '' then
                PurchInvLine.setrange("NWTH Vendor No.", UpdateCerQuery.NWTH_Vendor_No_);
            if UpdateCerQuery.NWTH_WHT_Custom_Address <> '' then
                PurchInvLine.setrange("NWTH WHT Custom Address", UpdateCerQuery.NWTH_WHT_Custom_Address);

            PurchInvLine.FindFirst();
            If WHTPostingSetupG.Get(PurchInvLine."NWTH WHT Bus. Posting Group", PurchInvLine."NWTH WHT Prod. Posting Group") Then begin

                WHTPostingSetupG.TestField("NWTH WHT Cert. Nos.");
                WHTCertificateG := NoSeriesManagementG.GetNextNo(WHTPostingSetupG."NWTH WHT Cert. Nos.", PurchInvLine."NWTH Document Date", true);
                WHTPostingSetupG.TestField("WHT Report Line No. Series");
                WHTReportLineG := NoSeriesManagementG.GetNextNo(WHTPostingSetupG."WHT Report Line No. Series", PurchInvLine."NWTH Document Date", true);

                DocDate := UpdateCerQuery.NWTH_Document_Date;
                VendorNo := UpdateCerQuery.NWTH_Vendor_No_;
                WHTCustom := UpdateCerQuery.NWTH_WHT_Custom_Address;

                if VendorNo <> '' then
                    UpdateWHTCertificateByVendorNo(DocNo, DocDate, VendorNo, WHTCertificateG, WHTReportLineG);
                if WHTCustom <> '' then
                    UpdateWHTCertificateByWHTCustom(DocNo, DocDate, WHTCustom, WHTCertificateG, WHTReportLineG);
            end;
        end;

        UpdateCerQuery.Close();
        Message('Updated');

    end;

    local procedure UpdateWHTCertificateByVendorNo(DocNo: Code[20]; DocDate: Date; VendorNo: Code[20]; WHTCertNo: Code[20]; WHTLineNo: Code[20])
    var
        PurchaseInvLineL: Record "Purch. Inv. Line";
        WHTEntryG: Record "NWTH WHT Entry";
    begin
        PurchaseInvLineL.SetRange("Document No.", DocNo);
        PurchaseInvLineL.SetRange("NWTH Vendor No.", VendorNo);
        PurchaseInvLineL.SetRange("NWTH Document Date", DocDate);
        If PurchaseInvLineL.FindSet() then
            repeat
                if PurchaseInvLineL."NWTH WHT Certificate No." = '' then begin
                    PurchaseInvLineL."NWTH WHT Certificate No." := WHTCertNo;
                    PurchaseInvLineL."NWTH WHT Report Line No" := WHTLineNo;
                    PurchaseInvLineL.Modify();
                end;

                WHTEntryG.Reset();
                WHTEntryG.setrange("NWTH Ref. Document No.", PurchaseInvLineL."Document No.");
                WHTEntryG.setrange("NWTH Ref. Line No.", PurchaseInvLineL."Line No.");
                WHTEntryG.setrange("Document Type", WHTEntryG."Document Type"::Payment);
                If WHTEntryG.FindSet() then
                    repeat
                        if WHTEntryG."WHT Certificate No." = '' then begin
                            WHTEntryG."WHT Certificate No." := WHTCertNo;
                            WHTEntryG."WHT Report Line No" := WHTLineNo;
                            WHTEntryG."External Document No." := PurchaseInvLineL."NWTH Vendor Invoice No.";
                            WHTEntryG.Modify();
                        end;
                    until WHTEntryG.next() = 0;

            until PurchaseInvLineL.next() = 0;
    end;

    local procedure UpdateWHTCertificateByWHTCustom(DocNo: Code[20]; DocDate: Date; WHTCustom: Code[20]; WHTCertNo: Code[20]; WHTLineNo: Code[20])
    var
        PurchaseInvLineL: Record "Purch. Inv. Line";
        WHTEntryG: Record "NWTH WHT Entry";
    begin
        PurchaseInvLineL.SetRange("Document No.", DocNo);
        PurchaseInvLineL.SetRange("NWTH WHT Custom Address", WHTCustom);
        PurchaseInvLineL.SetRange("NWTH Document Date", DocDate);
        If PurchaseInvLineL.FindSet() then
            repeat
                if PurchaseInvLineL."NWTH WHT Certificate No." = '' then begin
                    PurchaseInvLineL."NWTH WHT Certificate No." := WHTCertNo;
                    PurchaseInvLineL."NWTH WHT Report Line No" := WHTLineNo;
                    PurchaseInvLineL.Modify();
                end;

                WHTEntryG.Reset();
                WHTEntryG.setrange("NWTH Ref. Document No.", PurchaseInvLineL."Document No.");
                WHTEntryG.setrange("NWTH Ref. Line No.", PurchaseInvLineL."Line No.");
                WHTEntryG.setrange("Document Type", WHTEntryG."Document Type"::Payment);
                If WHTEntryG.FindSet() then
                    repeat
                        if WHTEntryG."WHT Certificate No." = '' then begin
                            WHTEntryG."WHT Certificate No." := WHTCertNo;
                            WHTEntryG."WHT Report Line No" := WHTLineNo;
                            WHTEntryG."External Document No." := PurchaseInvLineL."NWTH Vendor Invoice No.";
                            WHTEntryG.Modify();
                        end;
                    until WHTEntryG.next() = 0;
            until PurchaseInvLineL.next() = 0;
    end;
    //WHT--

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Get Shipment", 'OnBeforeTransferLineToSalesDoc', '', true, true)]
    local procedure GetSalesPersonCode(SalesShipmentHeader: Record "Sales Shipment Header"; SalesShipmentLine: Record "Sales Shipment Line"; var SalesHeader: Record "Sales Header"; var TransferLine: Boolean)

    begin
        SalesHeader.validate("BIS Sales Person", SalesShipmentHeader."Salesperson Code");
        SalesHeader.validate("External Document No.", SalesShipmentHeader."External Document No.");
        SalesHeader.Modify();
    end;

    //Reason Of Approve Sales
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeApprovalEntryInsert', '', true, true)]
    local procedure AddReasonToApproveSales(ApprovalEntryArgument: Record "Approval Entry"; ApproverId: Code[50]; var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean; WorkflowStepArgument: Record "Workflow Step Argument")
    var

        RecRef: RecordRef;
        SalesOrder: Record "Sales Header";
        ReasonApp1: Text[30];
        ReasonApp2: Text[30];
        ReasonApp3: Text[30];
        ReasonApp4: Text[30];

    begin
        if RecRef.Get(ApprovalEntry."Record ID to Approve") then begin
            if RecRef.Number = Database::"Sales Header" then begin
                RecRef.SetTable(SalesOrder);
                if SalesOrder."Document Type" = SalesOrder."Document Type"::Order then begin
                    SalesOrder.GetApprovalRequestReason(ReasonApp1,
                                                        ReasonApp2,
                                                        ReasonApp3,
                                                        ReasonApp4);
                    ApprovalEntry."Reason 1" := ReasonApp1;
                    ApprovalEntry."Reason 2" := ReasonApp2;
                    ApprovalEntry."Reason 3" := ReasonApp3;
                    ApprovalEntry."Reason 4" := ReasonApp4;

                end;
            end;
        end;
    end;
    //Reason of Approve Sales


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterCopyFromItem', '', true, true)]
    local procedure ForceNonVATSalesLine(CurrentFieldNo: Integer; Item: Record Item; var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    var
        VATProd: Record "VAT Product Posting Group";
        Customer: Record Customer;
    begin
        if Customer.get(SalesLine."Sell-to Customer No.") then
            if Customer."Force NON VAT Sale" then begin
                VATProd.Reset();
                VATProd.setrange("Default NON VAT Sale", true);
                VATProd.FindFirst();
                SalesLine."VAT Prod. Posting Group" := VATProd.Code;
            end;

    end;



    var
        myInt: Codeunit 12;
}