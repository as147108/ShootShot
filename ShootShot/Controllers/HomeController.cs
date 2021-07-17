using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShootShot.ViewModels;
using ShootShot.Models;

namespace ShootShot.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            if (Session[Dictionary.USERE_MAIL] == null)
            {
                Session[Dictionary.NAVLINK_HIDDEN]= "hidden";
                Session[Dictionary.LOGIN_HIDDEN] = "";
                Session[Dictionary.LOGOUT_HIDDEN] = "hidden";
            }
            else
            {
                Session[Dictionary.NAVLINK_HIDDEN] = "";
                Session[Dictionary.LOGIN_HIDDEN] = "hidden";
                Session[Dictionary.LOGOUT_HIDDEN] = "";
            }
            dbShootShotEntities db = new dbShootShotEntities();
            IEnumerable<tPhotAlbum> album = db.tPhotAlbum.Where(t => t.fState == true).OrderByDescending(t => t.fId).Take(12);
            IEnumerable<tPhotAlbum> album2 = db.tPhotAlbum.Where(t=>t.fState==true).OrderBy(t=>t.fId).Take(12);
            List<IEnumerable<tPhotAlbum>> lstAlbum = new List<IEnumerable<tPhotAlbum>>();
            lstAlbum.Add(album);
            lstAlbum.Add(album2);
            return View(lstAlbum);
        }
        [HttpPost]
        public ActionResult Index(vmSearch pSearch)
        {
            dbShootShotEntities db = new dbShootShotEntities();
            if (pSearch==null)
            {
                IEnumerable<tPhotAlbum> album = db.tPhotAlbum.Where(t => t.fState == true).OrderByDescending(t => t.fId).Take(12);
                IEnumerable<tPhotAlbum> album2 = db.tPhotAlbum.Where(t => t.fState == true).OrderBy(t => t.fId).Take(12);
                List<IEnumerable<tPhotAlbum>> lstAlbum = new List<IEnumerable<tPhotAlbum>>();
                lstAlbum.Add(album);
                lstAlbum.Add(album2);
                return View(lstAlbum);
            }
            IEnumerable<tPhotAlbum> keywordAlbum = db.tPhotAlbum.Where(t => t.fKeyword.Contains(pSearch.keyword)).OrderByDescending(t=>t.fId).Take(12);
            IEnumerable<tPhotAlbum> keywordAlbum2 = db.tPhotAlbum.Where(t => t.fKeyword.Contains(pSearch.keyword)).OrderBy(t=>t.fId).Take(12);
            List<IEnumerable<tPhotAlbum>> lstKeywordAlbum = new List<IEnumerable<tPhotAlbum>>();
            lstKeywordAlbum.Add(keywordAlbum);
            lstKeywordAlbum.Add(keywordAlbum2);
            return View(lstKeywordAlbum);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}