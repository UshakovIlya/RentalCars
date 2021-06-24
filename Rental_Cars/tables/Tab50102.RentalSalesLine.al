table 50102 "Rental Sales Line"
{
    Caption = 'Rental Sales Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item."No." where(Type = filter(car | bike | track));
        }
        field(3; "Item name."; Text[100])
        {
            Caption = 'Item name.';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("Item No.")));

        }
        field(4; "Item Cost"; Decimal)
        {
            Caption = 'Item Cost';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Unit Price" where("No." = field("Item No.")));

        }
        field(8; "Total Item Cost"; Decimal)
        {
            Caption = 'Total Item Cost';

        }

        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
            TableRelation = "Rental Sales Header";
        }
        field(6; "GearBox"; Enum GearBox)
        {
            Caption = 'GearBox';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.GearBox where("No." = field("Item No.")));
        }
        field(7; "Vehicle Discount"; Decimal)
        {
            Caption = 'Vehicle Discount';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Vehicle Discount" where("No." = field("Item No.")));
        }
        field(9; "License Plate"; Text[20])
        {
            Caption = 'License Plate';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."License Plate" where("No." = field("Item No.")));
        }
        field(10; "Driving License Needed"; Enum "Driving License")
        {
            Caption = 'Driving License Needed';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Driving License Needed" where("No." = field("Item No.")));
        }
        field(11; "Car available"; Boolean)
        {
            Caption = 'Car available';
            InitValue = true;

        }
        field(12; "Rental Start"; Date)
        {
            Caption = 'Rental Start';
            DataClassification = ToBeClassified;


        }
        field(14; "Rental End"; Date)
        {
            Caption = 'Rental End';
            DataClassification = ToBeClassified;


        }

    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }

}
