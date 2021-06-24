page 50104 "Order Setup"
{

    Caption = 'Order Setup';
    PageType = Card;
    SourceTable = "Order Setup";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';

                field("Order Nos"; Rec."Order Nos")
                {
                    ToolTip = 'Specifies the value of the Order Nos field';
                    ApplicationArea = All;
                }
                field("Posted Order Nos"; Rec."Posted Order Nos")
                {
                    ToolTip = 'Specifies the value of the Posted Order Nos field';
                    ApplicationArea = All;
                }
            }
        }
    }

}
