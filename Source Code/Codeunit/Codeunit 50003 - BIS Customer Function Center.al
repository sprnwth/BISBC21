codeunit 50003 BisFunctionCenter
{
    trigger OnRun()
    begin

    end;

    // procedure TransferCustomerDataApi()
    // var
    //     TableCustomerApiL: Record CustomerApi;
    //     TableCustomerL: Record Customer;
    // begin
    //     if TableCustomerApiL.FindSet() then
    //         repeat
    //             TableCustomerL.Init();  //
    //             TableCustomerL.TransferFields(TableCustomerApiL);
    //             TableCustomerL.Insert();
    //         until TableCustomerApiL.Next() = 0;     // Break row = 0
    // end;

    // After upload attachment
    // [EventSubscriber(ObjectType::Table, Database::CustomerAttachments, 'OnAfterInsertEvent', '', true, true)]
    // local procedure CustomerAttachmentsAfterModify(var Rec: Record CustomerAttachments)
    // var
    //     TempBlob: Codeunit "Temp Blob";
    //     TableCustomerAttachments: Record CustomerAttachments;
    //     TableDocumentAttachmentCount: Record "Document Attachment";
    //     TableDocumentAttachment: Record "Document Attachment";
    //     TableTenantMedia: Record "Tenant Media";
    //     FileManagement: Codeunit "File Management";
    //     FromFileName: Text;
    //     DocumentStream: InStream;
    //     mediasetId: Text;
    //     RecRef: RecordRef;
    //     Customer: Record Customer;
    //     OutStr: OutStream;
    //     ImageName: Text;
    // begin
    //     if (Rec."Table ID" = 18) then begin
    //         TableDocumentAttachmentCount.Reset();
    //         TableCustomerAttachments.Reset();
    //         TableCustomerAttachments.SetRange("ID", Rec.ID);
    //         if TableCustomerAttachments.FindFirst() then begin
    //             // Set referance table(Customer)
    //             Customer.Reset();
    //             CUstomer.get(TableCustomerAttachments."Customer No.");
    //             RecRef.Get(Customer.RecordId);

    //             TableCustomerAttachments.CalcFields(FileContent);
    //             FromFileName := TableCustomerAttachments."File Name" + '.' + TableCustomerAttachments."File Extension";
    //             TableCustomerAttachments.FileContent.CreateInStream(DocumentStream);
    //             TableDocumentAttachment.SaveAttachmentFromStream(DocumentStream, RecRef, FromFileName);
    //         end;
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Header API", 'OnAfterInsertEvent', '', true, true)]
    // procedure TransferSalesHeaderDataApi(DocumentType: Code[20]; No: Code[20])
    // var
    //     TableSalesHeaderApi: Record "Sales Header API";
    //     TableSalesHeader: Record "Sales Header";
    //     TableSalesHeaderCheck: Record "Sales Header";
    //     TableSalesHeaderAttach: Record "Sales Header";
    //     TableSalesLineApi: Record SalesLineApi;
    //     TableSalesLine: Record "Sales Line";
    //     TableSalesHeaderAttachApi: Record CustomerAttachments;
    //     TableDocumentAttachment: Record "Document Attachment";
    //     GetLasetIdTableDocumentAttachment: Record "Document Attachment";
    //     Level: Enum "Sales Document Type";
    //     RecRef: RecordRef;
    //     FromFileName: Text;
    //     DocumentStream: InStream;
    //     CryptographyManagement: Codeunit "Cryptography Management";
    //     HashAlgorithmType: Option MD5,SHA1,SHA256,SHA384,SHA512;
    // begin
    //     case DocumentType of
    //         'Quote':
    //             Level := Level::Quote;
    //         'Order':
    //             Level := Level::Order;
    //         'Invoice':
    //             Level := Level::Invoice;
    //         'Credit Memo':
    //             Level := Level::"Return Order";
    //         'Blanket Order':
    //             Level := Level::"Credit Memo";
    //         'Return Order':
    //             Level := Level::"Blanket Order";
    //     end;

    //     TableSalesHeaderApi.Reset();
    //     TableSalesHeaderApi.SetRange("No.", No);
    //     TableSalesHeaderApi.SetRange("Document Type", Level);
    //     if TableSalesHeaderApi.FindSet() then begin
    //         if TableSalesHeaderApi."No." <> '' then begin
    //             TableSalesHeaderCheck.Reset();
    //             TableSalesHeaderCheck.SetRange("No.", TableSalesHeaderApi."No.");
    //             if (TableSalesHeaderCheck.Count() = 0) then begin
    //                 TableSalesHeader.Init();
    //                 TableSalesHeader.Validate("Document Type", TableSalesHeaderApi."Document Type");
    //                 TableSalesHeader.Validate("No.", TableSalesHeaderApi."No.");
    //                 TableSalesHeader.Validate("Sell-to Customer No.", TableSalesHeaderApi."Sell-to Customer No.");
    //                 TableSalesHeader.Insert(true);

    //                 TableSalesHeader.Validate("Ship-to Code", TableSalesHeaderApi."Ship-to Code");
    //                 TableSalesHeader.Validate("Order Date", TableSalesHeaderApi."Order Date");
    //                 TableSalesHeader.Validate("Posting Date", TableSalesHeaderApi."Posting Date");
    //                 TableSalesHeader.Validate("Shipment Date", TableSalesHeaderApi."Shipment Date");
    //                 TableSalesHeader.Validate("Due Date", TableSalesHeaderApi."Due Date");
    //                 TableSalesHeader.Validate("Salesperson Code", TableSalesHeaderApi."Salesperson Code");
    //                 TableSalesHeader.Validate("External Document No.", TableSalesHeaderApi."External Document No.");
    //                 TableSalesHeader.Modify(true);

    //                 TableSalesHeaderApi.Validate(TransferStatus, 'Transferred');
    //                 TableSalesHeader.Modify(true);

    //                 // Transfer lines to master
    //                 TableSalesLineApi.Reset();
    //                 TableSalesLineApi.SetRange("Document No.", TableSalesHeaderApi."No.");
    //                 if (TableSalesLineApi.Count() > 0) then begin
    //                     if TableSalesLineApi.FindSet() then
    //                         repeat
    //                             TableSalesLine.Init();  //   
    //                             TableSalesLine.Validate("Document Type", TableSalesLineApi."Document Type");
    //                             TableSalesLine.Validate("Document No.", TableSalesLineApi."Document No.");
    //                             TableSalesLine.Validate("Line No.", TableSalesLineApi."Line No.");
    //                             TableSalesLine.Validate(Type, TableSalesLineApi.type);
    //                             TableSalesLine.Validate("Unit Price", TableSalesLineApi."Unit Price");
    //                             TableSalesLine.Validate("Sell-to Customer No.", TableSalesLineApi."Sell-to Customer No.");
    //                             TableSalesLine.Validate("No.", TableSalesLineApi."No.");
    //                             TableSalesLine.Validate(Quantity, TableSalesLineApi.Quantity);
    //                             TableSalesLine.Insert(true);
    //                             TableSalesLineApi.Validate("Transfer Status", 'Transferred');
    //                             TableSalesLineApi.Modify(true);

    //                         until TableSalesLineApi.Next() = 0;     // Break row = 0
    //                 end;
    //                 // End transfer lines to master

    //                 // Transfer attach to master
    //                 TableSalesHeaderAttachApi.Reset();
    //                 TableSalesHeaderAttachApi.SetRange("Ref. System ID", TableSalesHeaderApi.SystemId);
    //                 TableSalesHeaderAttachApi.SetRange("Table ID", 36);
    //                 if (TableSalesHeaderAttachApi.Count() > 0) then begin
    //                     if TableSalesHeaderAttachApi.FindSet() then
    //                         repeat
    //                             uploadAttach(TableSalesHeaderApi.SystemId, TableSalesHeaderApi."Document Type", TableSalesHeaderApi."No.", TableSalesHeaderAttachApi.ID);
    //                         until TableSalesHeaderAttachApi.Next() = 0;     // Break row = 0
    //                 end;
    //                 // End transfer attach to master
    //             end;
    //         end;
    //     end;
    // end;

    // Upload file after transfer sales header
    // local procedure uploadAttach(TableSalesHeaderApiSysitemId: Guid; DocumentType: Enum "Sales Document Type"; No: Code[20]; IdSalesHeaderAttachApi: Integer)
    // var
    //     TableSalesHeaderAttachApi: Record CustomerAttachments;
    //     TableDocumentAttachment: Record "Document Attachment";
    //     TableSalesHeaderAttach: Record "Sales Header";
    //     RecRef: RecordRef;
    //     FromFileName: Text;
    //     DocumentStream: InStream;
    //     CryptographyManagement: Codeunit "Cryptography Management";
    //     HashAlgorithmType: Option MD5,SHA1,SHA256,SHA384,SHA512;
    // begin
    //     TableDocumentAttachment.Reset();
    //     TableSalesHeaderAttach.Reset();
    //     TableSalesHeaderAttachApi.Reset();
    //     TableSalesHeaderAttach.get(DocumentType, No);
    //     RecRef.Get(TableSalesHeaderAttach.RecordId);

    //     TableSalesHeaderAttachApi.Get(IdSalesHeaderAttachApi);
    //     TableSalesHeaderAttachApi.CalcFields(FileContent);
    //     FromFileName := TableSalesHeaderAttachApi."File Name" + '.' + TableSalesHeaderAttachApi."File Extension";
    //     TableSalesHeaderAttachApi.FileContent.CreateInStream(DocumentStream);
    //     TableDocumentAttachment.SaveAttachmentFromStream(DocumentStream, RecRef, FromFileName);
    // end;
    // End upload file after transfer sales header

    // Update file name after upload to CustomerAttachments
    // [EventSubscriber(ObjectType::Table, Database::CustomerAttachments, 'OnAfterInsertEvent', '', true, true)]
    // procedure updateFileName(Rec: Record CustomerAttachments)
    // var
    //     GetAttach: Record CustomerAttachments;
    //     FromFileName: Text;
    //     CryptographyManagement: Codeunit "Cryptography Management";
    //     HashAlgorithmType: Option MD5,SHA1,SHA256,SHA384,SHA512;
    // begin
    //     FromFileName := Rec."File Name" + '-' + CryptographyManagement.GenerateHash(Rec."File Name" + '-ID' + Format(Rec.ID) + Format(Time), HashAlgorithmType::MD5);
    //     GetAttach.Get(Rec.ID);
    //     GetAttach.Validate("File Name", FromFileName);
    //     GetAttach.Modify(true);
    // end;
    // End update file name after upload to CustomerAttachments

    // Delete CustomerAttachments after SalesHeaderAttachApi deleted
    // [EventSubscriber(ObjectType::Table, Database::"Sales Header API", 'OnAfterDeleteEvent', '', true, true)]
    // local procedure deleteAttachAfterDeleteCustomerAttachments(Rec: Record "Sales Header API")
    // var
    //     RecCustomerAttachments: Record CustomerAttachments;
    // begin
    //     RecCustomerAttachments.Reset();
    //     RecCustomerAttachments.SetRange("Ref. System ID", Rec.SystemId);
    //     if (RecCustomerAttachments.Count > 0) then begin
    //         RecCustomerAttachments.DeleteAll(true);
    //     end;
    // end;
    // End delete CustomerAttachments after SalesHeaderAttachApi deleted

    procedure TransferSalesLineDataApi()
    var
    // TableSalesLineApi: Record SalesLineApi;
    // TableSalesLine: Record "Sales Line";
    begin
        // if TableSalesLineApi.FindSet() then
        //     repeat
        //         TableSalesLine.Init();  //   
        //         TableSalesLine.Validate("Document Type", TableSalesLineApi."Document Type");
        //         TableSalesLine.Validate("Document No.", TableSalesLineApi."Document No.");
        //         TableSalesLine.Validate("Line No.", TableSalesLineApi."Line No.");
        //         TableSalesLine.Insert(true);

        //         TableSalesLine.Validate(Type, TableSalesLineApi.type);
        //         TableSalesLine.Validate("No.", TableSalesLineApi."No.");
        //         TableSalesLine.Validate(Description, TableSalesLineApi.Description);
        //         TableSalesLine.Validate(Quantity, TableSalesLineApi.Quantity);

        //         TableSalesLine.Modify(true);

        //     until TableSalesLineApi.Next() = 0;     // Break row = 0
    end;

    // After insert Sales Line
    // [EventSubscriber(ObjectType::Table, Database::SalesLineApi, 'OnAfterInsertEvent', '', true, true)]
    // local procedure SalesLineAfterInsertApi(var Rec: Record SalesLineApi)
    // var
    //     TableSalesLine: Record "Sales Line";
    // begin
    //     TableSalesLine.Reset();
    //     TableSalesLine.SetRange("Document No.", Rec."No.");
    //     TableSalesLine.SetRange("Document Type", Rec."Document Type");
    //     if (TableSalesLine.Count() = 0) then begin
    //         TableSalesLine.Init();  //   
    //         TableSalesLine.Validate("Document Type", Rec."Document Type");
    //         TableSalesLine.Validate("Document No.", Rec."Document No.");
    //         TableSalesLine.Validate("Line No.", Rec."Line No.");
    //         TableSalesLine.Validate(Type, Rec.type);
    //         TableSalesLine.Validate("Unit Price", Rec."Unit Price");
    //         TableSalesLine.Validate("Sell-to Customer No.", Rec."Sell-to Customer No.");
    //         TableSalesLine.Validate("No.", Rec."No.");
    //         TableSalesLine.Validate("No.", Rec."No.");
    //         TableSalesLine.Validate(Quantity, Rec.Quantity);
    //         TableSalesLine.Insert(true);
    //         // TableSalesLine.Validate("Unit Price", TableSalesLineApi."Unit Price");
    //         // TableSalesLine.Validate(Description, TableSalesLineApi.Description);
    //         // TableSalesLine.Modify(true);

    //         Rec.Validate("Transfer Status", 'Transferred');
    //         Rec.Modify(true);
    //     end;
    // end;

    // procedure TransferSalesDATAAPI()
    // var
    //     TableSalesLineApi: Record SalesLineApi;
    //     TableSalesLine: Record "Sales Line";
    //     TableSalesHeaderApi: Record "Sales Header API";
    //     TableSalesHeader: Record "Sales Header";
    //     TableItem: Record Item;
    // begin

    // end;

    procedure Ocr() responseText: Text;
    var
        client: HttpClient;
        request: HttpRequestMessage;
        response: HttpResponseMessage;
        contentHeaders: HttpHeaders;
        content: HttpContent;
        payload: Text;
    begin
        // Add the payload to the content
        content.WriteFrom(payload);

        // Retrieve the contentHeaders associated with the content
        content.GetHeaders(contentHeaders);
        contentHeaders.Clear();
        contentHeaders.Add('Content-Type', 'application/json');

        // Assigning content to request.Content will actually create a copy of the content and assign it.
        // After this line, modifying the content variable or its associated headers will not reflect in 
        // the content associated with the request message
        request.Content := content;
        request.Method := 'POST';
        request.SetRequestUri('http://localhost:3000/users');

        client.Send(request, response);

        // Read the response content as json.
        response.Content().ReadAs(responseText);
    end;

    procedure SendAzureFunctionPostRequest()
    var
        AzureFunctions: Codeunit "Azure Functions";
        AzureFunctionsResponse: Codeunit "Azure Functions Response";
        AzureFunctionsAuthentication: Codeunit "Azure Functions Authentication";
        IAzureFunctionsAuthentication: Interface "Azure Functions Authentication";
        RequestBody: Text;
        JsonObject: JsonObject;
    begin
        // JsonObject.Add('param1', 'value1');
        // JsonObject.Add('param2', 'value2');
        // JsonObject.Add('param3', 'value3');

        // JsonObject.WriteTo(RequestBody);
        IAzureFunctionsAuthentication := AzureFunctionsAuthentication.CreateCodeAuth('https://southeastasia.api.cognitive.microsoft.com/', 'b03dd2e3c3f4471195d75ccd3b14bc0b');
        AzureFunctionsResponse := AzureFunctions.SendPostRequest(IAzureFunctionsAuthentication, RequestBody, 'application/json');
        if AzureFunctionsResponse.IsSuccessful() then
            Message('Post request successful.')
        else
            Error('Post request failed.\Details: %1', AzureFunctionsResponse.GetError());
    end;
}