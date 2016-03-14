using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProgramInformationApplication
{
    public class InsertModel
    {
        public string InsertProgramInfo(ProgramInfo programInfo)
        {
            try
            {
                ProgramInfoEntities db = new ProgramInfoEntities();
                db.ProgramInfoes.Add(programInfo);
                db.SaveChanges();
                return programInfo.ProgramCode + " was successfully inserted.";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        public string InsertChairInfo(ChairInfo chairInfo)
        {
            try
            {
                ProgramInfoEntities db = new ProgramInfoEntities();
                db.ChairInfoes.Add(chairInfo);
                db.SaveChanges();
                return chairInfo.ChairFirstName + " " + chairInfo.ChairLastName + " was successfully inserted.";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        public string InsertCoordinatorInfo(CoordinatorInfo coordinatorInfo)
        {
            try
            {
                ProgramInfoEntities db = new ProgramInfoEntities();
                db.CoordinatorInfoes.Add(coordinatorInfo);
                db.SaveChanges();
                return coordinatorInfo.CoordinatorFirstName + " " + coordinatorInfo.CoordinatorLastName + " was successfully inserted.";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public string InsertDeanInfo(DeanInfo deanInfo)
        {
            try
            {
                ProgramInfoEntities db = new ProgramInfoEntities();
                db.DeanInfoes.Add(deanInfo);
                db.SaveChanges();
                return deanInfo.DeanFirstName + " " + deanInfo.DeanLastName + " was successfully inserted.";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
        public string InsertDeanInfo(DepartmentInfo departmentInfo)
        {
            try
            {
                ProgramInfoEntities db = new ProgramInfoEntities();
                db.DepartmentInfoes.Add(departmentInfo);
                db.SaveChanges();
                return departmentInfo.DepartmentAbbrev + " was successfully inserted.";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public string InsertSchoolInfo(SchoolInfo schoolInfo)
        {
            try
            {
                ProgramInfoEntities db = new ProgramInfoEntities();
                db.SchoolInfoes.Add(schoolInfo);
                db.SaveChanges();
                return schoolInfo.SchoolAbbrev + " was successfully inserted.";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public string InsertCVSApprovalInfo(CVSApproval CVSApprovalInfo)
        {
            try {
                ProgramInfoEntities db = new ProgramInfoEntities();
                db.CVSApprovals.Add(CVSApprovalInfo);
                db.SaveChanges();
                return CVSApprovalInfo.CVSID + " was successfully inserted.";
            }
            catch (Exception e)
            {
                return e.Message;
            }
            
        }

        public string InsertMTCUApprovalInfo(MTCUApproval MTCUApprovalInfo)
        {
            try
            {
                ProgramInfoEntities db = new ProgramInfoEntities();
                db.MTCUApprovals.Add(MTCUApprovalInfo);
                db.SaveChanges();
                return MTCUApprovalInfo.MTCUID + " was successfully inserted.";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public string InsertPEQABReportInfo(PEQABReport peqabReportInfo)
        {
            try
            {
                ProgramInfoEntities db = new ProgramInfoEntities();
                db.PEQABReports.Add(peqabReportInfo);
                db.SaveChanges();
                return peqabReportInfo.PEQABID + " was successfully inserted.";
            }
            catch (Exception e)
            {
                return e.Message;
            }

        }
    }
}