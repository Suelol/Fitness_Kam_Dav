﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FitnessOsnova_Kam_Dav.DbModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class FitnessClub_Kam_DavEntities : DbContext
    {
        public FitnessClub_Kam_DavEntities()
            : base("name=FitnessClub_Kam_DavEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Attendance> Attendance { get; set; }
        public virtual DbSet<Bookings> Bookings { get; set; }
        public virtual DbSet<Clients> Clients { get; set; }
        public virtual DbSet<Feedback> Feedback { get; set; }
        public virtual DbSet<FinancialTransactions> FinancialTransactions { get; set; }
        public virtual DbSet<Gyms> Gyms { get; set; }
        public virtual DbSet<Inventory> Inventory { get; set; }
        public virtual DbSet<MembershipTypes> MembershipTypes { get; set; }
        public virtual DbSet<Trainers> Trainers { get; set; }
        public virtual DbSet<Trainings> Trainings { get; set; }
    }
}