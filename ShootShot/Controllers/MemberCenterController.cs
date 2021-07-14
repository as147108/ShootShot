using ShootShot.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShootShot.Controllers
{
    public class MemberCenterController : Controller
    {
        // GET: MemberCenter
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult EditProfile()
        {
            if (Session[Dictionary.USER_ID] == null)
            {
                return RedirectToAction("Login", "LoginAndSignup");
            }
            dbShootShotEntities db = new dbShootShotEntities();
            int id = (int)Session[Dictionary.USER_ID];
            tMember member = db.tMember.Where(t => t.fId == id).FirstOrDefault();

            return View(member);
        }

        [HttpPost]
        public ActionResult EditProfile(tMember member)
        {
            if (Session[Dictionary.USER_ID] == null)
            {
                return RedirectToAction("Login", "LoginAndSignup");
            }
            dbShootShotEntities db = new dbShootShotEntities();
            int id = (int)Session[Dictionary.USER_ID];
            tMember tm = db.tMember.Where(t => t.fId == id).FirstOrDefault();
            if (tm != null)
            {
                tm.fName = Request.Form["name"];
                tm.fTel = Request.Form["phone"];
                tm.fArea = Request.Form["city"];

                db.SaveChanges();
                @ViewBag.successful = "修改成功";
            }
            return View(tm);
            
        }
    }
}