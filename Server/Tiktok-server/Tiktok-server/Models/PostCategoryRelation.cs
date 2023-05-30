using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class PostCategoryRelation
    {
        public int? PostId { get; set; }
        public int? CategoryId { get; set; }

        public virtual PostCategory? Category { get; set; }
        public virtual Post? Post { get; set; }
    }
}
