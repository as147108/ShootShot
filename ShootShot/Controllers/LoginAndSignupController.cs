using ShootShot.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShootShot.Controllers
{
    public class LoginAndSignupController : Controller
    {
        // GET: LoginAndSignup
        public ActionResult Signup()
        {
            if (Session[Dictionary.USER_ID] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        [HttpPost]
        public ActionResult Signup(tMember member)
        {
            dbShootShotEntities db = new dbShootShotEntities();
            string email = Request.Form["email"].ToString();
            var tm = db.tMember.Where(t => t.fEmail== email).FirstOrDefault();
            if (Request.Form["password"] != Request.Form["confirmPassword"])
            {
                ViewBag.ConfirmMsg = "密碼不一致,請重填表單";
                return View(member);
            }
            else if (tm!=null)
            {
                ViewBag.email = "Email已存在";
                return View(member);
            }
            member.fName = Request.Form["name"];
            member.fEmail = Request.Form["email"];
            member.fTel = Request.Form["tel"];
            member.fPassword = Request.Form["confirmPassword"];
            member.fGender = Convert.ToInt32(Request.Form["selectGender"]);
            member.fCode = 0;
            db.tMember.Add(member);
            db.SaveChanges();
            return RedirectToAction("Login");
        }
        public ActionResult Login()
        {
            if (Session[Dictionary.USER_ID]!=null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        [HttpPost]
        public ActionResult Login(tMember member)
        {
            if (Session[Dictionary.USER_ID] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            dbShootShotEntities db = new dbShootShotEntities();
            var account = db.tMember.Where(t => t.fEmail == member.fEmail).FirstOrDefault();
            if (account==null)
            {
                @ViewBag.LoginMsg = "帳號或密碼錯誤";
                return View();
            }
            else if (account.fPassword!=member.fPassword)
            {
                @ViewBag.LoginMsg = "密碼錯誤";
                return View();
            }
            Session[Dictionary.USER_ID] = account.fId;
            Session[Dictionary.USERE_MAIL] = account.fEmail;
            Session[Dictionary.USER_ROLES] = account.fCode;
            return RedirectToAction("Index", "Home");
        }        
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
    }
}