tableextension 50100 "Car Item" extends Item
{
    fields
    {
        field(50101; Mileage; Integer)
        {
            Caption = 'Mileage';
            DataClassification = CustomerContent;
        }
        field(50102; "License Plate"; Code[20])
        {
            Caption = 'License Plate';
            DataClassification = CustomerContent;
        }

        field(50105; "Vehicle Discount"; Decimal)
        {
            Caption = 'Vehicle Discount';
            DataClassification = CustomerContent;
        }
        field(50103; GearBox; Enum GearBox)
        {
            Caption = 'GearBox';
            DataClassification = CustomerContent;
        }
        field(50104; "Driving License Needed"; Enum "Driving License")
        {
            Caption = 'Driving License Needed';
            DataClassification = CustomerContent;
        }
        field(50106; "Is a car"; Boolean)
        {
            Caption = 'Is a car';
            DataClassification = CustomerContent;

        }
    }
}
