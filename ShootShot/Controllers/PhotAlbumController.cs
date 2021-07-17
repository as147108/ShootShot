using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShootShot.Models;
using System.Data;
using System.Data.SqlClient;
using ShootShot.ViewModels;

namespace ShootShot.Controllers
{
    public class PhotAlbumController : Controller
    {
        dbShootShotEntities db = new dbShootShotEntities();
        // GET: PhotAlbum
        public ActionResult Index()
        {
            var albums = db.tPhotAlbum.ToList();
            return View(albums);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(tPhotAlbum album)
        {
            if (ModelState.IsValid)
            {
                ViewBag.Error = false;
                var temp = db.tPhotAlbum.Where(m => m.fEmail == album.fEmail).FirstOrDefault();
                //if (temp != null)
                //{
                //    ViewBag.Error = true;
                //    return View(album);
                //}
                db.tPhotAlbum.Add(album);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(album);
        }
        public ActionResult EditAlbum()
        {
            //if (Session[Dictionary.USER_ID] == null)
            //{
            //    return RedirectToAction("Login", "LoginAndSignup");
            //}
            dbShootShotEntities db = new dbShootShotEntities();
            string email = (string)Session[Dictionary.USERE_MAIL];
            tPhotAlbum album = db.tPhotAlbum.Where(m => m.fEmail == email).FirstOrDefault();
            AlbumViewModel avm = new AlbumViewModel();
            avm.album = album;
            return View(avm);
        }
        [HttpPost]
        public ActionResult EditAlbum(AlbumViewModel album)
        {
            //if (Session[Dictionary.USER_ID] == null)
            //{
            //    return RedirectToAction("Login", "LoginAndSignup");
            //}
            dbShootShotEntities db = new dbShootShotEntities();
            string email = (string)Session[Dictionary.USERE_MAIL];
            tPhotAlbum alb = db.tPhotAlbum.Where(m => m.fEmail == email).FirstOrDefault();
            if (alb!=null)
            {
                alb.fName = Request.Form["name"];
                db.SaveChanges();
            }
            AlbumViewModel avm = new AlbumViewModel();
            avm.album = alb;
            return View(avm);
        }
        public ActionResult Delete(string fEmail)
        {
            var alb = db.tPhotAlbum.Where(m => m.fEmail == fEmail).FirstOrDefault();
            db.tPhotAlbum.Remove(alb);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}