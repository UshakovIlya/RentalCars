page 50103 "Rental Order List"
{

    ApplicationArea = All;
    Caption = 'Rental Order List';
    PageType = List;
    SourceTable = "Rental Sales Header";
    UsageCategory = Lists;
    CardPageId = "Rental Sales";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field';
                    ApplicationArea = All;
                }

                field("Sales Person No."; Rec."Sales Person No.")
                {
                    ToolTip = 'Specifies the value of the Sales Person field';
                    ApplicationArea = All;
                }
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ToolTip = 'Specifies the value of the Salesperson Name field';
                    ApplicationArea = All;
                }


                field("Contract Total sum"; Rec."Contract Total sum")
                {
                    ToolTip = 'Specifies the value of the Contract Total sum field';
                    ApplicationArea = All;
                }
            }
        }
    }


}
