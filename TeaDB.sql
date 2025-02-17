USE [master]
GO
/****** Object:  Database [Tea]    Script Date: 2/17/2025 12:52:14 PM ******/
CREATE DATABASE [Tea]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tea', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tea.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tea_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tea_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tea] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tea] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tea] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tea] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tea] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tea] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tea] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tea] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tea] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tea] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tea] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tea] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tea] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tea] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tea] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tea] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tea] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tea] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tea] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tea] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tea] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tea] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tea] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tea] SET  MULTI_USER 
GO
ALTER DATABASE [Tea] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tea] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tea] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tea] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tea] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tea] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tea] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tea] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tea]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 2/17/2025 12:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[TeaID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2/17/2025 12:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tea]    Script Date: 2/17/2025 12:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tea](
	[TeaID] [int] IDENTITY(1,1) NOT NULL,
	[TeaName] [varchar](50) NOT NULL,
	[TeaType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([TeaID])
REFERENCES [dbo].[Tea] ([TeaID])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Tea] SET  READ_WRITE 
GO
