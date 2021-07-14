using ShootShot.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ShootShot.Controllers
{
    public class MProjectController : Controller
    {
 
        public ActionResult _MsgPartial() 
        {

            dbShootShotEntities db = new dbShootShotEntities();
            // 由orderNO & CEmail列出舊有留言
            var email = "nina1982@gmail.com";
            string OrderNo = Request.Form["txtOrderNum"];
            // 有問題, 並未將物件參考設定為物件的執行個體。
            string PfEmail = db.tProject.Where(p => p.fOrderNum == OrderNo).FirstOrDefault().ToString();
            if (string.IsNullOrEmpty(OrderNo))
            {
                // 無留言
            }
            else
            {
				// 列出客戶所有訂單留言
				tMsg custMsg = db.tMsg.OrderBy(m => m.fId).FirstOrDefault(m => m.fCEmail == email);
				// 搜尋特定訂單留言並依據fid排序
				var tMsgs = db.tMsg.Where(t => t.fOrderNum == OrderNo).OrderBy(t => t.fId).FirstOrDefault();
				// 攝影師註冊登入照片
				var tMember = db.tMember.Where(m => m.fEmail == PfEmail).SingleOrDefault();
				string PhoImg = tMember.fPhoto.ToString();						
                if (!string.IsNullOrEmpty(tMember.fPhoto))
                {
                    TempData["PhoImg"] = tMember.fPhoto.ToString();
                }
                else {TempData["PhoImg"] = "未上傳照片.png"; }

                // 客戶註冊登入照片
				var custimg = db.tMember.Where(m => m.fEmail == tMsgs.fCEmail).FirstOrDefault();
				string CustImg = custimg.fPhoto.ToString();
                if (!string.IsNullOrEmpty(custimg.fPhoto))
                {
                    TempData["CustImg"] = custimg.fPhoto.ToString();
                }
                else {TempData["CustImg"] = "未上傳照片.png";}

				//foreach列出 , 當states = false & fPMsg != null 產生回覆按鈕點擊後產生textarea,input type = "submit",
				if (tMsgs.fStates == false)
				{
					// 自己留言攝影師未回

					// 攝影師留言自己未回
					tMsgs.fPMsg += "HTML語法=>對話框及input submit按鈕 送出更新states";
				}
				else
				{

				}


				//foreach列出 ,視窗最後產生textarea,input type = "submit"=>在最上方
			}
			//return View();
			return PartialView();
		}
        //[HttpPost]
        //public ActionResult _MsgPartial()
        //{
        //    ModelState.Clear();
        //    return RedirectToAction("_MsgPartial");
        //}

        // GET: MProject
        public ActionResult List()
        {
            dbShootShotEntities db = new dbShootShotEntities();
            // 列出客戶所有專案
            IEnumerable<tProject> custprj = null;
            var email = "nina1982@gmail.com"; // 登入email
            custprj = from p in db.tProject
                      where p.fCEmail.Contains(email)
                      select p;

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
			 return View(custprj);
		}

		// GET: MProject/Details/5
		public ActionResult Details(int id)
        {
            return View();
        }

        // GET: MProject/Create
        public ActionResult Create()
        {
            return View();
        }
    }
}
