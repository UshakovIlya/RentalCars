pageextension 50101 "Center_Navigation_extantion" extends "Business Manager Role Center"
{
    actions
    {
        addlast(sections)
        {
            group("Rental Order")
            {
                action("Rental Sales")
                {
                    RunObject = page "Rental Order List";
                    ApplicationArea = All;
                }
                action("Order Setup")
                {
                    RunObject = page "Order Setup";
                    ApplicationArea = All;
                }
                action("Cars List")
                {
                    RunObject = page "Cars List";
                    ApplicationArea = All;
                }
                action("Posted Rental Sales")
                {
                    RunObject = page "Posted Orders List";
                    ApplicationArea = All;
                }



            }
        }
    }
}
