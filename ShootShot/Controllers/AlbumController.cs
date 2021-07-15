using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShootShot.Controllers
{
    public class AlbumController : Controller
    {
        // GET: Album
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Create(HttpPostedFileBase photo)
        {
            string fileName = "";
            if (photo != null)
            {
                if (photo.ContentLength > 0)
                {
                    fileName = Path.GetFileName(photo.FileName);
                    var path = Path.Combine(Server.MapPath("~/Photos"), fileName);
                    photo.SaveAs(path);
                }
            }
            return View();
        }
    }
}