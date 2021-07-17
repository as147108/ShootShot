using ShootShot.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShootShot.Controllers
{
    public class PhoPrjMgmtController : Controller
    {
        // GET: PhoPrjMgmt
        public ActionResult List()
        {
            dbShootShotEntities db = new dbShootShotEntities();

            IEnumerable<tProject> projects = null;
            ;
            int id = 7;
            //int id = (int)Session[Dictionary.USER_ID];
            var member = db.tMember.Where(t => t.fId == id & t.fCode == 1).FirstOrDefault();
            string pemail = member.fEmail.ToString();
            // 攝影師註冊登入照片
            var PtMember = db.tMember.Where(m => m.fEmail == pemail).FirstOrDefault()?.fPhoto ?? "user.png";
            if (!string.IsNullOrEmpty(PtMember))
                TempData["PhoImg"] = PtMember.ToString();
            // 選擇攝影師所有專案匯入
            projects = from p in db.tProject where p.fPEmail.Contains(pemail) select p;
            MProjectViewModel prj = new MProjectViewModel();
            prj.projects = projects;
            // 接收查詢專案訂單編號
            string OrderNo = Request.Form["txtOrderNum"];
            // 客戶註冊登入照片
            string CfEmail = (from p in db.tProject where p.fOrderNum == OrderNo select new { p.fCEmail }).ToString();
            var CtMember = db.tMember.Where(m => m.fEmail == CfEmail).FirstOrDefault()?.fPhoto ?? "user.png";
            if (!string.IsNullOrEmpty(CtMember))
                TempData["CustImg"] = CtMember.ToString();
            // 列出查詢專案詳細資訊
            if (string.IsNullOrEmpty(OrderNo))
            {
                // 不列出
            }
            else
            {
                // 專案詳細訊息
                tProject tprj = db.tProject.FirstOrDefault(m => m.fOrderNum == OrderNo);
                var tPrj = db.tProject.Where(t => t.fOrderNum == OrderNo).FirstOrDefault();
                var tMember = db.tMember.Where(t => t.fEmail == tPrj.fPEmail).FirstOrDefault();
                string name = tMember.fName.ToString(); ;
                TempData["OrderNum"] = OrderNo;
                TempData["PjtTopic"] = tprj.fPjtTopic;
                TempData["PjtDate"] = tprj.fPjtDate;
                TempData["FilmDate"] = tprj.fFilmDate;
                TempData["FilmTime"] = tprj.fFilmTime;
                TempData["City"] = tprj.fCity;
                TempData["Loc"] = tprj.fLoc;
                TempData["PrintQty"] = tprj.fPrintQty;
                TempData["Budget"] = tprj.fBudget;
                TempData["Style"] = tprj.fStyle;
                TempData["Contact"] = tprj.fContact;
                TempData["ContactTel"] = tprj.fContactTel;
                TempData["WkdyTime"] = tprj.fWkdyTime;
                TempData["WkndTime"] = tprj.fWkndTime;
                TempData["Req"] = tprj.fReq;
                TempData["PicUpload"] = "未上傳照片.png";
                TempData["PhotoName"] = name;
                TempData["PEnail"] = pemail;
                if (!string.IsNullOrEmpty(tprj.fPicUpload))
                {
                    TempData["PicUpload"] = tprj.fPicUpload.ToString();
                }
            }
            return View(prj);
        }
        public ActionResult Create()
        {
            string key = Request.QueryString["Key"];
            TempData["fixkey"] = key;
            return View(key);
        }



        [HttpPost]
        public ActionResult Create(tMsg g)
        {
            dbShootShotEntities db = new dbShootShotEntities();
            int id = 7;
            //	//int id = (int)Session[Dictionary.USER_ID];
            var member = db.tMember.Where(t => t.fId == id & t.fCode == 1).FirstOrDefault();

            string pemail = member.fEmail.ToString();

            string OrderNo = Request.Form["msgOrderNo"];
            var tPrj = db.tProject.Where(t => t.fOrderNum == OrderNo).FirstOrDefault();
            var tMember = db.tMember.Where(t => t.fEmail == tPrj.fCEmail).FirstOrDefault();
            string cemail = tMember.fEmail.ToString();

            //string key = Request.Form["replyid"];
            //int ikey = Convert.ToInt32(key);
            //tMsg msg = db.tMsg.FirstOrDefault(m => m.fId == ikey);
            //if (msg != null)
            //{
            //    g.fPMsg = Request.Form["phoPrjMgmt_texboxChat"];
            //    msg.fPMsg = g.fPMsg;
            //    msg.fPMsgTime = DateTime.Now;
            //    db.SaveChanges();
            //}
            //else
            //{

                g.fOrderNum = Request.Form["msgOrderNo"];
                g.fPMsg = Request.Form["phoPrjMgmt_texboxChat"];
                g.fPMsgTime = DateTime.Now;
                g.fPEmail = pemail;
                g.fCEmail = cemail;
                g.fStates = false;

                db.tMsg.Add(g);
                //try { 
                db.SaveChanges();
                //} 
                //catch (Exception ex){ throw; }	
            //}
            return RedirectToAction("List");
        }

        // 把replymsg create 寫成if 


        [HttpPost]
        public ActionResult ReplyMsg(tMsg m)
        {
            dbShootShotEntities db = new dbShootShotEntities();
            string key = Request.QueryString["Key"];
            int ikey = Convert.ToInt32(key); 
            tMsg msg = db.tMsg.FirstOrDefault(g => g.fId== ikey);
            if (msg != null) 
            {
                
                m.fPMsg = Request.Form["phoPrjMgmt_texboxChat"];
                m.fPMsgTime = DateTime.Now;
                m.fStates = true;
                db.SaveChanges();
            }
            return RedirectToAction("List");
        }

        public ActionResult _PhoMsgPartial()
        {
            string OrderNo = Request.Form["txtOrderNum"];
            dbShootShotEntities db = new dbShootShotEntities();
            int id = 7;
            var member = db.tMember.Where(t => t.fId == id & t.fCode == 1).FirstOrDefault();
            string pemail = member.fEmail.ToString();

            // 攝影師註冊登入照片
            var PtMember = db.tMember.Where(m => m.fEmail == pemail).FirstOrDefault()?.fPhoto ?? "user.png";
            if (!string.IsNullOrEmpty(PtMember))
                TempData["PhoImg"] = PtMember.ToString();

            // 客戶註冊登入照片
            string CfEmail = (from prj in db.tProject where prj.fOrderNum == OrderNo select new { prj.fCEmail }).ToString();
            var CtMember = db.tMember.Where(m => m.fEmail == CfEmail).FirstOrDefault()?.fPhoto ?? "user.png";
            if (!string.IsNullOrEmpty(CtMember))
                TempData["CustImg"] = CtMember.ToString();
            IEnumerable<tMsg> Msg = null;
            Msg = from g in db.tMsg where g.fOrderNum.Contains(OrderNo) orderby g.fId select g;
            string msg = Msg.ToString();

            return PartialView(Msg);
        }

    }
}
