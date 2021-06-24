page 50109 "Posted Rental Sales Line"
{

    Caption = 'Posted Rental Sales Line';
    PageType = ListPart;
    SourceTable = "Posted Rental Sales Line";

    AutoSplitKey = true;
    MultipleNewLines = true;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field';
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field';
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Item Desc."; Rec."Item name.")
                {
                    ToolTip = 'Specifies the value of the Item name. field';
                    ApplicationArea = All;
                }
                field("Item Cost"; Rec."Item Cost")
                {
                    ToolTip = 'Specifies the value of the Item Cost field';
                    ApplicationArea = All;
                }
                field("GearBox"; Rec.GearBox)
                {
                    ToolTip = 'Specifies the value of the Item Cost field';
                    ApplicationArea = All;
                }

                field("License Plate"; Rec."License Plate")
                {
                    ToolTip = 'Specifies the value of the Item Cost field';
                    ApplicationArea = All;
                }
                field("Driving License Needed"; Rec."Driving License Needed")
                {
                    ToolTip = 'Specifies the value of the Item Cost field';
                    ApplicationArea = All;
                }
                field("Total Sum"; Rec."Total Item Cost")
                {
                    ToolTip = 'Specifies the value of the Item Cost field';
                    ApplicationArea = All;
                }
                field("Vehicle Discount"; Rec."Vehicle Discount")
                {
                    ToolTip = 'Specifies the value of the Item Cost field';
                    ApplicationArea = All;
                }
                field("Rental Start"; Rec."Rental Start")
                {
                    ToolTip = 'Specifies the value of the Item Cost field';
                    ApplicationArea = All;
                }
                field("Rental End"; Rec."Rental End")
                {
                    ToolTip = 'Specifies the value of the Item Cost field';
                    ApplicationArea = All;
                }
            }
        }
    }

}
