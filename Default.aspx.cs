using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//expansion class idea to track amount of holiday allocation remaining
public class Employee
{

}

//Class and constructer for the holiday data
public class holidayBookingData
{
    //holiday data varibles
    public string name;
    public DateTime startDate;
    public DateTime endDate;
    public int totalDays;

    //list to hold all the holidays that have been booked
    public static List<holidayBookingData> listOfHolidays = new List<holidayBookingData>();

    //holiday booking data constructer with function to automatically add the data to the list
    public holidayBookingData(string nameCon, DateTime start, DateTime end, int days)
    {
        this.name = nameCon;
        this.startDate = start;
        this.endDate = end;
        this.totalDays = days;
        //automatically add all the holidays created to a public list
        listOfHolidays.Add(this);
    }
}

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //initialise the checkboxlist so it doesn't cause a null exception when adding holidays
        CreateCheckboxMethod();
    }

    public void bookingCalendar_DayRender(Object source, DayRenderEventArgs e)
    {
        // Change the background color of the days in the month
        //if (!e.Day.IsOtherMonth && !e.Day.IsWeekend)
        //    e.Cell.BackColor = System.Drawing.Color.LightGoldenrodYellow;
        
        //Create the DayRender function to take the data from the list and then color the 
        //cells accordingly
        int count = 0;
        for (int j = 0; j < holidayBookingData.listOfHolidays.Count; j++)
        {
            DateTime tempStartDate = holidayBookingData.listOfHolidays[j].startDate;
            for (int i = 0; i < holidayBookingData.listOfHolidays[j].totalDays; i++)
            {
            if (e.Day.Date == tempStartDate)
                {
                    e.Cell.BackColor = System.Drawing.Color.FromArgb(230, 242, 255);
                }
                tempStartDate = tempStartDate.AddDays(1);
            }
            count++;
        }
        //render the weekend into a different color
        if (e.Day.IsWeekend)
        {
            e.Cell.BackColor = System.Drawing.Color.FromArgb(254, 254, 230);
        }
        //render the previous and next month overlap in a different colour
        if (e.Day.IsOtherMonth)
        {
            e.Cell.BackColor = System.Drawing.Color.FromArgb(245,245,239);
        }
    }

    //Method to get the date input convert it to a date object and
    //then work out the difference in days
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            dateWarning.Text = "";
            DateTime startDateTemp = ConvertToDate(txtStartDate.Text);
            DateTime endDateTemp = ConvertToDate(txtEndDate.Text);
            TimeSpan dayDifference = endDateTemp.Subtract(startDateTemp);
            int dayDiffInt = Int32.Parse(dayDifference.Days.ToString()) + 1;
            int daysTaken = holidayDaysCalculation(startDateTemp, dayDiffInt);
            holidayBookingData temp = new holidayBookingData("Andy", startDateTemp, endDateTemp, dayDiffInt);
            //remove the controls from the page so that they don't write on top of each other
            checkbokPlaceholder.Controls.Clear();
            CreateCheckboxMethod();
        }
        catch (FormatException)
        {
            dateWarning.Text = "Please enter both a start and end date for your holiday";
        }
    }

    //Convert to date object method
    public DateTime ConvertToDate(string dateToConvert)
    {
        int[] dateSperator = new int[3];
        string[] dateSperatorString =  dateToConvert.Split('-');
        for (int i = 0; i < 3; i++)
        {
            dateSperator[i] = Int32.Parse(dateSperatorString[i]);
        }
        DateTime dateToReturn = new DateTime(dateSperator[0], dateSperator[1], dateSperator[2]);
        return dateToReturn;
    }

    //method for removing holidays from the calender
    public void removeHoliday()
    {
        int index = 0;
        List<int> indexToDelete = new List<int>();
        //clear the list of index's ready to be repopulated depending on what holidays are needed to be deleted
        indexToDelete.Clear();
        CheckBoxList cbx = (CheckBoxList)checkbokPlaceholder.FindControl("chkboxListOfHolidays");
        //check for checkbox value and add the index to a list to be deleted(this allows for multiple records
        //to be deleted at the same time
        foreach (ListItem chkList in cbx.Items) 
        {
            if (chkList.Selected)
            {
                indexToDelete.Add(index);
            }
            index++;
        }
        //go backwards through the list of records to delete and removing them
        //this is done like this to stop the index out of range exceptions caused by shortening the list
        for (int i = indexToDelete.Count() - 1; i >= 0; i--)
        {
            holidayBookingData.listOfHolidays.RemoveAt(indexToDelete[i]);
        }
    }

    //method to create the dynamic checkboxlist and be able to retrieve the checked value
    //using the checkboxlist object to be able to retrieve the values from the checkbox's 
    public void CreateCheckboxMethod()
    {
        CheckBoxList listOFHolidaysChk = new CheckBoxList();

        listOFHolidaysChk.Items.Clear();
        listOFHolidaysChk.ID = "chkboxListOfHolidays";
        foreach (holidayBookingData h in holidayBookingData.listOfHolidays)
        {
            listOFHolidaysChk.Items.Add(new ListItem("-  " + h.name + " has holiday booked from "
                + h.startDate.ToLongDateString() + " until " + h.endDate.ToLongDateString()));
        }
        listOFHolidaysChk.CssClass = "checkbox";
        checkbokPlaceholder.Controls.Add(listOFHolidaysChk);
    }

    //remove button method
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        //call the remove holiday method
        removeHoliday();
        //remove the controls from the page so that they don't write on top of each other
        checkbokPlaceholder.Controls.Clear();
        //recreate the checkboxlist
        CreateCheckboxMethod();
    }

    //method to calculate the amount of actual holiday days taken accounting for weekends not been part of
    //the holiday allowance
    public int holidayDaysCalculation(DateTime startDateToAddTo, int dayDifference)
    {
        int holidayDays = dayDifference;
        for (int i = 1; i <= dayDifference; i++)
        {
            if (startDateToAddTo.DayOfWeek.ToString() == "Saturday" || startDateToAddTo.DayOfWeek.ToString() == "Sunday")
            {
                holidayDays--;
            }
            startDateToAddTo = startDateToAddTo.AddDays(1);
        }
        return holidayDays;
    }

}