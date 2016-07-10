<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'/>
    <meta charset="utf-8"/>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>  
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="css/StyleSheet.css" rel="stylesheet" /> <!-- Custom css -->
    <title>Holiday Booking Application</title>
</head>

<body>
    <div class="container-fluid customContainer"> <!-- open bootstrap container -->
        <div class="row"> <!-- open row --> 
            <div class="jumbotron customTitle"><h1>Holiday Booking Application</h1>
            </div>
        </div> <!-- close row -->
        <form id="holidayForm" runat="server">
            <div class="row panel panel-default"> <!-- open row -->
                <div class="col-sm-5"> <!-- open column -->
                    <asp:Calendar ID="bookingCalendar" runat="server" CssClass="table" NextPrevFormat="ShortMonth" 
                        OnDayRender="bookingCalendar_DayRender" SelectionMode="None" FirstDayOfWeek="Sunday"
                        ForeColor="#383f33">
                        <DayHeaderStyle HorizontalAlign="Center" />
                        <DayStyle BorderStyle="Solid" BorderColor="#99ae8f" BorderWidth="1px" BackColor="White" />
                        <OtherMonthDayStyle />
                        <TitleStyle BackColor="white" Font-Bold="true"/>
                        <TodayDayStyle BorderStyle="Outset"/>
                    </asp:Calendar>
                </div> <!-- close column -->
                <div class="col-sm-7"> <!-- open column -->
                    <div>Please enter the start and end dates of the holiday you wish to book.
                    </div>
                    <div class="row">  <!-- open row -->
                    <div class="col-sm-5">
                        <h5>Start Date:</h5>
                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox><br />
                    </div>
                    </div> <!-- close row -->
                    <div class="row">  <!-- open row -->
                    <div class="col-sm-5">
                    <h5>End Date:</h5>
                        <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox><br />
                    </div>
                        </div> <!-- close row -->
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-default" />
                    <asp:Label ID="dateWarning" runat="server" Text="" CssClass="text-warning"></asp:Label>
                </div> <!-- close column -->
            </div><!-- close row -->
            <div class="row panel panel-default">
            <div class="row"><!-- open row -->
                <div class="col-sm-12"><!-- open column -->
                    <asp:Label ID="lblBookedHolidays" runat="server" Text="Holiday's that have been booked: "></asp:Label>
                </div><!-- close column -->
            </div><!-- close row -->

            <div class="row"> <!-- open row -->
                <div class="col-sm-12"> <!-- open column -->
                    <asp:PlaceHolder ID="checkbokPlaceholder" runat="server"></asp:PlaceHolder>
                </div> <!-- close column -->
            </div> <!-- close row -->
                <div class="row"> <!-- open row -->
                <div class="col-sm-12"> <!-- open column -->
                    <asp:Button  ID="btnRemove" runat="server" Text="Remove Holiday" OnClick="btnRemove_Click" CssClass="btn btn-default" />
                </div> <!-- close column -->
            </div> <!-- close row -->
                </div>
        </form>
        <div class="row panel panel-default"><!-- open row -->
            <div class="col-sm-12"> <!-- open column -->
                <h2 class="text-center">Booking Application Project Conclusions</h2>
                <br />
                <h3>Original Idea</h3>
                <p>To create a web application to allow people to request holidays from work and then display the data to the calendar showing 
                    which days have been booked out already. This also dynamically creates a list of the booked holidays which can be 
                    removed and then automatically updates the calendar.</p>
                <h3>Technologies Used</h3>
                <ul>
                    <li>ASP.Net Web-forms</li>
                    <li>C#</li>
                    <li>Bootstrap</li>
                    <li>HTML 5</li>
                    <li>CSS</li>
                </ul>
                <h3>What I Learnt From This Project</h3>
                <p>Being new to ASP.Net I felt that I really learned a lot about what the technology is capable of, ways to implement my ideas 
                    but also the limitations of creating dynamic content in ASP.Net. This really helped me to push myself to overcome the issues 
                    I faced in implementing my ideas and because of that I felt that I learnt a lot about the technology.</p>
                <h3>Issues I Faced</h3>
                <p>When I first started this project the idea was to include multiple users with different colours representing the different 
                    departments inside the company so that an admin style account could be created that showed absence by department and then 
                    holidays could be rejected to ensure that each department had the right availability of staff needed. I then discovered that 
                    using the default calendar in ASP.Net this wouldn’t be possible due to the limitations of the DayRender function using a basic 
                    table layout that wouldn’t support multiple background colours.</p>
                <p>The biggest issue I faced during this project was in the way that ASP.Net uses dynamic controls. Even though they are very easy 
                    to create on the page the basic ASP.Net functionality doesn’t support returning values from dynamic controls using the default 
                    ASP.Net Web-forms controls. This meant that my dynamic list of holidays that had been booked would not return a value even if the checkbox 
                    was ticked. I overcame this issue by using the CheckBoxList class object and OOP principles to create the list as objects and 
                    then show them on the page.</p>
                <p>This then caused a display issue when adding and removing the items to the list and would cause 
                    multiple instances of each item to show. This was resolved by having to completely remove the CheckBoxList object from the page 
                    and then re-adding it each time the method is called which I don’t feel this is a very elegant with of resolving the issue.</p>
                <h3>What I Would Do To Expand This Concept</h3>
                <p>Going forward with this project I would look to implement a database to store the data and also look to either build a better 
                    calendar myself that would support multiple events or utilise one of the open source calendars that are available. This would 
                    require a full redesign of the project and at this point I would look to increase the scope more towards a full HR administration 
                    system.</p>
            </div> <!-- close column -->
        </div> <!-- close row -->
    </div> <!-- Close container -->
</body>
</html>
