USE [master]
GO
/****** Object:  Database [dbShootShot]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
CREATE DATABASE [dbShootShot]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbShootShot', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbShootShot.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbShootShot_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbShootShot_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbShootShot] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbShootShot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbShootShot] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbShootShot] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbShootShot] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbShootShot] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbShootShot] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbShootShot] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbShootShot] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbShootShot] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbShootShot] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbShootShot] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbShootShot] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbShootShot] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbShootShot] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbShootShot] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbShootShot] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbShootShot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbShootShot] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbShootShot] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbShootShot] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbShootShot] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbShootShot] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbShootShot] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbShootShot] SET RECOVERY FULL 
GO
ALTER DATABASE [dbShootShot] SET  MULTI_USER 
GO
ALTER DATABASE [dbShootShot] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbShootShot] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbShootShot] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbShootShot] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbShootShot] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbShootShot] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbShootShot', N'ON'
GO
ALTER DATABASE [dbShootShot] SET QUERY_STORE = OFF
GO
USE [dbShootShot]
GO
/****** Object:  Table [dbo].[tAlbumPhoto]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAlbumPhoto](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fAlbId] [int] NULL,
	[fName] [nvarchar](20) NULL,
	[fDes] [nvarchar](100) NULL,
	[fCover] [bit] NULL,
	[fLike] [int] NULL,
	[fView] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCMsg]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCMsg](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fCEmail] [nvarchar](50) NULL,
	[fOrderNum] [nvarchar](50) NULL,
	[fMsgTime] [smalldatetime] NULL,
	[fMsg] [nvarchar](100) NULL,
	[fState] [bit] NULL,
	[fPEmail] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tKeyword]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKeyword](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fPhoId] [int] NULL,
	[fKeyword] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMember]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMember](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](30) NULL,
	[fPhoto] [nvarchar](50) NULL,
	[fBday] [date] NULL,
	[fEmail] [nvarchar](50) NULL,
	[fTel] [nvarchar](20) NULL,
	[fArea] [nvarchar](10) NULL,
	[fPassword] [nvarchar](50) NULL,
	[fGender] [int] NULL,
	[fCode] [int] NULL,
	[fImgpath] [nvarchar](50) NULL,
 CONSTRAINT [PK__tMember__D9F8227C718CB29E] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMemberPhot]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMemberPhot](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](30) NULL,
	[fIntro] [nvarchar](1024) NULL,
	[fStudioName] [nvarchar](20) NULL,
	[fStuidioAdd] [nvarchar](100) NULL,
	[fEmail] [nvarchar](50) NULL,
	[fOther] [nvarchar](100) NULL,
	[fFB] [nvarchar](100) NULL,
	[fIns] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPhotAlbum]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPhotAlbum](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fEmail] [nvarchar](50) NULL,
	[fName] [nvarchar](20) NULL,
	[fState] [bit] NULL,
	[fCoverPath] [nvarchar](50) NULL,
	[fKeyword] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPhotArea]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPhotArea](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fEmail] [nvarchar](50) NULL,
	[fArea] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPhotStyle]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPhotStyle](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fEmail] [nvarchar](50) NULL,
	[fStyle] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPjtDetailType]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPjtDetailType](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fOrderNum] [nvarchar](50) NULL,
	[fFilmType] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPjtDetailUpload]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPjtDetailUpload](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fOrderNum] [nvarchar](50) NULL,
	[fPicUpload] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPMsg]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPMsg](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fPEmail] [nvarchar](50) NULL,
	[fOrderNum] [nvarchar](50) NULL,
	[fCEmail] [nvarchar](50) NULL,
	[fMsgTime] [smalldatetime] NULL,
	[fMsg] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProject]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProject](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fOrderNum] [nvarchar](50) NULL,
	[fPjtDate] [datetime] NULL,
	[fCEmail] [nvarchar](50) NULL,
	[fContact] [nvarchar](30) NULL,
	[fContactTel] [nvarchar](20) NULL,
	[fWkdyTime] [nvarchar](10) NULL,
	[fWkndTime] [nvarchar](10) NULL,
	[fCity] [nvarchar](10) NULL,
	[fLoc] [nvarchar](10) NULL,
	[fFilmDate] [date] NULL,
	[fFilmTime] [time](0) NULL,
	[fBudget] [int] NULL,
	[fPrintQty] [int] NULL,
	[fPjtTopic] [nvarchar](20) NULL,
	[fReq] [nvarchar](1024) NULL,
	[fStyle] [nvarchar](100) NULL,
	[fPjtState] [bit] NULL,
	[fPEmail] [nvarchar](50) NULL,
	[fPicUpload] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRoles]    Script Date: 2021/7/18 週日 上午 05:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRoles](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fCode] [int] NULL,
	[fRole] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tMember] ON 

INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (1, N'Mikhail Nilov', N'mikhail-nilov-user.jpeg', CAST(N'1974-02-10' AS Date), N'mikhail1974@gmail.com', N'9282111022', N'台北市', N'19740210', 1, 1, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (2, N'Dammy Wang', N'dammy-wang-user.jpg', CAST(N'1988-10-11' AS Date), N'dammy1988@gmail.com', N'988558580', N'台中市', N'19881011', 0, 0, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (3, N'Jack Cheng', N'jack-cheng-user.jpg', CAST(N'1990-01-01' AS Date), N'jack1990@gmail.com', N'933389930', N'高雄市', N'19900101', 1, 0, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (4, N'Nina Evans', N'nina-evans-user.jpg', CAST(N'1982-05-21' AS Date), N'nina1982@gmail.com', N'922202888', N'台中市', N'19820521', 0, 0, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (5, N'Ema Fu', N'ema-fu-user.jpg', CAST(N'1979-08-05' AS Date), N'ema1979@gmail.com', N'922889374', N'台東市', N'19790805', 0, 0, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (6, N'Lucas Pezeta', N'lucas-pezeta-user.jpeg', CAST(N'1976-11-29' AS Date), N'lucas1976@gmail.com', N'933894957', N'台南市', N'19761129', 1, 1, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (7, N'Olga Dimenshtein', N'olga-dimenshtein-phot.jpg', CAST(N'1986-06-30' AS Date), N'olga1986@gmail.com', N'960876455', N'台中市', N'19860630', 1, 1, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (8, N'Lisa Ramirez', N'lisa-ramirez-phot.jpg', CAST(N'1985-04-23' AS Date), N'lisa1985@gmail.com', N'958837465', N'屏東市', N'19850423', 0, 1, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (9, N'AnnaShvets', N'AnnaShvets-user.jpg', CAST(N'1992-07-21' AS Date), N'shvetsproduction@gamil.com', N'0934078992', N'高雄市', N'19920721', 0, 1, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (1031, N'TSENG HSI JUI', NULL, NULL, N'mycard@gmail.co', N'0910639656', N'屏東縣', N'0000', 0, 0, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (1032, N'Rey', NULL, NULL, N'mycard147108147108@gmail.com', N'0910639656', NULL, N'0000', 0, 0, N'/5dc1af6d-c3f8-4c4b-a85e-2268c8ef2916.jpg')
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (1033, N'TEST', NULL, NULL, N'mycar@gmail.com', N'0910000000', N'台南市', N'0000', 0, 0, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (1034, N'aaa', NULL, NULL, N'mycard1471081asdsaf08@gmail.coms', N'0910639656', N'台北市', N'asd', 0, 0, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (1035, N'asf', NULL, NULL, N'aard147108147108@gmail.com', N'0910639656', N'台北', N'a', 0, 0, NULL)
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode], [fImgpath]) VALUES (1036, N'TSENG HSI JUI', NULL, NULL, N'a@gmail.com', N'0910000001', NULL, N'aaaa', 1, 0, N'/c8488f77-5e03-4a8c-a64b-e28be1cadd2f.jpg')
SET IDENTITY_INSERT [dbo].[tMember] OFF
GO
SET IDENTITY_INSERT [dbo].[tMemberPhot] ON 

INSERT [dbo].[tMemberPhot] ([fId], [fName], [fIntro], [fStudioName], [fStuidioAdd], [fEmail], [fOther], [fFB], [fIns]) VALUES (1, N'Nilov', N'Commercial & Wedding Production. Your donations inspire us to create! | Follow me on Instagram. Thanks for the support :)', N'NilovStudio', N'106台北市大安區忠孝東路四段182號', N'mikhail1974@gmail.com', N'https://dreamwood.pro/Nilov', N'https://www.facebook.com/', N'https://www.instagram.com/mikhail_nilov/')
INSERT [dbo].[tMemberPhot] ([fId], [fName], [fIntro], [fStudioName], [fStuidioAdd], [fEmail], [fOther], [fFB], [fIns]) VALUES (2, N'Pezeta', N'If my work has touched your heart, consider donating through Paypal button. 1$ helps me a lot here in Brazil. Thank you, keep safe', N'Lucas Pezeta Lab', N'700台南市中西區南門路37號', N'lucas1976@gmail.com', N'https://lucaspezeta.com/', N'https://www.facebook.com/', N'https://www.instagram.com/lucaspezeta/')
INSERT [dbo].[tMemberPhot] ([fId], [fName], [fIntro], [fStudioName], [fStuidioAdd], [fEmail], [fOther], [fFB], [fIns]) VALUES (3, N'Olga Dimenshtein', N'check out our collections, grouped by topics. your donation creates inspiration😉 hello@omycotton.com', N'cottonbro studio', N'40701台中市西屯區台灣大道三段99號', N'olga1986@gmail.com', N'https://www.instagram.com/cottonbro/', N'https://www.facebook.com/', N'https://www.instagram.com/cottonbro/')
INSERT [dbo].[tMemberPhot] ([fId], [fName], [fIntro], [fStudioName], [fStuidioAdd], [fEmail], [fOther], [fFB], [fIns]) VALUES (4, N'Lisa', N'“ Somewhere, something incredible is waiting to be known ” - Carl Sagan', N'welshie.wonders', N'946屏東縣恆春鎮南灣路862巷36號', N'lisa1985@gmail.com', N'https://www.google.com/?hl=zh-tw', N'https://www.facebook.com/', N'https://www.instagram.com/welshie.wonders/')
INSERT [dbo].[tMemberPhot] ([fId], [fName], [fIntro], [fStudioName], [fStuidioAdd], [fEmail], [fOther], [fFB], [fIns]) VALUES (5, N'AnnaShvets', N'Anna Shvets / Photographer
✨Attractive people. Love', N'Anna''s place', N'高雄市前金區中正四路211號', N'shvetsproduction@gamil.com', N'https://shvetsproduction.com/?ref=pexels', N'https://www.facebook.com/', N'https://www.instagram.com/sh.vets/')
SET IDENTITY_INSERT [dbo].[tMemberPhot] OFF
GO
SET IDENTITY_INSERT [dbo].[tPhotAlbum] ON 

INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (1, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet1.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (2, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet2.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (3, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet3.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (4, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet4.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (5, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet5.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (6, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet6.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (7, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet7.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (8, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet8.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (9, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet9.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (10, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet10.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (11, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet11.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (12, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet12.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (13, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet13.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (14, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet14.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (15, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet15.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (16, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet16.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (17, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet17.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (18, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet18.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (19, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet19.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (20, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet20.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (21, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet21.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (22, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet22.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (23, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet23.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (24, N'lucas1976@gmail.com', N'玲玲的寵物', 1, N'pet24.jpg', N'寵物')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (25, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding1.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (26, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding2.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (27, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding3.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (28, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding4.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (29, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding5.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (30, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding6.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (31, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding7.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (32, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding8.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (33, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding9.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (34, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding10.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (35, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding11.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (36, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding12.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (37, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding13.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (38, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding14.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (39, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding15.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (40, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding16.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (41, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding17.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (42, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding18.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (43, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding19.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (44, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding20.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (45, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding21.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (46, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding22.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (47, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding23.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (48, N'olga1986@gmail.com', N'玲玲的婚禮', 1, N'wedding24.jpg', N'婚禮')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (49, N'olga1986@gmail.com', N'玲玲的車', 1, N'car1.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (50, N'olga1986@gmail.com', N'玲玲的車', 1, N'car2.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (51, N'olga1986@gmail.com', N'玲玲的車', 1, N'car3.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (52, N'olga1986@gmail.com', N'玲玲的車', 1, N'car4.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (53, N'olga1986@gmail.com', N'玲玲的車', 1, N'car5.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (54, N'olga1986@gmail.com', N'玲玲的車', 1, N'car6.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (55, N'olga1986@gmail.com', N'玲玲的車', 1, N'car7.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (56, N'olga1986@gmail.com', N'玲玲的車', 1, N'car8.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (57, N'olga1986@gmail.com', N'玲玲的車', 1, N'car9.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (58, N'olga1986@gmail.com', N'玲玲的車', 1, N'car10.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (59, N'olga1986@gmail.com', N'玲玲的車', 1, N'car11.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (60, N'olga1986@gmail.com', N'玲玲的車', 1, N'car12.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (61, N'olga1986@gmail.com', N'玲玲的車', 1, N'car13.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (62, N'olga1986@gmail.com', N'玲玲的車', 1, N'car14.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (63, N'olga1986@gmail.com', N'玲玲的車', 1, N'car15.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (64, N'olga1986@gmail.com', N'玲玲的車', 1, N'car16.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (65, N'olga1986@gmail.com', N'玲玲的車', 1, N'car17.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (66, N'olga1986@gmail.com', N'玲玲的車', 1, N'car18.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (67, N'olga1986@gmail.com', N'玲玲的車', 1, N'car19.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (68, N'olga1986@gmail.com', N'玲玲的車', 1, N'car20.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (69, N'olga1986@gmail.com', N'玲玲的車', 1, N'car21.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (70, N'olga1986@gmail.com', N'玲玲的車', 1, N'car22.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (71, N'olga1986@gmail.com', N'玲玲的車', 1, N'car23.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (72, N'olga1986@gmail.com', N'玲玲的車', 1, N'car24.jpg', N'車')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (73, N'lisa1985@gmail.com', N'大自然', 1, N'nature1.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (74, N'lisa1985@gmail.com', N'大自然', 1, N'nature2.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (75, N'lisa1985@gmail.com', N'大自然', 1, N'nature3.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (76, N'lisa1985@gmail.com', N'大自然', 1, N'nature4.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (77, N'lisa1985@gmail.com', N'大自然', 1, N'nature5.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (78, N'lisa1985@gmail.com', N'大自然', 1, N'nature6.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (79, N'lisa1985@gmail.com', N'大自然', 1, N'nature7.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (80, N'lisa1985@gmail.com', N'大自然', 1, N'nature8.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (81, N'lisa1985@gmail.com', N'大自然', 1, N'nature9.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (82, N'lisa1985@gmail.com', N'大自然', 1, N'nature10.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (83, N'lisa1985@gmail.com', N'大自然', 1, N'nature11.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (84, N'lisa1985@gmail.com', N'大自然', 1, N'nature12.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (85, N'lisa1985@gmail.com', N'大自然', 1, N'nature13.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (86, N'lisa1985@gmail.com', N'大自然', 1, N'nature14.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (87, N'lisa1985@gmail.com', N'大自然', 1, N'nature15.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (88, N'lisa1985@gmail.com', N'大自然', 1, N'nature16.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (89, N'lisa1985@gmail.com', N'大自然', 1, N'nature17.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (90, N'lisa1985@gmail.com', N'大自然', 1, N'nature18.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (91, N'lisa1985@gmail.com', N'大自然', 1, N'nature19.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (92, N'lisa1985@gmail.com', N'大自然', 1, N'nature20.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (93, N'lisa1985@gmail.com', N'大自然', 1, N'nature21.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (94, N'lisa1985@gmail.com', N'大自然', 1, N'nature22.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (95, N'lisa1985@gmail.com', N'大自然', 1, N'nature23.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (96, N'lisa1985@gmail.com', N'大自然', 1, N'nature24.jpg', N'自然')
INSERT [dbo].[tPhotAlbum] ([fId], [fEmail], [fName], [fState], [fCoverPath], [fKeyword]) VALUES (97, NULL, N'紅茶', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tPhotAlbum] OFF
GO
SET IDENTITY_INSERT [dbo].[tProject] ON 

INSERT [dbo].[tProject] ([fId], [fOrderNum], [fPjtDate], [fCEmail], [fContact], [fContactTel], [fWkdyTime], [fWkndTime], [fCity], [fLoc], [fFilmDate], [fFilmTime], [fBudget], [fPrintQty], [fPjtTopic], [fReq], [fStyle], [fPjtState], [fPEmail], [fPicUpload]) VALUES (1, N'2021071683', CAST(N'2021-07-16T02:40:44.000' AS DateTime), N'nina1982@gmail.com', N'REY', N'0910639656', N'14', N'2', N'麟洛鄉', N'我家', CAST(N'2021-07-14' AS Date), CAST(N'16:45:00' AS Time), 5, 1, N'色情', N'無', N'https://localhost:44322/CPROJECT/CREATE', 0, NULL, N'/1443fe11-31f2-4ce4-affd-372c2a616df8.jpg')
SET IDENTITY_INSERT [dbo].[tProject] OFF
GO
USE [master]
GO
ALTER DATABASE [dbShootShot] SET  READ_WRITE 
GO
