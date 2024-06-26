USE [master]
GO
/****** Object:  Database [InterviewSystem]    Script Date: 4/16/2024 9:41:10 PM ******/
CREATE DATABASE [InterviewSystem]
GO
ALTER DATABASE [InterviewSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InterviewSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InterviewSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InterviewSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InterviewSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [InterviewSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InterviewSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InterviewSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InterviewSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InterviewSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InterviewSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InterviewSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InterviewSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InterviewSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InterviewSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InterviewSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InterviewSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InterviewSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InterviewSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InterviewSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InterviewSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InterviewSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InterviewSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InterviewSystem] SET  MULTI_USER 
GO
ALTER DATABASE [InterviewSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InterviewSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InterviewSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InterviewSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InterviewSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InterviewSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InterviewSystem] SET QUERY_STORE = OFF
GO
USE [InterviewSystem]
GO
/****** Object:  Table [dbo].[Benefit]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benefit](
	[BenefitID] [int] IDENTITY(1,1) NOT NULL,
	[BenefitName] [nvarchar](100) NOT NULL,
 CONSTRAINT [Benefit_pk] PRIMARY KEY CLUSTERED 
(
	[BenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[CandidateID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[DOB] [date] NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Gender] [int] NOT NULL,
	[CVAttachment] [nvarchar](max) NULL,
	[PositionID] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CandidateStatusID] [int] NOT NULL,
	[YearOfExperience] [int] NOT NULL,
	[HighestLevel] [int] NULL,
	[CreateBy] [int] NULL,
	[LastUpdateAt] [date] NULL,
	[Recruiter] [int] NULL,
 CONSTRAINT [Candidate_pk] PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateSkills]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateSkills](
	[Candidate_CandidateID] [int] NOT NULL,
	[Skills_SkillID] [int] NOT NULL,
 CONSTRAINT [CandidateSkills_pk] PRIMARY KEY CLUSTERED 
(
	[Candidate_CandidateID] ASC,
	[Skills_SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateStatus]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateStatus](
	[CandidateStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](25) NOT NULL,
 CONSTRAINT [CandidateStatus_pk] PRIMARY KEY CLUSTERED 
(
	[CandidateStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractType]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractType](
	[ContractTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [ContractType_pk] PRIMARY KEY CLUSTERED 
(
	[ContractTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [Department_pk] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interviewer]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interviewer](
	[InterviewScheduleID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [Interviewer_pk] PRIMARY KEY CLUSTERED 
(
	[InterviewScheduleID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewSchedule]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewSchedule](
	[InterviewScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleTitle] [nvarchar](255) NOT NULL,
	[JobID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
	[ScheduleDateFrom] [datetime] NOT NULL,
	[ScheduleDateTo] [datetime] NOT NULL,
	[Location] [nvarchar](255) NULL,
	[UserID] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[MeetingID] [varchar](255) NOT NULL,
	[Result] [varchar](25) NOT NULL,
	[InterviewStatusID] [int] NOT NULL,
 CONSTRAINT [InterviewSchedule_pk] PRIMARY KEY CLUSTERED 
(
	[InterviewScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewStatus]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewStatus](
	[InterviewStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [InterviewStatus_pk] PRIMARY KEY CLUSTERED 
(
	[InterviewStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [nvarchar](255) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[SalarayFrom] [money] NULL,
	[SalaryTo] [money] NULL,
	[WorkingAddress] [nvarchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[createBy] [int] NULL,
 CONSTRAINT [Job_pk] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobBenefits]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobBenefits](
	[JobID] [int] NOT NULL,
	[BenefitID] [int] NOT NULL,
 CONSTRAINT [JobBenefits_pk] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC,
	[BenefitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobLevel]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobLevel](
	[LevelID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
 CONSTRAINT [JobLevel_pk] PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobSkills]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSkills](
	[JobID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
 CONSTRAINT [JobSkills_pk] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Level]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](50) NOT NULL,
 CONSTRAINT [Level_pk] PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offer]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[OfferID] [int] IDENTITY(1,1) NOT NULL,
	[CandidateID] [int] NOT NULL,
	[ContractTypeID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[LevelID] [int] NOT NULL,
	[Approver] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[InterviewScheduleID] [int] NOT NULL,
	[RecuiterOwner] [int] NOT NULL,
	[ContractFrom] [date] NOT NULL,
	[ContractTo] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
	[BasicSalary] [money] NOT NULL,
	[Note] [nvarchar](500) NOT NULL,
	[OfferStatusID] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[LastModified] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [Offer_pk] PRIMARY KEY CLUSTERED 
(
	[OfferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfferStatus]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfferStatus](
	[OfferStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [OfferStatus_pk] PRIMARY KEY CLUSTERED 
(
	[OfferStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](100) NOT NULL,
 CONSTRAINT [Position_pk] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResetPasswordLink]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResetPasswordLink](
	[ResetPasswordID] [varchar](100) NOT NULL,
	[UserID] [int] NOT NULL,
	[LinkGeneratedTime] [datetime] NOT NULL,
	[IsUsed] [bit] NOT NULL,
 CONSTRAINT [ResetPasswordLink_pk] PRIMARY KEY CLUSTERED 
(
	[ResetPasswordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](50) NOT NULL,
 CONSTRAINT [Skill_pk] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Usename] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[DOB] [date] NULL,
	[PhoneNumber] [varchar](15) NULL,
	[UserRoleID] [int] NOT NULL,
	[UserStatusID] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Gender] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [User_pk] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [UserRole_pk] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 4/16/2024 9:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[UserStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](25) NOT NULL,
 CONSTRAINT [UserStatus_pk] PRIMARY KEY CLUSTERED 
(
	[UserStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Benefit] ON 

INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (1, N'Lunch')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (2, N'25-day leave')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (3, N'Healthcare insurance')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (4, N'Hybrid working')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (5, N'Travel')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (6, N'Health Insurance')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (7, N'Healthcare insurance')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (8, N'Healthcare insurance')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (9, N'Healthcare insurance')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (10, N'Hybrid working')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (11, N'Healthcare insurance')
INSERT [dbo].[Benefit] ([BenefitID], [BenefitName]) VALUES (12, N'Hybrid working')
SET IDENTITY_INSERT [dbo].[Benefit] OFF
GO
SET IDENTITY_INSERT [dbo].[Candidate] ON 

INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (4, N'Tran Van Hiep', CAST(N'2003-06-24' AS Date), N'0839699073', N'hieptv.working@gmail.com', N'NA', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 1, N'NA', 2, 5, 1, 1, CAST(N'2023-01-29' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (5, N'Nguyen Van A', CAST(N'2000-02-23' AS Date), N'0843565436', N'anv@mail.com', N'NB', 1, NULL, 2, N'NA', 2, 1, NULL, NULL, CAST(N'2023-01-29' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (6, N'John Doe', CAST(N'1990-01-01' AS Date), N'0123456789', N'johndoe@gmail.com', N'1st Street', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 1, N'Pending', 1, 5, NULL, NULL, CAST(N'2023-01-29' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (7, N'Jane Doe', CAST(N'1991-02-02' AS Date), N'0987654321', N'janedoe@gmail.com', N'2nd Street', 2, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 2, N'Interviewed', 1, 3, NULL, NULL, CAST(N'2023-01-29' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (8, N'Peter Smith', CAST(N'1992-03-03' AS Date), N'0123456789', N'petersmith@gmail.com', N'3rd Street', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 1, N'Pending', 1, 10, NULL, NULL, CAST(N'2023-01-29' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (9, N'Sarah Jones', CAST(N'1993-04-04' AS Date), N'0987654321', N'sarahjones@gmail.com', N'4th Street', 2, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 2, N'Interviewed', 1, 2, NULL, NULL, CAST(N'2023-01-29' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (10, N'Michael Brown', CAST(N'1994-05-05' AS Date), N'0123456789', N'michaelbrown@gmail.com', N'5th Street', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 2, N'Interviewed', 7, 7, NULL, NULL, CAST(N'2024-04-14' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (11, N'Ashley Williams', CAST(N'1995-06-06' AS Date), N'0987654321', N'ashleywilliams@gmail.com', N'6th Street', 2, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 2, N'Interviewed', 1, 5, NULL, NULL, CAST(N'2023-01-29' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (12, N'David Miller', CAST(N'1996-07-07' AS Date), N'0123456789', N'davidmiller@gmail.com', N'7th Street', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 1, N'Pending', 1, 1, NULL, NULL, CAST(N'2023-01-29' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (13, N'Jessica Moore', CAST(N'1997-08-08' AS Date), N'0987654321', N'jessicamoore@gmail.com', N'8th Street', 2, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 2, N'Interviewed', 1, 4, NULL, NULL, CAST(N'2024-04-14' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (18, N'John Doeeeee', CAST(N'1990-06-15' AS Date), N'199999', N'john.doe@example.com', N'444 Main Street', 2, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 2, N'Note for candidate', 1, 4, 3, 1, CAST(N'2024-04-10' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (19, N'test1', CAST(N'2024-04-06' AS Date), N'0377212004', N'test1@gmail.com', N'test1', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 2, N'test note', 2, 1, 1, 8, CAST(N'2024-04-13' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (20, N'test2', CAST(N'2024-04-20' AS Date), N'0377212004', N'test2@gmail.com', N'Lala1233333', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34849429-9a19-418d-a222-6cbded56a15a.pdf', 2, N'test2', 1, 4, 1, 8, CAST(N'2024-04-14' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (21, N'Lê Việt Anh', CAST(N'2024-04-26' AS Date), N'0377212003', N'kingofvanhle@gmail.com', N'Lala1233333', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/875e4be4-111c-4d37-955d-a6970d8727f8.pdf', 3, N'FA', 2, 12, 4, 8, CAST(N'2024-04-11' AS Date), 2)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (22, N'Hoàng Chính hhhhh', CAST(N'2024-04-10' AS Date), N'0377212003', N'kingofvanhle@gmail.com', N'Lala1233333', 0, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/4245e7a2-cc70-489a-9c05-6e8d8559fb3f.pdf', 1, N'123', 1, 2, 1, 8, CAST(N'2024-04-15' AS Date), 2)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (23, N'Hoàng Chính hhhhh', CAST(N'2024-04-04' AS Date), N'0377212003', N'kingofvanhle@gmail.com', N'Lala1233333', 0, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/34ead284-0b63-4c47-8157-a03d130cd3c6.pdf', 4, N'test note', 1, 3, 1, 8, CAST(N'2024-04-15' AS Date), 2)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (24, N'Hoàng Chính hhhhhggg', CAST(N'2024-04-05' AS Date), N'0377212004', N'kingofvanhle@gmail.com', N'Lala1233333', 0, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/0ab393c5-8f39-453e-adfc-48bb72f27cba.pdf', 1, N'', 1, 2, 2, 8, CAST(N'2024-04-14' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (25, N'Hoàng Chính Huhu', CAST(N'2024-04-03' AS Date), N'0377212003', N'kingofvanhle@gmail.com', N'Lala12333331232132', 0, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/10bff2df-833d-4d2f-b454-7fb3fe6bd976.pdf', 2, N'', 2, 3, 2, 8, CAST(N'2024-04-15' AS Date), 8)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (26, N'Lê Việt Anh', CAST(N'2024-04-04' AS Date), N'0377212004', N'vanh@gmail.com', N'Lala1233333', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/c91e55ac-9d12-4b9d-8a12-41bf7e88453e.pdf', 2, N'test2', 2, 1, 5, 8, CAST(N'2024-04-15' AS Date), 28)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (27, N'Chung dep trai', CAST(N'2024-04-04' AS Date), N'0234345678', N'chung@gmail.com', N'Lala1233333', 1, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/14644556-63ab-4d02-a8e1-54c6a4728111.pdf', 2, N'test2', 2, 2, 2, 8, CAST(N'2024-04-15' AS Date), 27)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [DOB], [PhoneNumber], [Email], [Address], [Gender], [CVAttachment], [PositionID], [Note], [CandidateStatusID], [YearOfExperience], [HighestLevel], [CreateBy], [LastUpdateAt], [Recruiter]) VALUES (28, N'Hiep huhu', CAST(N'2024-04-01' AS Date), N'0377212005', N'hiep@gmail.com', N'test 55555', 2, N'https://cloudinary-a.akamaihd.net/dml7bkacn/image/upload/v1/CV/9d7a7f77-e48a-4368-a11a-beb840b66be0.pdf', 4, N'123', 1, 3, 1, 8, CAST(N'2024-04-15' AS Date), 28)
SET IDENTITY_INSERT [dbo].[Candidate] OFF
GO
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (4, 1)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (4, 2)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (18, 2)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (18, 3)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (19, 2)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (19, 3)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (19, 4)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (20, 1)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (20, 2)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (22, 2)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (22, 3)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (23, 3)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (23, 4)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (23, 5)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (24, 2)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (24, 3)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (24, 4)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (25, 3)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (25, 5)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (25, 6)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (26, 4)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (26, 5)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (27, 6)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (28, 2)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (28, 3)
INSERT [dbo].[CandidateSkills] ([Candidate_CandidateID], [Skills_SkillID]) VALUES (28, 4)
GO
SET IDENTITY_INSERT [dbo].[CandidateStatus] ON 

INSERT [dbo].[CandidateStatus] ([CandidateStatusID], [StatusName]) VALUES (1, N'Open')
INSERT [dbo].[CandidateStatus] ([CandidateStatusID], [StatusName]) VALUES (2, N'Banned')
INSERT [dbo].[CandidateStatus] ([CandidateStatusID], [StatusName]) VALUES (3, N'Approved Offer')
INSERT [dbo].[CandidateStatus] ([CandidateStatusID], [StatusName]) VALUES (4, N'Rejected Offer')
INSERT [dbo].[CandidateStatus] ([CandidateStatusID], [StatusName]) VALUES (5, N'Waiting for Response')
INSERT [dbo].[CandidateStatus] ([CandidateStatusID], [StatusName]) VALUES (6, N'Accepted Offer')
INSERT [dbo].[CandidateStatus] ([CandidateStatusID], [StatusName]) VALUES (7, N'Declined Offer')
INSERT [dbo].[CandidateStatus] ([CandidateStatusID], [StatusName]) VALUES (8, N'Cancelled Offer')
SET IDENTITY_INSERT [dbo].[CandidateStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ContractType] ON 

INSERT [dbo].[ContractType] ([ContractTypeID], [TypeName]) VALUES (1, N'Trial 2 months')
INSERT [dbo].[ContractType] ([ContractTypeID], [TypeName]) VALUES (2, N'Trainee 3 months')
INSERT [dbo].[ContractType] ([ContractTypeID], [TypeName]) VALUES (3, N'1 year')
INSERT [dbo].[ContractType] ([ContractTypeID], [TypeName]) VALUES (4, N'3 yers and Unlimited')
SET IDENTITY_INSERT [dbo].[ContractType] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (1, N'IT')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (2, N'HR')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (3, N'Finance')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (4, N'Communication')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (5, N'Marketing')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (6, N'Accounting')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
INSERT [dbo].[Interviewer] ([InterviewScheduleID], [UserID]) VALUES (12, 4)
INSERT [dbo].[Interviewer] ([InterviewScheduleID], [UserID]) VALUES (15, 5)
INSERT [dbo].[Interviewer] ([InterviewScheduleID], [UserID]) VALUES (16, 3)
GO
SET IDENTITY_INSERT [dbo].[InterviewSchedule] ON 

INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (12, N'Software Engineer interview', 1, 10, CAST(N'2024-04-09T09:00:00.000' AS DateTime), CAST(N'2024-04-09T17:00:00.000' AS DateTime), N'Ha Noi, Vietnam', 2, N'This is a note', N'meeting_12345', N'Passed', 1)
INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (13, N'Data Scientist interview', 2, 4, CAST(N'2024-04-11T10:00:00.000' AS DateTime), CAST(N'2024-04-11T18:00:00.000' AS DateTime), N'Ha Noi, Vietnam', 1, N'This is a note', N'meeting_23456', N'Passed', 2)
INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (14, N'Product Manager interview', 3, 9, CAST(N'2024-04-12T13:00:00.000' AS DateTime), CAST(N'2024-04-12T15:00:00.000' AS DateTime), N'Da Nang, Vietnam', 4, N'This is a note', N'meeting_34567', N'Passed', 3)
INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (15, N'DevOps Engineer interview', 1, 8, CAST(N'2024-04-15T08:00:00.000' AS DateTime), CAST(N'2024-04-15T12:00:00.000' AS DateTime), N'Ho Chi Minh, Vietnam', 1, N'This is a note', N'meeting_45678', N'Waiting', 4)
INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (16, N'QA Tester interview', 2, 7, CAST(N'2024-04-16T11:00:00.000' AS DateTime), CAST(N'2024-04-16T16:00:00.000' AS DateTime), N'Da Nang, Vietnam', 2, N'hihi', N'meeting_56789', N'Passed', 4)
INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (17, N'Backend Developer interview', 1, 6, CAST(N'2024-04-17T14:00:00.000' AS DateTime), CAST(N'2024-04-17T10:00:00.000' AS DateTime), N'Ha Noi, Vietnam', 5, N'This is a note', N'meeting_67890', N'Failed', 1)
INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (18, N'Full Stack Developer interview', 3, 5, CAST(N'2024-04-18T09:00:00.000' AS DateTime), CAST(N'2024-04-18T13:00:00.000' AS DateTime), N'Ho Chi Minh, Vietnam', 1, N'This is a note', N'meeting_78901', N'Waiting', 3)
INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (19, N'SE', 1, 13, CAST(N'2024-04-10T12:00:00.000' AS DateTime), CAST(N'2024-04-10T12:30:00.000' AS DateTime), N'Ha Noi, Viet Nam', 1, N'Hehe', N'Zone 1', N'Passed', 3)
INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (20, N'BA interview', 1, 4, CAST(N'2024-04-14T11:53:31.997' AS DateTime), CAST(N'2024-04-14T11:53:31.997' AS DateTime), N'Ha Noi', 4, N'Phong van 4 nguoi', N'meeting.com/t22323', N'Approved', 1)
INSERT [dbo].[InterviewSchedule] ([InterviewScheduleID], [ScheduleTitle], [JobID], [CandidateID], [ScheduleDateFrom], [ScheduleDateTo], [Location], [UserID], [Notes], [MeetingID], [Result], [InterviewStatusID]) VALUES (24, N'BA intern', 1, 5, CAST(N'2024-04-15T09:37:23.607' AS DateTime), CAST(N'2024-04-15T09:37:23.607' AS DateTime), N'Da Nang', 2, N'Ngay em ', N'Heee', N'He', 2)
SET IDENTITY_INSERT [dbo].[InterviewSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[InterviewStatus] ON 

INSERT [dbo].[InterviewStatus] ([InterviewStatusID], [StatusName]) VALUES (1, N'New')
INSERT [dbo].[InterviewStatus] ([InterviewStatusID], [StatusName]) VALUES (2, N'Invited')
INSERT [dbo].[InterviewStatus] ([InterviewStatusID], [StatusName]) VALUES (3, N'Interviewed')
INSERT [dbo].[InterviewStatus] ([InterviewStatusID], [StatusName]) VALUES (4, N'Cancelled')
SET IDENTITY_INSERT [dbo].[InterviewStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (1, N'Software Engineer', CAST(N'2023-11-21' AS Date), CAST(N'2025-05-21' AS Date), 80000.0000, 120000.0000, N'Ha Noi', N'Design, develop, and implement software systems.', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (2, N'Data Scientist', CAST(N'2024-02-14' AS Date), CAST(N'2024-08-14' AS Date), 90000.0000, 130000.0000, N'Ha Noi', N'Analyze data to extract insights and develop machine learning models.', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (3, N'Human Resources (HR) Specialist', CAST(N'2023-11-30' AS Date), CAST(N'2025-05-30' AS Date), 70000.0000, 110000.0000, N'Ha Noi', N'Recruit, interview, and hire new employees.', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (4, N'Web developer', CAST(N'2023-02-11' AS Date), CAST(N'2025-02-11' AS Date), 60000.0000, 100000.0000, N'Ha Noi', N'Responsible for designing, developing and maintaining web applications and websites', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (6, N'Software Tester', CAST(N'2024-03-10' AS Date), CAST(N'2025-09-10' AS Date), 60000.0000, 90000.0000, N'Ho Chi Minh', N'Test software applications to ensure quality and functionality', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (7, N'Database Administrator', CAST(N'2023-08-15' AS Date), CAST(N'2025-08-15' AS Date), 85000.0000, 120000.0000, N'Da Nang', N'Manage and maintain databases for optimal performance and security', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (8, N'Business Analyst', CAST(N'2024-01-05' AS Date), CAST(N'2025-07-05' AS Date), 75000.0000, 110000.0000, N'Ha Noi', N'Analyze business processes and requirements to recommend improvements and solutions', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (9, N'Network Engineer', CAST(N'2023-10-20' AS Date), CAST(N'2025-10-20' AS Date), 70000.0000, 100000.0000, N'Ho Chi Minh', N'Design and implement computer networks to ensure efficient data communication', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (10, N'Project Manager', CAST(N'2024-04-01' AS Date), CAST(N'2025-10-01' AS Date), 100000.0000, 150000.0000, N'Ha Noi', N'Oversee project planning, execution, and delivery to meet objectives and deadlines', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (11, N'Software Engineer', CAST(N'2024-04-15' AS Date), CAST(N'2024-12-31' AS Date), 50000.0000, 70000.0000, N'123 Main St, City', N'Develop software applications', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (12, N'sdfsdfdsfsd', CAST(N'0003-02-02' AS Date), CAST(N'0003-03-02' AS Date), 2.0000, 3.0000, N'2', N'a', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (13, N'sdfsdfdsfsd', CAST(N'0003-02-02' AS Date), CAST(N'0004-03-02' AS Date), 2.0000, 3.0000, N'23424', N'a', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (14, N'dcfsfsfsf', CAST(N'2002-04-23' AS Date), CAST(N'3000-05-31' AS Date), 234235.0000, 34535.0000, N'gdgfg', N'dgfgdfg', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (15, N'Tester', CAST(N'2024-04-14' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'heheeaksbflakj fbas
', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (16, N'Tester', CAST(N'2024-04-14' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'heheeaksbflakj fbas
', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (17, N'gvghvgv', CAST(N'2024-04-12' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'hb', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (18, N'Software Engineer', CAST(N'2024-04-15' AS Date), CAST(N'2024-12-31' AS Date), 50000.0000, 80000.0000, N'123 Main St, City, Country', N'Seeking a skilled software engineer to join our team.', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (19, N'Tester', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-11' AS Date), 5000.0000, 100000.0000, N'đầ', N'đá
', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (20, N'Testerrrrr ', CAST(N'2024-04-14' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'test1 này
', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (21, N'Testerrrrr ', CAST(N'2024-04-14' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'test1 này
', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (22, N'Testerrrrr ', CAST(N'2024-04-14' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'test1 này
', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (23, N'Testetest2 ', CAST(N'2024-04-05' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'đá ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (24, N'Testetest2 ', CAST(N'2024-04-05' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'đá ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (25, N'Testetest2 ', CAST(N'2024-04-05' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'đá ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (26, N'Testetest2 ', CAST(N'2024-04-05' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'đá ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (27, N'Testetest2 ', CAST(N'2024-04-05' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'đá ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (28, N'Testetestdábfaifb  ', CAST(N'2024-04-14' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'ád ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (29, N'Testetestdábfaifb  ', CAST(N'2024-04-14' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'ád ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (30, N'Testetestdábfaifb  ', CAST(N'2024-04-14' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'ád ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (31, N'Testetestdábfaifb  ', CAST(N'2024-04-14' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'ád ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (32, N'Tester', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-11' AS Date), 5000.0000, 100000.0000, N'đầ', N'đá
', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (33, N'gvghvgv', CAST(N'2024-04-12' AS Date), CAST(N'2024-04-28' AS Date), 5000.0000, 100000.0000, N'hà nội', N'hb', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (34, N'Testetest2341234', CAST(N'2024-04-07' AS Date), CAST(N'2024-04-21' AS Date), 5000.0000, 100000.0000, N'hà nội', N'dkb ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (35, N'Testetest2341234', CAST(N'2024-04-07' AS Date), CAST(N'2024-04-21' AS Date), 5000.0000, 100000.0000, N'hà nội', N'dkb ', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (36, N'Alo', CAST(N'2024-04-06' AS Date), CAST(N'2024-04-11' AS Date), 2000000.0000, 500000.0000, N'sfsfsf', N'cong viec', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (37, N'hello', CAST(N'2024-04-12' AS Date), CAST(N'2024-04-03' AS Date), 2000000.0000, 100000.0000, N'hà nội', N'ee', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (38, N'meo', CAST(N'2024-04-20' AS Date), CAST(N'2024-04-05' AS Date), 5000.0000, 100000.0000, N'hà nội', N'hello', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (39, N'meo121', CAST(N'2024-04-07' AS Date), CAST(N'2024-04-13' AS Date), 5000.0000, 500000.0000, N'hà nội', N'ưe', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (40, N'Software Engineer4555', CAST(N'2024-04-15' AS Date), CAST(N'2024-12-31' AS Date), 50000.0000, 80000.0000, N'123 Main St, City, Country', N'Description of the job', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (41, N'Software Engineer', CAST(N'2024-04-15' AS Date), CAST(N'2024-12-31' AS Date), 50000.0000, 80000.0000, N'123 Main St, City, Country', N'Seeking a skilled software engineer to join our team.', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (42, N'hello11111', CAST(N'2024-04-06' AS Date), CAST(N'2024-04-09' AS Date), 3000000.0000, 5000000000.0000, N'ha noi', N'meo', 0, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (43, N'Software Engineer', CAST(N'2024-04-15' AS Date), CAST(N'2024-12-31' AS Date), 50000.0000, 80000.0000, N'123 Main Street', N'We are hiring a software engineer.', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (44, N'Software Engineer', CAST(N'2024-04-15' AS Date), CAST(N'2024-12-31' AS Date), 50000.0000, 80000.0000, N'123 Main Street', N'We are hiring a software engineer.', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (45, N'Software Engineer', CAST(N'2024-04-15' AS Date), CAST(N'2024-12-31' AS Date), 50000.0000, 80000.0000, N'123 Main Street', N'We are hiring a software engineer.', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (46, N'Software Engineer', CAST(N'2024-04-15' AS Date), CAST(N'2024-12-31' AS Date), 50000.0000, 80000.0000, N'123 Main Street', N'We are hiring a software engineer.', 1, NULL)
INSERT [dbo].[Job] ([JobID], [JobTitle], [StartDate], [EndDate], [SalarayFrom], [SalaryTo], [WorkingAddress], [Description], [Status], [createBy]) VALUES (47, N'Software Engineer meomeo', CAST(N'2024-04-15' AS Date), CAST(N'2024-12-31' AS Date), 50000.0000, 80000.0000, N'123 Main Street', N'We are hiring a software engineer.', 1, NULL)
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (1, 4)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (1, 5)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (2, 5)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (3, 1)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (3, 3)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (4, 1)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (4, 4)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (6, 2)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (6, 4)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (7, 2)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (7, 3)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (8, 3)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (8, 5)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (9, 1)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (9, 4)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (10, 2)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (10, 5)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (46, 9)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (46, 10)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (47, 11)
INSERT [dbo].[JobBenefits] ([JobID], [BenefitID]) VALUES (47, 12)
GO
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (1, 4)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (1, 6)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (2, 1)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (2, 2)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (2, 12)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (3, 7)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (4, 8)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (5, 9)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (5, 10)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (6, 3)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (7, 43)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (8, 44)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (9, 45)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (10, 46)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (11, 12)
INSERT [dbo].[JobLevel] ([LevelID], [JobID]) VALUES (11, 47)
GO
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (1, 1)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (4, 2)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (1, 3)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (6, 4)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (10, 4)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (8, 5)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (3, 6)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (9, 6)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (2, 7)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (7, 8)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (46, 9)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (46, 10)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (47, 11)
INSERT [dbo].[JobSkills] ([JobID], [SkillID]) VALUES (47, 12)
GO
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (1, N'Fresher')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (2, N'Junior')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (3, N'Senior')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (4, N'Leader')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (5, N'Manager')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (6, N'Vice Head')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (7, N'Senior')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (8, N'Senior')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (9, N'Senior')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (10, N'Senior')
INSERT [dbo].[Level] ([LevelID], [LevelName]) VALUES (11, N'Senior')
SET IDENTITY_INSERT [dbo].[Level] OFF
GO
SET IDENTITY_INSERT [dbo].[Offer] ON 

INSERT [dbo].[Offer] ([OfferID], [CandidateID], [ContractTypeID], [PositionID], [LevelID], [Approver], [DepartmentID], [InterviewScheduleID], [RecuiterOwner], [ContractFrom], [ContractTo], [DueDate], [BasicSalary], [Note], [OfferStatusID], [ModifiedBy], [LastModified], [CreatedAt]) VALUES (6, 4, 2, 1, 1, 5, 1, 13, 5, CAST(N'2024-04-08' AS Date), CAST(N'2025-04-30' AS Date), CAST(N'2024-04-30' AS Date), 1000000000.0000, N'', 6, 3, CAST(N'2024-04-11T12:30:00.000' AS DateTime), CAST(N'2024-04-11T12:30:00.000' AS DateTime))
INSERT [dbo].[Offer] ([OfferID], [CandidateID], [ContractTypeID], [PositionID], [LevelID], [Approver], [DepartmentID], [InterviewScheduleID], [RecuiterOwner], [ContractFrom], [ContractTo], [DueDate], [BasicSalary], [Note], [OfferStatusID], [ModifiedBy], [LastModified], [CreatedAt]) VALUES (7, 9, 1, 2, 2, 4, 1, 14, 4, CAST(N'2024-04-08' AS Date), CAST(N'2026-04-30' AS Date), CAST(N'2024-04-30' AS Date), 1000000000.0000, N'', 2, 2, CAST(N'2024-04-11T12:30:00.000' AS DateTime), CAST(N'2024-04-11T12:30:00.000' AS DateTime))
INSERT [dbo].[Offer] ([OfferID], [CandidateID], [ContractTypeID], [PositionID], [LevelID], [Approver], [DepartmentID], [InterviewScheduleID], [RecuiterOwner], [ContractFrom], [ContractTo], [DueDate], [BasicSalary], [Note], [OfferStatusID], [ModifiedBy], [LastModified], [CreatedAt]) VALUES (8, 10, 3, 1, 3, 4, 4, 19, 8, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-24' AS Date), CAST(N'2024-04-11' AS Date), 200000000.0000, N'Dep trai', 6, 34, CAST(N'2024-04-14T16:14:15.823' AS DateTime), CAST(N'2024-04-11T12:30:00.000' AS DateTime))
INSERT [dbo].[Offer] ([OfferID], [CandidateID], [ContractTypeID], [PositionID], [LevelID], [Approver], [DepartmentID], [InterviewScheduleID], [RecuiterOwner], [ContractFrom], [ContractTo], [DueDate], [BasicSalary], [Note], [OfferStatusID], [ModifiedBy], [LastModified], [CreatedAt]) VALUES (11, 7, 3, 2, 5, 5, 4, 16, 8, CAST(N'2024-04-11' AS Date), CAST(N'2024-09-07' AS Date), CAST(N'2024-04-15' AS Date), 33333333.0000, N'', 1, 34, CAST(N'2024-04-14T15:51:25.810' AS DateTime), CAST(N'2024-04-11T12:30:00.000' AS DateTime))
INSERT [dbo].[Offer] ([OfferID], [CandidateID], [ContractTypeID], [PositionID], [LevelID], [Approver], [DepartmentID], [InterviewScheduleID], [RecuiterOwner], [ContractFrom], [ContractTo], [DueDate], [BasicSalary], [Note], [OfferStatusID], [ModifiedBy], [LastModified], [CreatedAt]) VALUES (15, 13, 3, 1, 1, 4, 2, 19, 29, CAST(N'2024-04-15' AS Date), CAST(N'2024-04-18' AS Date), CAST(N'2024-04-15' AS Date), 33333333.0000, N'', 1, 34, CAST(N'2024-04-15T00:58:21.393' AS DateTime), CAST(N'2024-04-15T00:50:36.303' AS DateTime))
SET IDENTITY_INSERT [dbo].[Offer] OFF
GO
SET IDENTITY_INSERT [dbo].[OfferStatus] ON 

INSERT [dbo].[OfferStatus] ([OfferStatusID], [StatusName]) VALUES (1, N'Waiting for Approval')
INSERT [dbo].[OfferStatus] ([OfferStatusID], [StatusName]) VALUES (2, N'Approved')
INSERT [dbo].[OfferStatus] ([OfferStatusID], [StatusName]) VALUES (3, N'Rejected')
INSERT [dbo].[OfferStatus] ([OfferStatusID], [StatusName]) VALUES (4, N'Waiting for Response')
INSERT [dbo].[OfferStatus] ([OfferStatusID], [StatusName]) VALUES (5, N'Accepted Offer')
INSERT [dbo].[OfferStatus] ([OfferStatusID], [StatusName]) VALUES (6, N'Declined Offer')
INSERT [dbo].[OfferStatus] ([OfferStatusID], [StatusName]) VALUES (7, N'Cancelled')
SET IDENTITY_INSERT [dbo].[OfferStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (1, N'Backend Developer')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (2, N'Business Analyst')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (3, N'Tester')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (4, N'HR')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (5, N'Project manager')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (6, N'DevOps')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (7, N'Software Engineer')
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
INSERT [dbo].[ResetPasswordLink] ([ResetPasswordID], [UserID], [LinkGeneratedTime], [IsUsed]) VALUES (N'g-Gk8XQyVe532O_yyRcj1hEltld6XmHj', 27, CAST(N'2024-04-15T09:46:51.130' AS DateTime), 1)
INSERT [dbo].[ResetPasswordLink] ([ResetPasswordID], [UserID], [LinkGeneratedTime], [IsUsed]) VALUES (N'Sa7pBaF65cqWU7WyswS3y8nfQV1jHXNT', 8, CAST(N'2024-04-10T11:22:55.207' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (1, N'Java')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (2, N'Nodejs')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (3, N'.NET')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (4, N'C++')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (5, N'Business analysis')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (6, N'Communication')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (7, N'Data Analysis')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (8, N'Database Management')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (9, N'Java')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (10, N'JavaScript')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (11, N'Java')
INSERT [dbo].[Skill] ([SkillID], [SkillName]) VALUES (12, N'JavaScript')
SET IDENTITY_INSERT [dbo].[Skill] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (1, N'', N'Huynv1', N'NewPassword', CAST(N'1990-01-01' AS Date), N'0911111111', 3, 1, N'anhnphe170999@fpt.edu.vn', N'Dương Liễu, Hoài Đức', 1, 2, N'New note')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (2, N'Trần Thị Lan', N'lantt', N'password456', CAST(N'1995-02-02' AS Date), N'0987654321', 2, 1, N'lantt@gmail.com', N'Da Nang, Vietnam', 2, 2, N'This is a note')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (3, N'Lê Văn Việt', N'vietlv', N'password789', CAST(N'2000-03-03' AS Date), N'0129876543', 3, 2, N'vietlv@gmail.com', N'Ho Chi Minh, Vietnam', 1, 1, N'This is a note')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (4, N'Pham Thị Duyên', N'duyenpt', N'password012', CAST(N'1992-04-04' AS Date), N'0987456321', 4, 1, N'hieptran.pa@gmail.com', N'Can Tho, Vietnam', 2, 3, N'This is a note')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (5, N'Đặng Văn Lâm Lâm', N'lamdvl', N'password345', CAST(N'1985-05-05' AS Date), N'0147856321', 4, 2, N'hieptvhe173252@gmail.com', N'Quang Ninh, Vietnam', 1, 2, N'This is a note')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (6, N'Hoàng Thị Ninh', N'ninhht', N'password678', CAST(N'1998-06-06' AS Date), N'0968547321', 4, 2, N'ninhht@gmail.com', N'Thai Binh, Vietnam', 2, 1, N'This is a note')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (8, N'Trần Văn Hiệp', N'hieptv', N'Matkhau123123@', CAST(N'2003-06-24' AS Date), N'0839699073', 2, 1, N'hieptran.pa@gmail.com', N'Nghe An, Viet Nam', 1, 1, N'NA')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (26, N'Đoàn Thành Chung', N'chungdt3', N'5Uy-FP9wS^', CAST(N'2002-05-11' AS Date), N'0949602355', 1, 1, N'doanthanhchung03nb@gmail.com', N'toa nha HolaGate, tan xa, Hanoi', 1, 2, N'nothing')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (27, N'Lê Việt Anh', N'anhlv', N'Matkhau123@', CAST(N'2024-03-06' AS Date), N'0949602355', 3, 1, N'levietanh20033002@gmail.com', N'tan xa, Hanoi', 2, 1, N'nothing')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (28, N'Đỗ Đức Thiện', N'thiendd', N'+6GY@y04@x', CAST(N'2024-04-19' AS Date), N'0949602355', 2, 1, N'xichung1994@gmail.com', N'tan xa, Hanoi', 1, 3, N'ko noi')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (29, N'Nguyễn Xuân Phi', N'phinx', N'8#aHpY6&_T', CAST(N'2024-04-10' AS Date), N'0949602355', 2, 1, N'phinxhe170131@fpt.edu.vn', N'tan xa, Hanoi', 1, 3, N'nothing')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (30, N'Lê Việt Em Anh Chung', N'chunglvea', N'0e!D3A&FIn', CAST(N'2024-04-19' AS Date), N'0949602355', 3, 1, N'emlv@gmail.com', N'tan xa2345, Hanoi', 1, 3, N'nothing123')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (32, N'Đoàn Thành Chung', N'chungdt2', N'e-3RniLJe$', CAST(N'2024-04-19' AS Date), N'0949602355', 3, 1, N'nmtrung310@gmail.com', N'tan xa, Hanoi', 2, 5, N'N/A')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (33, N'Đoàn Thành Chung', N'chungdt3', N'Tyrd_7<!m8', CAST(N'2024-05-03' AS Date), N'0949602355', 1, 1, N'chungdthe176077@fpt.edu.vn', N'toa nha HolaGate, tan xa234, Hanoi', 1, 2, N'nothing')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (34, N'Hoàng Tuấn Anh', N'anhht', N'-uRYG#vFX9', CAST(N'2024-04-17' AS Date), N'0911111111', 1, 1, N'tuanballbooo@gmail.com', N'tan xa, Hanoi', 1, 3, N'N/A')
INSERT [dbo].[User] ([UserID], [FullName], [Usename], [Password], [DOB], [PhoneNumber], [UserRoleID], [UserStatusID], [Email], [Address], [Gender], [DepartmentID], [Note]) VALUES (35, N'Trần Văn Hiệp 2', N'2tvh', N'RVNLyF6Xx*', CAST(N'2024-04-11' AS Date), N'0911111111', 1, 2, N'hieptvhe173252@gmail.com', N'tan xa, Hanoi', 1, 1, N'N/A')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([UserRoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([UserRoleID], [RoleName]) VALUES (2, N'Recuiter')
INSERT [dbo].[UserRole] ([UserRoleID], [RoleName]) VALUES (3, N'Interviewer')
INSERT [dbo].[UserRole] ([UserRoleID], [RoleName]) VALUES (4, N'Manager')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[UserStatus] ON 

INSERT [dbo].[UserStatus] ([UserStatusID], [StatusName]) VALUES (1, N'Active')
INSERT [dbo].[UserStatus] ([UserStatusID], [StatusName]) VALUES (2, N'Inactive')
SET IDENTITY_INSERT [dbo].[UserStatus] OFF
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [Candidate_CandidateStatus] FOREIGN KEY([CandidateStatusID])
REFERENCES [dbo].[CandidateStatus] ([CandidateStatusID])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [Candidate_CandidateStatus]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [Candidate_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [Candidate_Position]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Level] FOREIGN KEY([HighestLevel])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [FK_Candidate_Level]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_User] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [FK_Candidate_User]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_User1] FOREIGN KEY([Recruiter])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [FK_Candidate_User1]
GO
ALTER TABLE [dbo].[CandidateSkills]  WITH CHECK ADD  CONSTRAINT [CandidateSkills_Candidate] FOREIGN KEY([Candidate_CandidateID])
REFERENCES [dbo].[Candidate] ([CandidateID])
GO
ALTER TABLE [dbo].[CandidateSkills] CHECK CONSTRAINT [CandidateSkills_Candidate]
GO
ALTER TABLE [dbo].[CandidateSkills]  WITH CHECK ADD  CONSTRAINT [CandidateSkills_Skills] FOREIGN KEY([Skills_SkillID])
REFERENCES [dbo].[Skill] ([SkillID])
GO
ALTER TABLE [dbo].[CandidateSkills] CHECK CONSTRAINT [CandidateSkills_Skills]
GO
ALTER TABLE [dbo].[Interviewer]  WITH CHECK ADD  CONSTRAINT [Interviewer_InterviewSchedule] FOREIGN KEY([InterviewScheduleID])
REFERENCES [dbo].[InterviewSchedule] ([InterviewScheduleID])
GO
ALTER TABLE [dbo].[Interviewer] CHECK CONSTRAINT [Interviewer_InterviewSchedule]
GO
ALTER TABLE [dbo].[Interviewer]  WITH CHECK ADD  CONSTRAINT [Interviewer_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Interviewer] CHECK CONSTRAINT [Interviewer_User]
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD  CONSTRAINT [InterviewSchedule_Candidate] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[Candidate] ([CandidateID])
GO
ALTER TABLE [dbo].[InterviewSchedule] CHECK CONSTRAINT [InterviewSchedule_Candidate]
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD  CONSTRAINT [InterviewSchedule_InterviewStatus] FOREIGN KEY([InterviewStatusID])
REFERENCES [dbo].[InterviewStatus] ([InterviewStatusID])
GO
ALTER TABLE [dbo].[InterviewSchedule] CHECK CONSTRAINT [InterviewSchedule_InterviewStatus]
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD  CONSTRAINT [InterviewSchedule_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[InterviewSchedule] CHECK CONSTRAINT [InterviewSchedule_Job]
GO
ALTER TABLE [dbo].[InterviewSchedule]  WITH CHECK ADD  CONSTRAINT [InterviewSchedule_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[InterviewSchedule] CHECK CONSTRAINT [InterviewSchedule_User]
GO
ALTER TABLE [dbo].[JobBenefits]  WITH CHECK ADD  CONSTRAINT [JobBenefits_Benefit] FOREIGN KEY([BenefitID])
REFERENCES [dbo].[Benefit] ([BenefitID])
GO
ALTER TABLE [dbo].[JobBenefits] CHECK CONSTRAINT [JobBenefits_Benefit]
GO
ALTER TABLE [dbo].[JobBenefits]  WITH CHECK ADD  CONSTRAINT [JobBenefits_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobBenefits] CHECK CONSTRAINT [JobBenefits_Job]
GO
ALTER TABLE [dbo].[JobLevel]  WITH CHECK ADD  CONSTRAINT [JobLevel_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobLevel] CHECK CONSTRAINT [JobLevel_Job]
GO
ALTER TABLE [dbo].[JobLevel]  WITH CHECK ADD  CONSTRAINT [JobLevel_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[JobLevel] CHECK CONSTRAINT [JobLevel_Level]
GO
ALTER TABLE [dbo].[JobSkills]  WITH CHECK ADD  CONSTRAINT [JobSkills_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[JobSkills] CHECK CONSTRAINT [JobSkills_Job]
GO
ALTER TABLE [dbo].[JobSkills]  WITH CHECK ADD  CONSTRAINT [JobSkills_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([SkillID])
GO
ALTER TABLE [dbo].[JobSkills] CHECK CONSTRAINT [JobSkills_Skill]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_Candidate_Approver] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[Candidate] ([CandidateID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_Candidate_Approver]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_ContractType] FOREIGN KEY([ContractTypeID])
REFERENCES [dbo].[ContractType] ([ContractTypeID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_ContractType]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_CreatedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_CreatedBy]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_Department]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_InterviewSchedule] FOREIGN KEY([InterviewScheduleID])
REFERENCES [dbo].[InterviewSchedule] ([InterviewScheduleID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_InterviewSchedule]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_Level]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_OfferStatus] FOREIGN KEY([OfferStatusID])
REFERENCES [dbo].[OfferStatus] ([OfferStatusID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_OfferStatus]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_Position]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_User] FOREIGN KEY([Approver])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_User]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [Offer_User_RecuiterOwner] FOREIGN KEY([RecuiterOwner])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [Offer_User_RecuiterOwner]
GO
ALTER TABLE [dbo].[ResetPasswordLink]  WITH CHECK ADD  CONSTRAINT [ResetPasswordLink_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ResetPasswordLink] CHECK CONSTRAINT [ResetPasswordLink_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [User_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [User_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([UserRoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [User_UserRole]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [User_UserStatus] FOREIGN KEY([UserStatusID])
REFERENCES [dbo].[UserStatus] ([UserStatusID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [User_UserStatus]
GO
USE [master]
GO
ALTER DATABASE [InterviewSystem] SET  READ_WRITE 
GO
