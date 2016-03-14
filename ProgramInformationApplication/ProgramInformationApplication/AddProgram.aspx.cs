using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class AddProgram : System.Web.UI.Page
    {
        List<string> schoolList = new List<string>();
        List<string> departList = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                schoolList.Add("Choose a School");
                departList.Add("Choose a Department");
                ProgramInfoEntities db = new ProgramInfoEntities();
                foreach (SchoolInfo school in db.SchoolInfoes)
                {
                    schoolList.Add(school.SchoolAbbrev);
                }
                SchoolAbbrev.DataSource = schoolList;
                SchoolAbbrev.DataBind();
            }
        }

        protected void AdminProgramSubmitBtn_Click(object sender, EventArgs e)
        {
            if (SchoolAbbrev.SelectedValue == "Choose a School" || DepartmentAbbrev.SelectedValue == "Choose a Department")
            {
                Result.Text = "You have not chosen a school or a department";
            }
            else
            {
                try
                {
                    if (Disapproved.Checked)
                    {
                        string path = "/Upload/Disapproved/" + ProgramCodeTxtbox.Text + " Approval Documents";
                        if (Directory.Exists(Server.MapPath(path)))
                        {
                            // folder exist message
                            Result.Text = "Folder already exists!";
                        }
                        else
                        {
                            InsertModel programInfoModel = new InsertModel();
                            ProgramInfo programInfo = CreateProgramInfo();
                            string result = programInfoModel.InsertProgramInfo(programInfo);
                            string[] lastCheck = result.Split();
                            if (lastCheck[lastCheck.Length - 1] == "inserted.")
                            {
                                Directory.CreateDirectory(Server.MapPath(path));
                                base.OnLoad(e);
                                string url = "AddProgram.aspx";
                                string script = "window.onload = function(){ alert('";
                                script += result;
                                script += " Folder(s) is/are successfully created.";
                                script += "');";
                                script += "window.location = '";
                                script += url;
                                script += "'; }";
                                ClientScript.RegisterStartupScript(this.GetType(), "", script, true);
                            }
                            else
                            {
                                Result.Text = result;
                            }
                        }
                    }
                    if (Pending.Checked)
                    {
                        string path = "/Upload/Pending/" + ProgramCodeTxtbox.Text + " Approval Documents";
                        if (Directory.Exists(Server.MapPath(path)))
                        {
                            // folder exist message
                            Result.Text = "Folder already exists!";
                        }
                        else
                        {
                            InsertModel programInfoModel = new InsertModel();
                            ProgramInfo programInfo = CreateProgramInfo();
                            string result = programInfoModel.InsertProgramInfo(programInfo);
                            string[] lastCheck = result.Split();
                            if (lastCheck[lastCheck.Length - 1] == "inserted.")
                            {
                                Directory.CreateDirectory(Server.MapPath(path));
                                base.OnLoad(e);
                                string url = "AddProgram.aspx";
                                string script = "window.onload = function(){ alert('";
                                script += result;
                                script += " Folder(s) is/are successfully created.";
                                script += "');";
                                script += "window.location = '";
                                script += url;
                                script += "'; }";
                                ClientScript.RegisterStartupScript(this.GetType(), "", script, true);
                            }
                            else
                            {
                                Result.Text = result;
                            }
                        }
                    }
                    if (Current.Checked)
                    {
                        string path = "/Upload/Current/" + ProgramCodeTxtbox.Text;
                        if (Directory.Exists(Server.MapPath(path)))
                        {
                            // folder exist message
                            Result.Text = "Folder already exists!";
                        }
                        else
                        {
                            InsertModel programInfoModel = new InsertModel();
                            ProgramInfo programInfo = CreateProgramInfo();
                            string result = programInfoModel.InsertProgramInfo(programInfo);
                            string[] lastCheck = result.Split();
                            if (lastCheck[lastCheck.Length - 1] == "inserted.")
                            {
                                Directory.CreateDirectory(Server.MapPath(path));
                                Directory.CreateDirectory(Server.MapPath(path + "/PAC"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Mapping"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Outcomes"));
                                Directory.CreateDirectory(Server.MapPath(path + "/New CAAT Standards"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Title Change"));
                                if (Degree.Checked)
                                {
                                    Directory.CreateDirectory(Server.MapPath(path + "/PEQAB Renewal"));
                                }
                                Directory.CreateDirectory(Server.MapPath(path + "/Accreditations"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Articulations"));
                                Directory.CreateDirectory(Server.MapPath(path + "/CPQR"));
                                Directory.CreateDirectory(Server.MapPath(path + "/" + ProgramCodeTxtbox.Text + " Approval Documents"));
                                base.OnLoad(e);
                                string url = "AddProgram.aspx";
                                string script = "window.onload = function(){ alert('";
                                script += result;
                                script += " Folder(s) is/are successfully created.";
                                script += "');";
                                script += "window.location = '";
                                script += url;
                                script += "'; }";
                                ClientScript.RegisterStartupScript(this.GetType(), "", script, true);
                            }
                            else
                            {
                                Result.Text = result;
                            }
                        }
                    }
                    if (Suspended.Checked)
                    {
                        string path = "/Upload/Suspended/" + ProgramCodeTxtbox.Text;
                        if (Directory.Exists(Server.MapPath(path)))
                        {
                            // folder exist message
                            Result.Text = "Folder already exists!";
                        }
                        else
                        {
                            InsertModel programInfoModel = new InsertModel();
                            ProgramInfo programInfo = CreateProgramInfo();
                            string result = programInfoModel.InsertProgramInfo(programInfo);
                            string[] lastCheck = result.Split();
                            if (lastCheck[lastCheck.Length - 1] == "inserted.")
                            {
                                Directory.CreateDirectory(Server.MapPath(path));
                                Directory.CreateDirectory(Server.MapPath(path + "/PAC"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Mapping"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Outcomes"));
                                Directory.CreateDirectory(Server.MapPath(path + "/New CAAT Standards"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Title Change"));
                                if (Degree.Checked)
                                {
                                    Directory.CreateDirectory(Server.MapPath(path + "/PEQAB Renewal"));
                                }
                                Directory.CreateDirectory(Server.MapPath(path + "/Accreditations"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Articulations"));
                                Directory.CreateDirectory(Server.MapPath(path + "/CPQR"));
                                Directory.CreateDirectory(Server.MapPath(path + "/" + ProgramCodeTxtbox.Text + " Approval Documents"));
                                base.OnLoad(e);
                                string url = "AddProgram.aspx";
                                string script = "window.onload = function(){ alert('";
                                script += result;
                                script += " Folder(s) is/are successfully created.";
                                script += "');";
                                script += "window.location = '";
                                script += url;
                                script += "'; }";
                                ClientScript.RegisterStartupScript(this.GetType(), "", script, true);
                            }
                            else
                            {
                                Result.Text = result;
                            }
                        }
                    }
                    if (Canceled.Checked)
                    {
                        string path = "/Upload/Canceled/" + ProgramCodeTxtbox.Text;
                        if (Directory.Exists(Server.MapPath(path)))
                        {
                            // folder exist message
                            Result.Text = "Folder already exists!";
                        }
                        else
                        {
                            InsertModel programInfoModel = new InsertModel();
                            ProgramInfo programInfo = CreateProgramInfo();
                            string result = programInfoModel.InsertProgramInfo(programInfo);
                            string[] lastCheck = result.Split();
                            if (lastCheck[lastCheck.Length - 1] == "inserted.")
                            {
                                Directory.CreateDirectory(Server.MapPath(path));
                                Directory.CreateDirectory(Server.MapPath(path + "/PAC"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Mapping"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Outcomes"));
                                Directory.CreateDirectory(Server.MapPath(path + "/New CAAT Standards"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Title Change"));
                                if (Degree.Checked)
                                {
                                    Directory.CreateDirectory(Server.MapPath(path + "/PEQAB Renewal"));
                                }
                                Directory.CreateDirectory(Server.MapPath(path + "/Accreditations"));
                                Directory.CreateDirectory(Server.MapPath(path + "/Articulations"));
                                Directory.CreateDirectory(Server.MapPath(path + "/CPQR"));
                                Directory.CreateDirectory(Server.MapPath(path + "/" + ProgramCodeTxtbox.Text + " Approval Documents"));
                                base.OnLoad(e);
                                string url = "AddProgram.aspx";
                                string script = "window.onload = function(){ alert('";
                                script += result;
                                script += " Folder(s) is/are successfully created.";
                                script += "');";
                                script += "window.location = '";
                                script += url;
                                script += "'; }";
                                ClientScript.RegisterStartupScript(this.GetType(), "", script, true);
                            }
                            else
                            {
                                Result.Text = result;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Result.Text = "Date Information is Invalid";
                }
            }
        }
        private ProgramInfo CreateProgramInfo()
        {
            ProgramInfo programInfo = new ProgramInfo();
            programInfo.DepartmentAbbrev = DepartmentAbbrev.SelectedValue;
            programInfo.ProgramCode = ProgramCodeTxtbox.Text;
            if (Degree.Checked)
            {
                programInfo.Credential = "Degree";
            }
            if (Diploma.Checked)
            {
                programInfo.Credential = "Diploma";
            }
            if (AdvancedDiploma.Checked)
            {
                programInfo.Credential = "Advanced Diploma";
            }
            if (Certificate.Checked)
            {
                programInfo.Credential = "Certificate";
            }
            if (GraduateCertificate.Checked)
            {
                programInfo.Credential = "Graduate Certificate";
            }
            if (Pending.Checked)
            {
                programInfo.ProgramStatus = "Pending";
            }
            if (Disapproved.Checked)
            {
                programInfo.ProgramStatus = "Disapproved";
            }
            if (Current.Checked)
            {
                programInfo.ProgramStatus = "Current";
            }
            if (Suspended.Checked)
            {
                programInfo.ProgramStatus = "Suspended";
            }
            if (Canceled.Checked)
            {
                programInfo.ProgramStatus = "Canceled";
            }
            programInfo.ProgramName = ProgramNameTxtbox.Text;
            if (StartDateTxtBox.Text != "")
            {
                programInfo.StartDate = DateTime.Parse(StartDateTxtBox.Text).Date;
            }
            programInfo.ProgramDuration = Convert.ToInt32(ProgramDurationTxtBox.Text);
            programInfo.Reason = ReasonTxtbox.Text;
            
            

            return programInfo;
        }

        protected void SchoolAbbrev_SelectedIndexChanged(object sender, EventArgs e)
        {
            departList.Clear();
            departList.Add("Choose a Department");
            ProgramInfoEntities db = new ProgramInfoEntities();
            foreach (DepartmentInfo department in db.DepartmentInfoes)
            {
                if (department.SchoolAbbrev == SchoolAbbrev.SelectedValue)
                {

                    departList.Add(department.DepartmentAbbrev);
                }

            }
            DepartmentAbbrev.DataSource = departList;
            DepartmentAbbrev.DataBind();
        }

        protected void Suspended_CheckedChanged(object sender, EventArgs e)
        {
            ReasonTxtbox.Enabled = true;
            ReasonTxtbox.Visible = true;
            HideReason.Enabled = true;
            HideReason.Visible = true;
        }

        protected void Current_CheckedChanged(object sender, EventArgs e)
        {
            ReasonTxtbox.Enabled = false;
            ReasonTxtbox.Visible = false;
            HideReason.Enabled = false;
            HideReason.Visible = false;
        }
    }
}