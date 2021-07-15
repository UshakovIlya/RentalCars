tableextension 50101 "Customer Disc" extends Customer
{
    fields
    {

        field(50101; "Driving License Category"; Enum "Driving License")
        {
            Caption = 'Customer Driving License Category';
            DataClassification = CustomerContent;
        }
    }
}
