using System;
using System.Collections.Generic;

namespace Tiktok_server.Models
{
    public partial class Person
    {
        public Person()
        {
            Comments = new HashSet<Comment>();
            FollowFollowerNavigations = new HashSet<Follow>();
            FollowUsers = new HashSet<Follow>();
            Likes = new HashSet<Like>();
            NotifyUsers = new HashSet<NotifyUser>();
            Posts = new HashSet<Post>();
            RoomMembers = new HashSet<RoomMember>();
        }

        public int UserId { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public string? FullName { get; set; }
        public string? Description { get; set; }
        public int? Age { get; set; }
        public int? Gender { get; set; }
        public string? Location { get; set; }
        public string? Email { get; set; }
        public int? Status { get; set; }
        public string? Avatar { get; set; }
        public bool? IsPrivate { get; set; }
        public bool? DeleteFlag { get; set; }
        public int RoleId { get; set; }

        public virtual Role Role { get; set; } = null!;
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<Follow> FollowFollowerNavigations { get; set; }
        public virtual ICollection<Follow> FollowUsers { get; set; }
        public virtual ICollection<Like> Likes { get; set; }
        public virtual ICollection<NotifyUser> NotifyUsers { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
        public virtual ICollection<RoomMember> RoomMembers { get; set; }
    }
}
