using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class PostTagRelation
    {
        public int? PostId { get; set; }
        public int? TagId { get; set; }

        public virtual Post? Post { get; set; }
        public virtual Tag? Tag { get; set; }
    }
}
