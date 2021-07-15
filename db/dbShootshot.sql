USE [master]
GO
/****** Object:  Database [dbShootShot]    Script Date: 2021/6/28 下午 01:39:05 ******/
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
/****** Object:  Table [dbo].[tAlbumPhoto]    Script Date: 2021/6/28 下午 01:39:06 ******/
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
	[fView] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCMsg]    Script Date: 2021/6/28 下午 01:39:06 ******/
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
/****** Object:  Table [dbo].[tKeyword]    Script Date: 2021/6/28 下午 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKeyword](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fPhoId] [int] NULL,
	[fKeyword] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMember]    Script Date: 2021/6/28 下午 01:39:06 ******/
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
/****** Object:  Table [dbo].[tMemberPhot]    Script Date: 2021/6/28 下午 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMemberPhot](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](30) NULL,
	[fIntro] [nvarchar](100) NULL,
	[fStudioName] [nvarchar](20) NULL,
	[fStuidioAdd] [nvarchar](100) NULL,
	[fEmail] [nvarchar](50) NULL,
	[fOther] [nvarchar](100) NULL,
	[fFB] [nvarchar](100) NULL,
	[fIns] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPhotAlbum]    Script Date: 2021/6/28 下午 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPhotAlbum](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fEmail] [nvarchar](50) NULL,
	[fName] [nvarchar](20) NULL,
	[FState] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPhotArea]    Script Date: 2021/6/28 下午 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPhotArea](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fEmail] [nvarchar](50) NULL,
	[fArea] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPhotStyle]    Script Date: 2021/6/28 下午 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPhotStyle](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fEmail] [nvarchar](50) NULL,
	[fStyle] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPjtDetailType]    Script Date: 2021/6/28 下午 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPjtDetailType](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fOrderNum] [nvarchar](50) NULL,
	[fFilmType] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPjtDetailUpload]    Script Date: 2021/6/28 下午 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPjtDetailUpload](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fOrderNum] [nvarchar](50) NULL,
	[fPicUpload] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPMsg]    Script Date: 2021/6/28 下午 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPMsg](
	[fId] [int] NULL,
	[fPEmail] [nvarchar](50) NULL,
	[fOrderNum] [nvarchar](50) NULL,
	[fCEmail] [nvarchar](50) NULL,
	[fMsgTime] [smalldatetime] NULL,
	[fMsg] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProject]    Script Date: 2021/6/28 下午 01:39:06 ******/
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
	[fReq] [nvarchar](100) NULL,
	[fStyle] [nvarchar](100) NULL,
	[fPjtState] [bit] NULL,
	[fPEmail] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tROles]    Script Date: 2021/6/28 下午 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tROles](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fCode] [varchar](1) NULL,
	[fRole] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [dbShootShot] SET  READ_WRITE 
GO
