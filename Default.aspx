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

            </div> <!-- close column -->
        </div> <!-- close row -->
    </div> <!-- Close container -->
</body>
</html>
