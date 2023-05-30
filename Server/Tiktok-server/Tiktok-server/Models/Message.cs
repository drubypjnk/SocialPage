using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Message
    {
        public int MessageId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string? Content { get; set; }
        public int Author { get; set; }
        public string? React { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual RoomMember AuthorNavigation { get; set; } = null!;
    }
}
