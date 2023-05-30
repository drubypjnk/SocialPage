using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Setting
    {
        public int Id { get; set; }
        public string? Key { get; set; }
        public string? Value { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateUpdated { get; set; }
        public bool? DeleteFlag { get; set; }
    }
}
