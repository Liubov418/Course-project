USE [master]
GO
/****** Object:  Database [Administration]    Script Date: 01.03.2025 10:56:01 ******/
CREATE DATABASE [Administration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Administration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Administration.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Administration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Administration_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Administration] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Administration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Administration] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Administration] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Administration] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Administration] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Administration] SET ARITHABORT OFF 
GO
ALTER DATABASE [Administration] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Administration] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Administration] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Administration] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Administration] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Administration] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Administration] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Administration] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Administration] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Administration] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Administration] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Administration] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Administration] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Administration] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Administration] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Administration] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Administration] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Administration] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Administration] SET  MULTI_USER 
GO
ALTER DATABASE [Administration] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Administration] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Administration] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Administration] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Administration] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Administration] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Administration] SET QUERY_STORE = OFF
GO
USE [Administration]
GO
/****** Object:  Table [dbo].[Archive]    Script Date: 01.03.2025 10:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archive](
	[ArchiveID] [int] IDENTITY(1,1) NOT NULL,
	[DateDeposit] [date] NOT NULL,
	[DocumentID] [int] NOT NULL,
	[ShelfLife] [int] NULL,
 CONSTRAINT [PK_Archive] PRIMARY KEY CLUSTERED 
(
	[ArchiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 01.03.2025 10:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Status] [int] NOT NULL,
	[TypeDocumentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusDocument]    Script Date: 01.03.2025 10:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusDocument](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusDocument] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeDocument]    Script Date: 01.03.2025 10:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeDocument](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 01.03.2025 10:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01.03.2025 10:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Archive] ON 

INSERT [dbo].[Archive] ([ArchiveID], [DateDeposit], [DocumentID], [ShelfLife]) VALUES (1, CAST(N'2025-11-23' AS Date), 1, 5)
INSERT [dbo].[Archive] ([ArchiveID], [DateDeposit], [DocumentID], [ShelfLife]) VALUES (2, CAST(N'2025-11-27' AS Date), 2, NULL)
INSERT [dbo].[Archive] ([ArchiveID], [DateDeposit], [DocumentID], [ShelfLife]) VALUES (3, CAST(N'2025-12-01' AS Date), 3, 5)
INSERT [dbo].[Archive] ([ArchiveID], [DateDeposit], [DocumentID], [ShelfLife]) VALUES (4, CAST(N'2025-12-12' AS Date), 4, 5)
SET IDENTITY_INSERT [dbo].[Archive] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([DocumentID], [Title], [CreatedDate], [Status], [TypeDocumentID], [UserID]) VALUES (1, N'Приказ №1', CAST(N'2025-09-25' AS Date), 1, 1, 1)
INSERT [dbo].[Document] ([DocumentID], [Title], [CreatedDate], [Status], [TypeDocumentID], [UserID]) VALUES (2, N'Договор №1', CAST(N'2025-10-10' AS Date), 2, 2, 2)
INSERT [dbo].[Document] ([DocumentID], [Title], [CreatedDate], [Status], [TypeDocumentID], [UserID]) VALUES (3, N'Отчёт №1', CAST(N'2025-10-15' AS Date), 2, 4, 3)
INSERT [dbo].[Document] ([DocumentID], [Title], [CreatedDate], [Status], [TypeDocumentID], [UserID]) VALUES (4, N'Отчёт №2', CAST(N'2025-11-20' AS Date), 2, 4, 3)
INSERT [dbo].[Document] ([DocumentID], [Title], [CreatedDate], [Status], [TypeDocumentID], [UserID]) VALUES (5, N'Приказ №2', CAST(N'2025-12-25' AS Date), 1, 1, 1)
INSERT [dbo].[Document] ([DocumentID], [Title], [CreatedDate], [Status], [TypeDocumentID], [UserID]) VALUES (15, N'Акт№3', CAST(N'2025-11-22' AS Date), 3, 2, 5)
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusDocument] ON 

INSERT [dbo].[StatusDocument] ([StatusID], [StatusName]) VALUES (1, N'Создан')
INSERT [dbo].[StatusDocument] ([StatusID], [StatusName]) VALUES (2, N'На рассмотрении')
INSERT [dbo].[StatusDocument] ([StatusID], [StatusName]) VALUES (3, N'Утверждён')
INSERT [dbo].[StatusDocument] ([StatusID], [StatusName]) VALUES (4, N'Отклонён')
INSERT [dbo].[StatusDocument] ([StatusID], [StatusName]) VALUES (5, N'Архивирован')
SET IDENTITY_INSERT [dbo].[StatusDocument] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeDocument] ON 

INSERT [dbo].[TypeDocument] ([TypeID], [TypeName]) VALUES (1, N'Приказ')
INSERT [dbo].[TypeDocument] ([TypeID], [TypeName]) VALUES (2, N'Акт')
INSERT [dbo].[TypeDocument] ([TypeID], [TypeName]) VALUES (3, N'Договор')
INSERT [dbo].[TypeDocument] ([TypeID], [TypeName]) VALUES (4, N'Отчёт')
SET IDENTITY_INSERT [dbo].[TypeDocument] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([RoleID], [RoleName]) VALUES (1, N'Глава администрации')
INSERT [dbo].[UserRole] ([RoleID], [RoleName]) VALUES (2, N'Заместитель главы ')
INSERT [dbo].[UserRole] ([RoleID], [RoleName]) VALUES (3, N'Секретарь')
INSERT [dbo].[UserRole] ([RoleID], [RoleName]) VALUES (4, N'IT-специалист')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [Role]) VALUES (1, N'User1', N'123', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [Role]) VALUES (2, N'User2', N'123', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [Role]) VALUES (3, N'User3', N'123', 3)
INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [Role]) VALUES (4, N'User4', N'123', 4)
INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [Role]) VALUES (5, N'lol', N'1', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Archive]  WITH CHECK ADD  CONSTRAINT [FK_Archive_Document] FOREIGN KEY([DocumentID])
REFERENCES [dbo].[Document] ([DocumentID])
GO
ALTER TABLE [dbo].[Archive] CHECK CONSTRAINT [FK_Archive_Document]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_StatusDocument] FOREIGN KEY([Status])
REFERENCES [dbo].[StatusDocument] ([StatusID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_StatusDocument]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Type] FOREIGN KEY([TypeDocumentID])
REFERENCES [dbo].[TypeDocument] ([TypeID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Type]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRole] FOREIGN KEY([Role])
REFERENCES [dbo].[UserRole] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRole]
GO
USE [master]
GO
ALTER DATABASE [Administration] SET  READ_WRITE 
GO
