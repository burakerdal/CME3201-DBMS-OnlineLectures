USE [master]
GO

/****** Object:  Database [OnlineLectures]    Script Date: 8.04.2021 11:50:25 ******/
CREATE DATABASE [OnlineLectures]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineLectures', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OnlineLectures.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineLectures_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OnlineLectures_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineLectures].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [OnlineLectures] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [OnlineLectures] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [OnlineLectures] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [OnlineLectures] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [OnlineLectures] SET ARITHABORT OFF 
GO

ALTER DATABASE [OnlineLectures] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [OnlineLectures] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [OnlineLectures] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [OnlineLectures] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [OnlineLectures] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [OnlineLectures] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [OnlineLectures] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [OnlineLectures] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [OnlineLectures] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [OnlineLectures] SET  DISABLE_BROKER 
GO

ALTER DATABASE [OnlineLectures] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [OnlineLectures] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [OnlineLectures] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [OnlineLectures] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [OnlineLectures] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [OnlineLectures] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [OnlineLectures] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [OnlineLectures] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [OnlineLectures] SET  MULTI_USER 
GO

ALTER DATABASE [OnlineLectures] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [OnlineLectures] SET DB_CHAINING OFF 
GO

ALTER DATABASE [OnlineLectures] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [OnlineLectures] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [OnlineLectures] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [OnlineLectures] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [OnlineLectures] SET QUERY_STORE = OFF
GO

ALTER DATABASE [OnlineLectures] SET  READ_WRITE 
GO
/****** CREATE TABLES ******/
USE [OnlineLectures]
GO

/****** Object:  Table [dbo].[User]    Script Date: 8.04.2021 12:02:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserType] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [OnlineLectures]
GO

/****** Object:  Table [dbo].[Teacher]    Script Date: 8.04.2021 12:03:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Teacher](
	[Tnickname] [nvarchar](50) NOT NULL,
	[Tname] [nvarchar](50) NOT NULL,
	[Tgender] [nvarchar](50) NOT NULL,
	[TAge] [int] NOT NULL,
	[TEducationLevel] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Tnickname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [OnlineLectures]
GO

/****** Object:  Table [dbo].[Student]    Script Date: 8.04.2021 12:03:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Student](
	[Snickname] [nvarchar](50) NOT NULL,
	[Sname] [nvarchar](50) NOT NULL,
	[Sgender] [nvarchar](50) NOT NULL,
	[SAge] [int] NOT NULL,
	[SEducationLevel] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Snickname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [OnlineLectures]
GO

/****** Object:  Table [dbo].[StCourses]    Script Date: 8.04.2021 12:04:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StCourses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Snickname] [nvarchar](50) NOT NULL,
	[Cname] [nvarchar](50) NOT NULL,
	[Cteacher] [nvarchar](50) NOT NULL,
	[Clevel] [nvarchar](50) NOT NULL,
	[Ccost] [int] NOT NULL,
 CONSTRAINT [PK_StCourses_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [OnlineLectures]
GO

/****** Object:  Table [dbo].[Lecture]    Script Date: 8.04.2021 12:04:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Lecture](
	[Lname] [nvarchar](50) NOT NULL,
	[Llevel] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Lecture] PRIMARY KEY CLUSTERED 
(
	[Lname] ASC,
	[Llevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [OnlineLectures]
GO

/****** Object:  Table [dbo].[Course]    Script Date: 8.04.2021 12:05:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Cname] [nvarchar](50) NOT NULL,
	[Cteacher] [nvarchar](50) NOT NULL,
	[Clevel] [nvarchar](50) NOT NULL,
	[Ccost] [int] NOT NULL,
 CONSTRAINT [PK_Course_1] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** CREATE PROCEDURES ******/

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[IsUserValid]    Script Date: 8.04.2021 12:09:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IsUserValid] @nickname nvarchar(50), @password nvarchar(50),@type nvarchar(50)
AS
    -- Insert statements for procedure here
	SELECT UserID, UserName, UserType, Password
	FROM [dbo].[User]
	WHERE UserName=@nickname and Password=@password and UserType=@type
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spUserInsert]    Script Date: 8.04.2021 12:09:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUserInsert] 
	@username nvarchar(50),
	@usertype nvarchar(50),
	@password nvarchar(50)
AS
declare @result int
declare @control int

