using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void DayRender(Object source, DayRenderEventArgs e)
    {
        // Change the background color of the days in the month
        if (!e.Day.IsOtherMonth && !e.Day.IsWeekend)
            e.Cell.BackColor = System.Drawing.Color.LightGoldenrodYellow;

        DateTime date = new DateTime(2016, 07, 10);
        for (int i = 0; i < 28; i++)
        {
            //testing individual day rendering
            if (e.Day.Date == date)
            {
                e.Cell.BackColor = System.Drawing.Color.FromArgb(30, System.Drawing.Color.Azure);
                //e.Cell.Controls.Add(new LiteralControl("<br />Holiday"));
            }
            date = date.AddDays(1);
            //testingDate.Text = date.ToLongDateString();
        }

        // Add custom text to cell in the Calendar control.

        //testing multiple days different color code
        if (e.Day.Date.Day == 18)
        {
            if (e.Cell.BackColor == System.Drawing.Color.Azure)
            {
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
            else
            {
                e.Cell.BackColor = System.Drawing.Color.Green;
            }
        }

        //e.Cell.Controls.Add(new LiteralControl("<br />Holiday"));

    }
}