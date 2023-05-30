using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Like
    {
        public int LikeId { get; set; }
        public int? PostId { get; set; }
        public int UserId { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Post? Post { get; set; }
        public virtual Person User { get; set; } = null!;
    }
}
