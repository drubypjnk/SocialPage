USE [master]
GO
/****** Object:  Database [Tiktok]    Script Date: 5/30/2023 3:42:23 PM ******/
CREATE DATABASE [Tiktok]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tiktok', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tiktok.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tiktok_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tiktok_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tiktok] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tiktok].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tiktok] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tiktok] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tiktok] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tiktok] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tiktok] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tiktok] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Tiktok] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tiktok] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tiktok] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tiktok] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tiktok] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tiktok] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tiktok] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tiktok] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tiktok] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tiktok] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tiktok] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tiktok] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tiktok] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tiktok] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tiktok] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tiktok] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tiktok] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tiktok] SET  MULTI_USER 
GO
ALTER DATABASE [Tiktok] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tiktok] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tiktok] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tiktok] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tiktok] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tiktok] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tiktok] SET QUERY_STORE = OFF
GO
USE [Tiktok]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] NOT NULL,
	[post_id] [int] NULL,
	[content] [text] NULL,
	[created_date] [datetime] NULL,
	[author] [int] NOT NULL,
	[visibility_id] [int] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[follower] [int] NOT NULL,
	[request_date] [datetime] NULL,
	[approve_date] [datetime] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keyword]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keyword](
	[id] [varchar](64) NOT NULL,
	[count_view] [int] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[like_id] [int] NOT NULL,
	[post_id] [int] NULL,
	[user_id] [int] NOT NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[like_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[message_id] [int] NOT NULL,
	[created_date] [datetime] NULL,
	[content] [text] NULL,
	[author] [int] NOT NULL,
	[react] [text] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notify]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notify](
	[notify_id] [int] NOT NULL,
	[notify_type] [int] NULL,
	[notify_title] [text] NULL,
	[notify_content] [text] NULL,
	[create_date] [datetime] NULL,
	[user_id] [int] NULL,
	[status] [int] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[notify_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotifyUser]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotifyUser](
	[id] [int] NOT NULL,
	[notify_id] [int] NULL,
	[notify_user] [int] NOT NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[id] [int] NOT NULL,
	[key] [text] NULL,
	[value] [text] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[user_id] [int] NOT NULL,
	[username] [text] NULL,
	[password] [text] NULL,
	[full_name] [text] NULL,
	[description] [text] NULL,
	[age] [int] NULL,
	[gender] [int] NULL,
	[location] [text] NULL,
	[email] [text] NULL,
	[status] [int] NULL,
	[avatar] [text] NULL,
	[is_private] [bit] NULL,
	[delete_flag] [bit] NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[post_id] [int] NOT NULL,
	[title] [text] NULL,
	[content] [text] NULL,
	[created_date] [datetime] NULL,
	[author] [int] NOT NULL,
	[visibility_id] [int] NULL,
	[update date] [datetime] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Category]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Category](
	[category_id] [int] NOT NULL,
	[name] [varchar](64) NULL,
	[desc] [varchar](500) NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Category_Relation]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Category_Relation](
	[post_id] [int] NULL,
	[category_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Tag_Relation]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Tag_Relation](
	[post_id] [int] NULL,
	[tag_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[name] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] NOT NULL,
	[room_title] [text] NULL,
	[create_date] [datetime] NULL,
	[delete_date] [datetime] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomMember]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomMember](
	[id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[member] [int] NOT NULL,
	[last_message] [int] NULL,
	[nickname] [text] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[id] [int] NOT NULL,
	[key] [text] NULL,
	[value] [text] NULL,
	[date_created] [datetime] NULL,
	[date_updated] [datetime] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[tag_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template](
	[id] [int] NOT NULL,
	[key] [int] NULL,
	[content] [text] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_keyword_Relation]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_keyword_Relation](
	[keyword] [varchar](64) NULL,
	[user_id] [int] NULL,
	[delete_flag] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visibility]    Script Date: 5/30/2023 3:42:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visibility](
	[id] [int] NOT NULL,
	[key] [text] NULL,
	[value] [text] NULL,
	[delete_flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment.author] FOREIGN KEY([author])
REFERENCES [dbo].[Person] ([user_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment.author]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment.post_id] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment.post_id]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow.follower] FOREIGN KEY([follower])
REFERENCES [dbo].[Person] ([user_id])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow.follower]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow.user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[Person] ([user_id])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow.user_id]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like.post_id] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like.post_id]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like.user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[Person] ([user_id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like.user_id]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message.author] FOREIGN KEY([author])
REFERENCES [dbo].[RoomMember] ([id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message.author]
GO
ALTER TABLE [dbo].[NotifyUser]  WITH CHECK ADD  CONSTRAINT [FK_NotifyUser.notify_id] FOREIGN KEY([notify_id])
REFERENCES [dbo].[Notify] ([notify_id])
GO
ALTER TABLE [dbo].[NotifyUser] CHECK CONSTRAINT [FK_NotifyUser.notify_id]
GO
ALTER TABLE [dbo].[NotifyUser]  WITH CHECK ADD  CONSTRAINT [FK_NotifyUser.notify_user] FOREIGN KEY([notify_user])
REFERENCES [dbo].[Person] ([user_id])
GO
ALTER TABLE [dbo].[NotifyUser] CHECK CONSTRAINT [FK_NotifyUser.notify_user]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person.role_id] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person.role_id]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post.author] FOREIGN KEY([author])
REFERENCES [dbo].[Person] ([user_id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post.author]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post.visibility_id] FOREIGN KEY([visibility_id])
REFERENCES [dbo].[Visibility] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post.visibility_id]
GO
ALTER TABLE [dbo].[Post_Category_Relation]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category_Relation.category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[Post_Category] ([category_id])
GO
ALTER TABLE [dbo].[Post_Category_Relation] CHECK CONSTRAINT [FK_Post_Category_Relation.category_id]
GO
ALTER TABLE [dbo].[Post_Category_Relation]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category_Relation.post_id] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[Post_Category_Relation] CHECK CONSTRAINT [FK_Post_Category_Relation.post_id]
GO
ALTER TABLE [dbo].[Post_Tag_Relation]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tag_Relation.post_id] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[Post_Tag_Relation] CHECK CONSTRAINT [FK_Post_Tag_Relation.post_id]
GO
ALTER TABLE [dbo].[Post_Tag_Relation]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tag_Relation.tag_id] FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tag] ([tag_id])
GO
ALTER TABLE [dbo].[Post_Tag_Relation] CHECK CONSTRAINT [FK_Post_Tag_Relation.tag_id]
GO
ALTER TABLE [dbo].[RoomMember]  WITH CHECK ADD  CONSTRAINT [FK_RoomMember.member] FOREIGN KEY([member])
REFERENCES [dbo].[Person] ([user_id])
GO
ALTER TABLE [dbo].[RoomMember] CHECK CONSTRAINT [FK_RoomMember.member]
GO
ALTER TABLE [dbo].[RoomMember]  WITH CHECK ADD  CONSTRAINT [FK_RoomMember.room_id] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[RoomMember] CHECK CONSTRAINT [FK_RoomMember.room_id]
GO
ALTER TABLE [dbo].[user_keyword_Relation]  WITH CHECK ADD  CONSTRAINT [FK_user_keyword_Relation.keyword] FOREIGN KEY([keyword])
REFERENCES [dbo].[Keyword] ([id])
GO
ALTER TABLE [dbo].[user_keyword_Relation] CHECK CONSTRAINT [FK_user_keyword_Relation.keyword]
GO
ALTER TABLE [dbo].[user_keyword_Relation]  WITH CHECK ADD  CONSTRAINT [FK_user_keyword_Relation.user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[Person] ([user_id])
GO
ALTER TABLE [dbo].[user_keyword_Relation] CHECK CONSTRAINT [FK_user_keyword_Relation.user_id]
GO
USE [master]
GO
ALTER DATABASE [Tiktok] SET  READ_WRITE 
GO
