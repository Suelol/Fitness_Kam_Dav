//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class FinancialTransactions
    {
        public int TransactionID { get; set; }
        public Nullable<int> ClientID { get; set; }
        public Nullable<System.DateTime> TransactionDate { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public string TransactionType { get; set; }
    
        public virtual Clients Clients { get; set; }
    }
}
