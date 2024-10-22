using System;
using System.Collections.Generic;

namespace TravelManagement.Models
{
    public partial class TourPackage
    {
        public TourPackage()
        {
            TourImages = new HashSet<TourImage>();
            TourTransactions = new HashSet<TourTransaction>();
        }

        public int TourPackageId { get; set; }
        public string TourName { get; set; } = null!;
        public string? Description { get; set; }
        public double? Price { get; set; }
        public DateOnly StartDate { get; set; }
        public DateOnly EndDate { get; set; }
        public int? Duration { get; set; }
        public int? NoOfSeats { get; set; }
        public string? Status { get; set; }
        public int? MgrId { get; set; }
        public int? GuideId { get; set; }

        public virtual User? Guide { get; set; }
        public virtual User? Mgr { get; set; }
        public virtual ICollection<TourImage> ? TourImages { get; set; }
        public virtual ICollection<TourTransaction>? TourTransactions { get; set; }
    }
}
