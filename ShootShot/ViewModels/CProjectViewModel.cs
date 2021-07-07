using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace ShootShot.ViewModels
{
	public class CProjectViewModel
	{
		// tproject
		public int fId { get; set; }
		public string fOrderNum { get; set; }
		public Nullable<System.DateTime> fPjtDate { get; set; }
		public string fCEmail { get; set; }
		public string fContact { get; set; }
		public string fContactTel { get; set; }
		public string fWkdyTime { get; set; }
		public string fWkndTime { get; set; }
		public string fCity { get; set; }
		public string fLoc { get; set; }
		public Nullable<System.DateTime> fFilmDate { get; set; }
		public Nullable<System.TimeSpan> fFilmTime { get; set; }
		public Nullable<int> fBudget { get; set; }
		public Nullable<int> fPrintQty { get; set; }
		public string fPjtTopic { get; set; }
		public string fReq { get; set; }
		public string fStyle { get; set; }
		public Nullable<bool> fPjtState { get; set; }
		public string fPEmail { get; set; }
		public List<tProject> project { get; set; }
		public string fName { get; set; }
		public string fEmail { get; set; }
		


		public List<tPjtDetailType> prjtype { get; set; }
		public List<tPjtDetailUpload>  prjphoto { get; set; }
		//public int fId
		//{
		//	get { return this.project.fId; }
		//	set { this.project.fId = value; }
		//}
		//[DisplayName("攝影師Email")]
		//public string fPEmail {
		//	get { return this.project.fPEmail; }
		//	set { this.project.fPEmail = value; }
		//}
		//[DisplayName("專案訂單編號")]
		//public string fOrderNum
		//{
		//	get { return this.project.fOrderNum; }
		//	set { this.project.fOrderNum = value; }
		//}
		//[DisplayName("一般會員姓名")]
		//public string fName {
		//	get { return this.member.fName; }
		//	set { this.member.fName = value; }
		//}
		//[DisplayName("一般會員電話")]
		//public string fTel
		//{
		//	get { return this.member.fTel; }
		//	set { this.member.fTel = value; }
		//}
		//[DisplayName("一般會員Email")]
		//public string fCEmail
		//{
		//	get { return this.project.fCEmail; }
		//	set { this.project.fCEmail = value; }
		//}
		//[DisplayName("專案聯繫人")]
		//public string fContact
		//{
		//	get { return this.project.fContact; }
		//	set { this.project.fContact = value; }
		//}
		//[DisplayName("專案聯繫人電話")]
		//public string fContactTel
		//{
		//	get { return this.project.fContactTel; }
		//	set { this.project.fContactTel = value; }
		//}
		//[DisplayName("平日可聯繫時間")]
		//public string fWkdyTime
		//{
		//	get { return this.project.fWkdyTime; }
		//	set { this.project.fWkdyTime = value; }
		//}
		//[DisplayName("假日可聯繫時間")]
		//public string fWkndTime
		//{
		//	get { return this.project.fWkndTime; }
		//	set { this.project.fWkndTime = value; }
		//}
		//[DisplayName("拍攝城市")]
		//public string fCity
		//{
		//	get { return this.project.fCity; }
		//	set { this.project.fCity = value; }
		//}
		//[DisplayName("拍攝地點")]
		//public string fLoc
		//{
		//	get { return this.project.fLoc; }
		//	set { this.project.fLoc = value; }
		//}
		//[DisplayName("拍攝日期")]
		//public Nullable<System.DateTime> fFilmDate {
		//	get {return this.project.fFilmDate; }
		//	set { this.project.fFilmDate = value; }
		//}
		//[DisplayName("拍攝時間")]
		//public Nullable<System.TimeSpan> fFilmTime {
		//	get { return this.project.fFilmTime; }
		//	set { this.project.fFilmTime = value; }
		//}
		//[DisplayName("拍攝預算")]
		//public Nullable<int> fBudget {
		//	get { return this.project.fBudget; }
		//	set { this.project.fBudget = value; }
		//}
		//[DisplayName("出圖張數")]
		//public Nullable<int> fPrintQty {
		//	get { return this.project.fPrintQty; }
		//	set { this.project.fPrintQty = value; }
		//}
		//[DisplayName("拍攝風格")]
		//public string fFilmType {
		//	get { return this.prjtype.fFilmType; }
		//	set { this.prjtype.fFilmType = value; }
		//}
		//[DisplayName("專案主題")]
		//public string fPjtTopic {
		//	get { return this.project.fPjtTopic; }
		//	set { this.project.fPjtTopic = value; }
		//}
		//[DisplayName("專案需求")]
		//public string fReq {
		//	get { return this.project.fReq; }
		//	set { this.project.fReq = value; }
		//}
		//[DisplayName("參考風格")]
		//public string fStyle {
		//	get { return this.project.fStyle; }
		//	set { this.project.fStyle = value; }
		//}
		//[DisplayName("參考照片")]
		//public string fPicUpload {
		//	get { return this.prjphoto.fPicUpload; }
		//	set { this.prjphoto.fPicUpload = value; }
		//}
		//public HttpPostedFileBase photo { get; set; }
		//public string cProject_txtId1 { get; internal set; }
		//public string txtOrderNum { get; internal set; }

		//public IEnumerable<tProject> tProjects { get; set; }
		//public IEnumerable<tMember> tMembers { get; set; }
		//public IEnumerable<tPjtDetailType> tPjtDetailTypes { get; set; }
		//public IEnumerable<tPjtDetailUpload> tPjtDetailUploads { get; set; }

	}
	public class PjtDetailType
    {
        public int fId { get; set; }
		public string fOrderNum { get; set; }
		public string fFilmType { get; set; }
	}
	public class tPjtDetailUpload
	{
		public int fId { get; set; }
		public string fOrderNum { get; set; }
		public string fPicUpload { get; set; }
	}
}