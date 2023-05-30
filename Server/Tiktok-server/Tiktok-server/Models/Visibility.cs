using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Visibility
    {
        public Visibility()
        {
            Posts = new HashSet<Post>();
        }

        public int Id { get; set; }
        public string? Key { get; set; }
        public string? Value { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
    }
}
