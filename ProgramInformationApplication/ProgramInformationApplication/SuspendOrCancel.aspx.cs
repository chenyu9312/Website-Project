using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class SuspendOrCancel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> currentList = new List<string>();
                ProgramInfoEntities db = new ProgramInfoEntities();
                foreach (ProgramInfo program in db.ProgramInfoes)
                {
                    if (program.ProgramStatus == "Current")
                    {
                        currentList.Add(program.ProgramName);
                    }
                }
                CurrentLbox.DataSource = currentList;
                CurrentLbox.DataBind();
            }
        }

        protected void AdminSuspendSubmitBtn_Click(object sender, EventArgs e)
        {
            ProgramInfoEntities db = new ProgramInfoEntities();
            string currentPath = "/Upload/Current/";
            string targetPath = "/Upload/Suspended/";
            foreach (ProgramInfo program in db.ProgramInfoes)
            {
                if (program.ProgramName == CurrentLbox.SelectedValue)
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
                        program.ProgramStatus = "Suspended";
                        program.Reason = ReasonTxtbox.Text;
                        Result.Text = "Changes made successfully, please refresh this page to make another change.";
                    }
                }
            }
            db.SaveChanges();

        }

        protected void AdminCanceleSubmitBtn_Click(object sender, EventArgs e)
        {
            ProgramInfoEntities db = new ProgramInfoEntities();
            string currentPath = "/Upload/Current/";
            string targetPath = "/Upload/Canceled/";
            foreach (ProgramInfo program in db.ProgramInfoes)
            {
                if (program.ProgramName == CurrentLbox.SelectedValue)
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
                        program.Reason = ReasonTxtbox.Text;
                        Result.Text = "Changes made successfully, please refresh this page to make another change.";
                    }
                }
            }
            db.SaveChanges();

        }
    }
}