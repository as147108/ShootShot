using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShootShot.Controllers
{
    public class MProject1Controller : Controller
    {
        // GET: MProject1
        public ActionResult List(string orderNum)
        {
            IEnumerable<tProject> prj;

            string OrderNo = Request.Form["txtOrderNum"];
            if (OrderNo != null)
            {
                prj = (from p in (new dbShootShotEntities()).tProject
                       where p.fOrderNum == OrderNo
                       select p).ToList();
            }
            else { prj = null; }
            return View(prj);
        }

        // GET: MProject1/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: MProject1/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MProject1/Create
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

        // GET: MProject1/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: MProject1/Edit/5
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

        // GET: MProject1/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: MProject1/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
