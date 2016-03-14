using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class AddDepartmentInfo : System.Web.UI.Page
    {
        List<string> schoolList = new List<string>();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                schoolList.Add("Choose a School");
                ProgramInfoEntities db = new ProgramInfoEntities();
                foreach (SchoolInfo school in db.SchoolInfoes)
                {
                    schoolList.Add(school.SchoolAbbrev);
                }
                SchoolAbbrev.DataSource = schoolList;
                SchoolAbbrev.DataBind();
            }
        }

        protected void AdminDepartmentSubmitBtn_Click(object sender, EventArgs e)
        {
            if (SchoolAbbrev.SelectedValue == "Choose a School")
            {
                Result.Text = "You have not chosen a school";
            }
            else
            {
                try
                {
                    InsertModel deanInfoModel = new InsertModel();
                    DepartmentInfo departmentInfo = CreateDepartmentInfo();
                    string result = deanInfoModel.InsertDeanInfo(departmentInfo);
                    string[] lastCheck = result.Split();
                    if (lastCheck[lastCheck.Length - 1] == "inserted.")
                    {
                        string url = "AddDepartmentInfo.aspx";
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

        private DepartmentInfo CreateDepartmentInfo()
        {
            DepartmentInfo departmentInfo = new DepartmentInfo();
            departmentInfo.SchoolAbbrev = SchoolAbbrev.SelectedValue;
            departmentInfo.DepartmentAbbrev = DepartmentAbbrevTxtbox.Text;
            departmentInfo.DepartmentName = DepartmentNameTxtbox.Text;
            departmentInfo.Description = DescriptionTxtbox.Text;

            return departmentInfo;
        }
    }
}
