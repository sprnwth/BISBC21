// pageextension 50103 PageExSalesLine extends "Sales Lines"
// {
//     Editable = true;

//     layout
//     {
//         // Add changes to page layout here
//     }

//     actions
//     {
//         addafter("Reservation Entries")
//         {
//             action("Test JavaScript")
//             {
//                 ApplicationArea = All;
//                 Image = New;
//                 trigger OnAction()
//                 var
//                 begin
//                     SetResult('Test JavaScript');
//                 end;
//             }
//         }
//     }
//     procedure SetResult(NewResult: Text)
//     var
//         client: HttpClient;
//         content: HttpContent;
//         headers: HttpHeaders;
//         responseMessage: HttpResponseMessage;
//         request: HttpRequestMessage;
//     begin
//         headers := client.DefaultRequestHeaders();
//         client.Post('http://localhost:3000/users', content, responseMessage);
//     end;

//     var
//         myInt: Integer;
// }