using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class NotifyUser
    {
        public int Id { get; set; }
        public int? NotifyId { get; set; }
        public int NotifyUser1 { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Notify? Notify { get; set; }
        public virtual Person NotifyUser1Navigation { get; set; } = null!;
    }
}
