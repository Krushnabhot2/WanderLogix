using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace TravelManagement.Models
{
    public partial class TourMember
    {
        public int MemberId { get; set; }
        public int? UserId { get; set; }
        public int? TtId { get; set; }
        public string Fname { get; set; } = null!;
        public string Lname { get; set; } = null!;
        public string AadharNo { get; set; } = null!;


        [JsonIgnore]

        public virtual TourTransaction? Tt { get; set; }

        [JsonIgnore]
        public virtual User? User { get; set; }
    }
}
