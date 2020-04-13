USE [DocumentTracking]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[CreateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryLangs]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryLangs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_CategoryLangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColorCodes]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorCodes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[CssCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_ColorCodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentLangs]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentLangs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentLangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentMangers]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentMangers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentMangers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageID] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationLangs]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationLangs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_LocationLangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[DepartmentID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[FontawareSome] [nvarchar](max) NULL,
	[RoleID] [int] NOT NULL,
	[Index] [int] NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationDetails]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationDetails](
	[NotificationDetailID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationID] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UserID] [int] NOT NULL,
	[LanguageID] [nvarchar](max) NULL,
	[Sent] [bit] NOT NULL,
 CONSTRAINT [PK_NotificationDetails] PRIMARY KEY CLUSTERED 
(
	[NotificationDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[RecordID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Action] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionDetails]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAction] [nvarchar](max) NULL,
	[CodeAction] [nvarchar](max) NULL,
	[PermisionID] [int] NOT NULL,
 CONSTRAINT [PK_PermissionDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Records]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Records](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[StatusID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Modifieddate] [datetime2](7) NOT NULL,
	[TrackingID] [nvarchar](max) NULL,
	[DepartmentHeadID] [int] NOT NULL,
	[LanguageID] [nvarchar](max) NULL,
	[ColorCodeID] [int] NOT NULL,
	[State] [bit] NOT NULL,
	[Privacy] [bit] NOT NULL,
 CONSTRAINT [PK_Records] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUsers]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RoleUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusLangs]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusLangs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_StatusLangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_SubCategories] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategoryLangs]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategoryLangs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[SubCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_SubCategoryLangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamLangs]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamLangs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_TeamLangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 4/13/2020 4:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](3000) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Mobi] [nvarchar](20) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[Position] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[IDcardNumber] [nvarchar](max) NULL,
	[RoleID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[LanguageID] [nvarchar](max) NULL,
	[PemisionID] [int] NOT NULL,
 CONSTRAINT [PK_UserAccounts] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200411013516_InitialDb', N'3.1.1')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [CreateTime]) VALUES (2, N'Giấy phê chuẩn - Approval Sheet - 簽呈', CAST(N'2019-10-29T14:26:00.8270000' AS DateTime2))
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [CreateTime]) VALUES (1002, N'Demo VI - Demo EN - 資產請購單', CAST(N'2019-11-13T14:25:39.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryLangs] ON 
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (1, N'Giấy phê chuẩn', N'vi', 2)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (2, N'簽呈', N'tw', 2)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (3, N'Approval Sheet', N'en', 2)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (4, N'Demo VI', N'vi', 1002)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (5, N'Demo EN', N'en', 1002)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (6, N'Demo TW', N'en', 1002)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (7, N'資產請購單', N'tw', 1002)
GO
SET IDENTITY_INSERT [dbo].[CategoryLangs] OFF
GO
SET IDENTITY_INSERT [dbo].[DepartmentLangs] ON 
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (35, N'DEV', N'vi', 1006)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (36, N'DEV', N'en', 1006)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (37, N'開發中心', N'tw', 1006)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (38, N'ADM', N'vi', 1007)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (39, N'ADM', N'en', 1007)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (40, N'管理部', N'tw', 1007)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (41, N'SEA', N'vi', 1008)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (42, N'SEA', N'en', 1008)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (43, N'SEA', N'tw', 1008)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (44, N'GA', N'vi', 1009)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (45, N'GA', N'en', 1009)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (46, N'總務部', N'tw', 1009)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (47, N'Production Center', N'vi', 1010)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (48, N'Production Center', N'en', 1010)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (49, N'生產中心', N'tw', 1010)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (50, N'ME', N'vi', 1011)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (51, N'ME', N'en', 1011)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (52, N'ME', N'tw', 1011)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (53, N'QC', N'vi', 1012)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (54, N'QC', N'en', 1012)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (55, N'QC', N'tw', 1012)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (56, N'FIN', N'vi', 1013)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (57, N'FIN', N'en', 1013)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (58, N'財務部', N'tw', 1013)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (59, N'TT', N'vi', 1014)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (60, N'TT', N'en', 1014)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (61, N'技轉部', N'tw', 1014)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (62, N'Planning Department', N'vi', 1015)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (63, N'Planning Department', N'en', 1015)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (64, N'生管部', N'tw', 1015)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (65, N'Purchasing Department', N'vi', 1016)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (66, N'Purchasing Department', N'en', 1016)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (67, N'資材部', N'tw', 1016)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (68, N'IT Room', N'vi', 1017)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (69, N'IT Room', N'en', 1017)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (70, N'電腦室', N'tw', 1017)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (71, N'BIZ', N'vi', 1018)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (72, N'Business Department', N'en', 1018)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (73, N'業務部', N'tw', 1018)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (74, N'FHO', N'vi', 1019)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (75, N'FHO', N'en', 1019)
GO
INSERT [dbo].[DepartmentLangs] ([ID], [Name], [LanguageID], [DepartmentID]) VALUES (76, N'廠區辦公室', N'tw', 1019)
GO
SET IDENTITY_INSERT [dbo].[DepartmentLangs] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1006, N'DEV - DEV - 開發中心', CAST(N'2019-12-17T14:04:51.0630000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1007, N'ADM - ADM - 管理部', CAST(N'2019-12-17T14:05:18.6570000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1008, N'SEA - SEA - SEA', CAST(N'2019-12-17T14:05:30.3000000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1009, N'GA - GA - 總務部', CAST(N'2019-12-17T14:05:43.8530000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1010, N'Production Center - Production Center - 生產中心', CAST(N'2019-12-17T14:07:06.2870000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1011, N'ME - ME - ME', CAST(N'2019-12-17T14:07:27.0500000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1012, N'QC - QC - QC', CAST(N'2019-12-17T14:07:42.2070000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1013, N'FIN - FIN - 財務部', CAST(N'2019-12-17T14:08:08.6600000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1014, N'TT - TT - 技轉部', CAST(N'2019-12-17T14:08:58.5300000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1015, N'Planning Department - Planning Department - 生管部', CAST(N'2019-12-17T14:09:35.7670000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1016, N'Purchasing Department - Purchasing Department - 資材部', CAST(N'2019-12-17T14:10:20.7300000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1017, N'IT Room - IT Room - 電腦室', CAST(N'2019-12-17T14:11:04.0100000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1018, N'BIZ - Business Department - 業務部', CAST(N'2019-12-17T14:11:41.3370000' AS DateTime2))
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [CreateTime]) VALUES (1019, N'FHO - FHO - 廠區辦公室', CAST(N'2019-12-17T14:12:28.7900000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[LocationLangs] ON 
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (1, N'Văn phòng Mr. Erick ', N'vi', 11)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (2, N'董事長辦公室', N'tw', 11)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (3, N'Chair man''s office', N'en', 11)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (4, N'Văn phòng Mr. Erick', N'vi', 1)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (5, N'Erick辦公室', N'tw', 1)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (6, N'Mr. Erick office ', N'en', 1)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (7, N'Địa điểm 2', N'vi', 2)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (8, N'YY辦公室', N'tw', 2)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (9, N'YY''s office', N'en', 2)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (10, N'Địa điểm 3 3', N'vi', 3)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (11, N'財務長辦公室', N'tw', 3)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (12, N'CFO''s office', N'en', 3)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (13, N'Địa điểm 9', N'vi', 9)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (14, N'總經理辦公室', N'tw', 9)
GO
INSERT [dbo].[LocationLangs] ([ID], [Name], [LanguageID], [LocationID]) VALUES (15, N'GM''s office', N'en', 9)
GO
SET IDENTITY_INSERT [dbo].[LocationLangs] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Remark], [DepartmentID], [TeamID]) VALUES (1, N'Văn phòng Mr. Erick - Mr. Erick office  - Erick辦公室', N'2', 3, 17)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Remark], [DepartmentID], [TeamID]) VALUES (2, N'Địa điểm 2 - YY''s office - YY辦公室', N'2', 3, 17)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Remark], [DepartmentID], [TeamID]) VALUES (3, N'Địa điểm 3 3 - CFO''s office - 財務長辦公室', N'3', 3, 17)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Remark], [DepartmentID], [TeamID]) VALUES (9, N'Địa điểm 9 - GM''s office - 總經理辦公室', N'123', 3, 17)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Remark], [DepartmentID], [TeamID]) VALUES (11, N'Văn phòng Mr. Erick  - Chair man''s office - 董事長辦公室', NULL, 3, 17)
GO
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (1, N'Language', N'/Languages', N'fa fa-language', 1, 999999)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (3, N'Document Category', N'/Categories', N'fa fa-anchor', 1, 6)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (4, N'User', N'/UserAccounts', N'fa fa-user-circle', 1, 5)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (5, N'Team', N'/Teams', N'fa fa-object-group', 1, 4)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (6, N'Approval Sheet Category', N'/SubCategories', N'fa fa-external-link', 1, 7)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (7, N'Status', N'/Status', N'fa fa-pencil-square', 1, 8)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (8, N'Location', N'/Locations', N'fa fa-location-arrow', 1, 9)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (10, N'Department', N'/Departments', N'fa fa-edit', 1, 3)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (12, N'Color Code', N'/ColorCodes', N'fa fa-contao', 1, 10)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (13, N'Record', N'/Records', N'fa fa-file-text', 2, 1)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (15, N'Team', N'/Teams', N'fa fa-object-group', 1001, 3)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (16, N'User ', N'/UserAccounts', N'fa fa-user-circle', 1001, 4)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (17, N'User', N'/UserAccounts', N'fa fa-user-circle', 1002, 3)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (18, N'Record', N'/Records', N'fa fa-file-text', 1001, 1)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (19, N'Record', N'/Records', N'fa fa-file-text', 1, 1)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (20, N'History', N'/Histories', N'fa fa-history', 1, 2)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (21, N'History', N'/Histories', N'fa fa-history', 2, 2)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (22, N'History', N'/Histories', N'fa fa-history', 1002, 2)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (23, N'History', N'/Histories', N'fa fa-history', 1001, 2)
GO
INSERT [dbo].[Menus] ([ID], [Title], [Url], [FontawareSome], [RoleID], [Index]) VALUES (24, N'Record', N'/Records', N'fa fa-file-text', 1002, 1)
GO
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RoleID], [Name], [Code]) VALUES (1, N'admin', N'ADMIN')
GO
INSERT [dbo].[Roles] ([RoleID], [Name], [Code]) VALUES (2, N'user', N'USER')
GO
INSERT [dbo].[Roles] ([RoleID], [Name], [Code]) VALUES (1001, N'department head', N'DEPTHEAD')
GO
INSERT [dbo].[Roles] ([RoleID], [Name], [Code]) VALUES (1002, N'supervisor', N'SUP')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 
GO
INSERT [dbo].[Status] ([StatusID], [Name]) VALUES (1, N'Đang thực hiện - On going - 進行中')
GO
INSERT [dbo].[Status] ([StatusID], [Name]) VALUES (2, N'Đang chờ xử lý - Pending - 卡關')
GO
INSERT [dbo].[Status] ([StatusID], [Name]) VALUES (3, N'Làm xong - Done - 完成')
GO
INSERT [dbo].[Status] ([StatusID], [Name]) VALUES (4, N'Đang đợi tài liệu - Wait For Document - 準備送件')
GO
INSERT [dbo].[Status] ([StatusID], [Name]) VALUES (9, N'new status - new status - 新增文件')
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusLangs] ON 
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (1, N'Đang thực hiện', N'vi', 1)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (2, N'進行中', N'tw', 1)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (3, N'On going', N'en', 1)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (4, N'Đang chờ xử lý', N'vi', 2)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (5, N'卡關', N'tw', 2)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (6, N'Pending', N'en', 2)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (7, N'Làm xong', N'vi', 3)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (8, N'完成', N'tw', 3)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (9, N'Done', N'en', 3)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (10, N'Đang đợi tài liệu', N'vi', 4)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (11, N'準備送件', N'tw', 4)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (12, N'Wait For Document', N'en', 4)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (21, N'new status', N'vi', 9)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (22, N'新增文件', N'tw', 9)
GO
INSERT [dbo].[StatusLangs] ([ID], [Name], [LanguageID], [StatusID]) VALUES (23, N'new status', N'en', 9)
GO
SET IDENTITY_INSERT [dbo].[StatusLangs] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategories] ON 
GO
INSERT [dbo].[SubCategories] ([SubCategoryID], [Name], [CreateTime], [CategoryID]) VALUES (1003, N'Others - Others - 其他類', CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[SubCategories] ([SubCategoryID], [Name], [CreateTime], [CategoryID]) VALUES (1004, N'dasd - asd - 請購類', CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[SubCategories] ([SubCategoryID], [Name], [CreateTime], [CategoryID]) VALUES (1005, N'asd - asdas - 休假類', CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 2)
GO
SET IDENTITY_INSERT [dbo].[SubCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategoryLangs] ON 
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (4, N'Others', N'vi', 1003)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (5, N'Others', N'en', 1003)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (6, N'其他類', N'tw', 1003)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (7, N'dasd', N'vi', 1004)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (8, N'asd', N'en', 1004)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (9, N'請購類', N'en', 1004)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (10, N'asd', N'vi', 1005)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (11, N'asdas', N'en', 1005)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (12, N'完成', N'en', 1005)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (17, N'休假類', N'tw', 1005)
GO
INSERT [dbo].[SubCategoryLangs] ([ID], [Name], [LanguageID], [SubCategoryID]) VALUES (18, N'請購類', N'tw', 1004)
GO
SET IDENTITY_INSERT [dbo].[SubCategoryLangs] OFF
GO
SET IDENTITY_INSERT [dbo].[TeamLangs] ON 
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (4, N'Team VI1', N'vi', 17)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (5, N'Team EN1', N'en', 17)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (6, N'組1', N'tw', 17)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (7, N'Nhóm 3.1', N'vi', 18)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (8, N'Team 3.1', N'en', 18)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (9, N'3.1組', N'tw', 18)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (12, N'Nhóm 3', N'vi', 19)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (14, N'Team 3', N'en', 19)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (15, N'3組', N'tw', 19)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (22, N'asdas', N'vi', 22)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (23, N'asdas', N'en', 22)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (24, N'asdas', N'tw', 22)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (25, N'Lab Team', N'vi', 23)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (26, N'Lab Team', N'en', 23)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (27, N'實驗組', N'tw', 23)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (28, N'Admin Affairs', N'vi', 24)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (29, N'Admin Affairs', N'en', 24)
GO
INSERT [dbo].[TeamLangs] ([ID], [Name], [LanguageID], [TeamID]) VALUES (30, N'事務組', N'tw', 24)
GO
SET IDENTITY_INSERT [dbo].[TeamLangs] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 
GO
INSERT [dbo].[Teams] ([ID], [Name], [DepartmentID]) VALUES (17, N'Team VI1 - Team EN1 - 組1', 1001)
GO
INSERT [dbo].[Teams] ([ID], [Name], [DepartmentID]) VALUES (18, N'Nhóm 3.1 - Team 3.1 - 3.1組', 3)
GO
INSERT [dbo].[Teams] ([ID], [Name], [DepartmentID]) VALUES (19, N'Nhóm 3 - Team 3 - 3組', 3)
GO
INSERT [dbo].[Teams] ([ID], [Name], [DepartmentID]) VALUES (22, N'asdas - asdas - asdas', 1005)
GO
INSERT [dbo].[Teams] ([ID], [Name], [DepartmentID]) VALUES (23, N'Lab Team - Lab Team - 實驗組', 1019)
GO
INSERT [dbo].[Teams] ([ID], [Name], [DepartmentID]) VALUES (24, N'Admin Affairs - Admin Affairs - 事務組', 1019)
GO
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAccounts] ON 
GO
INSERT [dbo].[UserAccounts] ([UserID], [PasswordHash], [PasswordSalt], [Username], [Password], [Address], [Email], [Mobi], [Avatar], [Description], [CreateTime], [CreateBy], [Position], [Status], [IDcardNumber], [RoleID], [DepartmentID], [TeamID], [LocationID], [LanguageID], [PemisionID]) VALUES (1, 0x43226AD3205DF972BF8DE302D7402D81A6E8643628D38CE4BF586B360EEF9B0BA9A32D74C47032B2216DE59E771B0B8BE657A6205CD72FB08ECCB129EA3664A3, 0x199E992D5F007C9D18950C689ADB9EE14F018D18AC108AC67E407C572F08F1031ED46979D696A0722798CBD90BEA6D3242CEDC7640ABA5ADAEB3E0E6E5FE95BD81B1D08C82B9B87F6598F021066E20E7CD3E73C4170923EE77467584DECD56913BD3202DF89CB187E5308F2DC04275E25433340D589D94F379537B1AA93B72DF, N'admin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', NULL, N'Sy.Pham@shc.ssbshoes.com', NULL, NULL, N'description 1', CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), N'admin', 1, 1, N'64710', 1, 0, 0, 1, N'tw', 1)
GO
INSERT [dbo].[UserAccounts] ([UserID], [PasswordHash], [PasswordSalt], [Username], [Password], [Address], [Email], [Mobi], [Avatar], [Description], [CreateTime], [CreateBy], [Position], [Status], [IDcardNumber], [RoleID], [DepartmentID], [TeamID], [LocationID], [LanguageID], [PemisionID]) VALUES (7, 0x6808B8F2E14EC3D4A5AD33C9F129618A93F9F378006F23E3E1AC693F11F7176EED202A18F02EE6E7FE002FF15379A02F6EE4324D48EBB7EA33C3A7DFECEC7957, 0x97D6575F9B4B2351763CBB95B4E9E2197FAD32CF08C35A4AC92155BB1AFF885687F0CF75AF1609FE299D77C255EE646E375CA891175C1638C4B7866E60B25FF92077F99F93622F053D222573A2EF81D56D64B1B907D9BECE8259DC16C134A6D6C23C8F931FC117909941935E278B03D20E73255012E1687A6124CD243DBA7CD6, N'peter', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', NULL, N'Peter.Tran@shc.ssbshoes.com', NULL, NULL, N'Description 121', CAST(N'2019-10-15T09:41:51.1230000' AS DateTime2), NULL, 6, 1, N'60212', 1002, 1019, 23, 0, N'tw', 1002)
GO
INSERT [dbo].[UserAccounts] ([UserID], [PasswordHash], [PasswordSalt], [Username], [Password], [Address], [Email], [Mobi], [Avatar], [Description], [CreateTime], [CreateBy], [Position], [Status], [IDcardNumber], [RoleID], [DepartmentID], [TeamID], [LocationID], [LanguageID], [PemisionID]) VALUES (31, 0x41D4F6E9CC1C8E8F6CFC825C116FC451F19E4FCA15F88D60F1E2968D1B96EB3747204C9E2CA6FB6DC3C1FDFEDC597F7E1BB7B6E1768EFB52E415D2331A08C4E4, 0xDF4A28392B7BCD202F848BE49CC4865605B48398B1AA8550B3406EB3395353CC8C0EDAE971B51C0E716E8DED91574AB8D17B01331610B819DF3FBA021CE6B3576010E287D9156CCC348AC33B4B7AE095249B6344C053F77AE15EE9C46D590996C0710175EE36D67AF89911F2006045D20EF56F8D1B5712313224A8247D1BAAB7, N'swook', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', NULL, N'swook.lu@shc.ssbshoes.com', NULL, NULL, NULL, CAST(N'2019-10-30T17:32:24.7300000' AS DateTime2), NULL, 0, 1, N'90394', 1001, 1019, 23, 0, N'tw', 1001)
GO
INSERT [dbo].[UserAccounts] ([UserID], [PasswordHash], [PasswordSalt], [Username], [Password], [Address], [Email], [Mobi], [Avatar], [Description], [CreateTime], [CreateBy], [Position], [Status], [IDcardNumber], [RoleID], [DepartmentID], [TeamID], [LocationID], [LanguageID], [PemisionID]) VALUES (32, 0x386DDEE27BE94ED09FC2820794400345EAB7766BB718E03FAE289A69AF87DDBF1950D31E96EE0C45BDF2266D1779FD1DE9451380F52878A62EADFB5095C27A32, 0x1E87956C460AF57819AE5FDFEADC487BFD87A35B29243386ED9DA998FA5977F7469A080FBDD893A3BA638C702F2876D79BDBB77A86D5B7335F1FD26B852A8B743CC8DA173C05CC95E1C3629A4908BFD6C9543B277461014940063A1DE9A96642F9D96C8C0AB9FFCFC999E5526240AC30F9BA218705DF5619AD964B38229B5312, N'henry', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', NULL, N'Sy.Pham@shc.ssbshoes.com', NULL, NULL, NULL, CAST(N'2019-11-12T14:35:22.0770000' AS DateTime2), NULL, 0, 0, N'63125', 2, 1019, 23, 0, N'tw', 1002)
GO
INSERT [dbo].[UserAccounts] ([UserID], [PasswordHash], [PasswordSalt], [Username], [Password], [Address], [Email], [Mobi], [Avatar], [Description], [CreateTime], [CreateBy], [Position], [Status], [IDcardNumber], [RoleID], [DepartmentID], [TeamID], [LocationID], [LanguageID], [PemisionID]) VALUES (43, 0x98A053E520206BCF6782706D4972F9875BFE3831F086F2DF4F8B89D0C7039986303D7B8465FAAB528DC58513D15AFB0C2CC1E3C02778D647BAA47AD64967BD1D, 0x0B9ABA78E2199D3AC075CB08D80EC1F3060809D44CEBC331C78CE57A25C8320A4310BD6DB269C9B31DE7BB49C61DE181779AA90026D476B77FE41F202469D4611360D94D42E8C39A09D2CA0CD298FF248B7FE791043B93A2D423A243E83F5B8A234DDC6CF5737B35EF6EB884BB4CEED7ED08651CD26940ABE97E67296F7F0E4B, N'Jenny', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, N'Jenny.Wang@shc.ssbshoes.com', NULL, NULL, NULL, CAST(N'2020-01-11T12:22:02.7230000' AS DateTime2), NULL, 0, 1, N'90597', 1, 1019, 24, 0, N'tw', 0)
GO
SET IDENTITY_INSERT [dbo].[UserAccounts] OFF
GO
ALTER TABLE [dbo].[CategoryLangs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryLangs_Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryLangs] CHECK CONSTRAINT [FK_CategoryLangs_Categories_CategoryID]
GO
ALTER TABLE [dbo].[DepartmentLangs]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentLangs_Departments_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DepartmentLangs] CHECK CONSTRAINT [FK_DepartmentLangs_Departments_DepartmentID]
GO
ALTER TABLE [dbo].[LocationLangs]  WITH CHECK ADD  CONSTRAINT [FK_LocationLangs_Locations_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LocationLangs] CHECK CONSTRAINT [FK_LocationLangs_Locations_LocationID]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Roles_RoleID]
GO
ALTER TABLE [dbo].[PermissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_PermissionDetails_Permissions_PermisionID] FOREIGN KEY([PermisionID])
REFERENCES [dbo].[Permissions] ([PermissionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PermissionDetails] CHECK CONSTRAINT [FK_PermissionDetails_Permissions_PermisionID]
GO
ALTER TABLE [dbo].[StatusLangs]  WITH CHECK ADD  CONSTRAINT [FK_StatusLangs_Status_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StatusLangs] CHECK CONSTRAINT [FK_StatusLangs_Status_StatusID]
GO
ALTER TABLE [dbo].[SubCategoryLangs]  WITH CHECK ADD  CONSTRAINT [FK_SubCategoryLangs_SubCategories_SubCategoryID] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategories] ([SubCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubCategoryLangs] CHECK CONSTRAINT [FK_SubCategoryLangs_SubCategories_SubCategoryID]
GO
ALTER TABLE [dbo].[TeamLangs]  WITH CHECK ADD  CONSTRAINT [FK_TeamLangs_Teams_TeamID] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Teams] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamLangs] CHECK CONSTRAINT [FK_TeamLangs_Teams_TeamID]
GO
ALTER TABLE [dbo].[UserAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserAccounts_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserAccounts] CHECK CONSTRAINT [FK_UserAccounts_Roles_RoleID]
GO
