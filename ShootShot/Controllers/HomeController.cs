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
            dbShootShotEntities db = new dbShootShotEntities();
            IEnumerable<tPhotAlbum> album = db.tPhotAlbum.Where(t=>t.fState==true).Take(12);
            return View(album);
        }
        [HttpPost]
        public ActionResult Index(vmSearch pSearch)
        {
            dbShootShotEntities db = new dbShootShotEntities();
            if (pSearch==null)
            {
                IEnumerable<tPhotAlbum> album = db.tPhotAlbum.Where(t => t.fState == true).Take(12);
                return View(album);
            }
            IEnumerable<tPhotAlbum> keywordAlbum = db.tPhotAlbum.Where(t => t.fKeyword.Contains(pSearch.keyword)).Take(12);
            return View(keywordAlbum);
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