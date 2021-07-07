using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShootShot.Models
{
	public class CProjectFactory
	{
		public List<tAlbumPhoto> queryAll() {
			dbShootShotEntities db = new dbShootShotEntities();
			tAlbumPhoto photog = new tAlbumPhoto();
			
		}

		//public void photoglist(IQueryable<tMemberPhot> member, string name, string email)
		//{
		//	foreach (tMemberPhot item in member.ToList())
		//	{
		//		photoglist(item.fId, name, email);
		//	}
		//}
	}
}