/*    ==Параметры сценариев==

    Версия исходного сервера : SQL Server 2017 (14.0.1000)
    Выпуск исходного ядра СУБД : Выпуск Microsoft SQL Server Enterprise Edition
    Тип исходного ядра СУБД : Изолированный SQL Server

    Версия целевого сервера : SQL Server 2017
    Выпуск целевого ядра СУБД : Выпуск Microsoft SQL Server Standard Edition
    Тип целевого ядра СУБД : Изолированный SQL Server
*/
USE [master]
GO
/****** Object:  Database [Sessia1]    Script Date: 25.01.2023 11:27:34 ******/
CREATE DATABASE [Sessia1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sessia1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sessia1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sessia1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sessia1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Sessia1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sessia1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sessia1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sessia1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sessia1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sessia1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sessia1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sessia1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sessia1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sessia1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sessia1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sessia1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sessia1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sessia1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sessia1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sessia1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sessia1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sessia1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sessia1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sessia1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sessia1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sessia1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sessia1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sessia1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sessia1] SET RECOVERY FULL 
GO
ALTER DATABASE [Sessia1] SET  MULTI_USER 
GO
ALTER DATABASE [Sessia1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sessia1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sessia1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sessia1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sessia1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sessia1', N'ON'
GO
ALTER DATABASE [Sessia1] SET QUERY_STORE = OFF
GO
USE [Sessia1]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Sessia1]
GO
/****** Object:  Table [dbo].[Competition]    Script Date: 25.01.2023 11:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competition](
	[ID_Competition] [float] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Date_Start] [nvarchar](255) NOT NULL,
	[Date_End] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[City] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Competition] PRIMARY KEY CLUSTERED 
(
	[ID_Competition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Competition_Skill]    Script Date: 25.01.2023 11:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competition_Skill](
	[ID_Competition] [float] NULL,
	[Skill_ID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 25.01.2023 11:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[ID_Regions] [float] NULL,
	[Name_Regions] [nvarchar](255) NULL,
	[Capital] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.01.2023 11:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [float] NULL,
	[Role] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 25.01.2023 11:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[ID_Skill] [float] NULL,
	[Title] [nvarchar](255) NULL,
	[Skill_Block_ID] [float] NULL,
	[Is_Future] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[area per workplace (sq#m)] [float] NULL,
	[The area of the evaluation room for 1 expert group] [float] NULL,
	[briefing area (sq# m#)] [float] NULL,
	[warehouse area (sq# m)] [float] NULL,
	[briefing area for experts] [float] NULL,
	[number of participants in the team] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill_Block]    Script Date: 25.01.2023 11:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill_Block](
	[ID_Skill_Block] [float] NULL,
	[Title] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25.01.2023 11:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_Users] [float] NULL,
	[FIO] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[PIN] [float] NULL,
	[Date_Birth] [datetime] NULL,
	[Role_ID] [float] NULL,
	[Skill] [float] NULL,
	[Region] [float] NULL,
	[Places] [float] NULL,
	[Championship] [float] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Sessia1] SET  READ_WRITE 
GO
