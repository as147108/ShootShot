using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShootShot.Controllers
{
    public class PhotAlbumController : Controller
    {
        // GET: PhotAlbum
        public ActionResult Index()
        {
            return View();
        }

        // GET: PhotAlbum/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: PhotAlbum/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PhotAlbum/Create
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

        // GET: PhotAlbum/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: PhotAlbum/Edit/5
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

        // GET: PhotAlbum/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: PhotAlbum/Delete/5
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
