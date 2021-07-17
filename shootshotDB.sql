USE [master]
GO
/****** Object:  Database [gogobuydb]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
CREATE DATABASE [gogobuydb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gogobuydb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gogobuydb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gogobuydb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gogobuydb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [gogobuydb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gogobuydb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gogobuydb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gogobuydb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gogobuydb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gogobuydb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gogobuydb] SET ARITHABORT OFF 
GO
ALTER DATABASE [gogobuydb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gogobuydb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gogobuydb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gogobuydb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gogobuydb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gogobuydb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gogobuydb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gogobuydb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gogobuydb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gogobuydb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gogobuydb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gogobuydb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gogobuydb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gogobuydb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gogobuydb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gogobuydb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gogobuydb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gogobuydb] SET RECOVERY FULL 
GO
ALTER DATABASE [gogobuydb] SET  MULTI_USER 
GO
ALTER DATABASE [gogobuydb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gogobuydb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gogobuydb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gogobuydb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gogobuydb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gogobuydb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'gogobuydb', N'ON'
GO
ALTER DATABASE [gogobuydb] SET QUERY_STORE = OFF
GO
USE [gogobuydb]
GO
/****** Object:  Table [dbo].[tCollection]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCollection](
	[fCollectID] [int] IDENTITY(1,1) NOT NULL,
	[fProductID] [int] NULL,
	[fMemberID] [int] NULL,
 CONSTRAINT [PK_tCollection] PRIMARY KEY CLUSTERED 
(
	[fCollectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMembership]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMembership](
	[fMemberID] [int] IDENTITY(1,1) NOT NULL,
	[fFirstName] [nvarchar](30) NULL,
	[fLastName] [nvarchar](30) NULL,
	[fAddress] [nvarchar](100) NULL,
	[fEmail] [nvarchar](30) NULL,
	[fPhone] [nvarchar](30) NULL,
	[fDateOfBirth] [date] NULL,
	[fGender] [bit] NULL,
	[fEmailVerified] [bit] NULL,
	[fPassword] [char](64) NULL,
	[fSalt] [char](64) NULL,
 CONSTRAINT [PK_tMembership] PRIMARY KEY CLUSTERED 
(
	[fMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrder]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrder](
	[fOrderID] [int] IDENTITY(1,1) NOT NULL,
	[fPrice] [money] NULL,
	[fResCount] [int] NULL,
	[fOrderDate] [date] NULL,
	[fSellerID] [int] NULL,
	[fBuyerID] [int] NULL,
	[fOrderAddress] [nvarchar](50) NULL,
	[fOrderPhone] [nvarchar](30) NULL,
	[fBuyerName] [nvarchar](30) NULL,
 CONSTRAINT [PK_tOrder] PRIMARY KEY CLUSTERED 
(
	[fOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrderDetails]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrderDetails](
	[fDetailID] [int] IDENTITY(1,1) NOT NULL,
	[fOrderID] [int] NULL,
	[fProductID] [int] NULL,
	[fQuantity] [int] NULL,
 CONSTRAINT [PK_tOrderDetails] PRIMARY KEY CLUSTERED 
(
	[fDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProduct]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProduct](
	[fProductID] [int] IDENTITY(1,1) NOT NULL,
	[fCategory] [nvarchar](30) NULL,
	[fProductName] [nvarchar](30) NULL,
	[fPrice] [money] NULL,
	[fQuantity] [int] NULL,
	[fImgPath] [nvarchar](30) NULL,
	[fDescription] [nvarchar](50) NULL,
	[fMemberID] [int] NULL,
	[fProductLocation] [nvarchar](30) NULL,
	[fArrivalTime] [nvarchar](30) NULL,
	[fUpdateTime] [date] NULL,
 CONSTRAINT [PK_tProduct] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProductDetails]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductDetails](
	[fPDetails] [int] IDENTITY(1,1) NOT NULL,
	[fPName] [nvarchar](30) NULL,
	[fProductID] [int] NULL,
 CONSTRAINT [PK_tProductDetails] PRIMARY KEY CLUSTERED 
(
	[fPDetails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tShopping]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tShopping](
	[fCartID] [int] IDENTITY(1,1) NOT NULL,
	[fMemberID] [int] NULL,
 CONSTRAINT [PK_tShopping] PRIMARY KEY CLUSTERED 
(
	[fCartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tShoppingDetails]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tShoppingDetails](
	[fSDtails] [int] IDENTITY(1,1) NOT NULL,
	[fProductID] [int] NULL,
	[fQuantity] [int] NULL,
	[fCartID] [int] NULL,
 CONSTRAINT [PK_tShoppingDetails] PRIMARY KEY CLUSTERED 
(
	[fSDtails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tWishProduct]    Script Date: 2021/7/17 週六 上午 11:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tWishProduct](
	[fProductID] [int] IDENTITY(1,1) NOT NULL,
	[fCategory] [nvarchar](30) NULL,
	[fProductName] [nvarchar](30) NULL,
	[fPrice] [money] NULL,
	[fQuantity] [int] NULL,
	[fImgPath] [nvarchar](30) NULL,
	[fDescription] [nvarchar](50) NULL,
	[fMemberID] [int] NULL,
	[fCity] [nvarchar](30) NULL,
	[fArrivalTime] [date] NULL,
	[fCommission] [money] NULL,
	[fUpdateTime] [date] NULL,
 CONSTRAINT [PK_tWishProduct] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tMembership] ON 

INSERT [dbo].[tMembership] ([fMemberID], [fFirstName], [fLastName], [fAddress], [fEmail], [fPhone], [fDateOfBirth], [fGender], [fEmailVerified], [fPassword], [fSalt]) VALUES (1, N'王', N'曉明', NULL, N'dfjisdf123@gmail.com', N'0933311312', CAST(N'2020-01-01' AS Date), NULL, NULL, N'zxc123                             zxc123                       ', NULL)
INSERT [dbo].[tMembership] ([fMemberID], [fFirstName], [fLastName], [fAddress], [fEmail], [fPhone], [fDateOfBirth], [fGender], [fEmailVerified], [fPassword], [fSalt]) VALUES (2, N'王', N'文', N'zxczxczxczc', N'zxczxcasd1112222@gmail.com', N'0931111111', CAST(N'2019-01-01' AS Date), 1, NULL, N'111111                                                          ', N'08e33b635b27e296d7aa3f29d4d33ef8ce8c09f1983686d10f377614cd2243bd')
INSERT [dbo].[tMembership] ([fMemberID], [fFirstName], [fLastName], [fAddress], [fEmail], [fPhone], [fDateOfBirth], [fGender], [fEmailVerified], [fPassword], [fSalt]) VALUES (3, N'陳', N'玲', N'zxczxczxczc', N'qazwsxedc123@gmail.com', N'0933246225', CAST(N'2015-02-24' AS Date), 0, NULL, N'43e6f1f3b3b72e8a26d6bc51d2572684e1b712b003e7d5a32c9f33dc2152e4f3', N'76dc88b2345451dafa31e53fdc7d14a18f3a96efd8487f1d9a19c80856eea1d7')
INSERT [dbo].[tMembership] ([fMemberID], [fFirstName], [fLastName], [fAddress], [fEmail], [fPhone], [fDateOfBirth], [fGender], [fEmailVerified], [fPassword], [fSalt]) VALUES (4, N'TSENG2', N'JUI', N'ssssssssssssssssssssssssssssssssss', N'mycard147108147108@gmail.com', N'0910000000', CAST(N'2020-01-01' AS Date), NULL, NULL, N'9bb378487cf9ea74d2fe6f0ca8c63c58fee88aa7ab630edf26748bd230db4e91', N'9e4ae5115d7e2594fc8dd499cd6dab64352dd958ce310960b644d1779fac4852')
SET IDENTITY_INSERT [dbo].[tMembership] OFF
GO
ALTER TABLE [dbo].[tMembership] ADD  CONSTRAINT [DF_tMembership_fEmailVerified]  DEFAULT ((0)) FOR [fEmailVerified]
GO
ALTER TABLE [dbo].[tCollection]  WITH CHECK ADD  CONSTRAINT [FK_tCollection_tMembership] FOREIGN KEY([fMemberID])
REFERENCES [dbo].[tMembership] ([fMemberID])
GO
ALTER TABLE [dbo].[tCollection] CHECK CONSTRAINT [FK_tCollection_tMembership]
GO
ALTER TABLE [dbo].[tCollection]  WITH CHECK ADD  CONSTRAINT [FK_tCollection_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tCollection] CHECK CONSTRAINT [FK_tCollection_tProduct]
GO
ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tMembership] FOREIGN KEY([fSellerID])
REFERENCES [dbo].[tMembership] ([fMemberID])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tMembership]
GO
ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tMembership1] FOREIGN KEY([fBuyerID])
REFERENCES [dbo].[tMembership] ([fMemberID])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tMembership1]
GO
ALTER TABLE [dbo].[tOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetails_tOrder] FOREIGN KEY([fOrderID])
REFERENCES [dbo].[tOrder] ([fOrderID])
GO
ALTER TABLE [dbo].[tOrderDetails] CHECK CONSTRAINT [FK_tOrderDetails_tOrder]
GO
ALTER TABLE [dbo].[tOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetails_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tOrderDetails] CHECK CONSTRAINT [FK_tOrderDetails_tProduct]
GO
ALTER TABLE [dbo].[tProduct]  WITH CHECK ADD  CONSTRAINT [FK_tProduct_tMembership] FOREIGN KEY([fMemberID])
REFERENCES [dbo].[tMembership] ([fMemberID])
GO
ALTER TABLE [dbo].[tProduct] CHECK CONSTRAINT [FK_tProduct_tMembership]
GO
ALTER TABLE [dbo].[tProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_tProductDetails_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tProductDetails] CHECK CONSTRAINT [FK_tProductDetails_tProduct]
GO
ALTER TABLE [dbo].[tShopping]  WITH CHECK ADD  CONSTRAINT [FK_tShopping_tMembership] FOREIGN KEY([fMemberID])
REFERENCES [dbo].[tMembership] ([fMemberID])
GO
ALTER TABLE [dbo].[tShopping] CHECK CONSTRAINT [FK_tShopping_tMembership]
GO
ALTER TABLE [dbo].[tShoppingDetails]  WITH CHECK ADD  CONSTRAINT [FK_tShoppingDetails_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tShoppingDetails] CHECK CONSTRAINT [FK_tShoppingDetails_tProduct]
GO
ALTER TABLE [dbo].[tShoppingDetails]  WITH CHECK ADD  CONSTRAINT [FK_tShoppingDetails_tShopping] FOREIGN KEY([fCartID])
REFERENCES [dbo].[tShopping] ([fCartID])
GO
ALTER TABLE [dbo].[tShoppingDetails] CHECK CONSTRAINT [FK_tShoppingDetails_tShopping]
GO
ALTER TABLE [dbo].[tWishProduct]  WITH CHECK ADD  CONSTRAINT [FK_tWishProduct_tMembership] FOREIGN KEY([fMemberID])
REFERENCES [dbo].[tMembership] ([fMemberID])
GO
ALTER TABLE [dbo].[tWishProduct] CHECK CONSTRAINT [FK_tWishProduct_tMembership]
GO
USE [master]
GO
ALTER DATABASE [gogobuydb] SET  READ_WRITE 
GO
