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
            ViewBag.scroll = "";
            Session[Dictionary.INDEX_HIDDEN] = "";
            Session[Dictionary.SEARCH_HIDDEN] = "hidden";
            if (Session[Dictionary.USER_ID] != null)
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "";
                Session[Dictionary.LOGIN_HIDDEN] = "hidden";
                Session[Dictionary.LOGOUT_HIDDEN] = "";
                return RedirectToAction("Index", "Home");
            }
            else
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "hidden";
                Session[Dictionary.LOGIN_HIDDEN] = "";
                Session[Dictionary.LOGOUT_HIDDEN] = "hidden";
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
            member.fArea = Request.Form["city"];
            member.fGender = Convert.ToInt32(Request.Form["selectGender"]);
            member.fCode = 0;
            db.tMember.Add(member);
            db.SaveChanges();
            return RedirectToAction("SignupSucessfull");
        }
        public ActionResult SignupSucessfull(tMember member)
        {
            return View();
        }
        public ActionResult Login()
        {
            ViewBag.scroll = "";
            Session[Dictionary.INDEX_HIDDEN] = "";
            Session[Dictionary.SEARCH_HIDDEN] = "hidden";
            if (Session[Dictionary.USER_ID] != null)
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "";
                Session[Dictionary.LOGIN_HIDDEN] = "hidden";
                Session[Dictionary.LOGOUT_HIDDEN] = "";
                return RedirectToAction("Index", "Home");
            }
            else
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "hidden";
                Session[Dictionary.LOGIN_HIDDEN] = "";
                Session[Dictionary.LOGOUT_HIDDEN] = "hidden";
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
            Session[Dictionary.NAVLINK_HIDDEN] = "";
            Session[Dictionary.LOGIN_HIDDEN] = "hidden";
            Session[Dictionary.LOGOUT_HIDDEN] = "";
            return RedirectToAction("Index", "Home");
        }        
        public ActionResult Logout()
        {
            ViewBag.scroll = "";
            Session[Dictionary.NAVLINK_HIDDEN] = "hidden";
            Session[Dictionary.LOGIN_HIDDEN] = "";
            Session[Dictionary.LOGOUT_HIDDEN] = "hidden";
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
    }
}