using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShootShot.Models
{
	public class CProject
	{
		public string txtOrderNum { get; set; }
		public Nullable<System.DateTime> txtPjtDate { get; set; }
		public string txtCEmail { get; set; }
		public string txtContact { get; set; }
		public string txtContactTel { get; set; }
		public string txtWkdyTime { get; set; }
		public string txtWkndTime { get; set; }
		public string txtCity { get; set; }
		public string txtLoc { get; set; }
		public Nullable<System.DateTime> txtFilmDate { get; set; }
		public Nullable<System.TimeSpan> txtFilmTime { get; set; }
		public Nullable<int> txtBudget { get; set; }
		public Nullable<int> txtPrintQty { get; set; }
		public string txtPjtTopic { get; set; }
		public string txtReq { get; set; }
		public string txtStyle { get; set; }
		public Nullable<bool> txtPjtState { get; set; }
		public string txtPEmail { get; set; }

		// pjtdetailtype
		public string txtOrderNum1 { get; set; }
		public string txtFilmType { get; set; }

		// pjtdetailupload
		public string txtOrderNum2 { get; set; }
		public string txtPicUpload { get; set; }
	}
}