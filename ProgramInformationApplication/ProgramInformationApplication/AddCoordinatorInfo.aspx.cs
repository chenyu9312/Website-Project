using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class AddCoordinatorInfo : System.Web.UI.Page
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

        protected void AdminCoordinatorSubmitBtn_Click(object sender, EventArgs e)
        {
            if (SchoolAbbrev.SelectedValue == "Choose a School" || DepartmentAbbrev.SelectedValue == "Choose a Department" || ProgramCode.SelectedValue == "Choose a Program")
            {
                Result.Text = "You have not chosen a school, a department or a program";
            }
            else
            {
                try
                {
                    InsertModel coordinatorInfoModel = new InsertModel();
                    CoordinatorInfo coordinatorInfo = CreateCoordinatorInfo();
                    string result = coordinatorInfoModel.InsertCoordinatorInfo(coordinatorInfo);
                    string[] lastCheck = result.Split();
                    if (lastCheck[lastCheck.Length - 1] == "inserted.")
                    {
                        string url = "AddCoordinatorInfo.aspx";
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
                catch (Exception ex)
                {
                    Result.Text = "Date Information is Invalid";
                }
            }
        }

        private CoordinatorInfo CreateCoordinatorInfo()
        {
            CoordinatorInfo coordinatorInfo = new CoordinatorInfo();
            coordinatorInfo.ProgramCode = ProgramCode.SelectedValue;
            coordinatorInfo.CoordinatorFirstName = CoordinatorFirstTxtBox.Text;
            coordinatorInfo.CoordinatorLastName = CoordinatorLastTxtBox.Text;
            coordinatorInfo.Acting = ActingCkBox.Checked;
            if (StartDateTxtBox.Text != "")
            {
                coordinatorInfo.CoordinatorStartDate = DateTime.Parse(StartDateTxtBox.Text).Date;
            }
            if (EndDateTxtBox.Text != "")
            {
                coordinatorInfo.CoordinatorEndDate = DateTime.Parse(EndDateTxtBox.Text).Date;
            }
            coordinatorInfo.CoordinatorDescription = DescriptionTxtbox.Text;

            return coordinatorInfo;
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
            ProgramCode.DataSource = programList;
            ProgramCode.DataBind();
        }
    }
}