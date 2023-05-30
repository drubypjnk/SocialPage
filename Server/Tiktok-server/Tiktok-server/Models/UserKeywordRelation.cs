using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class UserKeywordRelation
    {
        public string? Keyword { get; set; }
        public int? UserId { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Keyword? KeywordNavigation { get; set; }
        public virtual Person? User { get; set; }
    }
}
