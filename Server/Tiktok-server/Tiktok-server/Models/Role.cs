using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Role
    {
        public Role()
        {
            People = new HashSet<Person>();
        }

        public int Id { get; set; }
        public string? Name { get; set; }

        public virtual ICollection<Person> People { get; set; }
    }
}
