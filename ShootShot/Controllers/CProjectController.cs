﻿using ShootShot.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages.Html;
using static System.Net.Mime.MediaTypeNames;


namespace ShootShot.Controllers
{
	public class CProjectController : Controller
    {
        // GET: CProject
        public ActionResult Index()
        {
            return View();
        }

        // GET: CProject/Details/5

        //public ActionResult fileUploadDemo()
        //{
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult fileUploadDemo(HttpPostedFileBase photo)
        //{
        //    photo.SaveAs(@"C:\Users\Yulin\Desktop\ShootShot\ShootShot\Content\photo.jpg");
        //    return View();
        //}
        // GET: CProject/Create
        [HttpGet]
        public ActionResult Create()
        {
            // 判斷身分
            //if (Session[Dictionary.USER_ID] == null)
            //{
            //    return RedirectToAction("Login", "LoginAndSignup");
            //}

            dbShootShotEntities db = new dbShootShotEntities();
			//tMember photog = new tMember();
			var cemail = "nina1982@gmail.com";
            tMember cust = db.tMember.FirstOrDefault(m => m.fEmail == cemail);
            if (cust != null)
            {
                ViewBag.txtCEmail = cemail;
                ViewBag.txtCTel = cust.fTel;
                ViewBag.txtCName = cust.fName;
            };
            //int code = 1;
            //tMember photog = from g in db.tMember where g.fCode == code select new { g.fEmail,g.fName};
            
            var list = new SelectList(new[]
            {
             new {Email="mikhail1974@gmail.com",Name="Nilov"},
              new{Email="lucas1976@gmail.com",Name="Pezeta"},
                new{Email="olga1986@gmail.com",Name="Olga Dimenshtein"},
                 },
                "Email", "Name", 1);
                 ViewData["list"] = list;



   //         var code = 1;
			//static photog =from g in db.tMember where g.fCode == code select new { g.fEmail,g.fName };
			//if (photog != null)
			//{
			//	var list = new List<SelectListItem>();

			//	list.Add(new SelectListItem
			//	{
			//		Text = photog.fName,
			//		Value = photog.fEmail
			//	});
			//	ViewBag.List = new SelectList(list);
			//};
			//tMember cust = db.tMember.Where(t=>t.fEmail.ToString()==cemail).FirstOrDefault();

			//CProjectViewModel cprj = new CProjectViewModel();
			//cprj.fCName = cust.fName;

			//var photoglist = from m in db.tMemberPhot select m;
			//ViewBag.SelPhotog = new SelectList(photoglist, "fName").ToList();
			//攝影師清單由資料庫產生及拍攝地點

			//var data = from g in (new dbShootShotEntities()).tMemberPhot select g; //假設從資料庫撈出資料。
			//tMemberPhot item = new tMemberPhot();

			//預約者姓名電話email帶入

			//return RedirectToAction("Create");


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
            dbShootShotEntities db = new dbShootShotEntities();
            db.tProject.Add(p.project);
            db.SaveChanges();
            ModelState.Clear();
            return View();




        }
    }
}