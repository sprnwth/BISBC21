report 50039 "Assembly Order New"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Source Code/ReportLayout/Assembly_Order New.rdlc';
    Caption = 'Assembly Order';

    dataset
    {
        dataitem("Assembly Header"; "Assembly Header")
        {
            DataItemTableView = SORTING("Document Type", "No.");
            RequestFilterFields = "No.", "Item No.", "Due Date";
            column(No_AssemblyHeader; "No.")
            {
            }
            column(ItemNo_AssemblyHeader; "Item No.")
            {
                IncludeCaption = true;
            }
            column(Description_AssemblyHeader; Description)
            {
                IncludeCaption = true;
            }
            column(Quantity_AssemblyHeader; Quantity)
            {
                IncludeCaption = true;
            }
            column(QuantityToAssemble_AssemblyHeader; "Quantity to Assemble")
            {
                IncludeCaption = true;
            }
            column(UnitOfMeasureCode_AssemblyHeader; "Unit of Measure Code")
            {
            }
            column(DueDate_AssemblyHeader; Format("Due Date"))
            {
            }
            column(StartingDate_AssemblyHeader; Format("Starting Date"))
            {
            }
            column(EndingDate_AssemblyHeader; Format("Ending Date"))
            {
            }
            column(LocationCode_AssemblyHeader; "Location Code")
            {
                IncludeCaption = true;
            }
            column(BinCode_AssemblyHeader; "Bin Code")
            {
                IncludeCaption = true;
            }
            column(SalesDocNo; SalesDocNo)
            {
            }
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
            {
            }
            dataitem("Assembly Line"; "Assembly Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                column(Type_AssemblyLine; Type)
                {
                    IncludeCaption = true;
                }
                column(No_AssemblyLine; "No.")
                {
                    IncludeCaption = true;
                }
                column(Description_AssemblyLine; Description)
                {
                    IncludeCaption = true;
                }
                column(VariantCode_AssemblyLine; "Variant Code")
                {
                }
                column(DueDate_AssemblyLine; Format("Due Date"))
                {
                }
                column(QuantityPer_AssemblyLine; "Quantity per")
                {
                    IncludeCaption = true;
                }
                column(Quantity_AssemblyLine; Quantity)
                {
                    IncludeCaption = true;
                }
                column(UnitOfMeasureCode_AssemblyLine; "Unit of Measure Code")
                {
                }
                column(LocationCode_AssemblyLine; "Location Code")
                {
                    IncludeCaption = true;
                }
                column(BinCode_AssemblyLine; "Bin Code")
                {
                    IncludeCaption = true;
                }
                column(QuantityToConsume_AssemblyLine; "Quantity to Consume")
                {
                    IncludeCaption = true;
                }
                column(UMODescriptionG; UMODescriptionG)
                {

                }
            }

            trigger OnAfterGetRecord()
            var
                ATOLink: Record "Assemble-to-Order Link";
            begin
                Clear(SalesDocNo);
                if ATOLink.Get("Document Type", "No.") then
                    SalesDocNo := ATOLink."Document No.";

                UnitofMesureG.Reset();
                UnitofMesureG.SetRange(Code, "Unit of Measure Code");
                if UnitofMesureG.FindFirst() then
                    UMODescriptionG := UnitofMesureG.Description;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
        AssemblyOrderHeading = 'Assembly Order';
        AssemblyItemHeading = 'Assembly Item';
        BillOfMaterialHeading = 'Bill of Material';
        PageCaption = 'Page';
        OfCaption = 'of';
        OrderNoCaption = 'Order No.';
        QuantityAssembledCaption = 'Quantity Assembled';
        QuantityPickedCaption = 'Quantity Picked';
        QuantityConsumedCaption = 'Quantity Consumed';
        AssembleToOrderNoCaption = 'Asm. to Order No.';
        UnitOfMeasureCaption = 'Unit of Measure';
        VariantCaption = 'Variant';
        DueDateCaption = 'Due Date';
        StartingDateCaption = 'Starting Date';
        EndingDateCaption = 'Ending Date';
    }

    var
        SalesDocNo: Code[20];
        UnitofMesureG: Record "Unit of Measure";
        UMODescriptionG: Text;
}

