using System;
using System.Collections.Generic;

namespace TravelManagement.Models
{
    public partial class TourImage
    {
        public int ImageId { get; set; }
        public int? TpId { get; set; }
        public string? ImageUrl { get; set; }

        public virtual TourPackage? Tp { get; set; }
    }
}
