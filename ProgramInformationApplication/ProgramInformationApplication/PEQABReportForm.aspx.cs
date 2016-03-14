using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class PEQABReportForm : System.Web.UI.Page
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

        private PEQABReport CreatePEQABReportInfo()
        {
            PEQABReport peqabReport = new PEQABReport();
            peqabReport.ProgramAbbrev = ProgramAbbrevDDL.SelectedValue;
            peqabReport.PEQABApprovalReprot = PEQABReportUp.FileName;
            peqabReport.PEAQBDesicion = PEQABDecisionUp.FileName;
            peqabReport.ResponseDate = DateTime.Parse(ResponseTxtBox.Text).Date;

           

            return peqabReport;
        }

        protected void AdminPEQABSubmitBtn_Click(object sender, EventArgs e)
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
                                InsertModel peqabReportModel = new InsertModel();
                                PEQABReport peqabReportInfo = CreatePEQABReportInfo();
                                string result = peqabReportModel.InsertPEQABReportInfo(peqabReportInfo);
                                string[] lastCheck = result.Split();
                                if (lastCheck[lastCheck.Length - 1] == "inserted.")
                                {
                                    if (PEQABReportUp.HasFile)
                                    {
                                        try
                                        {
                                            PEQABReportUp.SaveAs(Server.MapPath(path + PEQABReportUp.FileName));
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

                                    if (PEQABDecisionUp.HasFile)
                                    {
                                        try
                                        {
                                            PEQABDecisionUp.SaveAs(Server.MapPath(path + PEQABDecisionUp.FileName));
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
                                    string url = "PEQABReportForm.aspx";
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
                                InsertModel peqabReportModel = new InsertModel();
                                PEQABReport peqabReportInfo = CreatePEQABReportInfo();
                                string result = peqabReportModel.InsertPEQABReportInfo(peqabReportInfo);
                                string[] lastCheck = result.Split();
                                if (lastCheck[lastCheck.Length - 1] == "inserted.")
                                {
                                    if (PEQABReportUp.HasFile)
                                    {
                                        try
                                        {
                                            PEQABReportUp.SaveAs(Server.MapPath(path + PEQABReportUp.FileName));
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

                                    if (PEQABDecisionUp.HasFile)
                                    {
                                        try
                                        {
                                            PEQABDecisionUp.SaveAs(Server.MapPath(path + PEQABDecisionUp.FileName));
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

                                    string url = "PEQABReportForm.aspx";
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
    }
}