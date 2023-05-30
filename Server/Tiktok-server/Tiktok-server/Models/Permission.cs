using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Permission
    {
        public int Id { get; set; }
        public string? Key { get; set; }
        public string? Value { get; set; }
        public bool? DeleteFlag { get; set; }
    }
}
