using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Room
    {
        public Room()
        {
            RoomMembers = new HashSet<RoomMember>();
        }

        public int RoomId { get; set; }
        public string? RoomTitle { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? DeleteDate { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual ICollection<RoomMember> RoomMembers { get; set; }
    }
}
