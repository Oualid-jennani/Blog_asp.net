﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Blog
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class blogEntities : DbContext
    {
        public blogEntities()
            : base("name=blogEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<bloguser> bloguser { get; set; }
        public virtual DbSet<category> category { get; set; }
        public virtual DbSet<comment> comment { get; set; }
        public virtual DbSet<menuLink> menuLink { get; set; }
        public virtual DbSet<poste> poste { get; set; }
    }
}