begin
    SELECT @control=COUNT(*) FROM [dbo].[User] WHERE UserName = @username

	IF @control >0 
	   set @result = 0
	ELSE
	   begin
	   insert into [dbo].[User]([UserName],[UserType],[Password]) values(@username,@usertype,@password)
	   set @result = 1
	   end 

	return @result
end
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spStudentInsert]    Script Date: 8.04.2021 12:11:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spStudentInsert]
     @nickname nvarchar(50),
	 @name nvarchar(50),
	 @gender nvarchar(50),
	 @age int,
	 @educationlevel nvarchar(50)
AS
BEGIN
	INSERT INTO [dbo].[Student]([Snickname],[Sname],[Sgender],[SAge],[SEducationLevel]) values (@nickname, @name, @gender, @age, @educationlevel)
END
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spStudentName]    Script Date: 8.04.2021 12:11:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spStudentName]
@nickname nvarchar(50) 
AS
BEGIN
	Select Sname from [dbo].[Student] where Snickname=@nickname
END
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spStudentUpdate]    Script Date: 8.04.2021 12:12:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spStudentUpdate]
	 @nickname nvarchar(50),
	 @name nvarchar(50),
	 @gender nvarchar(50),
	 @age int,
	 @educationlevel nvarchar(50)
AS
BEGIN
    UPDATE [dbo].[Student]
	SET  Sname=@name, Sgender=@gender, SAge=@age, SEducationLevel=@educationlevel 
	WHERE Snickname=@nickname
END
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spTeacherInsert]    Script Date: 8.04.2021 12:13:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeacherInsert]
     @nickname nvarchar(50),
	 @name nvarchar(50),
	 @gender nvarchar(50),
	 @age int,
	 @educationlevel nvarchar(50)
AS
BEGIN
	INSERT INTO [dbo].[Teacher]([Tnickname],[Tname],[Tgender],[TAge],[TEducationLevel]) VALUES (@nickname, @name, @gender, @age, @educationlevel)
END
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spTeacherName]    Script Date: 8.04.2021 12:13:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeacherName]
@nickname nvarchar(50) 
AS
BEGIN
	Select Tname from [dbo].[Teacher] where Tnickname=@nickname
END 

GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spTeacherUpdate]    Script Date: 8.04.2021 12:13:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeacherUpdate]
	 @nickname nvarchar(50),
	 @name nvarchar(50),
	 @gender nvarchar(50),
	 @age int,
	 @educationlevel nvarchar(50)
AS
BEGIN
    UPDATE [dbo].[Teacher]
	SET  Tname=@name, Tgender=@gender, TAge=@age, TEducationLevel=@educationlevel 
	WHERE Tnickname=@nickname
END
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spCourseInsert]    Script Date: 8.04.2021 12:15:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCourseInsert] 
	 @cname nvarchar(50),
	 @cteacher nvarchar(50),
	 @clevel nvarchar(50),
	 @cost int
	 
AS

declare @result int
declare @control int

begin
    SELECT @control= COUNT(*) FROM [dbo].[Course] WHERE Cname = @cname AND Cteacher = @cteacher

	IF @control >0 
	   set @result = 0
	ELSE
	   begin
	   INSERT INTO [dbo].[Course] ([Cname],[Cteacher],[Clevel],[Ccost]) VALUES (@cname,@cteacher,@clevel,@cost)
	   set @result = 1
	   end 

	return @result
end
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spListCourse]    Script Date: 8.04.2021 12:16:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spListCourse]
AS
BEGIN
	Select Cname,Cteacher,Clevel,Ccost
	from [dbo].[Course]
END
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spListCourseTeacher]    Script Date: 8.04.2021 12:16:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spListCourseTeacher]
	@tnickname nvarchar(50)	
AS
BEGIN
	Select CourseID,Cname,Clevel,Ccost
	from [dbo].[Course]
	where Cteacher =@tnickname
END
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spListStudent]    Script Date: 8.04.2021 12:16:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spListStudent] 
	
AS
	SELECT * FROM [dbo].[Student]
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spListTeacher]    Script Date: 8.04.2021 12:17:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spListTeacher]
	
AS	
	SELECT * FROM [dbo].[Teacher]
GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spSelectCourseCost]    Script Date: 8.04.2021 12:17:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectCourseCost] 
	@level nvarchar(50),
    @cname nvarchar(50),
    @cteacher nvarchar(50)
