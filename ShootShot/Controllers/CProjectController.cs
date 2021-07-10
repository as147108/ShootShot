using ShootShot.ViewModels;
using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

        public ActionResult fileUploadDemo()
        {
            return View();
        }
        [HttpPost]
        public ActionResult fileUploadDemo(HttpPostedFileBase photo)
        {
            photo.SaveAs(@"C:\Users\Yulin\Desktop\ShootShot\ShootShot\Content\photo.jpg");
            return View();
        }
        // GET: CProject/Create
        public ActionResult Create()
        {
            dbShootShotEntities db = new dbShootShotEntities();
            var cemail = "nina1982@gmail.com";
            tMember cust = db.tMember.FirstOrDefault(c => c.fEmail == cemail);
            //tMember cust = db.tMember.FirstOrDefault(c =>c.fEmail==cemail);
            if (cust != null)
            {
                ViewBag.txtCEmail = cemail;
                ViewBag.txtCTel =cust.fTel;
                ViewBag.txtCName =cust.fName;
            }
            var photoglist = from m in db.tMemberPhot select m;
            ViewBag.SelPhotog = new SelectList(photoglist, "fName").ToList();
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
            return View();
        }


    }
}