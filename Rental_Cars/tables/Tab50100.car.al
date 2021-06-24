table 50100 car
{
    Caption = 'car';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; c; Code[10])
        {
            Caption = 'c';
            DataClassification = CustomerContent;
        }
        field(2; na; Text[20])
        {
            Caption = 'na';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; c)
        {
            Clustered = true;
        }
    }

}
