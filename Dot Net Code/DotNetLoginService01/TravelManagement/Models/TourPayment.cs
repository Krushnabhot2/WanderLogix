using System;
using System.Collections.Generic;

namespace TravelManagement.Models
{
    public partial class TourPayment
    {
        public int PaymentId { get; set; }
        public int? TourTransactionId { get; set; }
        public double? Amount { get; set; }
        public DateOnly PaymentDate { get; set; }
        public string PaymentMode { get; set; } = null!;

        public virtual TourTransaction? TourTransaction { get; set; }
    }
}
