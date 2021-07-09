using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Dynamic;
using ShootShot.ViewModels;
using ShootShot.Models;

namespace ShootShot.Controllers
{
    public class ProjectController : Controller
    {

		// GET: Projrct
		public ActionResult IdxProject()
        {
            return View();
        }

		public ActionResult fileUploadDemo()
		{
			return View();
		}
		[HttpPost]
		public ActionResult fileUploadDemo(HttpPostedFileBase photo)
		{
			photo.SaveAs(@"C:\Users\Yulin\Documents\GitHub\ShootShot\ShootShot\Content");
			return View();
		}

		public ActionResult CreatePrj(string email)
		{
			dbShootShotEntities db = new dbShootShotEntities();
			CProject p = new CProject();
			tMember cust = db.tMember.SingleOrDefault(c => c.fEmail == email);
			if (cust!=null)
			{
				ViewBag["CEmail"] = cust.fEmail;
				ViewBag["CPhone"] = cust.fPhoto;
				ViewBag["CName"] = cust.fName;
			}
			List<tProject> prj = db.tProject.ToList();
			List<tMemberPhot> photog = db.tMemberPhot.ToList();
			ViewBag.PhotogList = new SelectList(photog, "fEmail", "fName");

			//ViewModels.CPrjMemberViewModel cPrj = new CPrjMemberViewModel();
			

			return View();
		}
		[HttpPost]
		public ActionResult CreatePrj(CProject p)
		{
			
			tProject tp = new tProject();
			tPjtDetailType tpdt = new tPjtDetailType();
			tPjtDetailUpload tpdp = new tPjtDetailUpload();
			Random rnd = new Random();
			int x = rnd.Next(10, 99);
			p.txtOrderNum = DateTime.Now.ToString("yyyyMMdd") + x.ToString();
			p.txtPjtDate = DateTime.Now;
			//p.txtCEmail =; // 由系統帶入
			tp.fOrderNum = p.txtOrderNum;
			tp.fPjtDate = p.txtPjtDate;
			tp.fCEmail = p.txtCEmail;
			tp.fContact = p.txtContact;
			tp.fContactTel = p.txtContactTel;
			tp.fWkdyTime = p.txtWkdyTime;
			tp.fWkndTime = p.txtWkndTime;
			tp.fCity = p.txtCity;
			tp.fLoc = p.txtLoc;
			tp.fFilmDate = p.txtFilmDate;
			tp.fFilmTime = p.txtFilmTime;
			tp.fBudget = p.txtBudget;
			tp.fPrintQty = p.txtPrintQty;
			tp.fPjtTopic = p.txtPjtTopic;
			tp.fReq = p.txtReq;
			tp.fStyle = p.txtStyle;
			tp.fPjtState = p.txtPjtState;
			tp.fPEmail = p.txtPEmail;
			tpdt.fOrderNum = p.txtOrderNum1;
			tpdt.fFilmType = p.txtFilmType;
			tpdp.fOrderNum = p.txtOrderNum2;
			tpdp.fPicUpload = p.txtPicUpload;

			dbShootShotEntities db = new dbShootShotEntities();
			db.tProject.Add(tp);
			db.tPjtDetailType.Add(tpdt);
			db.tPjtDetailUpload.Add(tpdp);
			db.SaveChanges();

			return View(p);
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
