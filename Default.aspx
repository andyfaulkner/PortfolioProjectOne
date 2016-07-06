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
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <title>Holiday Booking Application</title>
</head>

<body>
    <div class="container customContainer"> <!-- open bootstrap container -->
        <div class="row"> <!-- open row --> 
            <div class="jumbotron customTitle"><h1>Holiday Booking Application</h1></div>
        </div> <!-- close row -->
        <div class="row"> <!-- open row -->

        </div><!-- close row -->
        <form id="holidayForm" runat="server">
        <div class="row"> <!-- open row -->
            <br />
            <div class="col-sm-5"> <!-- open column -->
                <asp:Calendar ID="bookingCalendar" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Size="9pt" ForeColor="Black" Height="350px" NextPrevFormat="FullMonth" OnDayRender="bookingCalendar_DayRender" Width="350px" SelectionMode="None">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                    <DayStyle BackColor="#CCCCCC" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                </asp:Calendar>
            </div> <!-- close column -->
            <div class="col-sm-7"> <!-- open column -->
                <h4>Start Date:</h4>
                <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date"></asp:TextBox><br />
                <h4>End Date:</h4>
                <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date"></asp:TextBox><br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <br />
                <asp:Label ID="testLabel" runat="server" Text=""></asp:Label>
            </div> <!-- close column -->
        </div><!-- close row -->

        <div class="row"> <!-- open row -->
            <div class="col-sm-8"> <!-- open column -->
               <%-- <asp:CheckBoxList ID="chkListOfHolidays" runat="server">
                </asp:CheckBoxList>--%>
                <asp:PlaceHolder ID="checkbokPlaceholder" runat="server"></asp:PlaceHolder>
            </div> <!-- close column -->
        </div> <!-- close row -->
            <div class="row"> <!-- open row -->
            <div class="col-sm-8"> <!-- open column -->
                <asp:Button ID="btnRemove" runat="server" Text="Remove Holiday" OnClick="btnRemove_Click" />
            </div> <!-- close column -->
        </div> <!-- close row -->
        </form>
    </div> <!-- Close container -->
</body>
</html>
