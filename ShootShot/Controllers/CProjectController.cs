using System;
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
            //攝影師清單由資料庫產生及拍攝地點

            //var data = from g in (new dbShootShotEntities()).tMemberPhot select g; //假設從資料庫撈出資料。
            //tMemberPhot item = new tMemberPhot();

            //預約者姓名電話email帶入

            return View();
        }

        // POST: CProject/Create
        [HttpPost]
        public ActionResult Create(tProject p)
        {
            string photoName = Guid.NewGuid().ToString() + ".jpg";
            p.photo.SaveAs(Server.MapPath("~/Content/") + photoName);
            p.fPicUpload = "/" + photoName;
            // 訂單編號
            Random rnd = new Random();
            int x = rnd.Next(10, 99);
            p.fOrderNum = DateTime.Now.ToString("yyyyMMdd") + x.ToString();
            dbShootShotEntities db = new dbShootShotEntities();
            db.tProject.Add(p);
            db.SaveChanges();
            return View();
        }


    }
}