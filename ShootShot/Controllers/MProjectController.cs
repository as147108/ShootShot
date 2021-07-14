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
            string PfEmail = (from prj in db.tProject where prj.fOrderNum == OrderNo select new { prj.fPEmail }).ToString(); 
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
				var PtMember = db.tMember.Where(m => m.fEmail == PfEmail).FirstOrDefault()?.fPhoto?? "未上傳照片.png";					
                if (!string.IsNullOrEmpty(PtMember))
                     TempData["PhoImg"] = PtMember.ToString();

                // 客戶註冊登入照片
                string CfEmail = (from prj in db.tProject where prj.fOrderNum == OrderNo select new { prj.fCEmail }).ToString();
                var CtMember = db.tMember.Where(m => m.fEmail == CfEmail).FirstOrDefault()?.fPhoto ?? "未上傳照片.png";
                if (!string.IsNullOrEmpty(CtMember))
                {
                    TempData["CustImg"] = CtMember.ToString();
                }
                else {TempData["CustImg"] = "未上傳照片.png";}

                //foreach列出 , 當states = false & fPMsg != null 產生回覆按鈕點擊後產生textarea,input type = "submit",

                var states = db.tMsg.Where(m => m.fOrderNum == OrderNo).FirstOrDefault()?.fStates;
				if (states!= true)
				{
                    // 自己留言攝影師未回

                    // 攝影師留言自己未回
                    // 未將物件設定為參考執行個體
                    //TempData["HTML"] = "<div class='prjMgmt_divForMes'>"+"<img src='~/ Content / images / login_pic.svg'>"+"<p class='memberMes'>"+"攝影師你好,因為氣象預報週六天氣可能會下雨,請問可以直接改期嗎?"+"</p>< p class='mesTime'>"+"2021/06/09 13:54:40</p></div>";
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
