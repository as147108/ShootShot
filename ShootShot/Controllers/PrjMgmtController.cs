using ShootShot.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ShootShot.Controllers
{
    public class PrjMgmtController : Controller
    {
 
        // 列出專案詳細資料
		public ActionResult List()
        {
            dbShootShotEntities db = new dbShootShotEntities();
			// 列出客戶所有專案
			//IEnumerable<tProject> projects = null;
			int id = 4;
			//int id = (int)Session[Dictionary.USER_ID];
			var member = db.tMember.Where(t => t.fId == id).FirstOrDefault();
			string cemail = member.fEmail.ToString();
			//tProject project = db.tProject.Where(p => p.fCEmail == cemail).FirstOrDefault();
			//project = from p in db.tProject where p.fCEmail.Contains(cemail) select p;
			//MProjectViewModel mcprj = new MProjectViewModel();
			//mcprj.project = project;
			// 詳細專案訊息
			string OrderNo = Request.Form["txtOrderNum"];
			if (string.IsNullOrEmpty(OrderNo))
			{
				// 不列出
			}
			else
			{
                // 專案詳細訊息
				tProject prj = db.tProject.FirstOrDefault(m => m.fOrderNum == OrderNo);
                var tPrj = db.tProject.Where(t => t.fOrderNum == OrderNo).FirstOrDefault();
                var tMember = db.tMember.Where(t => t.fEmail == tPrj.fPEmail).FirstOrDefault();
                string name = tMember.fName.ToString();
                string pemail = tMember.fEmail.ToString();
                TempData["OrderNum"] = OrderNo;
                TempData["PjtTopic"] = prj.fPjtTopic;
                TempData["PjtDate"] = prj.fPjtDate;
                TempData["FilmDate"] = prj.fFilmDate;
                TempData["FilmTime"] = prj.fFilmTime;
                TempData["City"] = prj.fCity;
                TempData["Loc"] = prj.fLoc;
                TempData["PrintQty"] = prj.fPrintQty;
                TempData["Budget"] = prj.fBudget;
                TempData["Style"] = prj.fStyle;
                TempData["Contact"] = prj.fContact;
                TempData["ContactTel"] = prj.fContactTel;
                TempData["WkdyTime"] = prj.fWkdyTime;
                TempData["WkndTime"] = prj.fWkndTime;
                TempData["Req"] = prj.fReq;
                TempData["PicUpload"] = "未上傳照片.png";
                TempData["PhotoName"] = name;
                TempData["PEnail"] = pemail;
                if (!string.IsNullOrEmpty(prj.fPicUpload))
                {
                    TempData["PicUpload"] = prj.fPicUpload.ToString();
                }
            }
			 return View();
		}

        // 新增留言
        [HttpPost]
		public ActionResult Create(tMsg g)
		{
		    int id = 4;
			//	//int id = (int)Session[Dictionary.USER_ID];
			var member = (new dbShootShotEntities()).tMember.Where(t => t.fId == id).FirstOrDefault();
            
            string cemail = member.fEmail.ToString();
            
            string OrderNo= Request.Form["msgOrderNo"];
            var tPrj = (new dbShootShotEntities()).tProject.Where(t => t.fOrderNum == OrderNo).FirstOrDefault();
            var tMember = (new dbShootShotEntities()).tMember.Where(t => t.fEmail == tPrj.fPEmail).FirstOrDefault();
            string pemail = tMember.fEmail.ToString();
            g.fOrderNum = Request.Form["msgOrderNo"];
            g.fCMsg = Request.Form["chattext"];
			g.fCMsgTime = DateTime.Now;
            g.fPEmail= pemail;
            g.fCEmail = cemail;
            g.fStates = false;

			dbShootShotEntities db = new dbShootShotEntities();
			db.tMsg.Add(g);
            //try { 
                db.SaveChanges();
            //} 
            //catch (Exception ex){ throw; }	
			return RedirectToAction("List");
		}

        public ActionResult ReplyMsg(int id)
        {
            dbShootShotEntities db = new dbShootShotEntities();
            tMsg msgs = null;
            msgs = db.tMsg.Where(g => g.fId == id).FirstOrDefault();
            MProjectViewModel msg = new MProjectViewModel();
            msg.msg = msgs;
            if (msgs == null)
                return RedirectToAction("List");
            return View(msg);
        }
        [HttpPost]
        public ActionResult ReplyMsg(tMsg m)
        {
            dbShootShotEntities db = new dbShootShotEntities();
            tMsg msgs = null;
            msgs = db.tMsg.Where(g => g.fId == m.fId).FirstOrDefault();
            MProjectViewModel msg = new MProjectViewModel();
            msg.msg = msgs;
            if (msgs != null)
            {
                msgs.fCMsg = m.fCMsg;
                msgs.fCMsgTime = DateTime.Now;
                msgs.fStates = true;
                db.SaveChanges();
            }
            return RedirectToAction("List");
        }


        // partial view 留言內容列表
        public ActionResult _MsgPartial() 
        {
            string OrderNo= Request.Form["txtOrderNum"];
            dbShootShotEntities db = new dbShootShotEntities();
            int id = 4;
            var member = db.tMember.Where(t => t.fId == id).FirstOrDefault();
            string cemail = member.fEmail.ToString();
            string PfEmail = (from prj in db.tProject where prj.fOrderNum == OrderNo select new { prj.fPEmail }).ToString();
            // 攝影師註冊登入照片
            var PtMember = db.tMember.Where(m => m.fEmail == PfEmail).FirstOrDefault()?.fPhoto ?? "user.png";
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
