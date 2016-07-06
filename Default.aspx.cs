using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        listOfHolidays.Add(this);
    }
}

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
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
                    e.Cell.BackColor = System.Drawing.Color.Coral;
                }
                tempStartDate = tempStartDate.AddDays(1);
            }
            count++;
        }
    }

    //Method to get the date input convert it to a date object and
    //then work out the difference in days
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DateTime startDateTemp = ConvertToDate(txtStartDate.Text);
        DateTime endDateTemp = ConvertToDate(txtEndDate.Text);
        TimeSpan dayDifference = endDateTemp.Subtract(startDateTemp);
        int dayDiffInt = Int32.Parse(dayDifference.Days.ToString()) + 1;
        holidayBookingData temp = new holidayBookingData("Andy", startDateTemp, endDateTemp, dayDiffInt);
        checkbokPlaceholder.Controls.Clear();
        CreateCheckboxMethod();
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
        CheckBoxList cbx = (CheckBoxList)checkbokPlaceholder.FindControl("chkboxListOfHolidays");
        foreach (ListItem chkList in cbx.Items) 
        {
            if (chkList.Selected)
            {
                indexToDelete.Add(index);
            }
            index++;
        }
        for (int i = indexToDelete.Count; i > 0; i--)
        {
            holidayBookingData.listOfHolidays.RemoveAt(index);
        }
    }

    //new method to try and create the dynamic checkbox and be able to retrieve the checked value
    public void CreateCheckboxMethod()
    {
            CheckBoxList listOFHolidaysChk = new CheckBoxList();
            listOFHolidaysChk.Items.Clear();
            listOFHolidaysChk.ID = "chkboxListOfHolidays";
            foreach (holidayBookingData h in holidayBookingData.listOfHolidays)
            {
                listOFHolidaysChk.Items.Add(new ListItem(" " + h.name + " has holiday booked from "
                    + h.startDate + " until " + h.endDate));
            }
            checkbokPlaceholder.Controls.Add(listOFHolidaysChk);
    }

    //remove button logic
    protected void btnRemove_Click(object sender, EventArgs e)
    {
            removeHoliday();
            checkbokPlaceholder.Controls.Clear();
            CreateCheckboxMethod();
    }

}