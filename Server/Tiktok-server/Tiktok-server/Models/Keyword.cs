using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Keyword
    {
        public string Id { get; set; } = null!;
        public int? CountView { get; set; }
        public bool? DeleteFlag { get; set; }
    }
}
