using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShootShot.Models;

namespace ShootShot.ViewModels
{
    public class vmSearch
    {
        public string keyword { get; set; }
        public List<string> imgPath { get; set; }
        public IEnumerable<tPhotAlbum> album { get; set; }
    }
}