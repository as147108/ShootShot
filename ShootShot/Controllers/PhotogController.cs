using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShootShot.Controllers
{
    public class PhotogController : Controller
    {
        // GET: Photog
        public ActionResult Index()
        {
            return View();
        }
    }
}