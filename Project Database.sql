USE [master]
GO
/****** Object:  Database [ProgramInformation]    Script Date: 12/17/2015 11:42:46 PM ******/
CREATE DATABASE [ProgramInformation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProgramInformation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProgramInformation.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProgramInformation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProgramInformation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProgramInformation] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProgramInformation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProgramInformation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProgramInformation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProgramInformation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProgramInformation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProgramInformation] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProgramInformation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProgramInformation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProgramInformation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProgramInformation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProgramInformation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProgramInformation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProgramInformation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProgramInformation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProgramInformation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProgramInformation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProgramInformation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProgramInformation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProgramInformation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProgramInformation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProgramInformation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProgramInformation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProgramInformation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProgramInformation] SET RECOVERY FULL 
GO
ALTER DATABASE [ProgramInformation] SET  MULTI_USER 
GO
ALTER DATABASE [ProgramInformation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProgramInformation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProgramInformation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProgramInformation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProgramInformation] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProgramInformation]
GO
/****** Object:  Table [dbo].[ChairInfo]    Script Date: 12/17/2015 11:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChairInfo](
	[ChairID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentAbbrev] [varchar](50) NOT NULL,
	[ChairFirstName] [varchar](50) NOT NULL,
	[ChairLastName] [varchar](50) NOT NULL,
	[Acting] [bit] NOT NULL,
	[ChairStartDate] [date] NULL,
	[ChairEndDate] [date] NULL,
	[ChairDescription] [varchar](400) NULL,
 CONSTRAINT [PK_ChairInfo] PRIMARY KEY CLUSTERED 
(
	[ChairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CoordinatorInfo]    Script Date: 12/17/2015 11:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoordinatorInfo](
	[CoordinatorID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramCode] [varchar](50) NOT NULL,
	[CoordinatorFirstName] [varchar](50) NOT NULL,
	[CoordinatorLastName] [varchar](50) NOT NULL,
	[Acting] [bit] NOT NULL,
	[CoordinatorStartDate] [date] NULL,
	[CoordinatorEndDate] [date] NULL,
	[CoordinatorDescription] [varchar](400) NULL,
 CONSTRAINT [PK_CoordinatorInfo] PRIMARY KEY CLUSTERED 
(
	[CoordinatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CVSApproval]    Script Date: 12/17/2015 11:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CVSApproval](
	[CVSID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramAbbrev] [varchar](50) NOT NULL,
	[CVSApplication] [varchar](50) NOT NULL,
	[ModelRoute] [varchar](50) NOT NULL,
	[CVSValidation] [bit] NOT NULL,
	[ResponseDate] [date] NOT NULL,
	[ValidationLetter] [varchar](50) NULL,
 CONSTRAINT [PK_CVSApproval_1] PRIMARY KEY CLUSTERED 
(
	[CVSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeanInfo]    Script Date: 12/17/2015 11:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeanInfo](
	[DeanID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolAbbrev] [varchar](50) NOT NULL,
	[DeanFirstName] [varchar](50) NOT NULL,
	[DeanLastName] [varchar](50) NOT NULL,
	[DeanStartDate] [date] NULL,
	[DeanEndDate] [date] NOT NULL,
	[Acting] [bit] NULL,
	[DeanDescription] [varchar](400) NULL,
 CONSTRAINT [PK_AdminSchoolInfo] PRIMARY KEY CLUSTERED 
(
	[DeanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DepartmentInfo]    Script Date: 12/17/2015 11:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepartmentInfo](
	[DepartmentAbbrev] [varchar](50) NOT NULL,
	[SchoolAbbrev] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_DepartmentInfo_1] PRIMARY KEY CLUSTERED 
(
	[DepartmentAbbrev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MTCUApproval]    Script Date: 12/17/2015 11:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MTCUApproval](
	[MTCUID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramAbbrev] [varchar](50) NOT NULL,
	[MTCURequest] [varchar](50) NOT NULL,
	[MTCUDecision] [bit] NOT NULL,
	[ResponseDate] [date] NOT NULL,
	[ApprovalLetter] [varchar](50) NOT NULL,
	[FundingCode] [varchar](50) NOT NULL,
	[FundingName] [varchar](50) NOT NULL,
	[APSCode] [varchar](50) NOT NULL,
	[APSName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MTCUApproval] PRIMARY KEY CLUSTERED 
(
	[MTCUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PEQABReport]    Script Date: 12/17/2015 11:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PEQABReport](
	[PEQABID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramAbbrev] [varchar](50) NOT NULL,
	[PEQABApprovalReprot] [varchar](50) NOT NULL,
	[PEAQBDesicion] [varchar](50) NOT NULL,
	[ResponseDate] [date] NOT NULL,
 CONSTRAINT [PK_PEQABReport] PRIMARY KEY CLUSTERED 
(
	[PEQABID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProgramInfo]    Script Date: 12/17/2015 11:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProgramInfo](
	[ProgramCode] [varchar](50) NOT NULL,
	[DepartmentAbbrev] [varchar](50) NOT NULL,
	[ProgramName] [varchar](50) NOT NULL,
	[Credential] [varchar](50) NOT NULL,
	[ProgramDuration] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[ProgramStatus] [varchar](50) NOT NULL,
	[Reason] [varchar](500) NULL,
 CONSTRAINT [PK_ProgramInfo] PRIMARY KEY CLUSTERED 
(
	[ProgramCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolInfo]    Script Date: 12/17/2015 11:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchoolInfo](
	[SchoolAbbrev] [varchar](50) NOT NULL,
	[SchoolName] [varchar](50) NOT NULL,
	[SchoolDescription] [varchar](400) NULL,
 CONSTRAINT [PK_SchoolInfo] PRIMARY KEY CLUSTERED 
(
	[SchoolAbbrev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ChairInfo]  WITH CHECK ADD  CONSTRAINT [FK_ChairInfo_DepartmentInfo] FOREIGN KEY([DepartmentAbbrev])
REFERENCES [dbo].[DepartmentInfo] ([DepartmentAbbrev])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChairInfo] CHECK CONSTRAINT [FK_ChairInfo_DepartmentInfo]
GO
ALTER TABLE [dbo].[CoordinatorInfo]  WITH CHECK ADD  CONSTRAINT [FK_CoordinatorInfo_ProgramInfo] FOREIGN KEY([ProgramCode])
REFERENCES [dbo].[ProgramInfo] ([ProgramCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CoordinatorInfo] CHECK CONSTRAINT [FK_CoordinatorInfo_ProgramInfo]
GO
ALTER TABLE [dbo].[CVSApproval]  WITH CHECK ADD  CONSTRAINT [FK_CVSApproval_ProgramInfo] FOREIGN KEY([ProgramAbbrev])
REFERENCES [dbo].[ProgramInfo] ([ProgramCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CVSApproval] CHECK CONSTRAINT [FK_CVSApproval_ProgramInfo]
GO
ALTER TABLE [dbo].[DeanInfo]  WITH CHECK ADD  CONSTRAINT [FK_DeanInfo_SchoolInfo] FOREIGN KEY([SchoolAbbrev])
REFERENCES [dbo].[SchoolInfo] ([SchoolAbbrev])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DeanInfo] CHECK CONSTRAINT [FK_DeanInfo_SchoolInfo]
GO
ALTER TABLE [dbo].[DepartmentInfo]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentInfo_SchoolInfo] FOREIGN KEY([SchoolAbbrev])
REFERENCES [dbo].[SchoolInfo] ([SchoolAbbrev])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DepartmentInfo] CHECK CONSTRAINT [FK_DepartmentInfo_SchoolInfo]
GO
ALTER TABLE [dbo].[MTCUApproval]  WITH CHECK ADD  CONSTRAINT [FK_MTCUApproval_ProgramInfo] FOREIGN KEY([ProgramAbbrev])
REFERENCES [dbo].[ProgramInfo] ([ProgramCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MTCUApproval] CHECK CONSTRAINT [FK_MTCUApproval_ProgramInfo]
GO
ALTER TABLE [dbo].[PEQABReport]  WITH CHECK ADD  CONSTRAINT [FK_PEQABReport_ProgramInfo] FOREIGN KEY([ProgramAbbrev])
REFERENCES [dbo].[ProgramInfo] ([ProgramCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PEQABReport] CHECK CONSTRAINT [FK_PEQABReport_ProgramInfo]
GO
ALTER TABLE [dbo].[ProgramInfo]  WITH CHECK ADD  CONSTRAINT [FK_ProgramInfo_DepartmentInfo] FOREIGN KEY([DepartmentAbbrev])
REFERENCES [dbo].[DepartmentInfo] ([DepartmentAbbrev])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ProgramInfo] CHECK CONSTRAINT [FK_ProgramInfo_DepartmentInfo]
GO
USE [master]
GO
ALTER DATABASE [ProgramInformation] SET  READ_WRITE 
GO
