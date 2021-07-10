using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShootShot.Models
{
	public class CProjectFactory
	{
		internal List<tMember> queryAllphotog() {
			dbShootShotEntities db = new dbShootShotEntities();
			tMember member = db.tMember.FirstOrDefault(g => g.fCode == "1");
			List<tMember> list = new List<tMember>();
			if (member != null) {
				tMember photogs = new tMember()
				{
					fName = member.fName.ToString(),
					fEmail=member.fEmail.ToString()
				};
				list.Add(photogs);
			}
			return list;
		}			
	}
}