AS
BEGIN
	
	Select Ccost
	From [dbo].[Course]
	Where Clevel = @level and Cname = @cname and Cteacher = @cteacher
END

GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spSelectCourseTeacher]    Script Date: 8.04.2021 12:18:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectCourseTeacher]
	@level nvarchar(50),
	@cname nvarchar(50)
AS
BEGIN
	    Select Cteacher 
	    From [dbo].[Course]
        where Clevel=@level and Cname = @cname
	
END

GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spSelectLecture]    Script Date: 8.04.2021 12:18:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectLecture] 
	@level nvarchar(50)
AS
BEGIN
	Select Lname from [dbo].[Lecture] where Llevel=@level
END

GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spSelectStCourses]    Script Date: 8.04.2021 12:19:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectStCourses]
	@snickname nvarchar(50)
	
AS
BEGIN
	
	SELECT Cname,Cteacher,Clevel,Ccost FROM [dbo].[StCourses]
	WHERE Snickname = @snickname
END

GO

USE [OnlineLectures]
GO

/****** Object:  StoredProcedure [dbo].[spStCoursesInsert]    Script Date: 8.04.2021 12:19:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spStCoursesInsert]
	@snickname nvarchar(50),
	@cname nvarchar(50),
	@cteacher nvarchar(50),
	@clevel nvarchar(50),
	@ccost int
AS
BEGIN
	
	INSERT INTO [dbo].[StCourses] ([Snickname],[Cname],[Cteacher],[Clevel],[Ccost]) 
	VALUES (@snickname,@cname,@cteacher,@clevel,@ccost)
END

GO

/****** INSERT TABLES ******/

USE [OnlineLectures]
GO

INSERT INTO [dbo].[User]([UserName],[UserType],[Password])VALUES('herikmen','Öğretmen','123')
INSERT INTO [dbo].[User]([UserName],[UserType],[Password])VALUES('htahta','Öğretmen','123')
INSERT INTO [dbo].[User]([UserName],[UserType],[Password])VALUES('ebekmezci','Öğretmen','123')
INSERT INTO [dbo].[User]([UserName],[UserType],[Password])VALUES('karub','Öğrenci','123')

INSERT INTO [dbo].[Teacher]([Tnickname],[Tname],[Tgender],[TAge],[TEducationLevel])VALUES('herikmen','Hayrettin Erikmen','Erkek',40,'İlkokul')
INSERT INTO [dbo].[Teacher]([Tnickname],[Tname],[Tgender],[TAge],[TEducationLevel])VALUES('htahta','Hatice Tahta','Kadın',35,'Ortaokul')
INSERT INTO [dbo].[Teacher]([Tnickname],[Tname],[Tgender],[TAge],[TEducationLevel])VALUES('ebekmezci','Ebru Bekmezci','Kadın',34,'Lise')

INSERT INTO [dbo].[Course]([Cname],[Cteacher],[Clevel],[Ccost])VALUES('Temel Matematik','Hayrettin Erikmen','İlkokul',20)
INSERT INTO [dbo].[Course]([Cname],[Cteacher],[Clevel],[Ccost])VALUES('Sosyal Bilgiler','Hatice Tahta','Ortaokul',18)
INSERT INTO [dbo].[Course]([Cname],[Cteacher],[Clevel],[Ccost])VALUES('Biyoloji','Ebru Bekmezci','Lise',22)

INSERT INTO [dbo].[Student]([Snickname],[Sname],[Sgender],[SAge],[SEducationLevel])VALUES('karub','Burak Erdal','Erkek',18,'Lise')

INSERT INTO [dbo].[Lecture]([Lname],[Llevel])VALUES('Temel Matematik','İlkokul')
INSERT INTO [dbo].[Lecture]([Lname],[Llevel])VALUES('Sosyal Bilgiler','Ortaokul')
INSERT INTO [dbo].[Lecture]([Lname],[Llevel])VALUES('Biyoloji','Lise')

TRUNCATE TABLE [dbo].[User]
TRUNCATE TABLE [dbo].[Teacher]
TRUNCATE TABLE [dbo].[Student]
TRUNCATE TABLE [dbo].[StCourses]
TRUNCATE TABLE [dbo].[Lecture]
TRUNCATE TABLE [dbo].[Course]


GO