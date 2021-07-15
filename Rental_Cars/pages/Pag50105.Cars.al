page 50105 "Cars"
{

    Caption = 'Cars';
    PageType = Card;
    SourceTable = Item;
    UsageCategory = Lists;
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            group(General)
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
                field("Is a car"; Rec."Is a car")
                {
                    ToolTip = 'Specifies the value of the Amount Of Doors field';
                    ApplicationArea = All;
                    Visible = false;

                }

            }
        }


        area(factboxes)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = FIELD("No."),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                              "Location Filter" = FIELD("Location Filter"),
                              "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                              "Variant Filter" = FIELD("Variant Filter");
            }

            part(ItemAttributesFactbox; "Item Attributes Factbox")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
    actions
    {
        area(processing)
        {
            group(ItemActionGroup)
            {
                Caption = 'Item';
                Image = DataEntry;
                action(Attributes)
                {
                    AccessByPermission = TableData "Item Attribute" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Attributes';
                    Image = Category;
                    Promoted = true;
                    PromotedOnly = true;
                    ToolTip = 'View or edit the item''s attributes, such as color, size, or other characteristics that help to describe the item.';

                    trigger OnAction()
                    begin
                        PAGE.RunModal(PAGE::"Item Attribute Value Editor", Rec);
                        CurrPage.SaveRecord();
                        CurrPage.ItemAttributesFactbox.PAGE.LoadItemAttributesData(Rec."No.");
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Is a car" := true;
    end;

}
