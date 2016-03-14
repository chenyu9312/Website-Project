using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class CreateFolder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminFolderSubmitBtn_Click(object sender, EventArgs e)
        {
            string path = "/Upload/Current/";
            DirectoryInfo directory = new DirectoryInfo(Server.MapPath(path));
            DirectoryInfo[] directories = directory.GetDirectories();

            if (directories.Length != 0)
            {
                foreach (DirectoryInfo folder in directories)
                {
                    string temporaryPath = path + folder.Name + "/" + FolderNameTxtBox.Text;
                    if (!Directory.Exists(Server.MapPath(temporaryPath)))
                    {
                        Directory.CreateDirectory(Server.MapPath(temporaryPath));
                    }

                }
            }
            path = "/Upload/Suspended/";
            directory = new DirectoryInfo(Server.MapPath(path));
            directories = directory.GetDirectories();

            if (directories.Length != 0)
            {
                foreach (DirectoryInfo folder in directories)
                {
                    string temporaryPath = path + folder.Name + "/" + FolderNameTxtBox.Text;
                    if (!Directory.Exists(Server.MapPath(temporaryPath)))
                    {
                        Directory.CreateDirectory(Server.MapPath(temporaryPath));
                    }

                }
            }
            path = "/Upload/Canceled/";
            directory = new DirectoryInfo(Server.MapPath(path));
            directories = directory.GetDirectories();

            if (directories.Length != 0)
            {
                foreach (DirectoryInfo folder in directories)
                {
                    string temporaryPath = path + folder.Name + "/" + FolderNameTxtBox.Text;
                    if (!Directory.Exists(Server.MapPath(temporaryPath)))
                    {
                        Directory.CreateDirectory(Server.MapPath(temporaryPath));
                    }

                }
            }
            base.OnLoad(e);
            string url = "CreateFolder.aspx";
            string script = "window.onload = function(){ alert('";
            script += "Folders created successfully";
            script += "');";
            script += "window.location = '";
            script += url;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "", script, true);
        }
    }
}
                