using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramInformationApplication
{
    public partial class AddDeanInfo : System.Web.UI.Page
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

        protected void AdminDeanSubmitBtn_Click(object sender, EventArgs e)
        {
            if (SchoolAbbrev.SelectedValue == "Choose a School")
            {
                Result.Text = "You have not chosen a school";
            }
            else
            {
                try {
                    InsertModel deanInfoModel = new InsertModel();
                    DeanInfo deanInfo = CreateDeanInfo();
                    string result = deanInfoModel.InsertDeanInfo(deanInfo);
                    string[] lastCheck = result.Split();
                    if (lastCheck[lastCheck.Length - 1] == "inserted.")
                    {
                        string url = "AddDeanInfo.aspx";
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

        private DeanInfo CreateDeanInfo()
        {
            DeanInfo deanInfo = new DeanInfo();
            deanInfo.SchoolAbbrev = SchoolAbbrev.SelectedValue;
            deanInfo.DeanFirstName = DeanFirstTxtBox.Text;
            deanInfo.DeanLastName = DeanLastTxtBox.Text;
            if (StartDateTxtBox.Text != "")
            {
                deanInfo.DeanStartDate = DateTime.Parse(StartDateTxtBox.Text).Date;
            }

            deanInfo.DeanEndDate = DateTime.Parse(EndDateTxtBox.Text).Date;
            deanInfo.Acting = ActingCkBox.Checked;
            deanInfo.DeanDescription = DescriptionTxtbox.Text;

            return deanInfo;
        }
    }

}