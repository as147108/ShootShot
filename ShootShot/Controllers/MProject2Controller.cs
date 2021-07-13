using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShootShot.Controllers
{
    public class MProject2Controller : Controller
    {
        // GET: MProject2
        public ActionResult List()
        {
            return View();
        }

        // GET: MProject2/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: MProject2/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MProject2/Create
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

        // GET: MProject2/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: MProject2/Edit/5
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

        // GET: MProject2/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: MProject2/Delete/5
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
