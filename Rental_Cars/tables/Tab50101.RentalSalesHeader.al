table 50101 "Rental Sales Header"
{
    Caption = 'Rental Sales Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;

        }
        field(3; "Sales Person No."; Code[20])
        {
            Caption = 'Sales Person No.';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";

        }
        field(4; "Contract Date"; Date)
        {
            Caption = 'Contract Start Date';
            DataClassification = CustomerContent;
        }
        field(5; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            TableRelation = Customer;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }
        field(6; "Customer Address"; Text[100])
        {
            Caption = 'Customer Address';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Address where("No." = field("Customer No.")));
            Editable = false;
        }
        field(7; "Salesperson Name"; Text[100])
        {
            Caption = 'Salesperson Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Salesperson/Purchaser".Name where("Code" = field("Sales Person No.")));
            Editable = false;

        }

        field(9; "Customer Driving License"; enum "Driving License")
        {
            Caption = 'Customer Driving License';
            DataClassification = CustomerContent;

        }
        field(11; "Contract Total sum"; Decimal)
        {
            Caption = 'Contract Total sum';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Rental Sales Line"."Total Item Cost" where("Document No." = field("Document No.")));
        }
        field(12; "Customer Discount"; Decimal)
        {
            Caption = 'Customer Discount';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                RentalSalesLine: Record "Rental Sales Line";
            begin
                UpdateTotalSum.TotalSumForOneItem(RentalSalesLine, Rec);
            end;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }



    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }

    }


    trigger OnInsert()
    begin
        InitInsert();
    end;

    procedure InitInsert()

    begin
        if "Document No." = '' then begin
            TestNoSeries();
            NoSeriesMgt.InitSeries(GetNoSeriesCode(), xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
    end;

    local procedure TestNoSeries()
    begin
        GetOrderSalesSetup();
        OrderSetup.TestField("Order Nos");

    end;

    local procedure GetOrderSalesSetup()
    begin
        if OrderSetup.Get() then
            exit;
        OrderSetup.Insert(true);
        Commit();
    end;

    procedure GetNoSeriesCode(): Code[20]
    begin
        exit(NoSeriesMgt.GetNoSeriesWithCheck(OrderSetup."Order Nos", false, "No. Series"));
    end;

    trigger OnDelete()
    var
        "Rental Sales Line": Record "Rental Sales Line";
    begin
        "Rental Sales Line".SetRange("Document No.", rec."Document No.");
        "Rental Sales Line".DeleteAll(true);
    end;

    var
        OrderSetup: Record "Order Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UpdateTotalSum: Codeunit UpdateTotalSum;
}
