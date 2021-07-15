xmlport 50100 "CarsPort"
{
    Caption = 'CarsPort';
    FormatEvaluate = Xml;
    Encoding = UTF8;

    schema
    {
        textelement(RootNodeName)
        {
            MaxOccurs = Once;
            tableelement(Item; Item)
            {
                MinOccurs = Zero;
                XmlName = 'Cars';
                fieldelement(No; Item."No.")
                {
                }
                fieldelement(Description; Item.Description)
                {
                }
                fieldelement(Type; Item."Type")
                {
                }
                fieldelement(UnitPrice; Item."Unit Price")
                {
                }
                fieldelement(LicensePlate; Item."License Plate")
                {
                }
                fieldelement(DrivingLicenseNeeded; Item."Driving License Needed")
                {
                }
                fieldelement(GearBox; Item.GearBox)
                {
                }
                fieldelement(Mileage; Item.Mileage)
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        XMLFile: File;
        Outstream: OutStream;
        ToFileName: Variant;
        FromFileName: Text;
}
