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
            ViewBag.ServerVar = "Html.RenderAction is appropriate for dynamic data";
            return PartialView();
        }

        // GET: MProject
        public ActionResult List()
        {
            dbShootShotEntities db = new dbShootShotEntities();
            IEnumerable<tProject> custprj = null;
            var email = "nina1982@gmail.com"; // 登入email
            custprj = from p in db.tProject
                      where p.fCEmail.Contains(email)
                      select p;

            string OrderNo = Request.Form["txtOrderNum"];
			if (string.IsNullOrEmpty(OrderNo))
			{
				
			}
			else
			{

				tProject prj = db.tProject.FirstOrDefault(m => m.fOrderNum == OrderNo);

                //無法轉型
                var tPrj = db.tProject.Where(t => t.fOrderNum == OrderNo).FirstOrDefault();
                var tMember = db.tMember.Where(t => t.fEmail == tPrj.fPEmail).FirstOrDefault();
                string name = tMember.fName.ToString();
                string pemail = tMember.fEmail.ToString();

                TempData["PjtTopic"] = prj.fPjtTopic;
                TempData["PjtDate"] = prj.fPjtDate;
                TempData["FilmDate"] = prj.fFilmDate;
                TempData["FilmTime"] = prj.fFilmTime;
                TempData["City"] = prj.fCity;
                TempData["Loc"] = prj.fLoc;
                TempData["PrintQty"] = prj.fPrintQty;
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

        // POST: MProject/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: MProject/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: MProject/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        
    }
}
