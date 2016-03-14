using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class AddChairInfo : System.Web.UI.Page
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

        protected void AdminChairSubmitBtn_Click(object sender, EventArgs e)
        {
            if (SchoolAbbrev.SelectedValue == "Choose a School" || DepartmentAbbrev.SelectedValue == "Choose a Department")
            {
                Result.Text = "You have not chosen a school or a department";
            }
            else
            {
                try
                {
                    InsertModel chairInfoModel = new InsertModel();
                    ChairInfo chairInfo = CreateChairInfo();
                    string result = chairInfoModel.InsertChairInfo(chairInfo);
                    string[] lastCheck = result.Split();
                    if (lastCheck[lastCheck.Length - 1] == "inserted.")
                    {
                        string url = "AddChairInfo.aspx";
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

        private ChairInfo CreateChairInfo()
        {
            ChairInfo chairInfo = new ChairInfo();
            chairInfo.DepartmentAbbrev = DepartmentAbbrev.SelectedValue;
            chairInfo.ChairFirstName = ChairFirstTxtBox.Text;
            chairInfo.ChairLastName = ChairLastTxtBox.Text;
            chairInfo.Acting = ActingCkBox.Checked;
            if (StartDateTxtBox.Text != "")
            {
                chairInfo.ChairStartDate = DateTime.Parse(StartDateTxtBox.Text).Date;
            }
            if (EndDateTxtBox.Text != "")
            {
                chairInfo.ChairEndDate = DateTime.Parse(EndDateTxtBox.Text).Date;
            }
            chairInfo.ChairDescription = DescriptionTxtbox.Text;

            return chairInfo;
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


    }
}