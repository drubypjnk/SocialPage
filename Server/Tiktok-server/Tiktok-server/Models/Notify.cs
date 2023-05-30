using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Notify
    {
        public Notify()
        {
            NotifyUsers = new HashSet<NotifyUser>();
        }

        public int NotifyId { get; set; }
        public int? NotifyType { get; set; }
        public string? NotifyTitle { get; set; }
        public string? NotifyContent { get; set; }
        public DateTime? CreateDate { get; set; }
        public int? UserId { get; set; }
        public int? Status { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual ICollection<NotifyUser> NotifyUsers { get; set; }
    }
}
