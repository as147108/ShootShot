using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace ShootShot.ViewModels
{
    //public class MProjectViewModel
    //{
    //    public string fCEmail { get; set; }
    //    public CustPrjList CustPrjList { get; set; }
    //    public PrjDetail PrjDetail { get;set;}
    //    public CustMsg CustMsg { get; set; }

    //}
    //// 專案列表
    //public class CustPrjList 
    //{
    //    [DisplayName("訂單編號")]
    //    public string fOrderNum { get; set; }
    //    [DisplayName("專案主題")]
    //    public string fPjtTopic { get; set; }
    //    public string fPicUpload { get; set; }
    //    // 照片路徑設定
    //    [DisplayName("照片存檔編碼")]
    //    public HttpPostedFileBase photo { get; set; }
    //    [DisplayName("訂單日期")]
    //    public Nullable<System.DateTime> fPjtDate { get; set; }

    //}
    //public class PrjDetail
    //{
    //    [DisplayName("專案主題")]
    //    public string fPjtTopic { get; set; }
    //    [DisplayName("訂單日期")]
    //    public Nullable<System.DateTime> fPjtDate { get; set; }
    //    [DisplayName("攝影師姓名")]
    //    public string fName { get; set; }

    //}
    //    // tProject table專案資訊
    //    [DisplayName("訂單編號")]
    //    public string fOrderNum { get; set; }
    //    [DisplayName("訂單日期")]
    //    public Nullable<System.DateTime> fPjtDate { get; set; }
    //    [DisplayName("客戶Email")]
    //    public string fCEmail { get; set; }
    //    [DisplayName("專案聯絡人")]
    //    public string fContact { get; set; }
    //    [DisplayName("專案聯絡人電話")]
    //    public string fContactTel { get; set; }
    //    [DisplayName("平日聯若時間")]
    //    public string fWkdyTime { get; set; }
    //    [DisplayName("假日聯若時間")]
    //    public string fWkndTime { get; set; }
    //    [DisplayName("拍攝程式")]
    //    public string fCity { get; set; }
    //    [DisplayName("拍攝地點")]
    //    public string fLoc { get; set; }
    //    [DisplayName("拍攝日期")]
    //    public Nullable<System.DateTime> fFilmDate { get; set; }
    //    [DisplayName("拍攝時間")]
    //    public Nullable<System.TimeSpan> fFilmTime { get; set; }
    //    [DisplayName("預算")]
    //    public Nullable<int> fBudget { get; set; }
    //    [DisplayName("出圖張數")]
    //    public Nullable<int> fPrintQty { get; set; }
    //    [DisplayName("專案主題")]
    //    public string fPjtTopic { get; set; }
    //    [DisplayName("需求描述")]
    //    public string fReq { get; set; }
    //    [DisplayName("參考網址")]
    //    public string fStyle { get; set; }
    //    [DisplayName("專案狀態")]
    //    public Nullable<bool> fPjtState { get; set; }
    //    [DisplayName("負責攝影師")]
    //    public string fPEmail { get; set; }
    //    [DisplayName("參考照片")]
    //    public string fPicUpload { get; set; }
    //    // 照片路徑設定
    //    [DisplayName("照片存檔編碼")]
    //    public HttpPostedFileBase photo { get; set; }


    //    // tMember會員資料fName.fEmail.fCode.fPhoto
    //    [DisplayName("會員姓名")]
    //    public string fName { get; set; }
    //    [DisplayName("會員個人照")]
    //    public string fPhoto { get; set; }
    //    [DisplayName("會員Email")]
    //    public string fEmail { get; set; }
    //    [DisplayName("會員角色判別")]
    //    public Nullable<int> fCode { get; set; }

    //    //// tPMsg 攝影師留言
    //    //public int fId { get; set; }
    //    //public string fPEmail { get; set; }
    //    //public string fOrderNum { get; set; }
    //    //public string fCEmail { get; set; }
    //    //public Nullable<System.DateTime> fMsgTime { get; set; }
    //    //public string fMsg { get; set; }

    //    //// tMsg 顧客留言
    //    //public int fId { get; set; }
    //    //public string fCEmail { get; set; }
    //    //public string fOrderNum { get; set; }
    //    //public Nullable<System.DateTime> fMsgTime { get; set; }
    //    //public string fMsg { get; set; }
    //    //public Nullable<bool> fState { get; set; }
    //    //public string fPEmail { get; set; }

    //    public MProjectViewModel()
    //    {
    //        this.project = new tProject();
    //        this.member = new tMember();
    //    }
    //    public tProject project { get; set; }
    //    public tMember member { get; set; }

        //public MProjectViewModel(string email)
        //{
        //    dbShootShotEntities db = new dbShootShotEntities();
        //    var query = from m in db.tMember
        //                join p in db.tProject on m.fEmail equals p.fPEmail into projectdetail
        //                orderby m.fEmail
        //                select new
        //                {
        //                    m.fEmail, m.fName,
        //                    p = from p1 in projectdetail
        //                        where p1.fCEmail == email
        //                        select p1
        //                };
        //}

    }
