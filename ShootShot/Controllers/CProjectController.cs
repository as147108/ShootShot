using Azure.Core;
using Grpc.Core;
using ShootShot.Models;
using ShootShot.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages.Html;
using SelectListItem = System.Web.WebPages.Html.SelectListItem;

namespace ShootShot.Controllers
{
	public class CProjectController : Controller
    {
        // GET: CProject
        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public ActionResult Create()
        {
            dbShootShotEntities db = new dbShootShotEntities();



			// 判斷身分
			if (Session[Dictionary.USER_ID] == null)
			{
				return RedirectToAction("Login", "LoginAndSignup");
			}


			//tMember photog = new tMember();

			int id = (int)Session[Dictionary.USER_ID];
			var member = db.tMember.Where(t => t.fId == id).FirstOrDefault();
            string cemail = member.fEmail.ToString();
            tMember cust = db.tMember.FirstOrDefault(m => m.fEmail == cemail);

            if (cust != null)
            {
                ViewBag.txtCEmail = cemail;
                ViewBag.txtCTel = cust.fTel;
                ViewBag.txtCName = cust.fName;
            };
            //int code = 1;
            //tMember photog = from g in db.tMember where g.fCode == code select new { g.fEmail,g.fName};

            // 匯入攝影師資訊
            ////	var photogs = from m in db.tMember where m.fCode.Equals(1) orderby m.fId select m;
            ////	var photogs = db.tMember.Where(m => m.fCode.Equals(1)).OrderBy(m => m.fId).ToString();
            ////	List<SelectList> photogs = new List<SelectList>()
            ////	{
            ////		ViewBag.PhotogList = new SelectList(
            ////		items: photogs,
            ////		dataTextField: "fName",
            ////		dataValueField: "fEmail"
            ////		);
            ////};
            //var x = 1;
            //var photos = from m in db.tMember where m.fCode.Equals(x) orderby m.fId select m;
            //List<SelectList> items = new List<SelectList>();
            //foreach (var photo in photos)
            //{
            //    items.Add(new SelectList()
            //    {
            //        DataTextField = photo.fName.ToString(),
            //        DataValueField = photo.fEmail

            //    });
            //    //    // 攝影師連結直接選定攝影師
            //    //    //items.Where(q => q.Value == cemail).First().Selected = true;
            //    //}
            //    ViewBag.PhotoItems = items;
            //}

    //        var selectList = new List<System.Web.Mvc.SelectListItem>()
    //        {
    //            new System.Web.Mvc.SelectListItem {Text="text-1", Value="value-1" },
    //            new System.Web.Mvc.SelectListItem {Text="text-2", Value="value-2" },
				//new System.Web.Mvc.SelectListItem {Text="text-3", Value="value-3" },
    //        };

    //        //預設選擇哪一筆
    //        selectList.Where(q => q.Value == "value-2").First().Selected = true;

    //        ViewBag.SelectList = selectList;

            return View();

        }
        // POST: CProject/Create
        [HttpPost]
		public ActionResult Create(CProjectViewModel p)
        {
			string photoName = Guid.NewGuid().ToString() + ".jpg";
			// 錯誤訊息,未將物件設定參考=>action要設定photo再由controller這邊存路徑
			p.photo.SaveAs(Server.MapPath("~/Content/") + photoName);
			p.fPicUpload = "/" + photoName;
			// 訂單編號
			Random rnd = new Random();
            int x = rnd.Next(10, 99);
            p.fOrderNum = DateTime.Now.ToString("yyyyMMdd") + x.ToString();
            p.fPEmail = Request.Form["txtPEmail"];
            dbShootShotEntities db = new dbShootShotEntities();
            db.tProject.Add(p.project);
            db.SaveChanges();
		    ModelState.Clear();
            return View();

        }

    }
}