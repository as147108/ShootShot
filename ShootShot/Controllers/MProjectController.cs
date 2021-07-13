using ShootShot.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ShootShot.Controllers
{
    public class MProjectController : Controller
    {
 
        public ActionResult _ListData(string orderNo=null) 
        {
            IEnumerable<tProject> prj;

            string OrderNo = Request.Form["txtOrderNum"];
            if (orderNo!= null)
            {
                prj = (from p in (new dbShootShotEntities()).tProject
                      where p.fOrderNum == orderNo
                      select p).Take(1).ToList();
            }
            return View("List");
        }

        // GET: MProject
        public ActionResult List()
        {
            dbShootShotEntities db = new dbShootShotEntities();

            IEnumerable<tProject> table = null;
            string OrderNo = Request.Form["txtOrderNum"];
            if (string.IsNullOrEmpty(OrderNo))
            {
                table = null;
            }
            else 
            { 
                table = from p in (new dbShootShotEntities()).tProject
                        where p.fOrderNum == OrderNo
                        select p;
            }
            return View();

        }



		//public ActionResult PrjDetails(string email)
  //      {
  //          dbShootShotEntities db = new dbShootShotEntities();
  //          tProject orderdetail = new tProject();
  //          string OrderNo = "2021071215";
  //          //string OrderNo = Request.Form["txtOrderNum"];
  //          orderdetail = db.tProject.FirstOrDefault(m => m.fOrderNum== OrderNo);
  //          ViewBag.topic = orderdetail.fPjtTopic;
            
  //          return View("List");
  //      }

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
