USE [master]
GO
/****** Object:  Database [dbShootShot]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tAlbumPhoto]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tCMsg]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tKeyword]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tMember]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
	[fGender] [bit] NULL,
	[fCode] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMemberPhot]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tPhotAlbum]    Script Date: 2021/7/8 下午 10:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPhotAlbum](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fEmail] [nvarchar](50) NULL,
	[fName] [nvarchar](20) NULL,
	[FState] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPhotArea]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tPhotStyle]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tPjtDetailType]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tPjtDetailUpload]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tPMsg]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
/****** Object:  Table [dbo].[tProject]    Script Date: 2021/7/8 下午 10:09:21 ******/
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
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRoles]    Script Date: 2021/7/8 下午 10:09:21 ******/
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

INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode]) VALUES (1, N'Mikhail Nilov', N'mikhail-nilov-user.jpeg', CAST(N'1974-02-10' AS Date), N'mikhail1974@gmail.com', N'9282111022', N'台北市', N'19740210', 1, N'1')
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode]) VALUES (2, N'Dammy Wang', N'dammy-wang-user.jpg', CAST(N'1988-10-11' AS Date), N'dammy1988@gmail.com', N'988558580', N'台中市', N'19881011', 0, N'0')
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode]) VALUES (3, N'Jack Cheng', N'jack-cheng-user.jpg', CAST(N'1990-01-01' AS Date), N'jack1990@gmail.com', N'933389930', N'高雄市', N'19900101', 1, N'0')
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode]) VALUES (4, N'Nina Evans', N'nina-evans-user.jpg', CAST(N'1982-05-21' AS Date), N'nina1982@gmail.com', N'922202888', N'台中市', N'19820521', 0, N'0')
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode]) VALUES (5, N'Ema Fu', N'ema-fu-user.jpg', CAST(N'1979-08-05' AS Date), N'ema1979@gmail.com', N'922889374', N'台東市', N'19790805', 0, N'0')
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode]) VALUES (6, N'Lucas Pezeta', N'lucas-pezeta-user.jpeg', CAST(N'1976-11-29' AS Date), N'lucas1976@gmail.com', N'933894957', N'台南市', N'19761129', 1, N'1')
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode]) VALUES (7, N'Olga Dimenshtein', N'olga-dimenshtein-phot.jpg', CAST(N'1986-06-30' AS Date), N'olga1986@gmail.com', N'960876455', N'台中市', N'19860630', 1, N'1')
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode]) VALUES (8, N'Lisa Ramirez', N'lisa-ramirez-phot.jpg', CAST(N'1985-04-23' AS Date), N'lisa1985@gmail.com', N'958837465', N'屏東市', N'19850423', 0, N'1')
INSERT [dbo].[tMember] ([fId], [fName], [fPhoto], [fBday], [fEmail], [fTel], [fArea], [fPassword], [fGender], [fCode]) VALUES (9, N'AnnaShvets', N'AnnaShvets-user.jpg', CAST(N'1992-07-21' AS Date), N'shvetsproduction@gamil.com', N'0934078992', N'高雄市', N'19920721', 0, N'1')
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
USE [master]
GO
ALTER DATABASE [dbShootShot] SET  READ_WRITE 
GO
