using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class DisapproveOrApprove : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> pendingList = new List<string>();
                ProgramInfoEntities db = new ProgramInfoEntities();
                foreach (ProgramInfo program in db.ProgramInfoes)
                {
                    if (program.ProgramStatus == "Pending")
                    {
                        pendingList.Add(program.ProgramName);
                    }
                }
                PendingLbox.DataSource = pendingList;
                PendingLbox.DataBind();
            }
        }

        protected void AdminApproveSubmitBtn_Click(object sender, EventArgs e)
        {
            ProgramInfoEntities db = new ProgramInfoEntities();
            string currentPath = "/Upload/Pending/";
            string targetPath = "/Upload/Current/";
            foreach (ProgramInfo program in db.ProgramInfoes)
            {
                if (program.ProgramName == PendingLbox.SelectedValue)
                {
                    currentPath = currentPath + program.ProgramCode + " Approval Documents";
                    targetPath = targetPath + program.ProgramCode;
                    Directory.CreateDirectory(Server.MapPath(targetPath));
                    Directory.CreateDirectory(Server.MapPath(targetPath + "/PAC"));
                    Directory.CreateDirectory(Server.MapPath(targetPath + "/Mapping"));
                    Directory.CreateDirectory(Server.MapPath(targetPath + "/Outcomes"));
                    Directory.CreateDirectory(Server.MapPath(targetPath + "/New CAAT Standards"));
                    Directory.CreateDirectory(Server.MapPath(targetPath + "/Title Change"));
                    if (program.ProgramStatus == "Degree")
                    {
                        Directory.CreateDirectory(Server.MapPath(targetPath + "/PEQAB Renewal"));
                    }
                    Directory.CreateDirectory(Server.MapPath(targetPath + "/Accreditations"));
                    Directory.CreateDirectory(Server.MapPath(targetPath + "/Articulations"));
                    Directory.CreateDirectory(Server.MapPath(targetPath + "/CPQR"));
                    targetPath = targetPath + "/" + program.ProgramCode + " Approval Documents";
                    if (Directory.Exists(Server.MapPath(targetPath)))
                    {
                        // folder exist message
                        Result.Text = "Folder already exists!";
                    }
                    else
                    {
                        Directory.Move(Server.MapPath(currentPath), Server.MapPath(targetPath));
                        program.ProgramStatus = "Current";
                        Result.Text = "Changes made successfully, please refresh this page to make another change.";
                    }
                }
            }
            db.SaveChanges();

        }

        protected void AdminDisapproveSubmitBtn_Click(object sender, EventArgs e)
        {
            ProgramInfoEntities db = new ProgramInfoEntities();
            string currentPath = "/Upload/Pending/";
            string targetPath = "/Upload/Disapproved/";
            foreach (ProgramInfo program in db.ProgramInfoes)
            {
                if (program.ProgramName == PendingLbox.SelectedValue)
                {
                    currentPath = currentPath + program.ProgramCode + " Approval Documents";
                    targetPath = targetPath + program.ProgramCode + " Approval Documents";
                    if (Directory.Exists(Server.MapPath(targetPath)))
                    {
                        // folder exist message
                        Result.Text = "Folder already exists!";
                    }
                    else
                    {
                        Directory.Move(Server.MapPath(currentPath), Server.MapPath(targetPath));
                        program.ProgramStatus = "Disapproved";
                        Result.Text = "Changes made successfully, please refresh this page to make another change.";
                    }
                }
            }
            db.SaveChanges();
        }
    }
}