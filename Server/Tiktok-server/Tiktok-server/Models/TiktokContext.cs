using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Tiktok_server.Models
{
    public partial class TiktokContext : DbContext
    {
        public TiktokContext()
        {
        }

        public TiktokContext(DbContextOptions<TiktokContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Comment> Comments { get; set; } = null!;
        public virtual DbSet<Follow> Follows { get; set; } = null!;
        public virtual DbSet<Keyword> Keywords { get; set; } = null!;
        public virtual DbSet<Like> Likes { get; set; } = null!;
        public virtual DbSet<Message> Messages { get; set; } = null!;
        public virtual DbSet<Notify> Notifies { get; set; } = null!;
        public virtual DbSet<NotifyUser> NotifyUsers { get; set; } = null!;
        public virtual DbSet<Permission> Permissions { get; set; } = null!;
        public virtual DbSet<Person> People { get; set; } = null!;
        public virtual DbSet<Post> Posts { get; set; } = null!;
        public virtual DbSet<PostCategory> PostCategories { get; set; } = null!;
        public virtual DbSet<PostCategoryRelation> PostCategoryRelations { get; set; } = null!;
        public virtual DbSet<PostTagRelation> PostTagRelations { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Room> Rooms { get; set; } = null!;
        public virtual DbSet<RoomMember> RoomMembers { get; set; } = null!;
        public virtual DbSet<Setting> Settings { get; set; } = null!;
        public virtual DbSet<Tag> Tags { get; set; } = null!;
        public virtual DbSet<Template> Templates { get; set; } = null!;
        public virtual DbSet<UserKeywordRelation> UserKeywordRelations { get; set; } = null!;
        public virtual DbSet<Visibility> Visibilities { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=localhost,1433;Initial Catalog=Tiktok;User ID=sa;Password=123");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Comment>(entity =>
            {
                entity.ToTable("Comment");

                entity.Property(e => e.CommentId)
                    .ValueGeneratedNever()
                    .HasColumnName("comment_id");

                entity.Property(e => e.Author).HasColumnName("author");

                entity.Property(e => e.Content)
                    .HasColumnType("text")
                    .HasColumnName("content");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasColumnName("created_date");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.PostId).HasColumnName("post_id");

                entity.Property(e => e.VisibilityId).HasColumnName("visibility_id");

                entity.HasOne(d => d.AuthorNavigation)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.Author)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Comment.author");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.PostId)
                    .HasConstraintName("FK_Comment.post_id");
            });

            modelBuilder.Entity<Follow>(entity =>
            {
                entity.ToTable("Follow");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.ApproveDate)
                    .HasColumnType("datetime")
                    .HasColumnName("approve_date");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Follower).HasColumnName("follower");

                entity.Property(e => e.RequestDate)
                    .HasColumnType("datetime")
                    .HasColumnName("request_date");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.FollowerNavigation)
                    .WithMany(p => p.FollowFollowerNavigations)
                    .HasForeignKey(d => d.Follower)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Follow.follower");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.FollowUsers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Follow.user_id");
            });

            modelBuilder.Entity<Keyword>(entity =>
            {
                entity.ToTable("Keyword");

                entity.Property(e => e.Id)
                    .HasMaxLength(64)
                    .IsUnicode(false)
                    .HasColumnName("id");

                entity.Property(e => e.CountView).HasColumnName("count_view");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");
            });

            modelBuilder.Entity<Like>(entity =>
            {
                entity.ToTable("Like");

                entity.Property(e => e.LikeId)
                    .ValueGeneratedNever()
                    .HasColumnName("like_id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.PostId).HasColumnName("post_id");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.Likes)
                    .HasForeignKey(d => d.PostId)
                    .HasConstraintName("FK_Like.post_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Likes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Like.user_id");
            });

            modelBuilder.Entity<Message>(entity =>
            {
                entity.ToTable("Message");

                entity.Property(e => e.MessageId)
                    .ValueGeneratedNever()
                    .HasColumnName("message_id");

                entity.Property(e => e.Author).HasColumnName("author");

                entity.Property(e => e.Content)
                    .HasColumnType("text")
                    .HasColumnName("content");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasColumnName("created_date");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.React)
                    .HasColumnType("text")
                    .HasColumnName("react");

                entity.HasOne(d => d.AuthorNavigation)
                    .WithMany(p => p.Messages)
                    .HasForeignKey(d => d.Author)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Message.author");
            });

            modelBuilder.Entity<Notify>(entity =>
            {
                entity.ToTable("Notify");

                entity.Property(e => e.NotifyId)
                    .ValueGeneratedNever()
                    .HasColumnName("notify_id");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasColumnName("create_date");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.NotifyContent)
                    .HasColumnType("text")
                    .HasColumnName("notify_content");

                entity.Property(e => e.NotifyTitle)
                    .HasColumnType("text")
                    .HasColumnName("notify_title");

                entity.Property(e => e.NotifyType).HasColumnName("notify_type");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.UserId).HasColumnName("user_id");
            });

            modelBuilder.Entity<NotifyUser>(entity =>
            {
                entity.ToTable("NotifyUser");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.NotifyId).HasColumnName("notify_id");

                entity.Property(e => e.NotifyUser1).HasColumnName("notify_user");

                entity.HasOne(d => d.Notify)
                    .WithMany(p => p.NotifyUsers)
                    .HasForeignKey(d => d.NotifyId)
                    .HasConstraintName("FK_NotifyUser.notify_id");

                entity.HasOne(d => d.NotifyUser1Navigation)
                    .WithMany(p => p.NotifyUsers)
                    .HasForeignKey(d => d.NotifyUser1)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_NotifyUser.notify_user");
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.ToTable("Permission");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Key)
                    .HasColumnType("text")
                    .HasColumnName("key");

                entity.Property(e => e.Value)
                    .HasColumnType("text")
                    .HasColumnName("value");
            });

            modelBuilder.Entity<Person>(entity =>
            {
                entity.HasKey(e => e.UserId)
                    .HasName("PK__Person__B9BE370F5DEDF4B1");

                entity.ToTable("Person");

                entity.Property(e => e.UserId)
                    .ValueGeneratedNever()
                    .HasColumnName("user_id");

                entity.Property(e => e.Age).HasColumnName("age");

                entity.Property(e => e.Avatar)
                    .HasColumnType("text")
                    .HasColumnName("avatar");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Description)
                    .HasColumnType("text")
                    .HasColumnName("description");

                entity.Property(e => e.Email)
                    .HasColumnType("text")
                    .HasColumnName("email");

                entity.Property(e => e.FullName)
                    .HasColumnType("text")
                    .HasColumnName("full_name");

                entity.Property(e => e.Gender).HasColumnName("gender");

                entity.Property(e => e.IsPrivate).HasColumnName("is_private");

                entity.Property(e => e.Location)
                    .HasColumnType("text")
                    .HasColumnName("location");

                entity.Property(e => e.Password)
                    .HasColumnType("text")
                    .HasColumnName("password");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Username)
                    .HasColumnType("text")
                    .HasColumnName("username");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.People)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Person.role_id");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.ToTable("Post");

                entity.Property(e => e.PostId)
                    .ValueGeneratedNever()
                    .HasColumnName("post_id");

                entity.Property(e => e.Author).HasColumnName("author");

                entity.Property(e => e.Content)
                    .HasColumnType("text")
                    .HasColumnName("content");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasColumnName("created_date");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Title)
                    .HasColumnType("text")
                    .HasColumnName("title");

                entity.Property(e => e.UpdateDate)
                    .HasColumnType("datetime")
                    .HasColumnName("update date");

                entity.Property(e => e.VisibilityId).HasColumnName("visibility_id");

                entity.HasOne(d => d.AuthorNavigation)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.Author)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Post.author");

                entity.HasOne(d => d.Visibility)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.VisibilityId)
                    .HasConstraintName("FK_Post.visibility_id");
            });

            modelBuilder.Entity<PostCategory>(entity =>
            {
                entity.HasKey(e => e.CategoryId)
                    .HasName("PK__Post_Cat__D54EE9B4E79C1C2E");

                entity.ToTable("Post_Category");

                entity.Property(e => e.CategoryId)
                    .ValueGeneratedNever()
                    .HasColumnName("category_id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Desc)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("desc");

                entity.Property(e => e.Name)
                    .HasMaxLength(64)
                    .IsUnicode(false)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<PostCategoryRelation>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Post_Category_Relation");

                entity.Property(e => e.CategoryId).HasColumnName("category_id");

                entity.Property(e => e.PostId).HasColumnName("post_id");

                entity.HasOne(d => d.Category)
                    .WithMany()
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Post_Category_Relation.category_id");

                entity.HasOne(d => d.Post)
                    .WithMany()
                    .HasForeignKey(d => d.PostId)
                    .HasConstraintName("FK_Post_Category_Relation.post_id");
            });

            modelBuilder.Entity<PostTagRelation>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Post_Tag_Relation");

                entity.Property(e => e.PostId).HasColumnName("post_id");

                entity.Property(e => e.TagId).HasColumnName("tag_id");

                entity.HasOne(d => d.Post)
                    .WithMany()
                    .HasForeignKey(d => d.PostId)
                    .HasConstraintName("FK_Post_Tag_Relation.post_id");

                entity.HasOne(d => d.Tag)
                    .WithMany()
                    .HasForeignKey(d => d.TagId)
                    .HasConstraintName("FK_Post_Tag_Relation.tag_id");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Name)
                    .HasColumnType("text")
                    .HasColumnName("name");
            });

            modelBuilder.Entity<Room>(entity =>
            {
                entity.ToTable("Room");

                entity.Property(e => e.RoomId)
                    .ValueGeneratedNever()
                    .HasColumnName("room_id");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasColumnName("create_date");

                entity.Property(e => e.DeleteDate)
                    .HasColumnType("datetime")
                    .HasColumnName("delete_date");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.RoomTitle)
                    .HasColumnType("text")
                    .HasColumnName("room_title");
            });

            modelBuilder.Entity<RoomMember>(entity =>
            {
                entity.ToTable("RoomMember");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.LastMessage).HasColumnName("last_message");

                entity.Property(e => e.Member).HasColumnName("member");

                entity.Property(e => e.Nickname)
                    .HasColumnType("text")
                    .HasColumnName("nickname");

                entity.Property(e => e.RoomId).HasColumnName("room_id");

                entity.HasOne(d => d.MemberNavigation)
                    .WithMany(p => p.RoomMembers)
                    .HasForeignKey(d => d.Member)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RoomMember.member");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.RoomMembers)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RoomMember.room_id");
            });

            modelBuilder.Entity<Setting>(entity =>
            {
                entity.ToTable("Setting");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasColumnName("date_created");

                entity.Property(e => e.DateUpdated)
                    .HasColumnType("datetime")
                    .HasColumnName("date_updated");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Key)
                    .HasColumnType("text")
                    .HasColumnName("key");

                entity.Property(e => e.Value)
                    .HasColumnType("text")
                    .HasColumnName("value");
            });

            modelBuilder.Entity<Tag>(entity =>
            {
                entity.ToTable("Tag");

                entity.Property(e => e.TagId)
                    .ValueGeneratedNever()
                    .HasColumnName("tag_id");
            });

            modelBuilder.Entity<Template>(entity =>
            {
                entity.ToTable("Template");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Content)
                    .HasColumnType("text")
                    .HasColumnName("content");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Key).HasColumnName("key");
            });

            modelBuilder.Entity<UserKeywordRelation>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("user_keyword_Relation");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Keyword)
                    .HasMaxLength(64)
                    .IsUnicode(false)
                    .HasColumnName("keyword");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.KeywordNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.Keyword)
                    .HasConstraintName("FK_user_keyword_Relation.keyword");

                entity.HasOne(d => d.User)
                    .WithMany()
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_user_keyword_Relation.user_id");
            });

            modelBuilder.Entity<Visibility>(entity =>
            {
                entity.ToTable("Visibility");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Key)
                    .HasColumnType("text")
                    .HasColumnName("key");

                entity.Property(e => e.Value)
                    .HasColumnType("text")
                    .HasColumnName("value");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
