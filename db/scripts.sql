USE [master]
GO
/****** Object:  Database [dbFirstSession]    Script Date: 06.03.2024 11:03:49 ******/
CREATE DATABASE [dbFirstSession]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbFirstSession', FILENAME = N'D:\servermssqla\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbFirstSession.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbFirstSession_log', FILENAME = N'D:\servermssqla\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbFirstSession_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbFirstSession] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbFirstSession].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbFirstSession] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbFirstSession] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbFirstSession] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbFirstSession] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbFirstSession] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbFirstSession] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbFirstSession] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbFirstSession] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbFirstSession] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbFirstSession] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbFirstSession] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbFirstSession] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbFirstSession] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbFirstSession] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbFirstSession] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbFirstSession] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbFirstSession] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbFirstSession] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbFirstSession] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbFirstSession] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbFirstSession] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbFirstSession] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbFirstSession] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbFirstSession] SET  MULTI_USER 
GO
ALTER DATABASE [dbFirstSession] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbFirstSession] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbFirstSession] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbFirstSession] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbFirstSession] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbFirstSession] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbFirstSession] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbFirstSession] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbFirstSession]
GO
/****** Object:  Table [dbo].[CodeHospitalization]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeHospitalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[PurposeHospitalization] [nvarchar](50) NOT NULL,
	[DepartamentHospitalization] [nvarchar](50) NOT NULL,
	[IDTypeHospitalization] [int] NOT NULL,
	[TermHospitalization] [int] NOT NULL,
	[AdditionalInformation] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CodeHospitalization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiseaseHistory]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiseaseHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameDisease] [nvarchar](50) NOT NULL,
	[DateOfDisease] [date] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DiseaseHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitalization]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPatient] [int] NOT NULL,
	[IDCodeHospitalization] [int] NOT NULL,
	[DateOfHospitalization] [date] NOT NULL,
	[TimeOfHospitalization] [time](7) NOT NULL,
	[StatusHospitalization] [bit] NULL,
	[ReasonRejection] [nvarchar](50) NULL,
 CONSTRAINT [PK_Hospitalization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranseCompany]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranseCompany](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InsuranseCompany] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuransePolicy]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuransePolicy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[DateOfExpiration] [date] NOT NULL,
 CONSTRAINT [PK_InsuransePolicy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCard]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[DateOfIssue] [date] NULL,
	[DateOfLastApeal] [date] NULL,
	[DateOfNextApeal] [date] NULL,
	[IdentificationCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MedicalCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passport]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Series] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Passport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[IDPassport] [int] NOT NULL,
	[DateOfBirth] [date] NULL,
	[IDGender] [int] NULL,
	[Adress] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IDMedicalCard] [int] NOT NULL,
	[IDInsuransePolicy] [int] NOT NULL,
	[Diagnos] [nvarchar](50) NULL,
	[IDDiseaseHistory] [int] NULL,
	[IDInsuranseCompany] [int] NOT NULL,
	[WorkPlace] [nvarchar](50) NOT NULL,
	[PathContract] [nvarchar](max) NULL,
	[PathPersonalData] [nvarchar](max) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultMesuares]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultMesuares](
	[ID] [int] NOT NULL,
	[ValueAnalysis] [nvarchar](50) NOT NULL,
	[DescriptionChanged] [nvarchar](255) NOT NULL,
	[PrescribedMedications] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ResultMesuares] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityAccessLog]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityAccessLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PersonCode] [nvarchar](50) NOT NULL,
	[PersonRole] [nvarchar](50) NOT NULL,
	[LastSecurityPointNumber] [int] NOT NULL,
	[LastSecurityPointDirection] [nvarchar](10) NOT NULL,
	[LastSecurityPointTime] [datetime] NOT NULL,
 CONSTRAINT [PK_SecurityAccessLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TherapeuticDiagnosticMesuares]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TherapeuticDiagnosticMesuares](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPatient] [int] NULL,
	[DateOfMesuares] [date] NULL,
	[IDUser] [int] NULL,
	[IDTypeMesuares] [int] NULL,
	[NameMesuares] [nvarchar](50) NULL,
	[IDResultMesuares] [int] NULL,
	[Recomendation] [nvarchar](50) NULL,
 CONSTRAINT [PK_TherapeuticDiagnosticMesuares] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeHospitalization]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeHospitalization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeHospitalization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeMesuares]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMesuares](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeMesuares] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06.03.2024 11:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[IDGender] [int] NOT NULL,
	[IDSpeciality] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CodeHospitalization] ON 

INSERT [dbo].[CodeHospitalization] ([ID], [Code], [PurposeHospitalization], [DepartamentHospitalization], [IDTypeHospitalization], [TermHospitalization], [AdditionalInformation]) VALUES (4, N'422', N'dfsds', N'werwe', 1, 22, N'sdfsdfdsf')
INSERT [dbo].[CodeHospitalization] ([ID], [Code], [PurposeHospitalization], [DepartamentHospitalization], [IDTypeHospitalization], [TermHospitalization], [AdditionalInformation]) VALUES (5, N'fdgfd', N'gdfg', N'dfgd', 1, 25, N'fdfg')
INSERT [dbo].[CodeHospitalization] ([ID], [Code], [PurposeHospitalization], [DepartamentHospitalization], [IDTypeHospitalization], [TermHospitalization], [AdditionalInformation]) VALUES (6, N'422', N'dfsds', N'werwe', 1, 25, N'fsf')
INSERT [dbo].[CodeHospitalization] ([ID], [Code], [PurposeHospitalization], [DepartamentHospitalization], [IDTypeHospitalization], [TermHospitalization], [AdditionalInformation]) VALUES (7, N'f', N'sdfsdfs', N'sdf', 2, 211, N'sdfsd')
SET IDENTITY_INSERT [dbo].[CodeHospitalization] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([ID], [Title]) VALUES (1, N'Мужской')
INSERT [dbo].[Gender] ([ID], [Title]) VALUES (2, N'Мужской')
INSERT [dbo].[Gender] ([ID], [Title]) VALUES (3, N'Женский')
INSERT [dbo].[Gender] ([ID], [Title]) VALUES (4, N'Женский')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Hospitalization] ON 

INSERT [dbo].[Hospitalization] ([ID], [IDPatient], [IDCodeHospitalization], [DateOfHospitalization], [TimeOfHospitalization], [StatusHospitalization], [ReasonRejection]) VALUES (2, 9, 4, CAST(N'2024-03-15' AS Date), CAST(N'15:18:00' AS Time), NULL, NULL)
INSERT [dbo].[Hospitalization] ([ID], [IDPatient], [IDCodeHospitalization], [DateOfHospitalization], [TimeOfHospitalization], [StatusHospitalization], [ReasonRejection]) VALUES (3, 3, 5, CAST(N'2024-03-21' AS Date), CAST(N'13:17:00' AS Time), NULL, NULL)
INSERT [dbo].[Hospitalization] ([ID], [IDPatient], [IDCodeHospitalization], [DateOfHospitalization], [TimeOfHospitalization], [StatusHospitalization], [ReasonRejection]) VALUES (4, 1, 6, CAST(N'2024-03-14' AS Date), CAST(N'14:19:00' AS Time), NULL, NULL)
INSERT [dbo].[Hospitalization] ([ID], [IDPatient], [IDCodeHospitalization], [DateOfHospitalization], [TimeOfHospitalization], [StatusHospitalization], [ReasonRejection]) VALUES (5, 10, 7, CAST(N'2024-03-07' AS Date), CAST(N'15:18:00' AS Time), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Hospitalization] OFF
GO
SET IDENTITY_INSERT [dbo].[InsuranseCompany] ON 

INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (1, N'Дмитриев Снаб')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (2, N'Бирюкова Снаб')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (3, N'Орехов Снаб')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (4, N'Лукин - Громов')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (5, N'Кошелева - Казаков')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (6, N'Зуева Трейд')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (7, N'Кулаков Пром')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (8, N'Кудрявцева Торг')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (9, N'Носова, Колесникова and Бобылева')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (10, N'Овчинникова, Рожков and Тихонова')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (11, N'sdf')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (12, N'Козлова - Владимирова')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (13, N'Морозова, Павлов and Горшков')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (14, N'Юдин Трейд')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (15, N'Быкова - Фомичев')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (16, N'Лукина Сбыт')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (17, N'Денисов Трейд')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (18, N'Прохоров Пром')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (19, N'Гусева Пром')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (20, N'Григорьева, Нестерова and Веселова')
INSERT [dbo].[InsuranseCompany] ([ID], [Title]) VALUES (21, N'Лукина, Евдокимов and Ильин')
SET IDENTITY_INSERT [dbo].[InsuranseCompany] OFF
GO
SET IDENTITY_INSERT [dbo].[InsuransePolicy] ON 

INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (1, N'IP-0x5d811ff1', CAST(N'2025-01-10' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (2, N'IP-0x69c65fe0', CAST(N'2024-05-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (3, N'IP-0x42559d35', CAST(N'2024-08-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (4, N'IP-0x38f98b61', CAST(N'2024-06-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (5, N'IP-0x1dd381e3', CAST(N'2024-07-29' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (6, N'IP-0x8a55e434', CAST(N'2024-11-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (7, N'IP-0xbf4bdb8c', CAST(N'2024-10-10' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (8, N'IP-0xec0003ad', CAST(N'2024-05-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (9, N'IP-0x50a4756b', CAST(N'2024-11-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (10, N'IP-0x0e9a631b', CAST(N'2024-04-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (11, N'IP-0x05f2ab70', CAST(N'2024-08-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (12, N'IP-0x58a2a12d', CAST(N'2024-06-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (13, N'IP-0x078e4207', CAST(N'2025-01-19' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (14, N'IP-0xf36de51a', CAST(N'2024-09-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (15, N'IP-0x235ec6e1', CAST(N'2024-05-16' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (16, N'IP-0x0e3888f1', CAST(N'2024-06-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (17, N'IP-0x910d12d7', CAST(N'2024-12-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (18, N'IP-0x0795009f', CAST(N'2024-10-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (19, N'IP-0xe1a103e0', CAST(N'2024-09-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (20, N'IP-0xa7bded17', CAST(N'2024-09-17' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (21, N'IP-0x7423059e', CAST(N'2024-10-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (22, N'IP-0x9be2f9f1', CAST(N'2025-02-17' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (23, N'IP-0x981de093', CAST(N'2024-03-14' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (24, N'IP-0x129c3872', CAST(N'2024-10-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (25, N'IP-0x7a1581a5', CAST(N'2024-07-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (26, N'IP-0xa771ece7', CAST(N'2025-03-02' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (27, N'IP-0x79619d47', CAST(N'2024-11-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (28, N'IP-0xfd76ade7', CAST(N'2024-07-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (29, N'IP-0xd3ff39bf', CAST(N'2024-11-16' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (30, N'IP-0x8f4cec80', CAST(N'2024-09-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (31, N'IP-0x4514006a', CAST(N'2024-09-11' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (32, N'IP-0xe4da3660', CAST(N'2024-06-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (33, N'IP-0x076c691b', CAST(N'2024-09-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (34, N'IP-0x72ebd94a', CAST(N'2024-04-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (35, N'IP-0x492f981c', CAST(N'2024-11-14' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (36, N'IP-0xeecd6d88', CAST(N'2024-10-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (37, N'IP-0x27f7248e', CAST(N'2024-08-31' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (38, N'IP-0x93635842', CAST(N'2024-08-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (39, N'IP-0x10ddb9e3', CAST(N'2025-01-11' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (40, N'IP-0xbac12502', CAST(N'2024-05-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (41, N'IP-0x3c7d7b07', CAST(N'2024-10-11' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (42, N'IP-0x4a848476', CAST(N'2024-09-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (43, N'IP-0xc4c59e7d', CAST(N'2024-06-02' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (44, N'IP-0xb8013251', CAST(N'2024-07-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (45, N'IP-0xf391d3fa', CAST(N'2024-10-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (46, N'IP-0x47289bd3', CAST(N'2025-02-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (47, N'IP-0x6d386a75', CAST(N'2025-02-20' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (48, N'IP-0x9376e6e7', CAST(N'2024-05-31' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (49, N'IP-0xea785e52', CAST(N'2024-07-13' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (50, N'IP-0x12e44f4f', CAST(N'2024-06-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (51, N'IP-0x16cfa746', CAST(N'2024-08-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (52, N'IP-0x1e9b928e', CAST(N'2024-09-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (53, N'IP-0x7d843445', CAST(N'2024-05-11' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (54, N'IP-0x14e72e2c', CAST(N'2024-03-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (55, N'IP-0x7f0f4e73', CAST(N'2024-06-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (56, N'IP-0xc58cc56c', CAST(N'2024-04-21' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (57, N'IP-0xbc38a443', CAST(N'2024-04-18' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (58, N'IP-0x89ca9d10', CAST(N'2025-02-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (59, N'IP-0x8789d007', CAST(N'2024-03-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (60, N'IP-0xa48815c6', CAST(N'2024-03-09' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (61, N'IP-0xde4bb1cf', CAST(N'2024-10-11' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (62, N'IP-0x71cbab6d', CAST(N'2024-06-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (63, N'IP-0x92f3724a', CAST(N'2025-01-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (64, N'IP-0x9f86e2c3', CAST(N'2024-04-17' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (65, N'IP-0xadc7cd68', CAST(N'2024-07-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (66, N'IP-0x3eac2303', CAST(N'2024-06-13' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (67, N'IP-0x0a617133', CAST(N'2025-03-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (68, N'IP-0x0039e69c', CAST(N'2024-03-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (69, N'IP-0x8151cfc0', CAST(N'2024-11-21' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (70, N'IP-0x3cd56aec', CAST(N'2024-09-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (71, N'IP-0xa86b49d5', CAST(N'2024-09-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (72, N'IP-0x2af33627', CAST(N'2024-04-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (73, N'IP-0xeed7465f', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (74, N'IP-0x2ba8b2de', CAST(N'2024-05-23' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (75, N'IP-0xaddc376a', CAST(N'2024-08-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (76, N'IP-0xb0973e9f', CAST(N'2025-01-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (77, N'IP-0xb33f543a', CAST(N'2024-10-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (78, N'IP-0xd9ed5427', CAST(N'2024-10-30' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (79, N'IP-0x42b60afa', CAST(N'2025-02-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (80, N'IP-0xcb8cfb52', CAST(N'2024-11-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (81, N'IP-0xfa7888c9', CAST(N'2024-03-14' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (82, N'IP-0x7eb54b34', CAST(N'2024-12-21' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (83, N'IP-0x24290b66', CAST(N'2025-02-14' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (84, N'IP-0x21a38283', CAST(N'2024-12-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (85, N'IP-0x2ca297a7', CAST(N'2024-12-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (86, N'IP-0x367c8ae3', CAST(N'2025-01-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (87, N'IP-0x96ac229a', CAST(N'2024-08-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (88, N'IP-0x6458d1e1', CAST(N'2024-09-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (89, N'IP-0x2faaf8f2', CAST(N'2025-03-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (90, N'IP-0x759f454f', CAST(N'2024-12-23' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (91, N'IP-0x26988ff4', CAST(N'2024-05-20' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (92, N'IP-0x6b95e72c', CAST(N'2024-05-16' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (93, N'IP-0x3e62cf21', CAST(N'2024-06-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (94, N'IP-0xe6f04d4c', CAST(N'2024-11-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (95, N'IP-0xea7bab59', CAST(N'2024-08-18' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (96, N'IP-0x6272c810', CAST(N'2024-03-14' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (97, N'IP-0x509a56a1', CAST(N'2025-01-09' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (98, N'IP-0x356b12c4', CAST(N'2024-04-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (99, N'IP-0xb73bd38c', CAST(N'2025-02-25' AS Date))
GO
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (100, N'IP-0xdc97e3de', CAST(N'2024-12-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (101, N'sdfsdf', CAST(N'2024-03-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (102, N'IP-0x7df7a841', CAST(N'2024-06-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (103, N'IP-0x5438fb5d', CAST(N'2024-05-25' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (104, N'IP-0x0876e6e7', CAST(N'2024-12-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (105, N'IP-0x53b3d580', CAST(N'2024-10-02' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (106, N'IP-0x3c5b9b19', CAST(N'2024-12-21' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (107, N'IP-0x6429de17', CAST(N'2024-11-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (108, N'IP-0xd1e883be', CAST(N'2025-01-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (109, N'IP-0xa17d0f21', CAST(N'2024-03-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (110, N'IP-0xd5eb5598', CAST(N'2024-05-16' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (111, N'IP-0x9c6c25ab', CAST(N'2025-02-09' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (112, N'IP-0xab32fae7', CAST(N'2024-08-20' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (113, N'IP-0x59427ce3', CAST(N'2024-04-30' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (114, N'IP-0xc1b9f0f2', CAST(N'2024-04-29' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (115, N'IP-0x7df12507', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (116, N'IP-0xdb53ded3', CAST(N'2025-02-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (117, N'IP-0xe65aef3d', CAST(N'2024-10-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (118, N'IP-0x31b22c86', CAST(N'2024-10-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (119, N'IP-0x736f2f50', CAST(N'2024-08-31' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (120, N'IP-0xc84dbb11', CAST(N'2024-12-09' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (121, N'IP-0xddf0e5bd', CAST(N'2024-07-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (122, N'IP-0xaa88b646', CAST(N'2024-03-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (123, N'IP-0x8f454d76', CAST(N'2024-06-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (124, N'IP-0x5550110b', CAST(N'2024-10-09' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (125, N'IP-0x9751349b', CAST(N'2024-08-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (126, N'IP-0xf4dd85b8', CAST(N'2024-04-09' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (127, N'IP-0x77929806', CAST(N'2024-08-30' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (128, N'IP-0x098770db', CAST(N'2025-01-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (129, N'IP-0xa7cfc868', CAST(N'2024-04-14' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (130, N'IP-0x77d05808', CAST(N'2024-06-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (131, N'IP-0x07ed1cc8', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (132, N'IP-0xe8cc0d70', CAST(N'2024-04-07' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (133, N'IP-0x57a0c068', CAST(N'2025-02-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (134, N'IP-0xa0306ecc', CAST(N'2024-06-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (135, N'IP-0xfd6f3368', CAST(N'2025-03-02' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (136, N'IP-0x5b70956a', CAST(N'2024-03-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (137, N'IP-0x9fbd69d2', CAST(N'2024-09-18' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (138, N'IP-0xed1d0397', CAST(N'2024-05-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (139, N'IP-0xb5469311', CAST(N'2024-12-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (140, N'IP-0x7a6e9cd3', CAST(N'2024-12-19' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (141, N'IP-0x817d11b8', CAST(N'2024-10-31' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (142, N'IP-0xe7a3621b', CAST(N'2024-06-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (143, N'IP-0xc267c4c6', CAST(N'2024-08-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (144, N'IP-0x2f45fd70', CAST(N'2024-07-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (145, N'IP-0xce43b092', CAST(N'2024-10-23' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (146, N'IP-0x2434dd71', CAST(N'2024-03-21' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (147, N'IP-0x61521b99', CAST(N'2024-10-10' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (148, N'IP-0x697dc6c5', CAST(N'2025-01-11' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (149, N'IP-0x0965eaa9', CAST(N'2024-04-18' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (150, N'IP-0x4d26dec0', CAST(N'2025-02-13' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (151, N'IP-0x0ac99273', CAST(N'2024-09-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (152, N'IP-0x247d77f7', CAST(N'2024-09-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (153, N'IP-0x913b7795', CAST(N'2024-11-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (154, N'IP-0x7fb90b7c', CAST(N'2024-11-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (155, N'IP-0x07f4da18', CAST(N'2024-07-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (156, N'IP-0x966a6662', CAST(N'2025-02-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (157, N'IP-0xb425f36f', CAST(N'2024-06-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (158, N'IP-0xc93c6abf', CAST(N'2025-02-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (159, N'IP-0x8538af2f', CAST(N'2025-02-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (160, N'IP-0x5c852ebb', CAST(N'2024-09-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (161, N'IP-0x8b7bde64', CAST(N'2025-01-29' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (162, N'IP-0x1d0bf76e', CAST(N'2025-01-02' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (163, N'IP-0xc3a33051', CAST(N'2024-05-19' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (164, N'IP-0xb7750b22', CAST(N'2024-06-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (165, N'IP-0x8c851500', CAST(N'2024-04-17' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (166, N'IP-0xead0e40f', CAST(N'2024-09-04' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (167, N'IP-0xd5776bab', CAST(N'2024-12-22' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (168, N'IP-0x7bc58c3e', CAST(N'2024-04-23' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (169, N'IP-0x571432e6', CAST(N'2024-08-13' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (170, N'IP-0x5b824135', CAST(N'2025-01-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (171, N'IP-0xc05ca699', CAST(N'2024-06-30' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (172, N'IP-0x4920cf2b', CAST(N'2024-08-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (173, N'IP-0x68148044', CAST(N'2025-02-26' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (174, N'IP-0x346b22f7', CAST(N'2025-01-15' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (175, N'IP-0xc9dab9d9', CAST(N'2024-12-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (176, N'IP-0x45e8099c', CAST(N'2024-12-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (177, N'IP-0xb7747565', CAST(N'2024-06-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (178, N'IP-0xe97f1425', CAST(N'2024-04-27' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (179, N'IP-0xabc87f30', CAST(N'2025-02-21' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (180, N'IP-0x0a3d1553', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (181, N'IP-0x6728465f', CAST(N'2025-03-01' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (182, N'IP-0x553a6b6f', CAST(N'2024-03-30' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (183, N'IP-0x03f81756', CAST(N'2024-10-24' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (184, N'IP-0x1082ae4c', CAST(N'2025-01-02' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (185, N'IP-0x027538fe', CAST(N'2024-11-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (186, N'IP-0xb6476145', CAST(N'2025-03-03' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (187, N'IP-0x0d6b2dc3', CAST(N'2025-01-31' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (188, N'IP-0x73a55ae6', CAST(N'2025-01-12' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (189, N'IP-0x9a0783ba', CAST(N'2025-02-18' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (190, N'IP-0x69a6d5e4', CAST(N'2025-01-23' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (191, N'IP-0x65099f97', CAST(N'2024-11-08' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (192, N'IP-0x05199f3a', CAST(N'2024-11-05' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (193, N'IP-0xf853f7e6', CAST(N'2024-10-28' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (194, N'IP-0x415571c7', CAST(N'2024-04-10' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (195, N'IP-0xdf01e08b', CAST(N'2024-06-13' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (196, N'IP-0xecfa23ae', CAST(N'2024-11-20' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (197, N'IP-0x8368b345', CAST(N'2024-07-30' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (198, N'IP-0x5aefc1e6', CAST(N'2024-11-06' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (199, N'IP-0x9ea4b330', CAST(N'2024-10-05' AS Date))
GO
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (200, N'IP-0xaaf2b863', CAST(N'2024-06-16' AS Date))
INSERT [dbo].[InsuransePolicy] ([ID], [Number], [DateOfExpiration]) VALUES (201, N'IP-0xb54dc9a2', CAST(N'2024-04-06' AS Date))
SET IDENTITY_INSERT [dbo].[InsuransePolicy] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalCard] ON 

INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (1, N'MC-0x008a049b', CAST(N'2022-05-08' AS Date), CAST(N'2022-02-26' AS Date), CAST(N'2024-03-22' AS Date), N'389029')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (2, N'MC-0x496dcbef', CAST(N'2017-08-11' AS Date), CAST(N'2022-06-28' AS Date), CAST(N'2024-03-24' AS Date), N'678531')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (3, N'MC-0x22b76988', CAST(N'2021-07-18' AS Date), CAST(N'2021-07-07' AS Date), CAST(N'2024-03-11' AS Date), N'717825')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (4, N'MC-0xd9ddcfc1', CAST(N'2022-07-06' AS Date), CAST(N'2023-12-12' AS Date), CAST(N'2024-03-16' AS Date), N'377945')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (5, N'MC-0x52b6f8c7', CAST(N'2020-01-31' AS Date), CAST(N'2021-06-09' AS Date), CAST(N'2024-03-20' AS Date), N'932700')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (6, N'MC-0x91592006', CAST(N'2020-02-19' AS Date), CAST(N'2022-02-07' AS Date), CAST(N'2024-04-04' AS Date), N'307130')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (7, N'MC-0xe12ac871', CAST(N'2016-06-30' AS Date), CAST(N'2022-12-10' AS Date), CAST(N'2024-03-09' AS Date), N'306822')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (8, N'MC-0xd18b1b4f', CAST(N'2023-06-12' AS Date), CAST(N'2021-05-29' AS Date), CAST(N'2024-03-13' AS Date), N'735091')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (9, N'MC-0xa3f20fea', CAST(N'2022-07-30' AS Date), CAST(N'2022-09-19' AS Date), CAST(N'2024-03-20' AS Date), N'924745')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (10, N'MC-0x61be6622', CAST(N'2014-07-30' AS Date), CAST(N'2023-11-04' AS Date), CAST(N'2024-03-27' AS Date), N'145961')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (11, N'MC-0x754b602f', CAST(N'2016-01-05' AS Date), CAST(N'2022-10-19' AS Date), CAST(N'2024-03-06' AS Date), N'608615')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (12, N'MC-0x850c8715', CAST(N'2018-01-31' AS Date), CAST(N'2022-04-16' AS Date), CAST(N'2024-03-15' AS Date), N'129661')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (13, N'MC-0xf68ac1b8', CAST(N'2019-09-17' AS Date), CAST(N'2021-06-18' AS Date), CAST(N'2024-03-25' AS Date), N'709881')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (14, N'MC-0xb331581e', CAST(N'2023-09-06' AS Date), CAST(N'2023-09-02' AS Date), CAST(N'2024-03-15' AS Date), N'190660')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (15, N'MC-0x55a7067d', CAST(N'2024-02-14' AS Date), CAST(N'2023-06-12' AS Date), CAST(N'2024-03-27' AS Date), N'129228')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (16, N'MC-0x873bb81a', CAST(N'2017-06-08' AS Date), CAST(N'2023-01-08' AS Date), CAST(N'2024-03-08' AS Date), N'379163')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (17, N'MC-0x4f0086fc', CAST(N'2023-10-03' AS Date), CAST(N'2022-12-20' AS Date), CAST(N'2024-03-14' AS Date), N'466640')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (18, N'MC-0x64717ca7', CAST(N'2019-08-31' AS Date), CAST(N'2023-07-30' AS Date), CAST(N'2024-03-22' AS Date), N'847542')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (19, N'MC-0x56380a6f', CAST(N'2021-09-11' AS Date), CAST(N'2023-02-14' AS Date), CAST(N'2024-03-11' AS Date), N'174210')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (20, N'MC-0x56594ff2', CAST(N'2022-04-02' AS Date), CAST(N'2021-10-24' AS Date), CAST(N'2024-03-14' AS Date), N'492164')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (21, N'MC-0x003dbad0', CAST(N'2020-04-03' AS Date), CAST(N'2023-07-16' AS Date), CAST(N'2024-03-26' AS Date), N'235614')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (22, N'MC-0x37b5f521', CAST(N'2023-06-27' AS Date), CAST(N'2022-12-18' AS Date), CAST(N'2024-03-27' AS Date), N'172225')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (23, N'MC-0x712736a9', CAST(N'2023-04-25' AS Date), CAST(N'2021-11-09' AS Date), CAST(N'2024-03-20' AS Date), N'101769')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (24, N'MC-0x784972b1', CAST(N'2017-05-31' AS Date), CAST(N'2023-08-28' AS Date), CAST(N'2024-03-17' AS Date), N'833469')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (25, N'MC-0x3a2da359', CAST(N'2021-01-26' AS Date), CAST(N'2023-11-04' AS Date), CAST(N'2024-03-16' AS Date), N'669273')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (26, N'MC-0x75df9216', CAST(N'2014-11-10' AS Date), CAST(N'2021-12-13' AS Date), CAST(N'2024-03-31' AS Date), N'473107')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (27, N'MC-0x199eb964', CAST(N'2017-04-01' AS Date), CAST(N'2023-01-22' AS Date), CAST(N'2024-03-14' AS Date), N'618565')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (28, N'MC-0x4cfe6eb6', CAST(N'2022-05-17' AS Date), CAST(N'2022-04-23' AS Date), CAST(N'2024-03-08' AS Date), N'219261')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (29, N'MC-0x4b881fe7', CAST(N'2016-06-25' AS Date), CAST(N'2021-12-02' AS Date), CAST(N'2024-03-28' AS Date), N'148959')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (30, N'MC-0x97ebb1f1', CAST(N'2023-06-24' AS Date), CAST(N'2023-05-09' AS Date), CAST(N'2024-03-26' AS Date), N'811600')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (31, N'MC-0x33000737', CAST(N'2019-07-25' AS Date), CAST(N'2022-10-23' AS Date), CAST(N'2024-03-24' AS Date), N'992166')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (32, N'MC-0x1d3b7dc8', CAST(N'2024-01-16' AS Date), CAST(N'2021-07-08' AS Date), CAST(N'2024-03-13' AS Date), N'963567')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (33, N'MC-0xffa1a010', CAST(N'2024-01-23' AS Date), CAST(N'2021-11-29' AS Date), CAST(N'2024-03-15' AS Date), N'928073')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (34, N'MC-0xed648492', CAST(N'2015-12-05' AS Date), CAST(N'2021-06-05' AS Date), CAST(N'2024-03-24' AS Date), N'856741')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (35, N'MC-0xd39373c5', CAST(N'2014-10-24' AS Date), CAST(N'2023-12-24' AS Date), CAST(N'2024-03-07' AS Date), N'145256')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (36, N'MC-0xc1c769f5', CAST(N'2018-11-28' AS Date), CAST(N'2023-05-01' AS Date), CAST(N'2024-03-29' AS Date), N'680260')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (37, N'MC-0x68fb4121', CAST(N'2020-05-18' AS Date), CAST(N'2021-09-03' AS Date), CAST(N'2024-03-12' AS Date), N'531191')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (38, N'MC-0x6d8cf0fd', CAST(N'2016-04-06' AS Date), CAST(N'2023-01-27' AS Date), CAST(N'2024-03-19' AS Date), N'454035')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (39, N'MC-0x82c3e459', CAST(N'2020-03-13' AS Date), CAST(N'2021-04-09' AS Date), CAST(N'2024-03-30' AS Date), N'953464')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (40, N'MC-0x310defaf', CAST(N'2015-05-06' AS Date), CAST(N'2023-04-12' AS Date), CAST(N'2024-03-07' AS Date), N'619726')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (41, N'MC-0x02574fd0', CAST(N'2023-10-17' AS Date), CAST(N'2022-05-24' AS Date), CAST(N'2024-03-10' AS Date), N'235324')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (42, N'MC-0x4e218a16', CAST(N'2014-06-14' AS Date), CAST(N'2022-05-09' AS Date), CAST(N'2024-03-23' AS Date), N'913575')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (43, N'MC-0x02ecb883', CAST(N'2023-04-18' AS Date), CAST(N'2023-08-02' AS Date), CAST(N'2024-03-10' AS Date), N'786145')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (44, N'MC-0xfd471ce9', CAST(N'2015-03-03' AS Date), CAST(N'2021-07-26' AS Date), CAST(N'2024-03-21' AS Date), N'119768')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (45, N'MC-0xd9733996', CAST(N'2018-04-26' AS Date), CAST(N'2022-11-12' AS Date), CAST(N'2024-03-20' AS Date), N'248056')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (46, N'MC-0x00581f01', CAST(N'2016-12-02' AS Date), CAST(N'2023-01-23' AS Date), CAST(N'2024-03-08' AS Date), N'734688')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (47, N'MC-0x5952bf02', CAST(N'2018-03-28' AS Date), CAST(N'2021-06-09' AS Date), CAST(N'2024-04-03' AS Date), N'194193')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (48, N'MC-0x04079b28', CAST(N'2020-12-14' AS Date), CAST(N'2023-10-20' AS Date), CAST(N'2024-03-18' AS Date), N'161822')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (49, N'MC-0x768fc647', CAST(N'2019-06-04' AS Date), CAST(N'2021-12-07' AS Date), CAST(N'2024-03-31' AS Date), N'634816')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (50, N'MC-0x47b96591', CAST(N'2023-04-20' AS Date), CAST(N'2023-06-21' AS Date), CAST(N'2024-03-19' AS Date), N'821995')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (51, N'MC-0xe98f3963', CAST(N'2022-06-15' AS Date), CAST(N'2023-06-09' AS Date), CAST(N'2024-03-26' AS Date), N'386067')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (52, N'MC-0x605297a4', CAST(N'2019-12-31' AS Date), CAST(N'2022-12-01' AS Date), CAST(N'2024-03-10' AS Date), N'237530')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (53, N'MC-0x081f85f3', CAST(N'2015-02-12' AS Date), CAST(N'2021-12-17' AS Date), CAST(N'2024-03-06' AS Date), N'287767')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (54, N'MC-0xe54e5961', CAST(N'2016-10-11' AS Date), CAST(N'2022-12-01' AS Date), CAST(N'2024-03-11' AS Date), N'450552')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (55, N'MC-0x06799268', CAST(N'2019-09-20' AS Date), CAST(N'2023-01-25' AS Date), CAST(N'2024-04-03' AS Date), N'676084')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (56, N'MC-0x86ad476a', CAST(N'2024-01-22' AS Date), CAST(N'2023-10-24' AS Date), CAST(N'2024-03-13' AS Date), N'366924')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (57, N'MC-0x3bfcf169', CAST(N'2020-08-11' AS Date), CAST(N'2022-01-26' AS Date), CAST(N'2024-04-02' AS Date), N'236862')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (58, N'MC-0xe5ab58c8', CAST(N'2020-08-23' AS Date), CAST(N'2022-03-31' AS Date), CAST(N'2024-03-16' AS Date), N'953558')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (59, N'MC-0xe9c4086e', CAST(N'2022-10-25' AS Date), CAST(N'2023-08-20' AS Date), CAST(N'2024-03-17' AS Date), N'872308')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (60, N'MC-0x3985f54c', CAST(N'2019-06-06' AS Date), CAST(N'2022-07-29' AS Date), CAST(N'2024-04-02' AS Date), N'901943')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (61, N'MC-0xda575bf8', CAST(N'2020-07-01' AS Date), CAST(N'2021-03-10' AS Date), CAST(N'2024-03-31' AS Date), N'450554')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (62, N'MC-0x429d500b', CAST(N'2014-07-17' AS Date), CAST(N'2021-11-14' AS Date), CAST(N'2024-03-20' AS Date), N'787022')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (63, N'MC-0x069f5976', CAST(N'2017-06-05' AS Date), CAST(N'2021-06-14' AS Date), CAST(N'2024-03-18' AS Date), N'401761')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (64, N'MC-0x2e863d73', CAST(N'2016-11-02' AS Date), CAST(N'2023-10-24' AS Date), CAST(N'2024-03-07' AS Date), N'833868')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (65, N'MC-0xc77783e1', CAST(N'2022-08-22' AS Date), CAST(N'2022-06-21' AS Date), CAST(N'2024-03-19' AS Date), N'956436')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (66, N'MC-0x2f3c87b6', CAST(N'2017-01-27' AS Date), CAST(N'2023-06-06' AS Date), CAST(N'2024-03-25' AS Date), N'490436')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (67, N'MC-0x7971440e', CAST(N'2020-10-11' AS Date), CAST(N'2021-11-22' AS Date), CAST(N'2024-03-11' AS Date), N'927626')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (68, N'MC-0x10e7f529', CAST(N'2020-01-10' AS Date), CAST(N'2022-05-23' AS Date), CAST(N'2024-03-12' AS Date), N'345258')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (69, N'MC-0xabb46a18', CAST(N'2016-05-27' AS Date), CAST(N'2024-01-17' AS Date), CAST(N'2024-04-02' AS Date), N'914358')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (70, N'MC-0xcdcd8996', CAST(N'2016-05-27' AS Date), CAST(N'2023-05-09' AS Date), CAST(N'2024-03-26' AS Date), N'537631')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (71, N'MC-0x9465100e', CAST(N'2020-07-04' AS Date), CAST(N'2023-08-10' AS Date), CAST(N'2024-03-18' AS Date), N'618686')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (72, N'MC-0x9b7aaa20', CAST(N'2023-04-19' AS Date), CAST(N'2021-03-26' AS Date), CAST(N'2024-03-25' AS Date), N'243110')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (73, N'MC-0x951dfd76', CAST(N'2024-01-16' AS Date), CAST(N'2023-07-11' AS Date), CAST(N'2024-03-26' AS Date), N'219756')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (74, N'MC-0x4c7b0089', CAST(N'2020-05-25' AS Date), CAST(N'2023-07-09' AS Date), CAST(N'2024-03-13' AS Date), N'810233')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (75, N'MC-0x1fb22a69', CAST(N'2018-02-25' AS Date), CAST(N'2023-06-13' AS Date), CAST(N'2024-03-29' AS Date), N'771431')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (76, N'MC-0xf2e8b095', CAST(N'2023-10-21' AS Date), CAST(N'2023-02-12' AS Date), CAST(N'2024-03-16' AS Date), N'912256')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (77, N'MC-0x260071c5', CAST(N'2023-09-07' AS Date), CAST(N'2023-04-28' AS Date), CAST(N'2024-03-27' AS Date), N'123662')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (78, N'MC-0x1546d280', CAST(N'2014-07-13' AS Date), CAST(N'2021-12-27' AS Date), CAST(N'2024-03-27' AS Date), N'854825')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (79, N'MC-0x20e5aecb', CAST(N'2018-04-26' AS Date), CAST(N'2021-08-30' AS Date), CAST(N'2024-04-03' AS Date), N'744260')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (80, N'MC-0x952877bb', CAST(N'2019-09-01' AS Date), CAST(N'2021-07-08' AS Date), CAST(N'2024-03-17' AS Date), N'397500')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (81, N'MC-0xc28ed5f7', CAST(N'2017-07-03' AS Date), CAST(N'2023-08-06' AS Date), CAST(N'2024-04-01' AS Date), N'478123')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (82, N'MC-0x37b28f74', CAST(N'2020-02-19' AS Date), CAST(N'2022-07-22' AS Date), CAST(N'2024-03-28' AS Date), N'510361')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (83, N'MC-0xf0980064', CAST(N'2017-12-30' AS Date), CAST(N'2022-07-06' AS Date), CAST(N'2024-03-21' AS Date), N'528097')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (84, N'MC-0x5de4e806', CAST(N'2019-06-27' AS Date), CAST(N'2022-01-01' AS Date), CAST(N'2024-03-14' AS Date), N'102012')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (85, N'MC-0xc82772e4', CAST(N'2020-03-19' AS Date), CAST(N'2023-11-20' AS Date), CAST(N'2024-04-02' AS Date), N'822585')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (86, N'MC-0xb669caca', CAST(N'2014-10-27' AS Date), CAST(N'2023-07-16' AS Date), CAST(N'2024-03-29' AS Date), N'723139')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (87, N'MC-0x126e76f4', CAST(N'2017-01-19' AS Date), CAST(N'2022-06-10' AS Date), CAST(N'2024-03-28' AS Date), N'535492')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (88, N'MC-0xeec7a414', CAST(N'2015-02-02' AS Date), CAST(N'2023-10-26' AS Date), CAST(N'2024-03-20' AS Date), N'532108')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (89, N'MC-0x179dea18', CAST(N'2016-09-13' AS Date), CAST(N'2022-10-09' AS Date), CAST(N'2024-03-17' AS Date), N'334723')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (90, N'MC-0xc0c01a12', CAST(N'2017-08-13' AS Date), CAST(N'2021-05-25' AS Date), CAST(N'2024-03-26' AS Date), N'889934')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (91, N'MC-0xd50a28cf', CAST(N'2017-05-27' AS Date), CAST(N'2021-06-28' AS Date), CAST(N'2024-03-28' AS Date), N'148021')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (92, N'MC-0xc25083b6', CAST(N'2018-10-22' AS Date), CAST(N'2022-07-12' AS Date), CAST(N'2024-03-27' AS Date), N'629268')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (93, N'MC-0x712305d2', CAST(N'2016-12-10' AS Date), CAST(N'2022-01-04' AS Date), CAST(N'2024-03-05' AS Date), N'646769')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (94, N'MC-0xa663a79d', CAST(N'2021-07-21' AS Date), CAST(N'2022-01-13' AS Date), CAST(N'2024-03-12' AS Date), N'956384')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (95, N'MC-0x50a63454', CAST(N'2018-05-08' AS Date), CAST(N'2022-11-16' AS Date), CAST(N'2024-03-10' AS Date), N'163090')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (96, N'MC-0x68e51950', CAST(N'2022-08-08' AS Date), CAST(N'2021-12-30' AS Date), CAST(N'2024-03-18' AS Date), N'204062')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (97, N'MC-0xc8b1fd5c', CAST(N'2015-11-29' AS Date), CAST(N'2023-08-08' AS Date), CAST(N'2024-04-01' AS Date), N'993992')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (98, N'MC-0xa6f66b03', CAST(N'2021-12-14' AS Date), CAST(N'2023-02-26' AS Date), CAST(N'2024-03-29' AS Date), N'220115')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (99, N'MC-0x83ca62c9', CAST(N'2018-01-05' AS Date), CAST(N'2022-07-18' AS Date), CAST(N'2024-03-24' AS Date), N'686909')
GO
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (100, N'MC-0x835b1633', CAST(N'2017-07-30' AS Date), CAST(N'2021-05-24' AS Date), CAST(N'2024-03-25' AS Date), N'714841')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (101, N'sdf', NULL, NULL, NULL, N'sdf')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (102, N'MC-0xe2f20470', CAST(N'2018-06-30' AS Date), CAST(N'2022-02-01' AS Date), CAST(N'2024-03-10' AS Date), N'351819')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (103, N'MC-0xef9f0780', CAST(N'2015-10-09' AS Date), CAST(N'2021-10-25' AS Date), CAST(N'2024-03-13' AS Date), N'617605')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (104, N'MC-0x4c481a0b', CAST(N'2019-02-04' AS Date), CAST(N'2021-03-19' AS Date), CAST(N'2024-03-11' AS Date), N'547095')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (105, N'MC-0x8fcd1c58', CAST(N'2019-06-15' AS Date), CAST(N'2022-12-25' AS Date), CAST(N'2024-03-23' AS Date), N'422242')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (106, N'MC-0x6c791341', CAST(N'2014-11-30' AS Date), CAST(N'2022-12-16' AS Date), CAST(N'2024-04-01' AS Date), N'326898')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (107, N'MC-0x0effa6ce', CAST(N'2016-08-23' AS Date), CAST(N'2023-12-14' AS Date), CAST(N'2024-03-19' AS Date), N'184718')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (108, N'MC-0xbbf17b1d', CAST(N'2022-02-03' AS Date), CAST(N'2021-05-27' AS Date), CAST(N'2024-03-09' AS Date), N'350483')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (109, N'MC-0x2795b192', CAST(N'2023-06-09' AS Date), CAST(N'2022-08-20' AS Date), CAST(N'2024-03-30' AS Date), N'233378')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (110, N'MC-0xd6d0aa95', CAST(N'2020-11-23' AS Date), CAST(N'2022-12-28' AS Date), CAST(N'2024-03-31' AS Date), N'483953')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (111, N'MC-0x33a24001', CAST(N'2016-03-06' AS Date), CAST(N'2022-02-15' AS Date), CAST(N'2024-03-29' AS Date), N'309880')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (112, N'MC-0xd73a8503', CAST(N'2015-07-22' AS Date), CAST(N'2021-09-10' AS Date), CAST(N'2024-03-12' AS Date), N'164259')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (113, N'MC-0xe0385cfb', CAST(N'2018-03-31' AS Date), CAST(N'2023-08-20' AS Date), CAST(N'2024-03-08' AS Date), N'529353')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (114, N'MC-0x76d07b52', CAST(N'2018-04-30' AS Date), CAST(N'2022-05-29' AS Date), CAST(N'2024-03-12' AS Date), N'251451')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (115, N'MC-0x6fdf5a96', CAST(N'2014-06-11' AS Date), CAST(N'2022-06-26' AS Date), CAST(N'2024-03-13' AS Date), N'322016')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (116, N'MC-0xc7c0b0aa', CAST(N'2020-07-26' AS Date), CAST(N'2021-11-24' AS Date), CAST(N'2024-03-10' AS Date), N'200025')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (117, N'MC-0x8fb17175', CAST(N'2015-11-18' AS Date), CAST(N'2023-12-20' AS Date), CAST(N'2024-03-09' AS Date), N'414122')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (118, N'MC-0xff5e9b8e', CAST(N'2022-10-10' AS Date), CAST(N'2022-06-11' AS Date), CAST(N'2024-03-13' AS Date), N'974841')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (119, N'MC-0xf568f9ca', CAST(N'2015-12-29' AS Date), CAST(N'2021-12-23' AS Date), CAST(N'2024-03-20' AS Date), N'461297')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (120, N'MC-0xe7ed1e6b', CAST(N'2020-05-18' AS Date), CAST(N'2022-12-02' AS Date), CAST(N'2024-03-07' AS Date), N'803245')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (121, N'MC-0xbb0a43fe', CAST(N'2017-01-07' AS Date), CAST(N'2021-12-01' AS Date), CAST(N'2024-03-09' AS Date), N'232464')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (122, N'MC-0xbf634783', CAST(N'2019-07-31' AS Date), CAST(N'2021-04-10' AS Date), CAST(N'2024-04-04' AS Date), N'255732')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (123, N'MC-0xcad32898', CAST(N'2021-08-23' AS Date), CAST(N'2022-04-30' AS Date), CAST(N'2024-03-30' AS Date), N'316722')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (124, N'MC-0x9269c9a2', CAST(N'2021-03-20' AS Date), CAST(N'2021-11-18' AS Date), CAST(N'2024-03-09' AS Date), N'204409')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (125, N'MC-0x827eed5b', CAST(N'2017-01-24' AS Date), CAST(N'2021-08-19' AS Date), CAST(N'2024-03-31' AS Date), N'644050')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (126, N'MC-0x6bc229e1', CAST(N'2022-12-04' AS Date), CAST(N'2023-09-26' AS Date), CAST(N'2024-03-25' AS Date), N'197778')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (127, N'MC-0x0f7e4de0', CAST(N'2018-12-27' AS Date), CAST(N'2021-12-30' AS Date), CAST(N'2024-03-26' AS Date), N'984081')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (128, N'MC-0x1aa6418b', CAST(N'2021-03-29' AS Date), CAST(N'2021-10-01' AS Date), CAST(N'2024-03-11' AS Date), N'113581')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (129, N'MC-0xc80bd0f6', CAST(N'2019-02-09' AS Date), CAST(N'2023-02-16' AS Date), CAST(N'2024-04-01' AS Date), N'948239')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (130, N'MC-0x667efd1a', CAST(N'2023-09-05' AS Date), CAST(N'2021-10-25' AS Date), CAST(N'2024-03-08' AS Date), N'547860')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (131, N'MC-0xe8d09fd3', CAST(N'2016-09-06' AS Date), CAST(N'2022-11-21' AS Date), CAST(N'2024-03-08' AS Date), N'796958')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (132, N'MC-0xc227b57b', CAST(N'2016-06-19' AS Date), CAST(N'2022-01-01' AS Date), CAST(N'2024-04-03' AS Date), N'880765')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (133, N'MC-0xaab7b8f0', CAST(N'2020-02-05' AS Date), CAST(N'2022-08-09' AS Date), CAST(N'2024-03-28' AS Date), N'421410')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (134, N'MC-0x3fc88a3f', CAST(N'2020-12-01' AS Date), CAST(N'2022-03-06' AS Date), CAST(N'2024-03-08' AS Date), N'817650')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (135, N'MC-0xa9eb45b3', CAST(N'2018-07-28' AS Date), CAST(N'2021-05-04' AS Date), CAST(N'2024-03-15' AS Date), N'985411')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (136, N'MC-0x35837154', CAST(N'2020-03-21' AS Date), CAST(N'2021-10-07' AS Date), CAST(N'2024-03-13' AS Date), N'780961')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (137, N'MC-0x8e318f80', CAST(N'2018-11-16' AS Date), CAST(N'2021-04-26' AS Date), CAST(N'2024-03-29' AS Date), N'218388')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (138, N'MC-0x93b0c9c4', CAST(N'2017-10-11' AS Date), CAST(N'2021-11-02' AS Date), CAST(N'2024-03-16' AS Date), N'265748')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (139, N'MC-0x2f834d6d', CAST(N'2021-01-28' AS Date), CAST(N'2023-08-31' AS Date), CAST(N'2024-03-10' AS Date), N'452867')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (140, N'MC-0x29a96573', CAST(N'2018-08-17' AS Date), CAST(N'2023-01-21' AS Date), CAST(N'2024-03-23' AS Date), N'309616')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (141, N'MC-0x657d001c', CAST(N'2018-07-21' AS Date), CAST(N'2024-02-23' AS Date), CAST(N'2024-04-02' AS Date), N'599003')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (142, N'MC-0x64bb8ed6', CAST(N'2023-09-05' AS Date), CAST(N'2023-04-05' AS Date), CAST(N'2024-03-31' AS Date), N'259303')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (143, N'MC-0xe3d451ac', CAST(N'2020-07-06' AS Date), CAST(N'2023-04-09' AS Date), CAST(N'2024-03-30' AS Date), N'973232')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (144, N'MC-0x59d406d2', CAST(N'2017-06-13' AS Date), CAST(N'2023-10-31' AS Date), CAST(N'2024-03-11' AS Date), N'185873')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (145, N'MC-0xacb98221', CAST(N'2019-06-28' AS Date), CAST(N'2023-04-17' AS Date), CAST(N'2024-04-01' AS Date), N'834669')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (146, N'MC-0x2c776231', CAST(N'2019-06-28' AS Date), CAST(N'2021-12-19' AS Date), CAST(N'2024-03-15' AS Date), N'970729')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (147, N'MC-0x186a7b8c', CAST(N'2024-02-23' AS Date), CAST(N'2021-11-14' AS Date), CAST(N'2024-03-25' AS Date), N'610738')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (148, N'MC-0x60331c81', CAST(N'2017-06-13' AS Date), CAST(N'2024-01-18' AS Date), CAST(N'2024-03-09' AS Date), N'319559')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (149, N'MC-0xf6c8e1ae', CAST(N'2019-12-01' AS Date), CAST(N'2021-12-27' AS Date), CAST(N'2024-03-22' AS Date), N'122435')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (150, N'MC-0xc89cc1d6', CAST(N'2022-11-17' AS Date), CAST(N'2021-07-15' AS Date), CAST(N'2024-03-06' AS Date), N'438463')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (151, N'MC-0xeffb3440', CAST(N'2020-05-05' AS Date), CAST(N'2023-10-07' AS Date), CAST(N'2024-03-25' AS Date), N'189041')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (152, N'MC-0xefde2c2a', CAST(N'2019-09-01' AS Date), CAST(N'2023-07-20' AS Date), CAST(N'2024-03-17' AS Date), N'619829')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (153, N'MC-0x2b483c11', CAST(N'2020-10-25' AS Date), CAST(N'2022-12-12' AS Date), CAST(N'2024-03-22' AS Date), N'936165')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (154, N'MC-0x1ea268aa', CAST(N'2015-07-28' AS Date), CAST(N'2022-08-20' AS Date), CAST(N'2024-03-31' AS Date), N'816958')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (155, N'MC-0x4e35b5eb', CAST(N'2018-02-26' AS Date), CAST(N'2022-11-29' AS Date), CAST(N'2024-03-22' AS Date), N'556336')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (156, N'MC-0xfbc909c7', CAST(N'2020-01-25' AS Date), CAST(N'2021-05-13' AS Date), CAST(N'2024-03-31' AS Date), N'308942')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (157, N'MC-0x2f3e9bb9', CAST(N'2015-07-20' AS Date), CAST(N'2022-09-24' AS Date), CAST(N'2024-03-14' AS Date), N'414458')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (158, N'MC-0x8c5f7d5a', CAST(N'2020-11-19' AS Date), CAST(N'2023-09-24' AS Date), CAST(N'2024-03-10' AS Date), N'724585')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (159, N'MC-0xb0a4c565', CAST(N'2023-12-31' AS Date), CAST(N'2024-02-23' AS Date), CAST(N'2024-03-11' AS Date), N'782833')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (160, N'MC-0x102dbfa8', CAST(N'2019-10-19' AS Date), CAST(N'2022-10-30' AS Date), CAST(N'2024-03-08' AS Date), N'323593')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (161, N'MC-0x4c0893ef', CAST(N'2016-02-21' AS Date), CAST(N'2022-07-06' AS Date), CAST(N'2024-03-11' AS Date), N'594286')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (162, N'MC-0x17d71f58', CAST(N'2018-06-27' AS Date), CAST(N'2022-06-04' AS Date), CAST(N'2024-03-31' AS Date), N'535535')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (163, N'MC-0xb7f58a44', CAST(N'2015-01-18' AS Date), CAST(N'2023-01-06' AS Date), CAST(N'2024-03-05' AS Date), N'969063')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (164, N'MC-0x5dbc13f8', CAST(N'2016-02-23' AS Date), CAST(N'2022-05-15' AS Date), CAST(N'2024-03-28' AS Date), N'322110')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (165, N'MC-0x126719aa', CAST(N'2015-01-01' AS Date), CAST(N'2022-08-01' AS Date), CAST(N'2024-03-30' AS Date), N'232173')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (166, N'MC-0x48724eab', CAST(N'2019-08-21' AS Date), CAST(N'2021-06-15' AS Date), CAST(N'2024-03-09' AS Date), N'331625')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (167, N'MC-0x4865a5a1', CAST(N'2017-02-26' AS Date), CAST(N'2022-01-29' AS Date), CAST(N'2024-03-14' AS Date), N'421138')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (168, N'MC-0x4c25b50d', CAST(N'2024-02-22' AS Date), CAST(N'2022-07-02' AS Date), CAST(N'2024-03-21' AS Date), N'618890')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (169, N'MC-0xbd4ef0c2', CAST(N'2024-03-04' AS Date), CAST(N'2023-09-22' AS Date), CAST(N'2024-03-10' AS Date), N'632198')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (170, N'MC-0x3509db79', CAST(N'2021-10-06' AS Date), CAST(N'2023-10-21' AS Date), CAST(N'2024-03-31' AS Date), N'543124')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (171, N'MC-0xc501d54b', CAST(N'2014-04-20' AS Date), CAST(N'2021-09-14' AS Date), CAST(N'2024-03-23' AS Date), N'824197')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (172, N'MC-0x0c2ae151', CAST(N'2017-10-17' AS Date), CAST(N'2022-06-20' AS Date), CAST(N'2024-03-09' AS Date), N'438077')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (173, N'MC-0x47f41f59', CAST(N'2014-08-11' AS Date), CAST(N'2021-11-18' AS Date), CAST(N'2024-03-09' AS Date), N'679776')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (174, N'MC-0x0a5ae795', CAST(N'2016-12-17' AS Date), CAST(N'2023-06-16' AS Date), CAST(N'2024-03-21' AS Date), N'147614')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (175, N'MC-0x9ca2ccd3', CAST(N'2022-02-20' AS Date), CAST(N'2022-04-10' AS Date), CAST(N'2024-03-30' AS Date), N'473410')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (176, N'MC-0x5f907fd4', CAST(N'2017-06-16' AS Date), CAST(N'2022-09-04' AS Date), CAST(N'2024-03-24' AS Date), N'313769')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (177, N'MC-0xca33fba0', CAST(N'2015-03-23' AS Date), CAST(N'2021-06-06' AS Date), CAST(N'2024-03-26' AS Date), N'393232')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (178, N'MC-0x43d3ee76', CAST(N'2015-11-15' AS Date), CAST(N'2021-06-20' AS Date), CAST(N'2024-03-14' AS Date), N'928689')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (179, N'MC-0xd9eb6461', CAST(N'2022-07-11' AS Date), CAST(N'2022-11-27' AS Date), CAST(N'2024-03-15' AS Date), N'174990')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (180, N'MC-0x8a37fc87', CAST(N'2021-05-17' AS Date), CAST(N'2023-04-28' AS Date), CAST(N'2024-03-26' AS Date), N'353572')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (181, N'MC-0x2a6b036e', CAST(N'2020-06-12' AS Date), CAST(N'2023-04-17' AS Date), CAST(N'2024-03-16' AS Date), N'439547')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (182, N'MC-0xdeaa892e', CAST(N'2015-06-08' AS Date), CAST(N'2021-11-20' AS Date), CAST(N'2024-03-25' AS Date), N'325680')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (183, N'MC-0xbf606da8', CAST(N'2015-05-06' AS Date), CAST(N'2022-05-15' AS Date), CAST(N'2024-03-22' AS Date), N'770133')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (184, N'MC-0xea0f07b3', CAST(N'2021-03-13' AS Date), CAST(N'2021-08-21' AS Date), CAST(N'2024-03-23' AS Date), N'146583')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (185, N'MC-0x2eea1d66', CAST(N'2014-04-29' AS Date), CAST(N'2023-10-14' AS Date), CAST(N'2024-03-06' AS Date), N'169673')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (186, N'MC-0xc588ad74', CAST(N'2020-08-31' AS Date), CAST(N'2021-06-12' AS Date), CAST(N'2024-03-28' AS Date), N'898883')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (187, N'MC-0x93d606fd', CAST(N'2020-05-01' AS Date), CAST(N'2023-01-25' AS Date), CAST(N'2024-04-01' AS Date), N'551129')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (188, N'MC-0xff6133cb', CAST(N'2017-11-29' AS Date), CAST(N'2021-05-04' AS Date), CAST(N'2024-03-09' AS Date), N'681166')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (189, N'MC-0xe39755b3', CAST(N'2022-12-21' AS Date), CAST(N'2024-02-09' AS Date), CAST(N'2024-03-07' AS Date), N'916175')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (190, N'MC-0xff5922b6', CAST(N'2019-06-14' AS Date), CAST(N'2024-02-25' AS Date), CAST(N'2024-03-21' AS Date), N'711676')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (191, N'MC-0x6612204a', CAST(N'2023-06-06' AS Date), CAST(N'2023-07-02' AS Date), CAST(N'2024-03-20' AS Date), N'863398')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (192, N'MC-0xd780aa6e', CAST(N'2015-03-07' AS Date), CAST(N'2022-08-17' AS Date), CAST(N'2024-03-09' AS Date), N'298632')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (193, N'MC-0xd3974b2e', CAST(N'2017-08-16' AS Date), CAST(N'2021-06-11' AS Date), CAST(N'2024-03-08' AS Date), N'930009')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (194, N'MC-0x4811c6db', CAST(N'2019-06-20' AS Date), CAST(N'2022-09-20' AS Date), CAST(N'2024-03-27' AS Date), N'737056')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (195, N'MC-0xaacca9cd', CAST(N'2021-01-22' AS Date), CAST(N'2021-08-23' AS Date), CAST(N'2024-03-14' AS Date), N'961107')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (196, N'MC-0x7c65093e', CAST(N'2020-05-30' AS Date), CAST(N'2022-05-23' AS Date), CAST(N'2024-03-28' AS Date), N'214465')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (197, N'MC-0x9427a6b5', CAST(N'2019-08-22' AS Date), CAST(N'2021-08-04' AS Date), CAST(N'2024-03-30' AS Date), N'645371')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (198, N'MC-0xf5402396', CAST(N'2021-10-11' AS Date), CAST(N'2023-10-22' AS Date), CAST(N'2024-03-25' AS Date), N'977622')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (199, N'MC-0x07ae4d50', CAST(N'2015-06-10' AS Date), CAST(N'2022-04-08' AS Date), CAST(N'2024-03-11' AS Date), N'417350')
GO
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (200, N'MC-0x743e1e89', CAST(N'2014-09-19' AS Date), CAST(N'2021-10-24' AS Date), CAST(N'2024-03-17' AS Date), N'714861')
INSERT [dbo].[MedicalCard] ([ID], [Number], [DateOfIssue], [DateOfLastApeal], [DateOfNextApeal], [IdentificationCode]) VALUES (201, N'MC-0x42c2f5e7', CAST(N'2018-01-11' AS Date), CAST(N'2023-08-02' AS Date), CAST(N'2024-03-18' AS Date), N'294344')
SET IDENTITY_INSERT [dbo].[MedicalCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Passport] ON 

INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (1, N'4501', N'349263')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (2, N'4501', N'972583')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (3, N'4605', N'163430')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (4, N'4506', N'831306')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (5, N'4501', N'852143')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (6, N'4601', N'644612')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (7, N'4605', N'851294')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (8, N'4605', N'354265')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (9, N'4605', N'952589')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (10, N'4601', N'406286')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (11, N'4501', N'137224')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (12, N'4506', N'814933')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (13, N'4501', N'397924')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (14, N'4506', N'995027')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (15, N'4601', N'351430')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (16, N'4506', N'233838')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (17, N'4506', N'445460')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (18, N'4501', N'218099')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (19, N'4506', N'635533')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (20, N'4506', N'443161')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (21, N'4605', N'581548')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (22, N'4501', N'123223')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (23, N'4506', N'766971')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (24, N'4605', N'775778')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (25, N'4601', N'985770')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (26, N'4605', N'765426')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (27, N'4501', N'826022')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (28, N'4605', N'287683')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (29, N'4506', N'413305')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (30, N'4601', N'999390')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (31, N'4605', N'667768')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (32, N'4601', N'789233')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (33, N'4605', N'742157')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (34, N'4601', N'200253')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (35, N'4601', N'409534')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (36, N'4506', N'778362')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (37, N'4501', N'491795')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (38, N'4501', N'658038')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (39, N'4601', N'645682')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (40, N'4501', N'463143')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (41, N'4601', N'935176')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (42, N'4501', N'899092')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (43, N'4601', N'791425')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (44, N'4501', N'852653')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (45, N'4501', N'818227')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (46, N'4605', N'412243')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (47, N'4601', N'732861')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (48, N'4601', N'725908')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (49, N'4506', N'361650')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (50, N'4506', N'107975')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (51, N'4601', N'386238')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (52, N'4601', N'641071')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (53, N'4605', N'597656')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (54, N'4605', N'621386')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (55, N'4601', N'693237')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (56, N'4501', N'134673')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (57, N'4605', N'479324')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (58, N'4501', N'517299')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (59, N'4506', N'147350')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (60, N'4601', N'603865')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (61, N'4506', N'213283')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (62, N'4501', N'127155')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (63, N'4601', N'316472')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (64, N'4601', N'587475')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (65, N'4605', N'386701')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (66, N'4501', N'724690')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (67, N'4601', N'156825')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (68, N'4506', N'625194')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (69, N'4501', N'503350')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (70, N'4605', N'477755')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (71, N'4605', N'599269')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (72, N'4501', N'500946')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (73, N'4506', N'503069')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (74, N'4501', N'413740')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (75, N'4506', N'573386')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (76, N'4501', N'587754')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (77, N'4605', N'224067')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (78, N'4605', N'687751')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (79, N'4605', N'903239')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (80, N'4506', N'240580')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (81, N'4506', N'957613')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (82, N'4501', N'526710')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (83, N'4506', N'576652')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (84, N'4501', N'291679')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (85, N'4601', N'562763')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (86, N'4605', N'219996')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (87, N'4506', N'436066')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (88, N'4605', N'122232')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (89, N'4501', N'605122')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (90, N'4605', N'468722')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (91, N'4501', N'671555')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (92, N'4601', N'927722')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (93, N'4501', N'535178')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (94, N'4501', N'793682')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (95, N'4506', N'974358')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (96, N'4605', N'201542')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (97, N'4506', N'401458')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (98, N'4601', N'388723')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (99, N'4605', N'612530')
GO
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (100, N'4601', N'140233')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (101, N'fsdfsdf', N'sdfs')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (102, N'4601', N'950445')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (103, N'4605', N'476963')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (104, N'4605', N'498671')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (105, N'4506', N'299565')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (106, N'4501', N'163009')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (107, N'4605', N'117937')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (108, N'4605', N'153371')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (109, N'4605', N'271741')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (110, N'4501', N'478730')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (111, N'4501', N'239310')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (112, N'4605', N'490531')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (113, N'4601', N'304776')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (114, N'4601', N'938293')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (115, N'4501', N'310950')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (116, N'4506', N'162307')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (117, N'4506', N'518301')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (118, N'4501', N'189792')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (119, N'4506', N'486395')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (120, N'4501', N'163137')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (121, N'4605', N'815523')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (122, N'4506', N'584195')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (123, N'4506', N'589052')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (124, N'4506', N'555181')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (125, N'4605', N'286583')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (126, N'4605', N'260077')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (127, N'4605', N'481118')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (128, N'4506', N'594961')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (129, N'4501', N'509131')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (130, N'4501', N'132380')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (131, N'4506', N'493387')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (132, N'4605', N'556237')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (133, N'4506', N'939148')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (134, N'4605', N'834308')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (135, N'4601', N'351829')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (136, N'4605', N'130799')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (137, N'4501', N'225194')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (138, N'4501', N'498175')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (139, N'4506', N'857887')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (140, N'4601', N'299686')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (141, N'4506', N'449169')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (142, N'4506', N'895542')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (143, N'4601', N'548704')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (144, N'4601', N'254360')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (145, N'4601', N'711684')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (146, N'4601', N'204527')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (147, N'4501', N'171553')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (148, N'4506', N'890697')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (149, N'4605', N'101984')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (150, N'4601', N'644067')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (151, N'4501', N'870355')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (152, N'4506', N'210395')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (153, N'4506', N'344987')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (154, N'4501', N'202604')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (155, N'4605', N'319344')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (156, N'4601', N'356831')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (157, N'4506', N'962021')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (158, N'4605', N'223443')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (159, N'4601', N'521003')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (160, N'4506', N'142078')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (161, N'4501', N'373170')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (162, N'4501', N'199607')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (163, N'4605', N'435184')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (164, N'4601', N'996253')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (165, N'4506', N'303947')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (166, N'4601', N'679104')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (167, N'4601', N'363247')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (168, N'4501', N'729757')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (169, N'4506', N'465674')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (170, N'4501', N'690175')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (171, N'4605', N'731904')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (172, N'4601', N'581437')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (173, N'4601', N'718242')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (174, N'4506', N'362666')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (175, N'4506', N'467079')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (176, N'4601', N'977974')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (177, N'4605', N'951333')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (178, N'4605', N'788351')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (179, N'4601', N'644282')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (180, N'4601', N'411686')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (181, N'4605', N'196016')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (182, N'4506', N'182525')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (183, N'4501', N'334769')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (184, N'4605', N'338568')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (185, N'4601', N'802509')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (186, N'4605', N'551644')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (187, N'4605', N'930898')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (188, N'4506', N'472735')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (189, N'4605', N'552089')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (190, N'4605', N'658512')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (191, N'4601', N'543444')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (192, N'4605', N'267591')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (193, N'4605', N'121223')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (194, N'4501', N'913140')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (195, N'4601', N'449813')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (196, N'4601', N'160997')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (197, N'4506', N'836984')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (198, N'4501', N'360418')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (199, N'4501', N'785362')
GO
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (200, N'4605', N'563041')
INSERT [dbo].[Passport] ([ID], [Series], [Number]) VALUES (201, N'4605', N'364144')
SET IDENTITY_INSERT [dbo].[Passport] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (1, N'https://loremflickr.com/320/240?lock=423463053', N'Екатерина', N'Соболева', N'Иванович', 1, CAST(N'1946-07-19' AS Date), 2, N'Труда ул., 363, Краснодар, Ботсвана', N'(938)143-08-05', N'Klavdiya.Pavlov@mail.ru', 1, 1, N'Ангина', NULL, 4, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (2, N'https://loremflickr.com/320/240?lock=1246232751', N'Людмила', N'Костина', N'Степанович', 2, CAST(N'1958-07-23' AS Date), 1, N'пр. Партизанская, 205, Тольятти, Боливия', N'(931)191-96-91', N'Yurii_Loginov@yandex.ru', 2, 2, N'Бронхит', NULL, 5, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (3, N'https://loremflickr.com/320/240?lock=169328230', N'Алла', N'Соловьев', N'Степанович', 3, CAST(N'1967-03-01' AS Date), 1, N'пр. Колхозная, 777, Барнаул, Панама', N'(904)705-03-80', N'Makar.Sobolev4@yandex.ru', 3, 3, N'Рак', NULL, 10, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (4, N'https://loremflickr.com/320/240?lock=620039679', N'Раиса', N'Уварова', N'Дмитриевич', 4, CAST(N'1993-05-14' AS Date), 2, N'ул. Березовая, 090, Сочи, Тунис', N'(948)188-39-37', N'Semyon6@yahoo.com', 4, 4, N'ОРВИ', NULL, 2, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (5, N'https://loremflickr.com/320/240?lock=1224471179', N'Семён', N'Лапина', N'Степанович', 5, CAST(N'1972-01-13' AS Date), 1, N'ул. Шевченко, 936, Магнитогорск, Малави', N'(934)901-71-89', N'Regina_Lavrentev@hotmail.com', 5, 5, N'ОРВИ', NULL, 3, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (6, N'https://loremflickr.com/320/240?lock=1189110765', N'Василиса', N'Самсонов', N'Дмитриевич', 6, CAST(N'1931-09-27' AS Date), 1, N'пл. Московская, 743, Тюмень, Филиппины', N'(905)182-50-47', N'Natalya_Faeeva@mail.ru', 6, 6, N'Ангина', NULL, 7, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (7, N'https://loremflickr.com/320/240?lock=1531616087', N'Лука', N'Медведева', N'Александрович', 7, CAST(N'1999-06-04' AS Date), 2, N'площадь Степная, 036, Сочи, Иран', N'(921)132-08-38', N'Valentin4@gmail.com', 7, 7, N'ОРВИ', NULL, 5, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (8, N'https://loremflickr.com/320/240?lock=2135226720', N'Таисия', N'Селезнев', N'Дмитриевич', 8, CAST(N'2001-02-14' AS Date), 1, N'площадь Шевченко, 173, Тольятти, Венесуэла', N'(972)534-96-93', N'Fyodor_Sergeev19@ya.ru', 8, 8, N'Рак', NULL, 3, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (9, N'https://loremflickr.com/320/240?lock=799359453', N'Василий', N'Бобылев', N'Иванович', 9, CAST(N'1950-10-08' AS Date), 2, N'Цветочная ул., 095, Оренбург, Коморские Острова', N'(977)085-22-11', N'Antonida.Panova@yandex.ru', 9, 9, N'ОРВИ', NULL, 2, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (10, N'https://loremflickr.com/320/240?lock=1648113488', N'Геннадий', N'Исаков', N'Степанович', 10, CAST(N'1957-04-17' AS Date), 2, N'Октябрьская пр., 514, Тула, Панама', N'(935)916-37-78', N'Igor55@mail.ru', 10, 10, N'ОРВИ', NULL, 7, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (11, N'https://loremflickr.com/320/240?lock=637334999', N'Илья', N'Моисеева', N'Степанович', 11, CAST(N'1987-05-31' AS Date), 1, N'Красноармейская проспект, 212, Тольятти, Бахрейн', N'(917)205-02-45', N'Margarita.Kiselev34@yahoo.com', 11, 11, N'ОРВИ', NULL, 6, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (12, N'https://loremflickr.com/320/240?lock=1583411771', N'Алина', N'Степанов', N'Степанович', 12, CAST(N'1978-06-02' AS Date), 2, N'пл. Пушкина, 725, Хабаровск, Албания', N'(969)070-24-08', N'Aleksei_Kabanov@gmail.com', 12, 12, N'Рак', NULL, 10, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (13, N'https://loremflickr.com/320/240?lock=478578840', N'Валентин', N'Павлова', N'Александрович', 13, CAST(N'1942-06-09' AS Date), 2, N'Подгорная ул., 816, Казань, Фиджи', N'(984)709-06-06', N'Lyubov_Samoilova@gmail.com', 13, 13, N'ОРВИ', NULL, 9, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (14, N'https://loremflickr.com/320/240?lock=674763050', N'Антон', N'Силина', N'Степанович', 14, CAST(N'1967-04-25' AS Date), 2, N'Заречная ул., 776, Липецк, Антарктика (не признана)', N'(991)178-35-46', N'Artyom.Stepanov@yahoo.com', 14, 14, N'Рак', NULL, 7, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (15, N'https://loremflickr.com/320/240?lock=212255062', N'Александра', N'Носкова', N'Александрович', 15, CAST(N'1954-02-07' AS Date), 2, N'Южная пл., 319, Белгород, Польша', N'(948)229-55-13', N'Nina.Kolesnikova@hotmail.com', 15, 15, N'ОРВИ', NULL, 1, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (16, N'https://loremflickr.com/320/240?lock=672303263', N'Юлия', N'Лазарев', N'Степанович', 16, CAST(N'1975-08-22' AS Date), 1, N'улица Солнечная, 375, Томск, Ботсвана', N'(902)084-18-08', N'Nikolai.Yakushev@hotmail.com', 16, 16, N'Рак', NULL, 3, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (17, N'https://loremflickr.com/320/240?lock=1966737767', N'Любовь', N'Воронова', N'Александрович', 17, CAST(N'1952-08-24' AS Date), 2, N'проспект Садовая, 346, Оренбург, Афганистан', N'(975)504-91-75', N'Svetlana35@ya.ru', 17, 17, N'ОРВИ', NULL, 4, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (18, N'https://loremflickr.com/320/240?lock=1958908174', N'Людмила', N'Терентьева', N'Дмитриевич', 18, CAST(N'1994-01-17' AS Date), 1, N'пр. Шоссейная, 023, Нижний Новгород, Мадагаскар', N'(921)545-24-01', N'Kseniya_Savina@ya.ru', 18, 18, N'Бронхит', NULL, 9, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (19, N'https://loremflickr.com/320/240?lock=1691034275', N'Антонида', N'Борисов', N'Иванович', 19, CAST(N'2000-02-12' AS Date), 2, N'Заречная проспект, 514, Омск, Малайзия', N'(940)229-82-66', N'Gennadii.Romanova@mail.ru', 19, 19, N'Ангина', NULL, 4, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (20, N'https://loremflickr.com/320/240?lock=2095069600', N'Егор', N'Макарова', N'Александрович', 20, CAST(N'1984-11-13' AS Date), 1, N'Первомайская улица, 156, Красноярск, Замбия', N'(984)457-53-99', N'Natalya_Pestov@yandex.ru', 20, 20, N'Рак', NULL, 8, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (21, N'https://loremflickr.com/320/240?lock=1350395693', N'Нина', N'Куликов', N'Александрович', 21, CAST(N'2002-12-31' AS Date), 1, N'пл. Зеленая, 156, Сочи, Малайзия', N'(903)083-97-67', N'Evgenii_Tretyakova@hotmail.com', 21, 21, N'Бронхит', NULL, 7, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (22, N'https://loremflickr.com/320/240?lock=775375949', N'Лука', N'Калашникова', N'Степанович', 22, CAST(N'1930-08-22' AS Date), 2, N'Почтовая улица, 205, Липецк, Гватемала', N'(943)594-40-66', N'Viktoriya87@hotmail.com', 22, 22, N'Бронхит', NULL, 4, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (23, N'https://loremflickr.com/320/240?lock=1967813813', N'Варвара', N'Журавлева', N'Иванович', 23, CAST(N'1971-09-28' AS Date), 2, N'Фрунзе проспект, 859, Ульяновск, Гамбия', N'(923)201-10-01', N'Aleksei_Nesterov22@ya.ru', 23, 23, N'Ангина', NULL, 1, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (24, N'https://loremflickr.com/320/240?lock=1279558563', N'Альберт', N'Боброва', N'Дмитриевич', 24, CAST(N'1929-01-18' AS Date), 2, N'пр. Кооперативная, 332, Самара, Эквадор', N'(921)753-10-86', N'Mikhail97@gmail.com', 24, 24, N'Рак', NULL, 10, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (25, N'https://loremflickr.com/320/240?lock=1650207750', N'Кира', N'Агафонова', N'Иванович', 25, CAST(N'1970-02-11' AS Date), 1, N'ул. Чкалова, 904, Рязань, Бельгия', N'(972)927-45-23', N'Vasilisa62@ya.ru', 25, 25, N'Бронхит', NULL, 2, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (26, N'https://loremflickr.com/320/240?lock=1723112242', N'Вера', N'Федотов', N'Александрович', 26, CAST(N'2004-09-13' AS Date), 1, N'Строительная площадь, 895, Липецк, Гвинея', N'(910)667-79-94', N'Anatolii_Ponomarev@ya.ru', 26, 26, N'Ангина', NULL, 7, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (27, N'https://loremflickr.com/320/240?lock=640315502', N'Нина', N'Ермаков', N'Степанович', 27, CAST(N'1997-10-12' AS Date), 1, N'Железнодорожная проспект, 420, Тольятти, Мозамбик', N'(925)113-71-43', N'Viktor.Sergeev87@hotmail.com', 27, 27, N'Ангина', NULL, 6, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (28, N'https://loremflickr.com/320/240?lock=214178981', N'Анатолий', N'Горшкова', N'Александрович', 28, CAST(N'1967-08-28' AS Date), 2, N'Энергетиков площадь, 676, Магнитогорск, Венесуэла', N'(970)502-36-01', N'Valentin68@yandex.ru', 28, 28, N'ОРВИ', NULL, 1, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (29, N'https://loremflickr.com/320/240?lock=1485232491', N'Любовь', N'Суханов', N'Александрович', 29, CAST(N'1964-10-17' AS Date), 2, N'Восточная ул., 029, Ижевск, Вануату', N'(902)847-57-40', N'Luka.Pestova87@gmail.com', 29, 29, N'Ангина', NULL, 7, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (30, N'https://loremflickr.com/320/240?lock=1645161695', N'Станислав', N'Котов', N'Степанович', 30, CAST(N'1947-07-27' AS Date), 1, N'ул. Строителей, 602, Киров, Гайана', N'(946)764-82-10', N'Nikolai53@mail.ru', 30, 30, N'ОРВИ', NULL, 6, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (31, N'https://loremflickr.com/320/240?lock=1694157774', N'Нина', N'Коновалова', N'Александрович', 31, CAST(N'1999-08-27' AS Date), 2, N'ул. Полевая, 026, Оренбург, Оман', N'(976)672-68-25', N'Luka10@yahoo.com', 31, 31, N'ОРВИ', NULL, 10, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (32, N'https://loremflickr.com/320/240?lock=2145221724', N'Вячеслав', N'Ефремов', N'Иванович', 32, CAST(N'2003-01-31' AS Date), 2, N'ул. Парковая, 869, Тольятти, Сальвадор', N'(995)904-36-81', N'Dmitrii.Andreev29@yahoo.com', 32, 32, N'Бронхит', NULL, 5, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (33, N'https://loremflickr.com/320/240?lock=815226681', N'Юрий', N'Кудряшов', N'Дмитриевич', 33, CAST(N'1991-01-01' AS Date), 1, N'Красноармейская проспект, 543, Уфа, Кабо-Верде', N'(982)950-21-46', N'Yuliya_Shubin4@gmail.com', 33, 33, N'Ангина', NULL, 3, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (34, N'https://loremflickr.com/320/240?lock=2141584655', N'Алла', N'Виноградов', N'Дмитриевич', 34, CAST(N'1929-12-22' AS Date), 1, N'проспект Матросова, 344, Уфа, Габон', N'(953)740-35-92', N'Albert.Dyachkov@gmail.com', 34, 34, N'ОРВИ', NULL, 5, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (35, N'https://loremflickr.com/320/240?lock=1784379742', N'Екатерина', N'Калашникова', N'Дмитриевич', 35, CAST(N'1997-12-05' AS Date), 1, N'площадь Зеленая, 438, Санкт-Петербург, Сент-Винсент и Гренадины', N'(986)903-35-81', N'Anton.Gorshkov35@hotmail.com', 35, 35, N'ОРВИ', NULL, 8, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (36, N'https://loremflickr.com/320/240?lock=171929337', N'Ксения', N'Антонова', N'Александрович', 36, CAST(N'1971-03-23' AS Date), 1, N'Кооперативная улица, 093, Красноярск, Сьерра-Леоне', N'(996)858-55-95', N'Mariya.Fokina45@hotmail.com', 36, 36, N'ОРВИ', NULL, 4, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (37, N'https://loremflickr.com/320/240?lock=1796641155', N'Макар', N'Калашникова', N'Иванович', 37, CAST(N'1929-08-10' AS Date), 2, N'улица Пролетарская, 060, Пенза, Филиппины', N'(998)166-80-59', N'Makar_Nikiforov@hotmail.com', 37, 37, N'Рак', NULL, 9, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (38, N'https://loremflickr.com/320/240?lock=529689383', N'Любовь', N'Тихонова', N'Степанович', 38, CAST(N'1937-07-15' AS Date), 1, N'улица Кирова, 731, Воронеж, Сирия', N'(990)475-15-50', N'Nikolai32@yandex.ru', 38, 38, N'ОРВИ', NULL, 6, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (39, N'https://loremflickr.com/320/240?lock=1163232637', N'Леонид', N'Овчинникова', N'Дмитриевич', 39, CAST(N'1999-05-11' AS Date), 2, N'Партизанская улица, 650, Москва, Замбия', N'(937)305-96-40', N'Alla52@gmail.com', 39, 39, N'Рак', NULL, 8, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (40, N'https://loremflickr.com/320/240?lock=2121103167', N'Валерия', N'Горбачева', N'Александрович', 40, CAST(N'1944-04-26' AS Date), 1, N'Первомайская пл., 781, Барнаул, Монголия', N'(910)894-10-30', N'Alyona.Moiseeva3@ya.ru', 40, 40, N'Ангина', NULL, 5, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (41, N'https://loremflickr.com/320/240?lock=361273842', N'Надежда', N'Устинов', N'Иванович', 41, CAST(N'1978-05-03' AS Date), 1, N'проспект Парковая, 473, Барнаул, Конго', N'(970)711-58-61', N'Alina99@yandex.ru', 41, 41, N'Ангина', NULL, 3, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (42, N'https://loremflickr.com/320/240?lock=32991843', N'Игорь', N'Миронова', N'Иванович', 42, CAST(N'1972-03-16' AS Date), 2, N'проспект Ленина, 971, Санкт-Петербург, Германия', N'(972)083-04-17', N'Aleksandra98@yandex.ru', 42, 42, N'Рак', NULL, 2, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (43, N'https://loremflickr.com/320/240?lock=656480706', N'Ярослав', N'Туров', N'Дмитриевич', 43, CAST(N'1962-12-16' AS Date), 2, N'Пролетарская ул., 249, Волгоград, Иордания', N'(926)513-69-87', N'Vasilii_Zykov@yandex.ru', 43, 43, N'Ангина', NULL, 1, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (44, N'https://loremflickr.com/320/240?lock=2022388756', N'Кира', N'Лихачева', N'Дмитриевич', 44, CAST(N'1960-07-10' AS Date), 2, N'улица Строительная, 158, Тула, Исландия', N'(967)749-79-87', N'Fyodor_Saveleva1@hotmail.com', 44, 44, N'ОРВИ', NULL, 5, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (45, N'https://loremflickr.com/320/240?lock=744390837', N'Регина', N'Блохина', N'Степанович', 45, CAST(N'1933-08-25' AS Date), 2, N'Советская пр., 810, Ростов-на-Дону, Сенегал', N'(981)235-94-88', N'Vladimir9@mail.ru', 45, 45, N'Бронхит', NULL, 7, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (46, N'https://loremflickr.com/320/240?lock=40828652', N'Анжелика', N'Александрова', N'Степанович', 46, CAST(N'1955-08-13' AS Date), 1, N'Пролетарская улица, 454, Красноярск, Эритрея', N'(900)856-28-70', N'Elizaveta58@mail.ru', 46, 46, N'ОРВИ', NULL, 2, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (47, N'https://loremflickr.com/320/240?lock=443489150', N'Наталья', N'Волков', N'Степанович', 47, CAST(N'1966-07-28' AS Date), 2, N'пл. Сосновая, 976, Уфа, Армения', N'(906)497-79-39', N'Arsenii.Kryukov13@ya.ru', 47, 47, N'Бронхит', NULL, 5, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (48, N'https://loremflickr.com/320/240?lock=763427468', N'Олег', N'Кабанова', N'Иванович', 48, CAST(N'1934-01-02' AS Date), 2, N'ул. Школьный, 548, Красноярск, Сент-Винсент и Гренадины', N'(953)965-11-65', N'Ekaterina3@ya.ru', 48, 48, N'ОРВИ', NULL, 2, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (49, N'https://loremflickr.com/320/240?lock=1132582186', N'Тамара', N'Дементьев', N'Александрович', 49, CAST(N'1956-07-12' AS Date), 1, N'проспект Ломоносова, 794, Самара, Литва', N'(963)256-07-34', N'Vadim_Rybakova@gmail.com', 49, 49, N'Рак', NULL, 1, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (50, N'https://loremflickr.com/320/240?lock=2007800727', N'Арсений', N'Назаров', N'Александрович', 50, CAST(N'1982-07-10' AS Date), 2, N'пл. Западная, 375, Ижевск, Перу', N'(991)671-20-34', N'Vyacheslav.Shukina16@mail.ru', 50, 50, N'ОРВИ', NULL, 4, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (51, N'https://loremflickr.com/320/240?lock=1038634641', N'Елизавета', N'Боброва', N'Дмитриевич', 51, CAST(N'2004-06-06' AS Date), 1, N'ул. Вокзальная, 854, Пермь, Туркменистан', N'(982)550-56-53', N'Grigorii2@yandex.ru', 51, 51, N'Рак', NULL, 3, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (52, N'https://loremflickr.com/320/240?lock=1673305048', N'Варвара', N'Блохин', N'Степанович', 52, CAST(N'1959-11-11' AS Date), 2, N'площадь Береговая, 161, Владивосток, Соломоновы Острова', N'(916)686-80-55', N'Vera_Kudryavceva@ya.ru', 52, 52, N'ОРВИ', NULL, 3, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (53, N'https://loremflickr.com/320/240?lock=1968779013', N'Оксана', N'Виноградов', N'Дмитриевич', 53, CAST(N'1949-04-08' AS Date), 2, N'ул. Луговая, 379, Владивосток, Барбадос', N'(930)564-39-60', N'Evgeniya1@hotmail.com', 53, 53, N'Бронхит', NULL, 9, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (54, N'https://loremflickr.com/320/240?lock=676705926', N'Светлана', N'Степанова', N'Дмитриевич', 54, CAST(N'1947-04-29' AS Date), 2, N'Березовая ул., 591, Москва, Республика Конго', N'(906)065-08-27', N'Stanislav.Rodionova@yandex.ru', 54, 54, N'Ангина', NULL, 7, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (55, N'https://loremflickr.com/320/240?lock=1255944321', N'Александр', N'Щербакова', N'Александрович', 55, CAST(N'1988-10-11' AS Date), 1, N'Победы пл., 315, Сочи, Буркина-Фасо', N'(950)489-23-04', N'Makar19@mail.ru', 55, 55, N'ОРВИ', NULL, 1, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (56, N'https://loremflickr.com/320/240?lock=1912688405', N'Вероника', N'Сысоева', N'Александрович', 56, CAST(N'1978-12-21' AS Date), 1, N'ул. Луговая, 690, Магнитогорск, Восточный Тимор', N'(907)466-10-29', N'Nikita.Krasilnikov@mail.ru', 56, 56, N'Рак', NULL, 2, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (57, N'https://loremflickr.com/320/240?lock=775612425', N'Алёна', N'Панфилов', N'Степанович', 57, CAST(N'1993-03-18' AS Date), 2, N'Советская ул., 723, Ставрополь, Судан', N'(983)412-63-17', N'Sofiya.Larionov@hotmail.com', 57, 57, N'ОРВИ', NULL, 5, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (58, N'https://loremflickr.com/320/240?lock=857918666', N'Зоя', N'Гришин', N'Александрович', 58, CAST(N'1987-12-15' AS Date), 2, N'улица Кирова, 430, Пенза, Того', N'(974)390-89-30', N'Nikita_Kolobov97@hotmail.com', 58, 58, N'Рак', NULL, 9, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (59, N'https://loremflickr.com/320/240?lock=2053235120', N'Лаврентий', N'Давыдова', N'Александрович', 59, CAST(N'1995-06-17' AS Date), 1, N'Заводская улица, 645, Тверь, Суринам', N'(918)359-86-70', N'Fyodor_Lavrentev@yandex.ru', 59, 59, N'Ангина', NULL, 4, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (60, N'https://loremflickr.com/320/240?lock=716253773', N'Вадим', N'Беспалов', N'Александрович', 60, CAST(N'1994-02-18' AS Date), 1, N'Маяковского ул., 701, Пенза, Македония', N'(930)463-36-15', N'Zhanna40@ya.ru', 60, 60, N'ОРВИ', NULL, 2, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (61, N'https://loremflickr.com/320/240?lock=1597949737', N'Елена', N'Корнилова', N'Александрович', 61, CAST(N'1965-08-25' AS Date), 2, N'пр. Энергетиков, 990, Санкт-Петербург, Мьянма', N'(905)281-00-66', N'Lavrentii.Stepanov96@hotmail.com', 61, 61, N'Бронхит', NULL, 1, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (62, N'https://loremflickr.com/320/240?lock=430047488', N'Анжела', N'Лыткина', N'Иванович', 62, CAST(N'1977-03-05' AS Date), 1, N'пр. Лермонтова, 936, Киров, Монако', N'(987)107-92-40', N'Semyon.Kotov64@mail.ru', 62, 62, N'Бронхит', NULL, 6, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (63, N'https://loremflickr.com/320/240?lock=1359087889', N'Арсений', N'Пахомова', N'Александрович', 63, CAST(N'1981-06-23' AS Date), 2, N'Гагарина улица, 081, Новосибирск, Гватемала', N'(921)563-02-00', N'Yuliya.Moiseev@hotmail.com', 63, 63, N'ОРВИ', NULL, 9, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (64, N'https://loremflickr.com/320/240?lock=1467118358', N'Мария', N'Лыткина', N'Дмитриевич', 64, CAST(N'1971-03-08' AS Date), 2, N'Механизаторов проспект, 925, Уфа, Румыния', N'(903)501-11-58', N'Rimma.Kotova@ya.ru', 64, 64, N'Ангина', NULL, 8, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (65, N'https://loremflickr.com/320/240?lock=495290578', N'Анфиса', N'Горбачева', N'Дмитриевич', 65, CAST(N'1989-10-09' AS Date), 1, N'пл. Дружбы, 343, Ярославль, Токелау (не признана)', N'(916)210-51-40', N'Svetlana_Turov@yahoo.com', 65, 65, N'Бронхит', NULL, 4, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (66, N'https://loremflickr.com/320/240?lock=562572390', N'Степан', N'Коновалова', N'Александрович', 66, CAST(N'2001-11-22' AS Date), 2, N'проспект Дружбы, 402, Астрахань, Армения', N'(911)670-18-96', N'Aleksandr.Gusev30@yandex.ru', 66, 66, N'Бронхит', NULL, 6, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (67, N'https://loremflickr.com/320/240?lock=634727718', N'Анжелика', N'Ларионов', N'Иванович', 67, CAST(N'1963-12-02' AS Date), 2, N'Строительная улица, 261, Ростов-на-Дону, Американское Самоа (не признана)', N'(938)533-56-79', N'Evgeniya98@mail.ru', 67, 67, N'Ангина', NULL, 7, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (68, N'https://loremflickr.com/320/240?lock=1630361377', N'Ульяна', N'Князева', N'Дмитриевич', 68, CAST(N'1957-08-05' AS Date), 2, N'пр. Фрунзе, 031, Москва, Ботсвана', N'(965)850-95-26', N'Oksana11@mail.ru', 68, 68, N'Ангина', NULL, 7, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (69, N'https://loremflickr.com/320/240?lock=1254047107', N'Дарья', N'Устинов', N'Дмитриевич', 69, CAST(N'1954-06-05' AS Date), 2, N'Чехова улица, 858, Иркутск, Эквадор', N'(939)727-81-72', N'Kira_Kryukov@mail.ru', 69, 69, N'ОРВИ', NULL, 5, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (70, N'https://loremflickr.com/320/240?lock=215498887', N'Лидия', N'Трофимов', N'Степанович', 70, CAST(N'1950-12-07' AS Date), 1, N'проспект Мичурина, 810, Тула, Франция', N'(994)391-96-27', N'Vasilii.Voronova7@mail.ru', 70, 70, N'Бронхит', NULL, 2, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (71, N'https://loremflickr.com/320/240?lock=1143631878', N'Игнатий', N'Сысоев', N'Иванович', 71, CAST(N'1948-01-04' AS Date), 2, N'улица Садовая, 147, Махачкала, Никарагуа', N'(998)709-91-09', N'Vera.Likhacheva@hotmail.com', 71, 71, N'Рак', NULL, 4, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (72, N'https://loremflickr.com/320/240?lock=85040141', N'Антон', N'Горшкова', N'Дмитриевич', 72, CAST(N'1950-09-15' AS Date), 2, N'пр. Лесной, 115, Самара, Швеция', N'(927)379-08-73', N'Larisa_Moiseeva65@mail.ru', 72, 72, N'Ангина', NULL, 2, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (73, N'https://loremflickr.com/320/240?lock=1484737234', N'Тамара', N'Куликов', N'Иванович', 73, CAST(N'1968-10-08' AS Date), 2, N'Центральная ул., 373, Ижевск, Судан', N'(930)301-22-49', N'Lyubov55@mail.ru', 73, 73, N'Рак', NULL, 9, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (74, N'https://loremflickr.com/320/240?lock=1585131110', N'Степан', N'Терентьева', N'Дмитриевич', 74, CAST(N'1930-09-20' AS Date), 2, N'пл. Почтовая, 064, Омск, Черногория', N'(985)523-77-12', N'Dmitrii_Sherbakova@gmail.com', 74, 74, N'Ангина', NULL, 5, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (75, N'https://loremflickr.com/320/240?lock=269499478', N'Ангелина', N'Ильина', N'Степанович', 75, CAST(N'1965-03-22' AS Date), 2, N'Строительная пл., 639, Ростов-на-Дону, Черногория', N'(937)795-82-60', N'Maksim90@yandex.ru', 75, 75, N'ОРВИ', NULL, 4, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (76, N'https://loremflickr.com/320/240?lock=2044558754', N'Лука', N'Трофимова', N'Дмитриевич', 76, CAST(N'2004-06-01' AS Date), 1, N'Юбилейная пр., 379, Челябинск, Доминика', N'(914)137-29-34', N'Yurii_Mironova1@gmail.com', 76, 76, N'Рак', NULL, 1, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (77, N'https://loremflickr.com/320/240?lock=1781719876', N'Виталий', N'Филатов', N'Дмитриевич', 77, CAST(N'1928-12-28' AS Date), 1, N'пл. Крупской, 292, Челябинск, Боливия', N'(959)627-67-19', N'Daniil_Arkhipova9@yandex.ru', 77, 77, N'Бронхит', NULL, 6, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (78, N'https://loremflickr.com/320/240?lock=1613533281', N'Юлия', N'Дроздова', N'Дмитриевич', 78, CAST(N'1948-10-02' AS Date), 1, N'Шоссейная ул., 550, Новосибирск, Нигерия', N'(900)159-23-02', N'Irina_Vasileva@gmail.com', 78, 78, N'ОРВИ', NULL, 3, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (79, N'https://loremflickr.com/320/240?lock=1596956405', N'Вячеслав', N'Молчанова', N'Иванович', 79, CAST(N'1980-01-12' AS Date), 1, N'проспект Лесной, 435, Владимир, Ирак', N'(955)411-40-06', N'Alyona_Samsonov80@yahoo.com', 79, 79, N'Рак', NULL, 8, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (80, N'https://loremflickr.com/320/240?lock=1874282558', N'Ангелина', N'Николаева', N'Александрович', 80, CAST(N'1982-12-08' AS Date), 2, N'Комарова улица, 671, Уфа, Исландия', N'(962)346-46-47', N'Ekaterina_Zykova@yahoo.com', 80, 80, N'ОРВИ', NULL, 1, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (81, N'https://loremflickr.com/320/240?lock=125625779', N'Эдуард', N'Меркушев', N'Александрович', 81, CAST(N'1992-06-14' AS Date), 1, N'пл. Лермонтова, 191, Магнитогорск, Сьерра-Леоне', N'(965)093-40-38', N'Yaroslav15@yandex.ru', 81, 81, N'Бронхит', NULL, 5, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (82, N'https://loremflickr.com/320/240?lock=572906746', N'Илья', N'Гордеева', N'Дмитриевич', 82, CAST(N'1975-07-04' AS Date), 2, N'площадь Спортивная, 180, Белгород, Монголия', N'(973)519-65-87', N'Vadim.Chernov@yahoo.com', 82, 82, N'Ангина', NULL, 5, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (83, N'https://loremflickr.com/320/240?lock=1419537819', N'Макар', N'Лукин', N'Александрович', 83, CAST(N'1976-12-24' AS Date), 1, N'улица Зеленая, 696, Иваново, Габон', N'(985)994-09-85', N'Irina.Orekhov84@gmail.com', 83, 83, N'Ангина', NULL, 8, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (84, N'https://loremflickr.com/320/240?lock=1589826052', N'Валерий', N'Князев', N'Иванович', 84, CAST(N'1946-09-01' AS Date), 2, N'улица Лесная, 317, Ульяновск, Корея (Северная)', N'(985)469-88-77', N'Stanislav_Maslova72@yahoo.com', 84, 84, N'ОРВИ', NULL, 5, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (85, N'https://loremflickr.com/320/240?lock=1924047408', N'Василиса', N'Медведев', N'Александрович', 85, CAST(N'1997-11-05' AS Date), 1, N'Трактовая ул., 195, Владимир, Австралия', N'(992)631-04-50', N'Viktor_Petrova36@mail.ru', 85, 85, N'Ангина', NULL, 10, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (86, N'https://loremflickr.com/320/240?lock=361905123', N'Анна', N'Кононова', N'Дмитриевич', 86, CAST(N'1993-02-08' AS Date), 2, N'ул. Комарова, 409, Челябинск, Экваториальная Гвинея', N'(905)752-62-21', N'Ilya.Timofeev@yandex.ru', 86, 86, N'Ангина', NULL, 4, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (87, N'https://loremflickr.com/320/240?lock=2099745156', N'Антон', N'Сорокин', N'Иванович', 87, CAST(N'1958-09-29' AS Date), 1, N'проспект Речная, 528, Махачкала, Бурунди', N'(939)175-75-99', N'Tamara45@gmail.com', 87, 87, N'ОРВИ', NULL, 7, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (88, N'https://loremflickr.com/320/240?lock=1992956802', N'Ангелина', N'Борисова', N'Дмитриевич', 88, CAST(N'1984-07-13' AS Date), 2, N'Труда ул., 589, Новокузнецк, Косово', N'(946)735-16-37', N'Zoya.Kirillova5@ya.ru', 88, 88, N'Рак', NULL, 9, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (89, N'https://loremflickr.com/320/240?lock=356319991', N'София', N'Иванова', N'Иванович', 89, CAST(N'1962-05-06' AS Date), 2, N'Московская площадь, 907, Москва, Бельгия', N'(951)913-68-78', N'Dmitrii3@gmail.com', 89, 89, N'ОРВИ', NULL, 5, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (90, N'https://loremflickr.com/320/240?lock=4297239', N'Анжела', N'Михайлова', N'Степанович', 90, CAST(N'1994-08-11' AS Date), 1, N'улица Больничная, 147, Тюмень, Камерун', N'(966)751-75-80', N'Regina18@ya.ru', 90, 90, N'Ангина', NULL, 8, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (91, N'https://loremflickr.com/320/240?lock=1158504193', N'Антонида', N'Кабанова', N'Дмитриевич', 91, CAST(N'1950-10-28' AS Date), 2, N'Пионерская площадь, 352, Пенза, Канада', N'(981)054-49-82', N'Valentin16@hotmail.com', 91, 91, N'Ангина', NULL, 6, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (92, N'https://loremflickr.com/320/240?lock=149914530', N'Елена', N'Павлова', N'Александрович', 92, CAST(N'1944-05-08' AS Date), 2, N'пр. Ломоносова, 144, Иркутск, Восточный Тимор', N'(974)239-85-23', N'Valerii.Odincov61@yahoo.com', 92, 92, N'Бронхит', NULL, 10, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (93, N'https://loremflickr.com/320/240?lock=968894243', N'Регина', N'Антонов', N'Дмитриевич', 93, CAST(N'1950-06-13' AS Date), 2, N'улица Почтовая, 740, Уфа, Бразилия', N'(942)036-84-08', N'Grigorii42@gmail.com', 93, 93, N'Бронхит', NULL, 6, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (94, N'https://loremflickr.com/320/240?lock=441274275', N'Анна', N'Игнатова', N'Александрович', 94, CAST(N'1933-10-13' AS Date), 2, N'улица Западная, 697, Кемерово, Мавритания', N'(968)298-83-50', N'Maksim_Grigorev6@gmail.com', 94, 94, N'ОРВИ', NULL, 4, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (95, N'https://loremflickr.com/320/240?lock=944872116', N'Станислав', N'Михеева', N'Александрович', 95, CAST(N'1952-05-02' AS Date), 1, N'Советская проспект, 840, Брянск, Кот-д''Ивуар', N'(980)342-99-46', N'Zinaida_Kopylova@yandex.ru', 95, 95, N'Ангина', NULL, 1, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (96, N'https://loremflickr.com/320/240?lock=1478164777', N'Алина', N'Соловьева', N'Степанович', 96, CAST(N'2001-01-03' AS Date), 1, N'ул. Свободы, 220, Новокузнецк, Мьянма', N'(979)824-34-25', N'Ivan.Fedorov@hotmail.com', 96, 96, N'ОРВИ', NULL, 3, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (97, N'https://loremflickr.com/320/240?lock=2125848617', N'Раиса', N'Сысоева', N'Иванович', 97, CAST(N'1986-02-05' AS Date), 2, N'Совхозная площадь, 646, Ростов-на-Дону, Парагвай', N'(965)135-48-88', N'Elena32@yahoo.com', 97, 97, N'Бронхит', NULL, 1, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (98, N'https://loremflickr.com/320/240?lock=902023979', N'Валерия', N'Брагина', N'Иванович', 98, CAST(N'2001-06-22' AS Date), 2, N'проспект Подгорная, 385, Казань, Латвия', N'(944)199-81-30', N'Leonid_Nesterov@gmail.com', 98, 98, N'Бронхит', NULL, 9, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (99, N'https://loremflickr.com/320/240?lock=568722848', N'Елена', N'Тетерин', N'Степанович', 99, CAST(N'1968-01-14' AS Date), 1, N'Победы ул., 755, Томск, Эстония', N'(919)108-21-69', N'Elena.Kirillova65@yahoo.com', 99, 99, N'Рак', NULL, 7, N'Газпром', NULL, NULL)
GO
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (100, N'https://loremflickr.com/320/240?lock=161656308', N'Эдуард', N'Рожкова', N'Александрович', 100, CAST(N'1972-07-05' AS Date), 2, N'площадь Космонавтов, 784, Рязань, Турецкая Республика Северного Кипра (не признана)', N'(950)692-70-18', N'Anzhelika.Nikolaev5@gmail.com', 100, 100, N'ОРВИ', NULL, 3, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (101, NULL, N'sdfsdf', N'sdfsdf', N'sdfsd', 101, NULL, NULL, NULL, NULL, NULL, 101, 101, NULL, NULL, 11, N'fsdfsf', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (102, N'https://loremflickr.com/320/240?lock=1853164734', N'Константин', N'Шарова', N'Ивановна', 102, CAST(N'1993-12-26' AS Date), 4, N'8 Марта ул., 336, Владимир, Гренада', N'(996)101-05-77', N'Sergei84@yahoo.com', 102, 102, N'ОРВИ', NULL, 19, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (103, N'https://loremflickr.com/320/240?lock=1184891214', N'Игнатий', N'Гусева', N'Александровна', 103, CAST(N'1960-01-29' AS Date), 3, N'Полевая улица, 729, Саратов, Сент-Люсия', N'(954)239-05-14', N'Stanislav.Gushin@yahoo.com', 103, 103, N'ОРВИ', NULL, 13, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (104, N'https://loremflickr.com/320/240?lock=1633883142', N'Антонина', N'Муравьев', N'Ивановна', 104, CAST(N'1927-11-14' AS Date), 4, N'площадь Кооперативная, 511, Владимир, Афганистан', N'(991)052-92-29', N'Vasilisa.Kharitonova@mail.ru', 104, 104, N'Ангина', NULL, 1, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (105, N'https://loremflickr.com/320/240?lock=1132908661', N'Елизавета', N'Мухин', N'Ивановна', 105, CAST(N'1980-02-18' AS Date), 3, N'ул. Лесной, 608, Киров, Самоа', N'(919)573-41-16', N'Nina_Kulakova61@yandex.ru', 105, 105, N'Бронхит', NULL, 4, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (106, N'https://loremflickr.com/320/240?lock=2102016459', N'Жанна', N'Туров', N'Ивановна', 106, CAST(N'1951-10-07' AS Date), 3, N'пр. Свердлова, 107, Новосибирск, Великобритания', N'(969)421-28-51', N'Albert54@mail.ru', 106, 106, N'Ангина', NULL, 6, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (107, N'https://loremflickr.com/320/240?lock=195845040', N'Елизавета', N'Захаров', N'Дмитриевна', 107, CAST(N'1963-10-29' AS Date), 4, N'площадь Парковая, 285, Омск, Сент-Люсия', N'(984)844-86-04', N'Lyubov.Gorbunov96@mail.ru', 107, 107, N'Ангина', NULL, 2, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (108, N'https://loremflickr.com/320/240?lock=21281976', N'Виктор', N'Николаева', N'Александровна', 108, CAST(N'1927-08-11' AS Date), 4, N'Красная пл., 499, Воронеж, Ватикан', N'(904)304-05-75', N'Vladislav58@yandex.ru', 108, 108, N'Бронхит', NULL, 5, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (109, N'https://loremflickr.com/320/240?lock=210898921', N'Алексей', N'Григорьева', N'Ивановна', 109, CAST(N'1992-01-16' AS Date), 3, N'пр. Калинина, 988, Казань, Бурунди', N'(953)863-81-24', N'Mariya_Lavrentev@yahoo.com', 109, 109, N'ОРВИ', NULL, 8, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (110, N'https://loremflickr.com/320/240?lock=1374608718', N'Ольга', N'Воробьева', N'Степановна', 110, CAST(N'1983-06-28' AS Date), 3, N'Матросова проспект, 215, Новокузнецк, Кипр', N'(997)159-87-39', N'Eduard_Kovalev7@gmail.com', 110, 110, N'Ангина', NULL, 2, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (111, N'https://loremflickr.com/320/240?lock=1063762284', N'Александра', N'Михайлов', N'Ивановна', 111, CAST(N'1968-10-31' AS Date), 4, N'площадь Береговая, 742, Уфа, Сент-Люсия', N'(931)879-23-34', N'Anatolii36@ya.ru', 111, 111, N'Бронхит', NULL, 10, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (112, N'https://loremflickr.com/320/240?lock=86232088', N'Лидия', N'Кузьмин', N'Александровна', 112, CAST(N'1982-04-20' AS Date), 4, N'ул. Дорожная, 659, Красноярск, Турция', N'(900)617-33-70', N'Evgenii_Kostina26@hotmail.com', 112, 112, N'Ангина', NULL, 14, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (113, N'https://loremflickr.com/320/240?lock=1011430373', N'Вероника', N'Шестаков', N'Дмитриевна', 113, CAST(N'1969-07-05' AS Date), 3, N'пл. Новая, 495, Чебоксары, Кука острова', N'(929)350-06-96', N'Daniil_Morozov@gmail.com', 113, 113, N'Рак', NULL, 17, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (114, N'https://loremflickr.com/320/240?lock=889149495', N'Людмила', N'Суворова', N'Дмитриевна', 114, CAST(N'1952-11-23' AS Date), 4, N'пл. Коммунальная, 875, Барнаул, Замбия', N'(968)584-07-02', N'Sergei.Petukhov@yahoo.com', 114, 114, N'Бронхит', NULL, 15, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (115, N'https://loremflickr.com/320/240?lock=1250142055', N'Варвара', N'Мартынова', N'Александровна', 115, CAST(N'1955-02-19' AS Date), 3, N'Интернациональная пр., 580, Ростов-на-Дону, Либерия', N'(944)021-53-24', N'Regina_Suvorov@hotmail.com', 115, 115, N'Рак', NULL, 6, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (116, N'https://loremflickr.com/320/240?lock=1725894281', N'Николай', N'Никитин', N'Степановна', 116, CAST(N'1945-01-15' AS Date), 3, N'Свердлова ул., 688, Тольятти, Швеция', N'(992)290-69-19', N'Vladimir25@yahoo.com', 116, 116, N'Рак', NULL, 5, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (117, N'https://loremflickr.com/320/240?lock=1719930647', N'Юрий', N'Молчанов', N'Степановна', 117, CAST(N'1963-02-13' AS Date), 4, N'пл. Механизаторов, 628, Ростов-на-Дону, Монголия', N'(958)443-28-65', N'Dmitrii.Vlasov@yahoo.com', 117, 117, N'Ангина', NULL, 7, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (118, N'https://loremflickr.com/320/240?lock=918834691', N'Кира', N'Шестакова', N'Дмитриевна', 118, CAST(N'1938-12-03' AS Date), 3, N'площадь Заводская, 067, Сочи, Либерия', N'(919)314-52-21', N'Eduard_Subbotina87@gmail.com', 118, 118, N'ОРВИ', NULL, 20, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (119, N'https://loremflickr.com/320/240?lock=1941751619', N'Виктор', N'Новиков', N'Степановна', 119, CAST(N'1984-11-26' AS Date), 3, N'Крупской пл., 654, Курск, Алжир', N'(967)286-40-68', N'Grigorii.Nikiforova86@gmail.com', 119, 119, N'Рак', NULL, 6, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (120, N'https://loremflickr.com/320/240?lock=2067302654', N'Арсений', N'Стрелкова', N'Ивановна', 120, CAST(N'1969-09-24' AS Date), 3, N'ул. Чехова, 404, Махачкала, Катар', N'(931)632-69-55', N'Valentin_Rogova69@yahoo.com', 120, 120, N'Бронхит', NULL, 20, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (121, N'https://loremflickr.com/320/240?lock=625469635', N'Евгения', N'Степанов', N'Степановна', 121, CAST(N'1971-08-06' AS Date), 3, N'Речная проспект, 687, Уфа, Катар', N'(990)777-44-27', N'Lavrentii_Seliverstova@gmail.com', 121, 121, N'Бронхит', NULL, 20, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (122, N'https://loremflickr.com/320/240?lock=428519818', N'Даниил', N'Шилова', N'Ивановна', 122, CAST(N'1930-02-21' AS Date), 3, N'Калинина проспект, 561, Пермь, Сейшельские острова', N'(966)187-65-30', N'Makar.Soboleva30@hotmail.com', 122, 122, N'ОРВИ', NULL, 1, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (123, N'https://loremflickr.com/320/240?lock=711661411', N'Олег', N'Матвеев', N'Дмитриевна', 123, CAST(N'1957-09-11' AS Date), 3, N'Карла Маркса площадь, 486, Ставрополь, Оман', N'(980)255-27-68', N'Dmitrii.Bolshakova0@gmail.com', 123, 123, N'ОРВИ', NULL, 11, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (124, N'https://loremflickr.com/320/240?lock=573796633', N'Станислав', N'Бобров', N'Александровна', 124, CAST(N'1952-11-09' AS Date), 3, N'пр. Северная, 782, Москва, Сенегал', N'(976)830-55-86', N'Irina.Maslov@gmail.com', 124, 124, N'Рак', NULL, 14, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (125, N'https://loremflickr.com/320/240?lock=1568462116', N'Таисия', N'Трофимова', N'Александровна', 125, CAST(N'1989-05-10' AS Date), 4, N'Восточная проспект, 784, Владимир, Румыния', N'(920)450-90-27', N'Aleksei.Ignatev@gmail.com', 125, 125, N'Бронхит', NULL, 19, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (126, N'https://loremflickr.com/320/240?lock=1628489250', N'Мария', N'Романов', N'Дмитриевна', 126, CAST(N'1951-09-16' AS Date), 4, N'пр. Солнечная, 111, Киров, Марокко', N'(984)162-00-17', N'Evgenii.Nikolaeva@gmail.com', 126, 126, N'Рак', NULL, 17, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (127, N'https://loremflickr.com/320/240?lock=715150164', N'Евгений', N'Терентьева', N'Ивановна', 127, CAST(N'1970-01-05' AS Date), 4, N'Некрасова пл., 727, Владимир, Ватикан', N'(959)090-33-59', N'Stepan23@mail.ru', 127, 127, N'Бронхит', NULL, 14, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (128, N'https://loremflickr.com/320/240?lock=1718786552', N'Анна', N'Хохлов', N'Дмитриевна', 128, CAST(N'1974-12-23' AS Date), 3, N'Степная площадь, 761, Томск, Корея (Северная)', N'(984)547-53-49', N'Denis.Bogdanova0@yandex.ru', 128, 128, N'ОРВИ', NULL, 12, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (129, N'https://loremflickr.com/320/240?lock=902307545', N'Регина', N'Гуляев', N'Дмитриевна', 129, CAST(N'2002-01-22' AS Date), 4, N'ул. Ломоносова, 125, Белгород, Сальвадор', N'(933)578-48-51', N'Boris_Pakhomova62@hotmail.com', 129, 129, N'Бронхит', NULL, 13, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (130, N'https://loremflickr.com/320/240?lock=56303096', N'Вера', N'Суханова', N'Степановна', 130, CAST(N'1969-09-13' AS Date), 4, N'пр. Матросова, 200, Красноярск, Шри-Ланка', N'(981)193-02-39', N'Anatolii83@yandex.ru', 130, 130, N'ОРВИ', NULL, 9, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (131, N'https://loremflickr.com/320/240?lock=1888740059', N'Максим', N'Лаврентьева', N'Дмитриевна', 131, CAST(N'1939-06-03' AS Date), 4, N'проспект Красная, 076, Кемерово, Иордания', N'(945)724-53-92', N'Boris8@gmail.com', 131, 131, N'Бронхит', NULL, 9, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (132, N'https://loremflickr.com/320/240?lock=391115203', N'Станислав', N'Колесникова', N'Ивановна', 132, CAST(N'1963-12-29' AS Date), 3, N'улица 8 Марта, 213, Челябинск, Гвинея-Бисау', N'(975)872-77-97', N'Artyom.Kornilov84@ya.ru', 132, 132, N'Ангина', NULL, 13, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (133, N'https://loremflickr.com/320/240?lock=635052765', N'Василиса', N'Антонов', N'Степановна', 133, CAST(N'1948-06-07' AS Date), 4, N'улица Парковая, 951, Новокузнецк, Малайзия', N'(980)906-72-05', N'Stanislav.Anisimova@hotmail.com', 133, 133, N'Ангина', NULL, 9, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (134, N'https://loremflickr.com/320/240?lock=23155374', N'Алексей', N'Артемьева', N'Александровна', 134, CAST(N'1954-06-11' AS Date), 4, N'проспект Карла Маркса, 596, Липецк, Маршалловы Острова', N'(992)193-86-32', N'Artyom_Zueva90@yahoo.com', 134, 134, N'Рак', NULL, 3, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (135, N'https://loremflickr.com/320/240?lock=651266365', N'Мария', N'Гусев', N'Дмитриевна', 135, CAST(N'1961-03-21' AS Date), 4, N'пл. Набережная, 700, Тверь, Доминиканская Республика', N'(939)720-07-07', N'Margarita.Panfilov@ya.ru', 135, 135, N'Бронхит', NULL, 5, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (136, N'https://loremflickr.com/320/240?lock=1785546260', N'Валентина', N'Ларионов', N'Александровна', 136, CAST(N'1938-12-03' AS Date), 3, N'Шевченко пр., 989, Владимир, Аомынь (не признана)', N'(957)932-55-45', N'Valerii.Orlov46@hotmail.com', 136, 136, N'Бронхит', NULL, 21, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (137, N'https://loremflickr.com/320/240?lock=1319019966', N'Татьяна', N'Семенов', N'Дмитриевна', 137, CAST(N'1961-08-04' AS Date), 4, N'пр. 40 лет Победы, 969, Екатеринбург, Тринидад и Тобаго', N'(939)462-32-44', N'Galina.Konovalov35@mail.ru', 137, 137, N'ОРВИ', NULL, 3, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (138, N'https://loremflickr.com/320/240?lock=18478692', N'Ксения', N'Козлов', N'Степановна', 138, CAST(N'1964-12-28' AS Date), 4, N'площадь Октябрьская, 002, Пенза, Гвинея', N'(902)527-70-25', N'Raisa_Nikiforova10@hotmail.com', 138, 138, N'Ангина', NULL, 18, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (139, N'https://loremflickr.com/320/240?lock=43762679', N'Иван', N'Аксенов', N'Ивановна', 139, CAST(N'1998-03-31' AS Date), 4, N'Куйбышева площадь, 833, Пермь, Самоа', N'(990)603-62-51', N'Matvei.Kovalev70@yandex.ru', 139, 139, N'Ангина', NULL, 15, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (140, N'https://loremflickr.com/320/240?lock=545922568', N'Алевтина', N'Исаков', N'Александровна', 140, CAST(N'1945-07-31' AS Date), 4, N'Куйбышева ул., 475, Чебоксары, Мозамбик', N'(992)302-70-16', N'Darya_Rodionova@hotmail.com', 140, 140, N'ОРВИ', NULL, 21, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (141, N'https://loremflickr.com/320/240?lock=1414051208', N'Елена', N'Тимофеева', N'Ивановна', 141, CAST(N'1972-06-28' AS Date), 3, N'Чкалова площадь, 544, Иваново, Пакистан', N'(901)303-56-08', N'Larisa.Zuev@gmail.com', 141, 141, N'Рак', NULL, 19, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (142, N'https://loremflickr.com/320/240?lock=272368772', N'Ярослав', N'Исаева', N'Степановна', 142, CAST(N'1932-04-07' AS Date), 3, N'Железнодорожная пр., 224, Хабаровск, Сент-Винсент и Гренадины', N'(925)638-47-00', N'Yuliya_Makarova@gmail.com', 142, 142, N'Рак', NULL, 8, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (143, N'https://loremflickr.com/320/240?lock=1846097545', N'Игорь', N'Богданов', N'Александровна', 143, CAST(N'1984-11-26' AS Date), 4, N'пр. Полевая, 418, Томск, Ватикан', N'(988)903-53-86', N'Oksana24@yandex.ru', 143, 143, N'Рак', NULL, 1, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (144, N'https://loremflickr.com/320/240?lock=1595678275', N'Арсений', N'Корнилов', N'Дмитриевна', 144, CAST(N'1988-10-31' AS Date), 4, N'Интернациональная пр., 824, Сочи, Ливан', N'(936)947-54-38', N'Regina80@hotmail.com', 144, 144, N'Ангина', NULL, 17, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (145, N'https://loremflickr.com/320/240?lock=1777943271', N'Вера', N'Никитин', N'Степановна', 145, CAST(N'1934-06-15' AS Date), 3, N'Садовая улица, 101, Новокузнецк, Греция', N'(933)910-01-74', N'Zinaida_Knyazeva@gmail.com', 145, 145, N'Бронхит', NULL, 13, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (146, N'https://loremflickr.com/320/240?lock=1620124985', N'Владимир', N'Назарова', N'Александровна', 146, CAST(N'2002-11-05' AS Date), 3, N'ул. Северная, 338, Екатеринбург, Вануату', N'(924)175-61-42', N'Andrei.Evseeva62@gmail.com', 146, 146, N'Бронхит', NULL, 12, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (147, N'https://loremflickr.com/320/240?lock=1786983326', N'Любовь', N'Ильин', N'Ивановна', 147, CAST(N'1931-02-07' AS Date), 4, N'проспект Спортивная, 985, Брянск, Греция', N'(971)703-73-02', N'Irina_Potapova10@yahoo.com', 147, 147, N'Бронхит', NULL, 6, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (148, N'https://loremflickr.com/320/240?lock=1436758528', N'Максим', N'Панфилов', N'Ивановна', 148, CAST(N'2001-12-15' AS Date), 4, N'Строителей пр., 686, Ижевск, Венгрия', N'(966)685-72-34', N'Konstantin_Aksenov28@yahoo.com', 148, 148, N'Ангина', NULL, 21, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (149, N'https://loremflickr.com/320/240?lock=852600629', N'Вадим', N'Кабанов', N'Дмитриевна', 149, CAST(N'1968-04-10' AS Date), 3, N'проспект Энергетиков, 459, Киров, Португалия', N'(957)271-46-23', N'Matvei_Suvorova@hotmail.com', 149, 149, N'ОРВИ', NULL, 13, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (150, N'https://loremflickr.com/320/240?lock=441719041', N'Валентин', N'Абрамов', N'Дмитриевна', 150, CAST(N'1998-09-26' AS Date), 4, N'проспект Сосновая, 637, Уфа, Восточный Тимор', N'(941)487-31-99', N'Marina.Panov@ya.ru', 150, 150, N'Бронхит', NULL, 2, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (151, N'https://loremflickr.com/320/240?lock=1159736508', N'Надежда', N'Блохина', N'Степановна', 151, CAST(N'1989-02-07' AS Date), 4, N'пл. Ломоносова, 189, Ульяновск, Бахрейн', N'(961)056-31-09', N'Kseniya15@yahoo.com', 151, 151, N'Бронхит', NULL, 15, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (152, N'https://loremflickr.com/320/240?lock=723638763', N'Артём', N'Вишнякова', N'Ивановна', 152, CAST(N'1946-10-12' AS Date), 4, N'Ленина пр., 409, Омск, Парагвай', N'(982)123-44-87', N'Maksim.Maksimova89@ya.ru', 152, 152, N'Бронхит', NULL, 21, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (153, N'https://loremflickr.com/320/240?lock=1363860538', N'Регина', N'Казаков', N'Ивановна', 153, CAST(N'1986-09-02' AS Date), 4, N'Ленина площадь, 499, Тольятти, Египет', N'(902)339-85-90', N'Aleksei.Shilova35@ya.ru', 153, 153, N'Ангина', NULL, 7, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (154, N'https://loremflickr.com/320/240?lock=1571153232', N'Лаврентий', N'Мишина', N'Александровна', 154, CAST(N'1932-02-23' AS Date), 4, N'проспект Заводская, 264, Иркутск, Демократическая Республика', N'(923)508-95-86', N'Nikolai_Shilova@hotmail.com', 154, 154, N'ОРВИ', NULL, 16, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (155, N'https://loremflickr.com/320/240?lock=147435960', N'Олег', N'Белякова', N'Дмитриевна', 155, CAST(N'1965-07-08' AS Date), 3, N'пр. Лесная, 249, Тверь, Уганда', N'(923)715-36-77', N'German81@yahoo.com', 155, 155, N'Ангина', NULL, 16, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (156, N'https://loremflickr.com/320/240?lock=1031776067', N'Мария', N'Терентьева', N'Ивановна', 156, CAST(N'2000-12-31' AS Date), 4, N'ул. Северная, 676, Самара, Гана', N'(977)111-66-06', N'Igor_Uvarov6@ya.ru', 156, 156, N'Бронхит', NULL, 8, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (157, N'https://loremflickr.com/320/240?lock=315505507', N'Римма', N'Блинов', N'Ивановна', 157, CAST(N'1997-01-20' AS Date), 4, N'ул. Трактовая, 565, Екатеринбург, Боливия', N'(947)958-17-16', N'Luka_Fedorov30@ya.ru', 157, 157, N'Рак', NULL, 20, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (158, N'https://loremflickr.com/320/240?lock=1606224890', N'Елена', N'Исаев', N'Степановна', 158, CAST(N'1966-05-09' AS Date), 3, N'Совхозная ул., 062, Уфа, Бахрейн', N'(947)845-16-12', N'Varvara_Kolobova@yahoo.com', 158, 158, N'Бронхит', NULL, 3, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (159, N'https://loremflickr.com/320/240?lock=827761000', N'Лидия', N'Белоусов', N'Степановна', 159, CAST(N'1940-07-26' AS Date), 4, N'40 лет Победы площадь, 041, Магнитогорск, Лесото', N'(982)081-52-57', N'Naezhda.Fomicheva@yandex.ru', 159, 159, N'Ангина', NULL, 6, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (160, N'https://loremflickr.com/320/240?lock=1886656702', N'Анатолий', N'Белякова', N'Степановна', 160, CAST(N'1995-02-20' AS Date), 4, N'пр. Школьная, 395, Самара, Румыния', N'(930)882-16-62', N'Lidiya_Likhachev@hotmail.com', 160, 160, N'Бронхит', NULL, 21, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (161, N'https://loremflickr.com/320/240?lock=703869057', N'Анна', N'Пахомов', N'Дмитриевна', 161, CAST(N'1969-12-23' AS Date), 4, N'ул. Дорожная, 423, Новокузнецк, Кувейт', N'(929)939-98-79', N'Irina.Ponomarev84@gmail.com', 161, 161, N'ОРВИ', NULL, 12, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (162, N'https://loremflickr.com/320/240?lock=1293177131', N'Макар', N'Веселов', N'Ивановна', 162, CAST(N'1958-06-27' AS Date), 3, N'ул. Заводская, 596, Киров, Австрия', N'(950)655-65-15', N'Vadim56@yahoo.com', 162, 162, N'Бронхит', NULL, 14, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (163, N'https://loremflickr.com/320/240?lock=617251111', N'Зинаида', N'Крюков', N'Ивановна', 163, CAST(N'1998-01-23' AS Date), 3, N'площадь Степная, 657, Ярославль, Сан-Марино', N'(920)929-09-24', N'Valentin18@yandex.ru', 163, 163, N'Рак', NULL, 3, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (164, N'https://loremflickr.com/320/240?lock=926975477', N'Даниил', N'Субботин', N'Ивановна', 164, CAST(N'1946-01-13' AS Date), 4, N'проспект Цветочная, 128, Тюмень, Палау', N'(916)185-68-43', N'Matvei71@gmail.com', 164, 164, N'Рак', NULL, 12, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (165, N'https://loremflickr.com/320/240?lock=1666652596', N'Ирина', N'Суханов', N'Александровна', 165, CAST(N'1930-10-23' AS Date), 3, N'Дзержинского ул., 931, Чебоксары, Камерун', N'(993)136-66-95', N'Evgenii.Kosheleva63@mail.ru', 165, 165, N'Ангина', NULL, 18, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (166, N'https://loremflickr.com/320/240?lock=1636152299', N'Екатерина', N'Бурова', N'Степановна', 166, CAST(N'1962-06-20' AS Date), 4, N'пр. Майская, 051, Рязань, Нигер', N'(939)415-62-35', N'Ulyana30@yahoo.com', 166, 166, N'Бронхит', NULL, 20, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (167, N'https://loremflickr.com/320/240?lock=1250888359', N'Виктор', N'Потапова', N'Дмитриевна', 167, CAST(N'1967-07-21' AS Date), 3, N'пр. Куйбышева, 113, Сочи, Гренада', N'(940)146-61-72', N'Yaroslav_Ivanova@ya.ru', 167, 167, N'ОРВИ', NULL, 5, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (168, N'https://loremflickr.com/320/240?lock=486326650', N'Геннадий', N'Королев', N'Ивановна', 168, CAST(N'1988-03-22' AS Date), 4, N'Новая проспект, 692, Волгоград, Хорватия', N'(992)205-95-75', N'Eduard_Orlova@yandex.ru', 168, 168, N'Ангина', NULL, 17, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (169, N'https://loremflickr.com/320/240?lock=120147569', N'Игнатий', N'Панфилов', N'Ивановна', 169, CAST(N'1974-08-06' AS Date), 4, N'пл. Комсомольская, 667, Махачкала, Гренада', N'(956)851-89-00', N'Oleg.Gushin@mail.ru', 169, 169, N'Рак', NULL, 15, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (170, N'https://loremflickr.com/320/240?lock=824437475', N'Макар', N'Брагин', N'Ивановна', 170, CAST(N'2005-12-10' AS Date), 4, N'площадь Кирова, 384, Ростов-на-Дону, Палау', N'(923)991-08-26', N'Kseniya50@yandex.ru', 170, 170, N'Ангина', NULL, 3, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (171, N'https://loremflickr.com/320/240?lock=1624027912', N'Татьяна', N'Кошелева', N'Дмитриевна', 171, CAST(N'1960-04-13' AS Date), 4, N'Парковая проспект, 992, Москва, Суринам', N'(924)181-15-13', N'Tamara55@ya.ru', 171, 171, N'Бронхит', NULL, 21, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (172, N'https://loremflickr.com/320/240?lock=1368579373', N'Георгий', N'Фролов', N'Александровна', 172, CAST(N'1989-07-12' AS Date), 4, N'проспект Чкалова, 266, Тюмень, Люксембург', N'(942)395-81-74', N'Evgenii.Safonov@ya.ru', 172, 172, N'Рак', NULL, 17, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (173, N'https://loremflickr.com/320/240?lock=1627612875', N'Семён', N'Быков', N'Степановна', 173, CAST(N'1964-10-18' AS Date), 3, N'Суворова ул., 836, Томск, Конго', N'(927)908-26-62', N'Ivan.Kudryashov@hotmail.com', 173, 173, N'ОРВИ', NULL, 10, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (174, N'https://loremflickr.com/320/240?lock=1257826671', N'Евгения', N'Мартынова', N'Степановна', 174, CAST(N'1989-09-07' AS Date), 4, N'ул. Почтовая, 210, Тюмень, Германия', N'(932)933-91-32', N'Kira.Veselova57@ya.ru', 174, 174, N'Ангина', NULL, 12, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (175, N'https://loremflickr.com/320/240?lock=1556595790', N'Жанна', N'Зайцев', N'Ивановна', 175, CAST(N'1995-07-03' AS Date), 3, N'пл. Космонавтов, 050, Владивосток, Норвегия', N'(905)646-63-94', N'Mikhail.Knyazeva85@ya.ru', 175, 175, N'Рак', NULL, 7, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (176, N'https://loremflickr.com/320/240?lock=1002028196', N'Мария', N'Мухина', N'Дмитриевна', 176, CAST(N'1965-09-24' AS Date), 4, N'Интернациональная проспект, 090, Тольятти, Тунис', N'(964)001-93-12', N'Margarita.Fomichev72@hotmail.com', 176, 176, N'Ангина', NULL, 16, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (177, N'https://loremflickr.com/320/240?lock=2128045595', N'Степан', N'Горбунов', N'Ивановна', 177, CAST(N'1942-04-07' AS Date), 4, N'Ленина пр., 156, Ярославль, Никарагуа', N'(924)219-50-93', N'Denis_Kulagin@gmail.com', 177, 177, N'Бронхит', NULL, 4, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (178, N'https://loremflickr.com/320/240?lock=385850909', N'Александра', N'Красильникова', N'Степановна', 178, CAST(N'1966-10-12' AS Date), 4, N'Московская площадь, 640, Барнаул, Чехия', N'(954)336-47-68', N'Aleksei_Bespalova17@mail.ru', 178, 178, N'Рак', NULL, 12, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (179, N'https://loremflickr.com/320/240?lock=1514347688', N'Ксения', N'Мельникова', N'Александровна', 179, CAST(N'1954-12-29' AS Date), 4, N'пр. Лесной, 957, Ижевск, Сирия', N'(966)957-88-89', N'Eduard69@ya.ru', 179, 179, N'ОРВИ', NULL, 15, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (180, N'https://loremflickr.com/320/240?lock=1663275544', N'Макар', N'Лебедев', N'Степановна', 180, CAST(N'2002-01-30' AS Date), 4, N'Некрасова улица, 767, Иваново, Мальта', N'(927)296-58-78', N'Vladislav_Isaeva@yandex.ru', 180, 180, N'Рак', NULL, 5, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (181, N'https://loremflickr.com/320/240?lock=106817802', N'Константин', N'Кулакова', N'Ивановна', 181, CAST(N'1960-02-06' AS Date), 3, N'Молодежная пр., 247, Брянск, Либерия', N'(912)343-23-20', N'Anzhela.Nikolaeva@gmail.com', 181, 181, N'Рак', NULL, 14, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (182, N'https://loremflickr.com/320/240?lock=611246150', N'Вероника', N'Гуляев', N'Ивановна', 182, CAST(N'2003-06-01' AS Date), 3, N'улица Рабочая, 751, Тольятти, Ливан', N'(915)388-03-71', N'Yurii27@yandex.ru', 182, 182, N'Бронхит', NULL, 1, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (183, N'https://loremflickr.com/320/240?lock=1094701116', N'Андрей', N'Красильникова', N'Дмитриевна', 183, CAST(N'1930-09-04' AS Date), 3, N'Интернациональная проспект, 265, Челябинск, Судан', N'(958)692-94-72', N'Rimma.Turova25@yandex.ru', 183, 183, N'Бронхит', NULL, 5, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (184, N'https://loremflickr.com/320/240?lock=1957896567', N'Лариса', N'Никитина', N'Ивановна', 184, CAST(N'1950-02-19' AS Date), 3, N'площадь Весенняя, 360, Тверь, Австралия', N'(960)898-13-33', N'Viktor_Simonov37@ya.ru', 184, 184, N'ОРВИ', NULL, 15, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (185, N'https://loremflickr.com/320/240?lock=1704371756', N'Арсений', N'Воронцова', N'Дмитриевна', 185, CAST(N'1993-06-05' AS Date), 4, N'пр. Центральная, 086, Екатеринбург, Южно-Африканская Республика', N'(932)048-66-67', N'Nikolai.Vinogradova@gmail.com', 185, 185, N'Бронхит', NULL, 18, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (186, N'https://loremflickr.com/320/240?lock=236215738', N'Борис', N'Федорова', N'Степановна', 186, CAST(N'1995-09-14' AS Date), 4, N'Московская улица, 234, Тула, Чад', N'(994)287-50-54', N'Irina85@yahoo.com', 186, 186, N'Рак', NULL, 18, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (187, N'https://loremflickr.com/320/240?lock=198879131', N'Любовь', N'Ермакова', N'Степановна', 187, CAST(N'1992-02-19' AS Date), 3, N'проспект Фрунзе, 871, Новосибирск, Молдова', N'(926)940-91-94', N'Aleksei.Kulikova@gmail.com', 187, 187, N'ОРВИ', NULL, 14, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (188, N'https://loremflickr.com/320/240?lock=821227812', N'Лаврентий', N'Фомичев', N'Ивановна', 188, CAST(N'1965-12-09' AS Date), 3, N'Западная улица, 580, Тюмень, Нидерланды', N'(987)313-76-42', N'Eduard.Fedotov28@mail.ru', 188, 188, N'Ангина', NULL, 7, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (189, N'https://loremflickr.com/320/240?lock=560153666', N'Герман', N'Ефимова', N'Дмитриевна', 189, CAST(N'1973-04-15' AS Date), 4, N'Дружбы проспект, 615, Ростов-на-Дону, Тунис', N'(922)469-25-67', N'Arkadii.Afanasev72@hotmail.com', 189, 189, N'ОРВИ', NULL, 12, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (190, N'https://loremflickr.com/320/240?lock=1991338638', N'Григорий', N'Мясникова', N'Александровна', 190, CAST(N'1945-01-02' AS Date), 3, N'Московская пл., 467, Нижний Новгород, Ангилья', N'(964)431-96-88', N'Regina23@ya.ru', 190, 190, N'Ангина', NULL, 5, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (191, N'https://loremflickr.com/320/240?lock=417001090', N'Георгий', N'Фомин', N'Дмитриевна', 191, CAST(N'1951-02-23' AS Date), 3, N'Степная пл., 257, Пенза, Эритрея', N'(929)307-88-23', N'Nina.Nikolaeva@gmail.com', 191, 191, N'Бронхит', NULL, 3, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (192, N'https://loremflickr.com/320/240?lock=1183642886', N'Елена', N'Красильникова', N'Александровна', 192, CAST(N'1959-02-28' AS Date), 3, N'проспект Береговая, 309, Рязань, Мозамбик', N'(923)494-27-54', N'Yaroslav13@gmail.com', 192, 192, N'Рак', NULL, 20, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (193, N'https://loremflickr.com/320/240?lock=347039773', N'Вера', N'Исаков', N'Степановна', 193, CAST(N'1955-10-03' AS Date), 3, N'Пролетарская улица, 883, Омск, Польша', N'(961)804-19-28', N'Nina.Gorbacheva@yandex.ru', 193, 193, N'ОРВИ', NULL, 3, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (194, N'https://loremflickr.com/320/240?lock=2033694167', N'Семён', N'Устинова', N'Степановна', 194, CAST(N'1982-02-17' AS Date), 4, N'улица Пушкина, 059, Иваново, Гондурас', N'(967)184-48-23', N'Anzhela_Markova3@ya.ru', 194, 194, N'Ангина', NULL, 4, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (195, N'https://loremflickr.com/320/240?lock=56420466', N'Марина', N'Баранова', N'Александровна', 195, CAST(N'1968-01-18' AS Date), 4, N'Куйбышева площадь, 110, Краснодар, Тунис', N'(994)605-23-79', N'Nikita_Muravev@yandex.ru', 195, 195, N'Ангина', NULL, 3, N'Газпром', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (196, N'https://loremflickr.com/320/240?lock=1349637762', N'Александр', N'Фомичев', N'Дмитриевна', 196, CAST(N'1955-02-06' AS Date), 3, N'Степная пр., 068, Белгород, Узбекистан', N'(925)740-75-55', N'Aleksandra8@hotmail.com', 196, 196, N'Бронхит', NULL, 14, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (197, N'https://loremflickr.com/320/240?lock=1884826761', N'Вероника', N'Сорокин', N'Дмитриевна', 197, CAST(N'1932-12-15' AS Date), 3, N'пл. Совхозная, 036, Саратов, Гвиана (не признана)', N'(990)121-04-95', N'Vera60@ya.ru', 197, 197, N'Рак', NULL, 10, N'СберБан', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (198, N'https://loremflickr.com/320/240?lock=125421203', N'Евгения', N'Калашникова', N'Александровна', 198, CAST(N'1950-05-14' AS Date), 4, N'улица Красноармейская, 808, Тверь, Буркина-Фасо', N'(973)556-74-97', N'Evgenii23@ya.ru', 198, 198, N'Бронхит', NULL, 15, N'ВТБ Банк', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (199, N'https://loremflickr.com/320/240?lock=769236014', N'Антон', N'Мясникова', N'Дмитриевна', 199, CAST(N'2002-05-29' AS Date), 3, N'проспект Шоссейная, 133, Иваново, Французская Полинезия (не признана)', N'(939)288-50-58', N'Georgii.Kopylova@yandex.ru', 199, 199, N'Бронхит', NULL, 9, N'Газпром', NULL, NULL)
GO
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (200, N'https://loremflickr.com/320/240?lock=1844143151', N'Светлана', N'Брагина', N'Ивановна', 200, CAST(N'1932-06-25' AS Date), 3, N'Островского пр., 938, Чебоксары, Йемен', N'(912)680-90-71', N'Vadim.Tretyakov@hotmail.com', 200, 200, N'Рак', NULL, 9, N'Тинькофф', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [Photo], [FirstName], [LastName], [MiddleName], [IDPassport], [DateOfBirth], [IDGender], [Adress], [Phone], [Email], [IDMedicalCard], [IDInsuransePolicy], [Diagnos], [IDDiseaseHistory], [IDInsuranseCompany], [WorkPlace], [PathContract], [PathPersonalData]) VALUES (201, N'https://loremflickr.com/320/240?lock=433351566', N'Вера', N'Шарова', N'Дмитриевна', 201, CAST(N'1994-04-20' AS Date), 4, N'ул. Победы, 562, Астрахань, Уганда', N'(978)075-47-53', N'Roman.Shiryaeva@mail.ru', 201, 201, N'ОРВИ', NULL, 8, N'Тинькофф', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[SecurityAccessLog] ON 

INSERT [dbo].[SecurityAccessLog] ([ID], [PersonCode], [PersonRole], [LastSecurityPointNumber], [LastSecurityPointDirection], [LastSecurityPointTime]) VALUES (2, N'54535', N'Клиент', 21, N'out', CAST(N'2024-02-17T15:12:35.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SecurityAccessLog] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeHospitalization] ON 

INSERT [dbo].[TypeHospitalization] ([ID], [Title]) VALUES (1, N'Платно')
INSERT [dbo].[TypeHospitalization] ([ID], [Title]) VALUES (2, N'Бесплатно')
SET IDENTITY_INSERT [dbo].[TypeHospitalization] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeMesuares] ON 

INSERT [dbo].[TypeMesuares] ([ID], [Title]) VALUES (1, N'Платно')
INSERT [dbo].[TypeMesuares] ([ID], [Title]) VALUES (2, N'Бесплатно')
SET IDENTITY_INSERT [dbo].[TypeMesuares] OFF
GO
ALTER TABLE [dbo].[CodeHospitalization]  WITH CHECK ADD  CONSTRAINT [FK_CodeHospitalization_TypeHospitalization] FOREIGN KEY([IDTypeHospitalization])
REFERENCES [dbo].[TypeHospitalization] ([ID])
GO
ALTER TABLE [dbo].[CodeHospitalization] CHECK CONSTRAINT [FK_CodeHospitalization_TypeHospitalization]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_CodeHospitalization] FOREIGN KEY([IDCodeHospitalization])
REFERENCES [dbo].[CodeHospitalization] ([ID])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_CodeHospitalization]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_Patient] FOREIGN KEY([IDPatient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_Patient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_DiseaseHistory] FOREIGN KEY([IDDiseaseHistory])
REFERENCES [dbo].[DiseaseHistory] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_DiseaseHistory]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Gender] FOREIGN KEY([IDGender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Gender]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_InsuranseCompany] FOREIGN KEY([IDInsuranseCompany])
REFERENCES [dbo].[InsuranseCompany] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_InsuranseCompany]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_InsuransePolicy] FOREIGN KEY([IDInsuransePolicy])
REFERENCES [dbo].[InsuransePolicy] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_InsuransePolicy]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_MedicalCard] FOREIGN KEY([IDMedicalCard])
REFERENCES [dbo].[MedicalCard] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_MedicalCard]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Passport] FOREIGN KEY([IDPassport])
REFERENCES [dbo].[Passport] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Passport]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMesuares]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMesuares_Patient] FOREIGN KEY([IDPatient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMesuares] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMesuares_Patient]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMesuares]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMesuares_ResultMesuares] FOREIGN KEY([IDResultMesuares])
REFERENCES [dbo].[ResultMesuares] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMesuares] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMesuares_ResultMesuares]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMesuares]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMesuares_TypeMesuares] FOREIGN KEY([IDTypeMesuares])
REFERENCES [dbo].[TypeMesuares] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMesuares] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMesuares_TypeMesuares]
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMesuares]  WITH CHECK ADD  CONSTRAINT [FK_TherapeuticDiagnosticMesuares_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TherapeuticDiagnosticMesuares] CHECK CONSTRAINT [FK_TherapeuticDiagnosticMesuares_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Gender] FOREIGN KEY([IDGender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Gender]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Speciality] FOREIGN KEY([IDSpeciality])
REFERENCES [dbo].[Speciality] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Speciality]
GO
USE [master]
GO
ALTER DATABASE [dbFirstSession] SET  READ_WRITE 
GO
