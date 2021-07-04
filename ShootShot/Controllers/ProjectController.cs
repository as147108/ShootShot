using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Dynamic;
using ShootShot.ViewModels;

namespace ShootShot.Controllers
{
    public class ProjectController : Controller
    {
        // GET: Projrct
        public ActionResult IdxProject()
        {
            return View();
        }

		// test
		public ActionResult CreatePrj__()
		{
			return View();
		}


		// 專案表格id
		// 自動產生訂單編號fOrderNum nvarchar(50) 10碼
		public ActionResult CreatePrj()
		{
			CProjectViewModel x = new CProjectViewModel();
			//dbShootShotEntities db = new dbShootShotEntities();

			//tProject photog = db.tProject.FirstOrDefault(p => p.fPEmail == email);
			//if (photog == null)
			// return Content("<script language='javascript' type='text/javascript'>alert('請選擇攝影師');</script>"); 
			//return View(photog);
			return View();
		}
		[HttpPost]
		public ActionResult CreatePrj(CProjectViewModel p)
		{
			CProjectViewModel item = new CProjectViewModel();
			string PhotoName = Guid.NewGuid().ToString() + ".jpg";
			p.photo.SaveAs(Server.MapPath("~/Content/") + PhotoName);
			p.fPicUpload = "/" + PhotoName;

			dbShootShotEntities db = new dbShootShotEntities();
			db.tProject.Add(p.project);
			db.tPjtDetailType.Add(p.prjtype);
			db.tPjtDetailUpload.Add(p.prjphoto);
			db.SaveChanges();
			return View();
		}
	//攝影師
	public ActionResult Listphotog() 
        {
			var table = from p in (new dbShootShotEntities()).tMemberPhot
						select p;
			return View(table);
			//IEnumerable<string> QueryName =
			//from tMemberPhot in (new dbShootShotEntities()).tMemberPhot
			//select tMemberPhot;
			//Console.WriteLine(QueryName.ToString());
			//ViewBag.name = QueryName;
			
		}
		// 後台專案用
		//public ActionResult List()
		//{ 

		//}

		//        public ActionResult Cprjtab()
		//        {
		//            return View();
		//        }
		//        [HttpPost]
		//        public ActionResult Cprjtab(tProject p, tPjtDetailType p1, tMember m)
		//        {
		//            //搜尋攝影師ShoppingController.cs=>addtochart =>
		//            String email = Request.Form["fCEmail"];
		//            if (string.IsNullOrEmpty(email))
		//            {
		//                return RedirectToAction("IdxProject");
		//            } else
		//            {
		//                //inner join資料表
		//                dbShootShotEntities db = new dbShootShotEntities();
		//            }
		//            return RedirectToAction("IdxProject");
		//        }
		//		// GET: Projrct/Create
		//		public ActionResult CProject()
		//		{
		//			return View();
		//		}

		//public ActionResult CProject(CProjectViewModel p)
		//{
		//	dbShootShotEntities db = new dbShootShotEntities();
			//tMember user = db.tMember.FirstOrDefault(n => n.fEmail == email);
			//ViewBag.name = user.fName;
			//ViewBag.tel = user.fTel;


			//透過使用者登入email搜尋資料庫傳回name,tel
		 //  var email = Request.Form["txtEmail"];
			//var cname = from m in (new dbShootShotEntities()).tMember
			//			where m.fEmail.Contains(email)
			//			select m.fName;

			//var ctel = from m in (new dbShootShotEntities()).tMember
			//		   where m.fEmail.Contains(email)
			//		   select m.fTel;
			//ViewBag.name = cname;
			//ViewBag.tel = ctel;

			//專案表格SQL(後台用)
			//var query = from m in (new dbShootShotEntities()).tMember
			//			join p in (new dbShootShotEntities()).tProject
			//				on m.fEmail equals p.fCEmail
			//			join pjt in (new dbShootShotEntities()).tPjtDetailType
			//				on p.fOrderNum equals pjt.fOrderNum
			//			join pjt1 in (new dbShootShotEntities()).tPjtDetailUpload
			//			on pjt.fOrderNum equals pjt1.fOrderNum
			//			select new ViewModels.CProjectViewModel
			//			{
			//				p.fPEmail,
			//				p.fOrderNum,
			//				m.fName,
			//				m.fTel,
			//				p.fCEmail,
			//				p.fContact,
			//				p.fContactTel,
			//				p.fWkdyTime,
			//				p.fWkndTime,
			//				p.fCity,
			//				p.fLoc,
			//				p.fFilmDate,
			//				p.fFilmTime,
			//				p.fBudget,
			//				p.fPrintQty,
			//				pjt.fFilmType,
			//				p.fPjtTopic,
			//				p.fReq,
			//				p.fStyle,
			//				pjt1.fPicUpload
			//			};

		//	return View();
		//}

	
		//		// POST: Projrct/Create
		//		[HttpPost]
		//        public ActionResult CProjrct()
		//        {
		//            return View();
		//        }

		//        // GET: Projrct/Edit/5
		//        public ActionResult Edit(int id)
		//        {
		//            return View();
		//        }

		//        // POST: Projrct/Edit/5
		//        [HttpPost]
		//        public ActionResult Edit(int id, FormCollection collection)
		//        {
		//            try
		//            {
		//                // TODO: Add update logic here

		//                return RedirectToAction("Index");
		//            }
		//            catch
		//            {
		//                return View();
		//            }
		//        }

		//        // GET: Projrct/Delete/5
		//        public ActionResult Delete(int id)
		//        {
		//            return View();
		//        }

		//        // POST: Projrct/Delete/5
		//        [HttpPost]
		//        public ActionResult Delete(int id, FormCollection collection)
		//        {
		//            try
		//            {
		//                // TODO: Add delete logic here

		//                return RedirectToAction("Index");
		//            }
		//            catch
		//            {
		//                return View();
		//            }
		//        }
	}
}
