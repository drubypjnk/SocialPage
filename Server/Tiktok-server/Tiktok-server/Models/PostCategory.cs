using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class PostCategory
    {
        public int CategoryId { get; set; }
        public string? Name { get; set; }
        public string? Desc { get; set; }
        public bool? DeleteFlag { get; set; }
    }
}
