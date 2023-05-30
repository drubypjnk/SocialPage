using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Follow
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int Follower { get; set; }
        public DateTime? RequestDate { get; set; }
        public DateTime? ApproveDate { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Person FollowerNavigation { get; set; } = null!;
        public virtual Person User { get; set; } = null!;
    }
}
