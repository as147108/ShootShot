using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShootShot.Models;

namespace ShootShot.ViewModels
{
    public class vmMember
    {
        public  tMember member { get; set; }
        public HttpPostedFileBase profilePhoto { get; set; }
    }
}