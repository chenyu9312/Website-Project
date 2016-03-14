using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class CVSApprovalForm : System.Web.UI.Page
    {
        List<string> schoolList = new List<string>();
        List<string> departList = new List<string>();
        List<string> programList = new List<string>();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                schoolList.Add("Choose a School");
                departList.Add("Choose a Department");
                programList.Add("Choose a Program");
                ProgramInfoEntities db = new ProgramInfoEntities();
                foreach (SchoolInfo school in db.SchoolInfoes)
                {
                    schoolList.Add(school.SchoolAbbrev);
                }
                SchoolAbbrev.DataSource = schoolList;
                SchoolAbbrev.DataBind();
            }

        }
        protected void AdminCVSSubmitBtn_Click(object sender, EventArgs e)
        {
            if (SchoolAbbrev.SelectedValue == "Choose a School" || DepartmentAbbrev.SelectedValue == "Choose a Department" || ProgramAbbrevDDL.SelectedValue == "Choose a Program")
            {
                Result.Text = "You have not chosen a school, a department or a program";
            }
            else
            {
                try
                {
                    ProgramInfoEntities db = new ProgramInfoEntities();
                    foreach (ProgramInfo program in db.ProgramInfoes)
                    {
                        if (program.ProgramCode == ProgramAbbrevDDL.SelectedValue)
                        {
                            if (program.ProgramStatus == "Disapproved" || program.ProgramStatus == "Pending")
                            {
                                string path = "/Upload/" + program.ProgramStatus + "/" + program.ProgramCode + " Approval Documents/";
                                InsertModel cvsApprovalModel = new InsertModel();
                                CVSApproval cvsApprovalInfo = CreateCVSApprovalInfo();
                                string result = cvsApprovalModel.InsertCVSApprovalInfo(cvsApprovalInfo);
                                string[] lastCheck = result.Split();
                                if (lastCheck[lastCheck.Length - 1] == "inserted.")
                                {
                                    if (CVSApplicationUp.HasFile)
                                    {
                                        try
                                        {
                                            CVSApplicationUp.SaveAs(Server.MapPath(path + CVSApplicationUp.FileName));
                                        }
                                        catch (Exception ex)
                                        {
                                            Result.Text = "ERROR: " + ex.Message.ToString();
                                        }
                                    }
                                    else
                                    {
                                        Result.Text = "You have not specified a file.";
                                    }

                                    if (ModelRouteUp.HasFile)
                                    {
                                        try
                                        {
                                            ModelRouteUp.SaveAs(Server.MapPath(path + ModelRouteUp.FileName));
                                        }
                                        catch (Exception ex)
                                        {
                                            Result.Text = "ERROR: " + ex.Message.ToString();
                                        }
                                    }
                                    else
                                    {
                                        Result.Text = "You have not specified a file.";
                                    }

                                    if (ValidationLetterUp.HasFile)
                                    {
                                        try
                                        {
                                            ValidationLetterUp.SaveAs(Server.MapPath(path + ValidationLetterUp.FileName));
                                        }
                                        catch (Exception ex)
                                        {
                                            Result.Text = "ERROR: " + ex.Message.ToString();
                                        }
                                    }
                                    string url = "CVSApprovalForm.aspx";
                                    string script = "window.onload = function(){ alert('";
                                    script += result;
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
                            if (program.ProgramStatus == "Current" || program.ProgramStatus == "Canceled" || program.ProgramStatus == "Suspended")
                            {
                                string path = "/Upload/" + program.ProgramStatus + "/" + program.ProgramCode + "/" + program.ProgramCode + " Approval Documents/";
                                InsertModel cvsApprovalModel = new InsertModel();
                                CVSApproval cvsApprovalInfo = CreateCVSApprovalInfo();
                                string result = cvsApprovalModel.InsertCVSApprovalInfo(cvsApprovalInfo);
                                string[] lastCheck = result.Split();
                                if (lastCheck[lastCheck.Length - 1] == "inserted.")
                                {
                                    if (CVSApplicationUp.HasFile)
                                    {
                                        try
                                        {
                                            CVSApplicationUp.SaveAs(Server.MapPath(path + CVSApplicationUp.FileName));
                                        }
                                        catch (Exception ex)
                                        {
                                            Result.Text = "ERROR: " + ex.Message.ToString();
                                        }
                                    }
                                    else
                                    {
                                        Result.Text = "You have not specified a file.";
                                    }

                                    if (ModelRouteUp.HasFile)
                                    {
                                        try
                                        {
                                            ModelRouteUp.SaveAs(Server.MapPath(path + ModelRouteUp.FileName));
                                        }
                                        catch (Exception ex)
                                        {
                                            Result.Text = "ERROR: " + ex.Message.ToString();
                                        }
                                    }
                                    else
                                    {
                                        Result.Text = "You have not specified a file.";
                                    }

                                    if (ValidationLetterUp.HasFile)
                                    {
                                        try
                                        {
                                            ValidationLetterUp.SaveAs(Server.MapPath(path + ValidationLetterUp.FileName));
                                        }
                                        catch (Exception ex)
                                        {
                                            Result.Text = "ERROR: " + ex.Message.ToString();
                                        }
                                    }
                                    string url = "CVSApprovalForm.aspx";
                                    string script = "window.onload = function(){ alert('";
                                    script += result;
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
                }
                catch (Exception ex)
                {
                    Result.Text = "Date Information is Invalid";
                }
            }

            
        }
        private CVSApproval CreateCVSApprovalInfo()
        {
            CVSApproval cvsApproval = new CVSApproval();
            cvsApproval.ProgramAbbrev = ProgramAbbrevDDL.SelectedValue;
            cvsApproval.CVSApplication = CVSApplicationUp.FileName;
            cvsApproval.ModelRoute = ModelRouteUp.FileName;
            if (CVSApproved.Checked)
            {
                cvsApproval.CVSValidation = true;
            }
            if (CVSNotApproved.Checked)
            {
                cvsApproval.CVSValidation = false;
            }
            cvsApproval.ResponseDate = DateTime.Parse(ResponseTxtBox.Text).Date;
            if (ValidationLetterUp.HasFile)
            {
                cvsApproval.ValidationLetter = ValidationLetterUp.FileName;
            }
            else
            {
                cvsApproval.ValidationLetter = "";
            }
            return cvsApproval;
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

        protected void DepartmentAbbrev_SelectedIndexChanged(object sender, EventArgs e)
        {
            programList.Clear();
            programList.Add("Choose a Program");
            ProgramInfoEntities db = new ProgramInfoEntities();
            foreach (ProgramInfo program in db.ProgramInfoes)
            {
                if (program.DepartmentAbbrev == DepartmentAbbrev.SelectedValue)
                {

                    programList.Add(program.ProgramCode);
                }

            }
            ProgramAbbrevDDL.DataSource = programList;
            ProgramAbbrevDDL.DataBind();
        }
    }
}