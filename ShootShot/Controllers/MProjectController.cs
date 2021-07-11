using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShootShot.Controllers
{
    public class MProjectController : Controller
    {
        // GET: MProject
        public ActionResult List()
        {
            IEnumerable<tProject> table = null;
            dbShootShotEntities db = new dbShootShotEntities();
            var email = "jack1990@gmail.com"; // 登入email
            table = from p in db.tProject where p.fCEmail==email
                        select p;
            ViewBag.fPName= from p in db.tProject
                            join m in db.tMember on p.fPEmail equals m.fEmail
                            select m.fName;
            return View(table);
        }
        public ActionResult PrjList()
        {
            return View();
        }

        // GET: MProject/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: MProject/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MProject/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: MProject/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: MProject/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        
    }
}
