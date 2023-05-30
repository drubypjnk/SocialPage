using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Comment
    {
        public int CommentId { get; set; }
        public int? PostId { get; set; }
        public string? Content { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int Author { get; set; }
        public int? VisibilityId { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Person AuthorNavigation { get; set; } = null!;
        public virtual Post? Post { get; set; }
    }
}
