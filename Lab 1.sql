USE [master]
GO
/****** Object:  Database [Bookstores]    Script Date: 2023-11-19 21:02:45 ******/
CREATE DATABASE [Bookstores]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bookstores', FILENAME = N'C:\Users\alexa\Bookstores.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bookstores_log', FILENAME = N'C:\Users\alexa\Bookstores_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bookstores] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bookstores].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bookstores] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bookstores] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bookstores] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bookstores] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bookstores] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bookstores] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Bookstores] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bookstores] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bookstores] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bookstores] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bookstores] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bookstores] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bookstores] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bookstores] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bookstores] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bookstores] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bookstores] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bookstores] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bookstores] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bookstores] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bookstores] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bookstores] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bookstores] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bookstores] SET  MULTI_USER 
GO
ALTER DATABASE [Bookstores] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bookstores] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bookstores] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bookstores] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bookstores] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bookstores] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bookstores] SET QUERY_STORE = OFF
GO
USE [Bookstores]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 2023-11-19 21:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2023-11-19 21:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ISBN] [nvarchar](13) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Language] [nvarchar](50) NULL,
	[Price] [decimal](10, 2) NULL,
	[ReleaseDate] [date] NULL,
	[AuthorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2023-11-19 21:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2023-11-19 21:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 2023-11-19 21:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[StoreID] [int] NOT NULL,
	[ISBN] [nvarchar](13) NOT NULL,
	[Number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 2023-11-19 21:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([ID], [FirstName], [LastName], [DateOfBirth]) VALUES (1, N'Arthur', N'Clarke', CAST(N'1917-12-16' AS Date))
INSERT [dbo].[Author] ([ID], [FirstName], [LastName], [DateOfBirth]) VALUES (2, N'Paulo', N'Coelho', CAST(N'1947-08-24' AS Date))
INSERT [dbo].[Author] ([ID], [FirstName], [LastName], [DateOfBirth]) VALUES (3, N'Jane', N'Austen', CAST(N'1775-12-16' AS Date))
INSERT [dbo].[Author] ([ID], [FirstName], [LastName], [DateOfBirth]) VALUES (4, N'Vladimir', N'Nabokov', CAST(N'1899-04-22' AS Date))
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
INSERT [dbo].[Books] ([ISBN], [Title], [Language], [Price], [ReleaseDate], [AuthorID]) VALUES (N'9780007155668', N'The Alchemist', N'English', CAST(250.00 AS Decimal(10, 2)), CAST(N'2014-04-15' AS Date), 2)
INSERT [dbo].[Books] ([ISBN], [Title], [Language], [Price], [ReleaseDate], [AuthorID]) VALUES (N'9780141199078', N'Pride and Prejudice', N'English', CAST(300.00 AS Decimal(10, 2)), CAST(N'2012-12-06' AS Date), 3)
INSERT [dbo].[Books] ([ISBN], [Title], [Language], [Price], [ReleaseDate], [AuthorID]) VALUES (N'9780345347954', N'Childhood´s End', N'English', CAST(200.00 AS Decimal(10, 2)), CAST(N'1994-03-01' AS Date), 1)
INSERT [dbo].[Books] ([ISBN], [Title], [Language], [Price], [ReleaseDate], [AuthorID]) VALUES (N'9783150198339', N'Lolita', N'English', CAST(150.00 AS Decimal(10, 2)), CAST(N'2000-02-03' AS Date), 4)
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email]) VALUES (1, N'Alexander', N'Angove Lilja', N'alexander.angove.lilja@iths.se')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email]) VALUES (2, N'Robin', N'Kamo', N'robin.kamo@iths.se')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email]) VALUES (3, N'Eric', N'Angove Lilja', N'eric.angove.lilja@iths.se')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Salary]) VALUES (1, N'Toni', N'Marosan', N'0731298173', 20000)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Salary]) VALUES (2, N'Isak', N'Roxbåge', N'0738181129', 30000)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [PhoneNumber], [Salary]) VALUES (3, N'Vanna', N'Vannasson', N'0701248592', 50000)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[Inventory] ([StoreID], [ISBN], [Number]) VALUES (1, N'9780007155668', 50)
INSERT [dbo].[Inventory] ([StoreID], [ISBN], [Number]) VALUES (1, N'9780345347954', 20)
INSERT [dbo].[Inventory] ([StoreID], [ISBN], [Number]) VALUES (2, N'9780141199078', 100)
INSERT [dbo].[Inventory] ([StoreID], [ISBN], [Number]) VALUES (3, N'9783150198339', 10)
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([ID], [StoreName], [Address]) VALUES (1, N'Nalle´s böcker', N'Svenslyckegatan 7')
INSERT [dbo].[Stores] ([ID], [StoreName], [Address]) VALUES (2, N'Robin´s böcker', N'Norra Hamngatan 26')
INSERT [dbo].[Stores] ([ID], [StoreName], [Address]) VALUES (3, N'Lilja´s böcker', N'Slotsskogsgatan 46B')
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([ID])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([ISBN])
REFERENCES [dbo].[Books] ([ISBN])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [dbo].[Stores] ([ID])
GO
USE [master]
GO
ALTER DATABASE [Bookstores] SET  READ_WRITE 
GO
