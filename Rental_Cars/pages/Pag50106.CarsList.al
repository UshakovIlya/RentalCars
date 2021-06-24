page 50106 "Cars List"
{

    ApplicationArea = All;
    Caption = 'Cars List';
    PageType = List;
    SourceTable = Item;
    UsageCategory = Lists;
    CardPageId = "Cars";
    Editable = false;
    SourceTableView = where(Type = filter(Bike | Car | Track));
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = All;
                }
                field("Item Type"; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field';
                    ApplicationArea = All;
                }
                field("License Plate"; Rec."License Plate")
                {
                    ToolTip = 'Specifies the value of the License Plate field';
                    ApplicationArea = All;
                }
                field("Driving License Needed"; Rec."Driving License Needed")
                {
                    ToolTip = 'Specifies the value of the License Plate field';
                    ApplicationArea = All;
                }
                field("GearBox"; Rec.GearBox)
                {
                    ToolTip = 'Specifies the value of the License Plate field';
                    ApplicationArea = All;
                }
                field("Mileage"; Rec.Mileage)
                {
                    ToolTip = 'Specifies the value of the License Plate field';
                    ApplicationArea = All;
                }
                field("Vehicle Discount"; Rec."Vehicle Discount")
                {
                    ToolTip = 'Specifies the value of the Amount Of Doors field';
                    ApplicationArea = All;
                }

            }
        }
    }
}
