report 50100 "Available Car Report"
{
    ApplicationArea = All;
    Caption = 'Available Car Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = 'AvailableCars.docx';
    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = sorting("No.") where(Type = filter(car | bike | track));

            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Type; Type)
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(UnitPrice; "Unit Price")
            {
                IncludeCaption = true;
            }
            column(GearBox; GearBox)
            {
                IncludeCaption = true;
            }
            column(DrivingLicenseNeeded; "Driving License Needed")
            {
                IncludeCaption = true;
            }
            dataitem("Posted  Rental Sales Line"; "Posted Rental Sales Line")
            {
                DataItemLink = "Item No." = field("No.");
                column(Item_No_; "Item No.")
                {
                    IncludeCaption = true;
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
}
