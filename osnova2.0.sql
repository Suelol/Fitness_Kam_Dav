USE [master]
GO
/****** Object:  Database [FitnessClub_Kam_Dav]    Script Date: 02.12.2024 13:58:53 ******/
CREATE DATABASE [FitnessClub_Kam_Dav]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FitnessClub_Kam_Dav', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FitnessClub_Kam_Dav.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FitnessClub_Kam_Dav_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FitnessClub_Kam_Dav_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FitnessClub_Kam_Dav].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET ARITHABORT OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET  MULTI_USER 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET QUERY_STORE = ON
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FitnessClub_Kam_Dav]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[TrainingID] [int] NULL,
	[AttendanceDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[TrainingID] [int] NOT NULL,
	[BookingDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[MembershipTypeID] [int] NULL,
	[RegistrationDate] [datetime] NULL,
	[Goals] [nvarchar](255) NULL,
	[Preferences] [nvarchar](255) NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[TrainerID] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](255) NULL,
	[FeedbackDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialTransactions]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialTransactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[TransactionDate] [datetime] NULL,
	[Amount] [decimal](10, 2) NULL,
	[TransactionType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gyms]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gyms](
	[GymID] [int] IDENTITY(1,1) NOT NULL,
	[GymName] [nvarchar](100) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Location] [nvarchar](255) NULL,
	[Facilities] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[GymID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Condition] [nvarchar](50) NULL,
	[LastMaintenanceDate] [datetime] NULL,
	[GymID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipTypes]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipTypes](
	[MembershipTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[DurationMonths] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Benefits] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MembershipTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainers]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainers](
	[TrainerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Specialization] [nvarchar](100) NULL,
	[Rating] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainings]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainings](
	[TrainingID] [int] IDENTITY(1,1) NOT NULL,
	[TrainingType] [nvarchar](50) NOT NULL,
	[TrainerID] [int] NULL,
	[GymID] [int] NULL,
	[Schedule] [datetime] NOT NULL,
	[Duration] [int] NULL,
	[MaxParticipants] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02.12.2024 13:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Email], [Phone], [MembershipTypeID], [RegistrationDate], [Goals], [Preferences], [UserID]) VALUES (2, N'Арсений', N'Арсений', N'arc@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Email], [Phone], [MembershipTypeID], [RegistrationDate], [Goals], [Preferences], [UserID]) VALUES (3, N'dav', N'dav', N'dav@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Email], [Phone], [MembershipTypeID], [RegistrationDate], [Goals], [Preferences], [UserID]) VALUES (5, N'Рамиль', N'Камалов', N'rqam@gmail.com', N'89274111404', 1, CAST(N'2023-12-20T00:00:00.000' AS DateTime), N'sas', N'sas', 4)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[MembershipTypes] ON 

INSERT [dbo].[MembershipTypes] ([MembershipTypeID], [TypeName], [DurationMonths], [Price], [Benefits]) VALUES (1, N'FAMILY', 123, CAST(123.00 AS Decimal(10, 2)), N'222')
SET IDENTITY_INSERT [dbo].[MembershipTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Email]) VALUES (0, N'Имя', N'Логин', N'Пароль', NULL)
INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Email]) VALUES (1, N'123', N'123', N'123', NULL)
INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Email]) VALUES (2, N'ram', N'RAM', N'RAM123', NULL)
INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Email]) VALUES (3, N'ram', N'ram1', N'ram', NULL)
INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Email]) VALUES (4, N'Рамиль', N'suelol', N'lol', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clients__A9D1053472514477]    Script Date: 02.12.2024 13:58:53 ******/
ALTER TABLE [dbo].[Clients] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([TrainingID])
REFERENCES [dbo].[Trainings] ([TrainingID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([TrainingID])
REFERENCES [dbo].[Trainings] ([TrainingID])
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([MembershipTypeID])
REFERENCES [dbo].[MembershipTypes] ([MembershipTypeID])
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Users]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainers] ([TrainerID])
GO
ALTER TABLE [dbo].[FinancialTransactions]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([GymID])
REFERENCES [dbo].[Gyms] ([GymID])
GO
ALTER TABLE [dbo].[Trainings]  WITH CHECK ADD FOREIGN KEY([GymID])
REFERENCES [dbo].[Gyms] ([GymID])
GO
ALTER TABLE [dbo].[Trainings]  WITH CHECK ADD FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainers] ([TrainerID])
GO
USE [master]
GO
ALTER DATABASE [FitnessClub_Kam_Dav] SET  READ_WRITE 
GO
