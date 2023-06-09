USE [master]
GO
/****** Object:  Database [Employee]    Script Date: 3/12/2023 8:07:24 PM ******/
CREATE DATABASE [Employee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Employee', FILENAME = N'D:\MSSQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Employee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Employee_log', FILENAME = N'D:\MSSQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Employee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Employee] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Employee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Employee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Employee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Employee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Employee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Employee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Employee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Employee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Employee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Employee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Employee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Employee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Employee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Employee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Employee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Employee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Employee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Employee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Employee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Employee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Employee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Employee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Employee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Employee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Employee] SET  MULTI_USER 
GO
ALTER DATABASE [Employee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Employee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Employee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Employee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Employee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Employee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Employee] SET QUERY_STORE = ON
GO
ALTER DATABASE [Employee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Employee]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/12/2023 8:07:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/12/2023 8:07:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[MonthlySalary] [int] NOT NULL,
	[LocationId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 3/12/2023 8:07:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [uniqueidentifier] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[NameOfWorkplace] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 3/12/2023 8:07:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[TaskCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230309145228_FirstMigration', N'7.0.3')
GO
INSERT [dbo].[Employees] ([Id], [FullName], [PhoneNumber], [DateOfBirth], [MonthlySalary], [LocationId]) VALUES (N'959d3e6c-18e4-4303-a5c3-3c4b85df47d6', N'David Johnatan', N'542352643', CAST(N'2023-03-15T16:51:00.0000000' AS DateTime2), 10000, N'4825190c-e62f-4ce9-8171-b7eedf71f974')
INSERT [dbo].[Employees] ([Id], [FullName], [PhoneNumber], [DateOfBirth], [MonthlySalary], [LocationId]) VALUES (N'645f12cc-4f47-4818-a07d-410ba07c6a14', N'Mark Zuckenberg', N'68386386', CAST(N'2023-03-08T16:05:00.0000000' AS DateTime2), 2000, N'4825190c-e62f-4ce9-8171-b7eedf71f974')
INSERT [dbo].[Employees] ([Id], [FullName], [PhoneNumber], [DateOfBirth], [MonthlySalary], [LocationId]) VALUES (N'baf3b69a-a773-437c-ac0f-4f8deb07d6d1', N'Stefan Knezic', N'0613158032', CAST(N'1999-05-12T16:04:00.0000000' AS DateTime2), 1000, N'ce387239-c87b-4769-8e15-ddc804d7299d')
INSERT [dbo].[Employees] ([Id], [FullName], [PhoneNumber], [DateOfBirth], [MonthlySalary], [LocationId]) VALUES (N'16862142-0716-49ab-a125-53840d494100', N'nicolas cage', N'57372257', CAST(N'2023-03-08T16:05:00.0000000' AS DateTime2), 10000, N'2f8ef59f-b5bd-4987-a801-10d5929e5573')
INSERT [dbo].[Employees] ([Id], [FullName], [PhoneNumber], [DateOfBirth], [MonthlySalary], [LocationId]) VALUES (N'0ae130cb-d28b-48cf-aabf-6c5c877e9740', N'Mark John', N'067411456', CAST(N'2023-03-01T19:37:00.0000000' AS DateTime2), 1200, N'4825190c-e62f-4ce9-8171-b7eedf71f974')
INSERT [dbo].[Employees] ([Id], [FullName], [PhoneNumber], [DateOfBirth], [MonthlySalary], [LocationId]) VALUES (N'23f859e9-f29f-45d6-8ced-ae401db24abc', N'Mark Tven', N'65426', CAST(N'2023-03-14T16:49:00.0000000' AS DateTime2), 10000, N'beaadd0e-ae3c-42e7-82b5-abf8c75ae205')
INSERT [dbo].[Employees] ([Id], [FullName], [PhoneNumber], [DateOfBirth], [MonthlySalary], [LocationId]) VALUES (N'03ca1b88-a498-4ffe-b737-b389f072fcb1', N'Liam Nesson', N'547574246254', CAST(N'2023-03-09T16:06:00.0000000' AS DateTime2), 10000, N'4825190c-e62f-4ce9-8171-b7eedf71f974')
GO
INSERT [dbo].[Locations] ([Id], [Address], [City], [NameOfWorkplace]) VALUES (N'bea45c6f-d52e-4a84-9c6a-04d449ff3294', N'main Street,bb', N'Paris,France', N'Workplace No.3')
INSERT [dbo].[Locations] ([Id], [Address], [City], [NameOfWorkplace]) VALUES (N'2f8ef59f-b5bd-4987-a801-10d5929e5573', N'America''s Main Street', N'Washington DC', N'Main Workplace')
INSERT [dbo].[Locations] ([Id], [Address], [City], [NameOfWorkplace]) VALUES (N'beaadd0e-ae3c-42e7-82b5-abf8c75ae205', N'Knez Mihailova bb', N'Belgrade', N'Workplace No.1 ')
INSERT [dbo].[Locations] ([Id], [Address], [City], [NameOfWorkplace]) VALUES (N'4825190c-e62f-4ce9-8171-b7eedf71f974', N'main Street,12 ', N'Los Angeles', N'Workplace No.2')
INSERT [dbo].[Locations] ([Id], [Address], [City], [NameOfWorkplace]) VALUES (N'ce387239-c87b-4769-8e15-ddc804d7299d', N'main Street,bb', N'Berlin', N'Workplace No.4')
GO
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [DueDate], [EmployeeId], [TaskCompleted]) VALUES (N'bd73e052-c40f-4f9a-b80c-0b7cb5c0bdf6', N'nesto ', N'fhs', CAST(N'2023-03-11T17:48:00.0000000' AS DateTime2), N'959d3e6c-18e4-4303-a5c3-3c4b85df47d6', 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [DueDate], [EmployeeId], [TaskCompleted]) VALUES (N'beb91ae1-7873-4d7a-b01d-202049396257', N'gfd', N'fdgs', CAST(N'2023-03-11T17:48:00.0000000' AS DateTime2), N'959d3e6c-18e4-4303-a5c3-3c4b85df47d6', 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [DueDate], [EmployeeId], [TaskCompleted]) VALUES (N'cb93c17e-c8e1-4e9f-ae8f-7773ecd010c1', N'Task 1', N'Task1 ', CAST(N'2023-03-11T17:45:00.0000000' AS DateTime2), N'0ae130cb-d28b-48cf-aabf-6c5c877e9740', 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [DueDate], [EmployeeId], [TaskCompleted]) VALUES (N'4c2be2c7-6a65-466b-a025-852d1a4e98f4', N'Washing', N'Washing the dishes', CAST(N'2023-03-16T16:13:00.0000000' AS DateTime2), N'03ca1b88-a498-4ffe-b737-b389f072fcb1', 0)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [DueDate], [EmployeeId], [TaskCompleted]) VALUES (N'189ebce0-29e5-4380-8882-8905d9aa8a59', N'hgdf', N'fgds', CAST(N'2023-03-11T17:48:00.0000000' AS DateTime2), N'959d3e6c-18e4-4303-a5c3-3c4b85df47d6', 1)
INSERT [dbo].[Tasks] ([Id], [Title], [Description], [DueDate], [EmployeeId], [TaskCompleted]) VALUES (N'e776e063-d562-47d1-9cd2-deac2985ed31', N'Do a Laundry', N'Need to do a loundry', CAST(N'2023-03-12T15:01:00.0000000' AS DateTime2), N'0ae130cb-d28b-48cf-aabf-6c5c877e9740', 1)
GO
/****** Object:  Index [IX_Employees_LocationId]    Script Date: 3/12/2023 8:07:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_LocationId] ON [dbo].[Employees]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_EmployeeId]    Script Date: 3/12/2023 8:07:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_EmployeeId] ON [dbo].[Tasks]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Locations_LocationId]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Employees_EmployeeId]
GO
USE [master]
GO
ALTER DATABASE [Employee] SET  READ_WRITE 
GO
