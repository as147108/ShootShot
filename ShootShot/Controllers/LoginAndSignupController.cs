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
            db.tMember.Add(member);/*e*/
            db.SaveChanges();
            return RedirectToAction("Login");
        }
        public ActionResult Login()
        {
            tMember tm = new tMember();
            int id = tm.fId;
            return View(id);
        }

    }
}