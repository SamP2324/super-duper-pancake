<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddAppointment.aspx.cs" Inherits="AddAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <br />
    </p>
<p>
        <asp:GridView ID="gvBrowse" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="AdvisorName" HeaderText="AdvisorName" SortExpression="AdvisorName" />
                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [AppointmentTable]"></asp:SqlDataSource>
    </p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
    <p>
        Advisor Name:
        <asp:TextBox ID="txtAdvisorName" runat="server"></asp:TextBox>
    </p>
<p>
    Location:
    <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
    </p>
<p>
    Date:
    <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
    </p>
<p>
    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
    </p>
<p>
    Time:&nbsp;&nbsp; Hour
    <asp:DropDownList ID="ddlHour" runat="server">
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
        <asp:ListItem>13</asp:ListItem>
        <asp:ListItem>14</asp:ListItem>
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>16</asp:ListItem>
        <asp:ListItem>17</asp:ListItem>
        <asp:ListItem></asp:ListItem>
    </asp:DropDownList>
&nbsp;&nbsp; Minute
    <asp:DropDownList ID="ddlMinute" runat="server">
        <asp:ListItem>00</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem></asp:ListItem>
    </asp:DropDownList>
    </p>
<p>
    Reason:
    <asp:TextBox ID="txtReason" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnSubmit" runat="server" Height="53px" OnClick="btnSubmit_Click" Text="Create Appointment" Width="168px" />
    </p>
    <p>
        <asp:ListBox ID="lstResult" runat="server" Height="131px" Width="535px"></asp:ListBox>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

