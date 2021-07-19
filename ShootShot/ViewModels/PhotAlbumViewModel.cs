using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShootShot.ViewModels
{
	public class PhotAlbumViewModel
	{
		public PhotAlbumViewModel()
		{
			this.photAlbum = new tPhotAlbum();
			this.albumPhoto = new tAlbumPhoto();
		}
		public tPhotAlbum photAlbum { get; set; }
		public tAlbumPhoto albumPhoto { get; set; }
		public int fId
		{ 
			get { return this.photAlbum.fId; }
			set { this.photAlbum.fId = value; } 
		}
		public string fEmail
		{
			get {return this.photAlbum.fEmail ;}
			set { this.photAlbum.fEmail = value; } 
		}
		public string fName 
		{
			get { return this.photAlbum.fName; }
			set { this.photAlbum.fEmail = value; }
		}
		public Nullable<bool> fState
		{
			get { return this.photAlbum.fState; }
			set { this.photAlbum.fState = value; }
		}
		public int fPhoId
		{
			get { return this.albumPhoto.fId; }
			set { this.albumPhoto.fId = value; }
		}
		public int fAlbId
		{
			get { return this.albumPhoto.fId; }
			set { this.albumPhoto.fId = value; }
		}
		public string fPhoName
		{
			get { return this.albumPhoto.fName; }
			set { this.albumPhoto.fName = value; }
		}
		public string fDes
		{
			get { return this.albumPhoto.fDes; }
			set { this.albumPhoto.fDes = value; }
		}
		public Nullable<bool> fCover
		{
			get { return this.albumPhoto.fCover; }
			set { this.albumPhoto.fCover = value; }
		}
		public Nullable<int> fLike
		{
			get { return this.albumPhoto.fLike; }
			set { this.albumPhoto.fLike = value; }
		}
		public Nullable<int> fView
		{
			get { return this.albumPhoto.fView; }
			set { this.albumPhoto.fView = value; }
		}
		public HttpPostedFileBase photo { get; set; }
	}
}