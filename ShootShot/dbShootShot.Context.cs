﻿//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShootShot
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class dbShootShotEntities : DbContext
    {
        public dbShootShotEntities()
            : base("name=dbShootShotEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tCMsg> tCMsg { get; set; }
        public virtual DbSet<tProject> tProject { get; set; }
        public virtual DbSet<tRoles> tRoles { get; set; }
        public virtual DbSet<tAlbumPhoto> tAlbumPhoto { get; set; }
        public virtual DbSet<tKeyword> tKeyword { get; set; }
        public virtual DbSet<tMemberPhot> tMemberPhot { get; set; }
        public virtual DbSet<tPhotAlbum> tPhotAlbum { get; set; }
        public virtual DbSet<tPhotArea> tPhotArea { get; set; }
        public virtual DbSet<tPhotStyle> tPhotStyle { get; set; }
        public virtual DbSet<tPMsg> tPMsg { get; set; }
        public virtual DbSet<tMember> tMember { get; set; }
    }
}
