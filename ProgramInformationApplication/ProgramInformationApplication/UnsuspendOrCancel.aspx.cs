using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class Unsuspend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> suspendedList = new List<string>();
                ProgramInfoEntities db = new ProgramInfoEntities();
                foreach (ProgramInfo program in db.ProgramInfoes)
                {
                    if (program.ProgramStatus == "Suspended")
                    {
                        suspendedList.Add(program.ProgramName);
                    }
                }
                SuspendedLbox.DataSource = suspendedList;
                SuspendedLbox.DataBind();
            }
        }

        protected void AdminUnsuspendSubmitBtn_Click(object sender, EventArgs e)
        {
            ProgramInfoEntities db = new ProgramInfoEntities();
            string currentPath = "/Upload/Suspended/";
            string targetPath = "/Upload/Current/";
            foreach (ProgramInfo program in db.ProgramInfoes)
            {
                if (program.ProgramName == SuspendedLbox.SelectedValue)
                {
                    currentPath = currentPath + program.ProgramCode;
                    targetPath = targetPath + program.ProgramCode;
                    if (Directory.Exists(Server.MapPath(targetPath)))
                    {
                        // folder exist message
                        Result.Text = "Folder already exists!";
                    }
                    else
                    {
                        Directory.Move(Server.MapPath(currentPath), Server.MapPath(targetPath));
                        program.ProgramStatus = "Current";
                        program.Reason = null;
                        Result.Text = "Changes made successfully, please refresh this page to make another change.";
                    }
                }
            }
            db.SaveChanges();
        }

        protected void AdminCanceleSubmitBtn_Click(object sender, EventArgs e)
        {
            ProgramInfoEntities db = new ProgramInfoEntities();
            string currentPath = "/Upload/Suspended/";
            string targetPath = "/Upload/Canceled/";
            foreach (ProgramInfo program in db.ProgramInfoes)
            {
                if (program.ProgramName == SuspendedLbox.SelectedValue)
                {
                    currentPath = currentPath + program.ProgramCode;
                    targetPath = targetPath + program.ProgramCode;
                    if (Directory.Exists(Server.MapPath(targetPath)))
                    {
                        // folder exist message
                        Result.Text = "Folder already exists!";
                    }
                    else
                    {
                        Directory.Move(Server.MapPath(currentPath), Server.MapPath(targetPath));
                        program.ProgramStatus = "Canceled";
                        Result.Text = "Changes made successfully, please refresh this page to make another change.";
                    }
                }
            }
            db.SaveChanges();
        }
    }
}