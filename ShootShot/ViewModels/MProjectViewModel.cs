using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace ShootShot.ViewModels
{
	public class MProjectViewModel
	{
		public tProject project { get; set; }
		public tMember member { get; set; }
		public tMsg msg { get; set; }
		public IEnumerable<tMsg> msgs { get; set; }
		public IEnumerable<tProject> projects { get; set; }
		//public IEnumerable<tMsg> msg { get; set; }
		public HttpPostedFileBase photo { get; set; }
	}
}
