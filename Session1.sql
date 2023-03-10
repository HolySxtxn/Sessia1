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
/****** Object:  Database [Session1_02]    Script Date: 01.03.2023 11:26:59 ******/
CREATE DATABASE [Session1_02]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session1_02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Session1_02.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session1_02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Session1_02_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Session1_02] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session1_02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session1_02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session1_02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session1_02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session1_02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session1_02] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session1_02] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session1_02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session1_02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session1_02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session1_02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session1_02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session1_02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session1_02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session1_02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session1_02] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session1_02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session1_02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session1_02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session1_02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session1_02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session1_02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session1_02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session1_02] SET RECOVERY FULL 
GO
ALTER DATABASE [Session1_02] SET  MULTI_USER 
GO
ALTER DATABASE [Session1_02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session1_02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session1_02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session1_02] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session1_02] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Session1_02', N'ON'
GO
ALTER DATABASE [Session1_02] SET QUERY_STORE = OFF
GO
USE [Session1_02]
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
USE [Session1_02]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 01.03.2023 11:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info]    Script Date: 01.03.2023 11:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Input] [time](7) NOT NULL,
	[Logout] [time](7) NOT NULL,
	[Error] [varchar](100) NULL,
	[UsersID] [int] NOT NULL,
 CONSTRAINT [PK_Info] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 01.03.2023 11:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 01.03.2023 11:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01.03.2023 11:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[OfficeID] [int] NULL,
	[Birthdate] [date] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Info]  WITH CHECK ADD  CONSTRAINT [FK_Info_Info] FOREIGN KEY([UsersID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Info] CHECK CONSTRAINT [FK_Info_Info]
GO
ALTER TABLE [dbo].[Offices]  WITH CHECK ADD  CONSTRAINT [FK_Office_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[Offices] CHECK CONSTRAINT [FK_Office_Country]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Offices] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Offices] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Offices]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Session1_02] SET  READ_WRITE 
GO
