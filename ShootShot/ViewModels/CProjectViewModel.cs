using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace ShootShot.ViewModels
{
	public class CProjectViewModel
	{
		public CProjectViewModel()
		{
			this.project = new tProject();
			this.member = new tMember();
		}
		public tProject project { get; set; }
		public tMember member { get; set; }
		public int fId
		{
			get { return this.project.fId; }
			set { this.project.fId = value; }
		}
		[DisplayName("專案訂單編號")]
		public string fOrderNum
		{
			get { return this.project.fOrderNum; }
			set { this.project.fOrderNum = value; }
		}
		[DisplayName("專案成立日期")]
		public Nullable<System.DateTime> fPjtDate {
			get {return this.project.fPjtDate; }
			set {this.project.fPjtDate=value; } 
		}
		[DisplayName("一般會員Email")]
		public string fCEmail
		{
			get { return this.project.fCEmail; }
			set { this.project.fCEmail = value; }
		}
		// 藉由fCEmail傳回電話姓名
		//public string fCName {
		//	get { return this.member.fName; }
		//	set { }
		//}
		//public string fCName { get; set; }
		//public string fCTel { get; set; }

		[DisplayName("專案聯繫人")]
		public string fContact
		{
			get { return this.project.fContact; }
			set { this.project.fContact = value; }
		}
		[DisplayName("專案聯繫人電話")]
		public string fContactTel
		{
			get { return this.project.fContactTel; }
			set { this.project.fContactTel = value; }
		}
		[DisplayName("平日可聯繫時間")]
		public string fWkdyTime
		{
			get { return this.project.fWkdyTime; }
			set { this.project.fWkdyTime = value; }
		}
		[DisplayName("假日可聯繫時間")]
		public string fWkndTime
		{
			get { return this.project.fWkndTime; }
			set { this.project.fWkndTime = value; }
		}
		[DisplayName("拍攝城市")]
		public string fCity
		{
			get { return this.project.fCity; }
			set { this.project.fCity = value; }
		}
		[DisplayName("拍攝地點")]
		public string fLoc
		{
			get { return this.project.fLoc; }
			set { this.project.fLoc = value; }
		}
		[DisplayName("拍攝日期")]
		public Nullable<System.DateTime> fFilmDate
		{
			get { return this.project.fFilmDate; }
			set { this.project.fFilmDate = value; }
		}
		[DisplayName("拍攝時間")]
		public Nullable<System.TimeSpan> fFilmTime
		{
			get { return this.project.fFilmTime; }
			set { this.project.fFilmTime = value; }
		}
		[DisplayName("拍攝預算")]
		public Nullable<int> fBudget
		{
			get { return this.project.fBudget; }
			set { this.project.fBudget = value; }
		}
		[DisplayName("出圖張數")]
		public Nullable<int> fPrintQty
		{
			get { return this.project.fPrintQty; }
			set { this.project.fPrintQty = value; }
		}
		[DisplayName("專案主題")]
		public string fPjtTopic
		{
			get { return this.project.fPjtTopic; }
			set { this.project.fPjtTopic = value; }
		}
		[DisplayName("專案需求")]
		public string fReq
		{
			get { return this.project.fReq; }
			set { this.project.fReq = value; }
		}





		[DisplayName("參考風格")]
		public string fStyle
		{
			get { return this.project.fStyle; }
			set { this.project.fStyle = value; }
		}
		[DisplayName("專案狀態")]
		public Nullable<bool> fPjtState
		{
			get { return this.project.fPjtState; }
			set { this.project.fPjtState = value; }
		}
		//public string fPName { get; set; }
		//public string fEmail
		//{
		//	get { return this.member.fEmail; }
	
		//}
		[DisplayName("攝影師Email")]
		public string fPEmail
		{
			get { return this.member.fEmail; }
			set { this.project.fPEmail = value; }
		}
		[DisplayName("參考照片")]
		public string fPicUpload
		{
			get { return this.project.fPicUpload; }
			set { this.project.fPicUpload = value; }
		}
		public HttpPostedFileBase photo { get; set; }
	}
}