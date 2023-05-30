using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class RoomMember
    {
        public RoomMember()
        {
            Messages = new HashSet<Message>();
        }

        public int Id { get; set; }
        public int RoomId { get; set; }
        public int Member { get; set; }
        public int? LastMessage { get; set; }
        public string? Nickname { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Person MemberNavigation { get; set; } = null!;
        public virtual Room Room { get; set; } = null!;
        public virtual ICollection<Message> Messages { get; set; }
    }
}
