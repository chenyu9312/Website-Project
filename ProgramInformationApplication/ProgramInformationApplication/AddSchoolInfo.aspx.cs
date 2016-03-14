using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class AddSchoolInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminSchoolInfobtnSubmit_Click(object sender, EventArgs e)
        {
            InsertModel schoolInfoModel = new InsertModel();
            SchoolInfo schoolInfo = CreateSchoolInfo();
            string result = schoolInfoModel.InsertSchoolInfo(schoolInfo);
            string[] lastCheck = result.Split();
            if (lastCheck[lastCheck.Length - 1] == "inserted.")
            {
                string url = "AddSchoolInfo.aspx";
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

        private SchoolInfo CreateSchoolInfo()
        {
            SchoolInfo schoolInfo = new SchoolInfo();
            schoolInfo.SchoolAbbrev = SchoolAbbrevTxtbox.Text;
            schoolInfo.SchoolName = SchoolNameTxtbox.Text;
            schoolInfo.SchoolDescription = DescriptionTxtbox.Text;

            return schoolInfo;
        }
    }
}