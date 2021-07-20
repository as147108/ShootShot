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
            ViewBag.scroll = "";
            Session[Dictionary.INDEX_HIDDEN] = "";
            Session[Dictionary.SEARCH_HIDDEN] = "hidden";
            if (Session[Dictionary.USER_ID] == null)
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "hidden";
                Session[Dictionary.LOGIN_HIDDEN] = "";
                Session[Dictionary.LOGOUT_HIDDEN] = "hidden";
                return RedirectToAction("Login", "LoginAndSignup");
            }
            else
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "";
                Session[Dictionary.LOGIN_HIDDEN] = "hidden";
                Session[Dictionary.LOGOUT_HIDDEN] = "";
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
                if (member.profilePhoto!=null)
                {
                    member.profilePhoto.SaveAs(Server.MapPath("~/Content/img/profile/") + photoName);
                    tm.fImgpath = "/" + photoName;
                }
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
        public ActionResult UpdatePassword()
        {
            ViewBag.scroll = "";
            Session[Dictionary.INDEX_HIDDEN] = "";
            Session[Dictionary.SEARCH_HIDDEN] = "hidden";
            if (Session[Dictionary.USER_ID] == null)
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "hidden";
                Session[Dictionary.LOGIN_HIDDEN] = "";
                Session[Dictionary.LOGOUT_HIDDEN] = "hidden";
                return RedirectToAction("Login", "LoginAndSignup");
            }
            else
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "";
                Session[Dictionary.LOGIN_HIDDEN] = "hidden";
                Session[Dictionary.LOGOUT_HIDDEN] = "";
            }
            return View();
        }
        [HttpPost]
        public ActionResult UpdatePassword(tMember pMember)
        {
            if (Session[Dictionary.USER_ID] == null)
            {
                return RedirectToAction("Login", "LoginAndSignup");
            }
            dbShootShotEntities db = new dbShootShotEntities();
            string email = Session[Dictionary.USERE_MAIL].ToString();
            string oldPassword = Request.Form["oldPassword"];
            string newPassword = Request.Form["newPassword"];
            string confirmPassword = Request.Form["confirmPassword"];
            tMember oldMember = db.tMember.Where(t => t.fEmail == email).FirstOrDefault();
            if (oldPassword!=oldMember.fPassword)
            {
                @ViewBag.msg = "密碼錯誤";
                return View();
            }
            else if(newPassword!=confirmPassword)
            {
                @ViewBag.msg = "新密碼輸入不一致";
                return View();
            }
            else if (oldPassword == confirmPassword)
            {
                @ViewBag.msg = "新舊密碼一樣";
                return View();
            }
            else
            {
                oldMember.fPassword = confirmPassword;
                db.SaveChanges();
            }
            return RedirectToAction("UpdatePasswordSucessfull");
        }
        public ActionResult UpdatePasswordSucessfull(tMember pMember)
        {
            ViewBag.scroll = "";
            Session[Dictionary.INDEX_HIDDEN] = "";
            Session[Dictionary.SEARCH_HIDDEN] = "hidden";
            if (Session[Dictionary.USER_ID] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            Session.Abandon();
            return View();
        }
    }
}