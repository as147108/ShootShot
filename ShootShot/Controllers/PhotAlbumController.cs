using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShootShot.Models;
using System.Data;
using System.Data.SqlClient;

namespace ShootShot.Controllers
{
    public class PhotAlbumController : Controller
    {
        string constr = @"Data Source=.;Initial Catalog=dbShootShot;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
        private List<tPhotAlbum> GetPhotAlbums()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = constr;
            SqlDataAdapter adp = new SqlDataAdapter("select * from tPhotAlbum", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            DataTable dt = ds.Tables[0];
            List<tPhotAlbum> photAlbums = new List<tPhotAlbum>();
            for(int i = 0; i < dt.Rows.Count; i++)
            {
                photAlbums.Add(new tPhotAlbum
                {
                    fName = dt.Rows[i]["fName"].ToString()
                });
            }
            return photAlbums;
        }
        
        private void ExecutedCmd(SqlCommand cmd)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = constr;
            con.Open();
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        // GET: PhotAlbum
        public ActionResult Index()
        {
            return View();
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
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "insert into tPhotAlbum(fName)" + "values(@fName)";
                    cmd.Parameters.Add(new SqlParameter("@fName", SqlDbType.NVarChar)).Value = album.fName;
                    ExecutedCmd(cmd);
                    return RedirectToAction("Index");
                }
                catch(Exception ex)
                {
                    ViewBag.Error = true;
                    return View(album);
                }
            }
            return View(album);
        }
    }
}