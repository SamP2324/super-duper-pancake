using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

public partial class AddAppointment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        AppointmentAppDbEntities dbcon = new AppointmentAppDbEntities();
        dbcon.AppointmentTables.Load();

        int hour = Convert.ToInt32(ddlHour.SelectedValue.ToString());
        int minute = Convert.ToInt32(ddlMinute.SelectedValue.ToString());

        if (validateAppointment(txtAdvisorName.Text, Convert.ToDateTime(lblDate.Text), new TimeSpan(hour, minute, 0)))
        {
            AppointmentTable myAppointment = new AppointmentTable();
            myAppointment.AdvisorName = txtAdvisorName.Text;
            myAppointment.Location = txtLocation.Text;
            myAppointment.Date = Convert.ToDateTime(lblDate.Text);
            myAppointment.Time = new TimeSpan(hour, minute, 0);
            myAppointment.Reason = txtReason.Text;
            dbcon.AppointmentTables.Add(myAppointment);
            dbcon.SaveChanges();
            gvBrowse.DataBind();
            lstResult.Items.Clear();
            lstResult.Items.Add("Student name: name, Advisor Name: " + txtAdvisorName.Text);
            lstResult.Items.Add("Location: " + txtLocation.Text);
            lstResult.Items.Add("Date: " + Convert.ToDateTime(lblDate.Text));
            lstResult.Items.Add("Time: " + new TimeSpan(hour, minute, 0));
            lstResult.Items.Add("Reason: " + txtReason.Text);
        }
    }

    private bool validateAppointment(string advisorName, DateTime appDate, TimeSpan appTime)
    {
        AppointmentAppDbEntities dbcon = new AppointmentAppDbEntities();
        dbcon.AppointmentTables.Load();

        var existingApp =
            from x in dbcon.AppointmentTables.Local
            where x.Date.Equals(appDate) && x.Time.Equals(appTime)
            select x;
        if (existingApp != null)
        {
            lstResult.Items.Clear();
            lstResult.Items.Add("You already have an existing appointment at that date and time.");
            return false;
        }

        return advisorAvailable(advisorName, appDate, appTime);
    }

    private bool advisorAvailable(string advisorName, DateTime appDate, TimeSpan appTime)
    {
        AdvisorDBEntities dbcon = new AdvisorDBEntities();
        dbcon.AdvisorTables.Load();

        var existingApp =
            from x in dbcon.AdvisorTables.Local
            where x.Date.Equals(appDate) && x.Time.Equals(appTime)
            select x;
        if (existingApp != null)
        {
            lstResult.Items.Clear();
            lstResult.Items.Add("The advisor is unavailable at the selected date and time.");
            return false;
        }
        return true;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        lblDate.Text = Calendar1.SelectedDate.ToShortDateString();
    }
}