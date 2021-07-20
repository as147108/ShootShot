using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShootShot.Models;

namespace ShootShot.Controllers
{
    public class PhotoGrapherController : Controller
    {
        // GET: PhotoGrapher
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ActivatePhotoGrapher()
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
            if (Convert.ToInt32(Session[Dictionary.USER_ROLES])==1)
            {
                return RedirectToAction("EditPhotoGrapherProfile");
            }
            else
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "";
                Session[Dictionary.LOGIN_HIDDEN] = "hidden";
                Session[Dictionary.LOGOUT_HIDDEN] = "";
            }
            dbShootShotEntities db = new dbShootShotEntities();
            int id = Convert.ToInt32(Session[Dictionary.USER_ID]);
            ViewBag.oldName = db.tMember.Where(t=>t.fId==id).FirstOrDefault().fName.ToString();
            return View();
        }
        [HttpPost]
        public ActionResult ActivatePhotoGrapher(tMemberPhot member)
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
            if (Convert.ToInt32(Session[Dictionary.USER_ROLES]) == 1)
            {
                return RedirectToAction("EditPhotoGrapherProfile");
            }
            else
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "";
                Session[Dictionary.LOGIN_HIDDEN] = "hidden";
                Session[Dictionary.LOGOUT_HIDDEN] = "";
            }
            dbShootShotEntities db = new dbShootShotEntities();
            if (member!=null)
            {
                int id=Convert.ToInt32(Session[Dictionary.USER_ID]);
                tMember tm=db.tMember.Where(t => t.fId == id).FirstOrDefault();
                tm.fCode = 1;
                Session[Dictionary.USER_ROLES] = 1;
                string email = Session[Dictionary.USERE_MAIL].ToString();
                member.fEmail = tm.fEmail;
                db.tMemberPhot.Add(member);
                db.SaveChanges();
                return RedirectToAction("ActivateSucessfull");
            }
            return View();
        }
        public ActionResult ActivateSucessfull()
        {
            return View();
        }
        public ActionResult EditPhotoGrapherProfile()
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
            if (Convert.ToInt32(Session[Dictionary.USER_ROLES]) == 0)
            {
                return RedirectToAction("ActivatePhotoGrapher");
            }
            else
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "";
                Session[Dictionary.LOGIN_HIDDEN] = "hidden";
                Session[Dictionary.LOGOUT_HIDDEN] = "";
            }
            dbShootShotEntities db = new dbShootShotEntities();
            string email = Session[Dictionary.USERE_MAIL].ToString();
            tMemberPhot photoGrapher = db.tMemberPhot.Where(t => t.fEmail == email).FirstOrDefault();
            int id = Convert.ToInt32(Session[Dictionary.USER_ID]);
            ViewBag.oldName2 = db.tMember.Where(t => t.fId == id).FirstOrDefault().fName.ToString();
            return View(photoGrapher);
        }
        [HttpPost]
        public ActionResult EditPhotoGrapherProfile(tMemberPhot photoGrapher)
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
            else if (Convert.ToInt32(Session[Dictionary.USER_ROLES])==0)
            {
                return RedirectToAction("ActivatePhotoGrapher");
            }
            else
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "";
                Session[Dictionary.LOGIN_HIDDEN] = "hidden";
                Session[Dictionary.LOGOUT_HIDDEN] = "";
            }
            if (photoGrapher!=null)
            {
                dbShootShotEntities db = new dbShootShotEntities();
                string email = Session[Dictionary.USERE_MAIL].ToString();
                tMemberPhot member = db.tMemberPhot.Where(t => t.fEmail == email).FirstOrDefault();
                member = photoGrapher;
                db.SaveChanges();
                return View(member);
            }
            return View();
        }
    }
}