using ShootShot.Models;
using ShootShot.ViewModels;
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
            vmMember vm = new vmMember();
            vm.member = member;
            return View(vm);
        }

        [HttpPost]
        public ActionResult EditProfile(vmMember member)
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
                string photoName = Guid.NewGuid().ToString() + ".jpg";
                member.profilePhoto.SaveAs(Server.MapPath("~/Content/img/profile/") + photoName);
                tm.fImgpath= "/" + photoName;
                tm.fName = Request.Form["name"];
                tm.fTel = Request.Form["phone"];
                tm.fArea = Request.Form["city"];

                db.SaveChanges();
                @ViewBag.successful = "修改成功";
            }
            vmMember vm = new vmMember();
            vm.member = tm;
            return View(vm);
            
        }
    }
}