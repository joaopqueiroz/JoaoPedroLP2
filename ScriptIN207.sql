USE [master]
GO
/****** Object:  Database [AulaBDIN207]    Script Date: 16/11/2017 14:44:34 ******/
CREATE DATABASE [AulaBDIN207]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AulaBDIN207', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AulaBDIN207.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AulaBDIN207_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AulaBDIN207_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AulaBDIN207] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AulaBDIN207].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AulaBDIN207] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AulaBDIN207] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AulaBDIN207] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AulaBDIN207] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AulaBDIN207] SET ARITHABORT OFF 
GO
ALTER DATABASE [AulaBDIN207] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AulaBDIN207] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AulaBDIN207] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AulaBDIN207] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AulaBDIN207] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AulaBDIN207] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AulaBDIN207] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AulaBDIN207] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AulaBDIN207] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AulaBDIN207] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AulaBDIN207] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AulaBDIN207] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AulaBDIN207] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AulaBDIN207] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AulaBDIN207] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AulaBDIN207] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AulaBDIN207] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AulaBDIN207] SET RECOVERY FULL 
GO
ALTER DATABASE [AulaBDIN207] SET  MULTI_USER 
GO
ALTER DATABASE [AulaBDIN207] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AulaBDIN207] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AulaBDIN207] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AulaBDIN207] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AulaBDIN207] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AulaBDIN207', N'ON'
GO
USE [AulaBDIN207]
GO
/****** Object:  Table [dbo].[Fornecedor]    Script Date: 16/11/2017 14:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedor](
	[id] [nchar](2) NOT NULL,
	[nome] [nvarchar](50) NULL,
	[status] [int] NULL,
	[cidade] [nvarchar](15) NULL,
 CONSTRAINT [PK_Fornecedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fornecimento]    Script Date: 16/11/2017 14:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecimento](
	[id_fornecedor] [nchar](2) NOT NULL,
	[id_peça] [nchar](2) NOT NULL,
	[quantidade] [int] NULL,
 CONSTRAINT [PK_Fornecimento] PRIMARY KEY CLUSTERED 
(
	[id_fornecedor] ASC,
	[id_peça] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Peça]    Script Date: 16/11/2017 14:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peça](
	[id] [nchar](2) NOT NULL,
	[nome] [nvarchar](20) NULL,
	[cor] [nvarchar](20) NULL,
	[peso] [int] NULL,
	[cidade] [nvarchar](15) NULL,
 CONSTRAINT [PK_Peça] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Fornecedor] ([id], [nome], [status], [cidade]) VALUES (N'S1', N'Smith', 20, N'London');
INSERT [dbo].[Fornecedor] ([id], [nome], [status], [cidade]) VALUES (N'S2', N'Jones', 10, N'Paris');
INSERT [dbo].[Fornecedor] ([id], [nome], [status], [cidade]) VALUES (N'S3', N'Blake', 30, N'Paris');
INSERT [dbo].[Fornecedor] ([id], [nome], [status], [cidade]) VALUES (N'S4', N'Clark', 20, N'London');
INSERT [dbo].[Fornecedor] ([id], [nome], [status], [cidade]) VALUES (N'S5', N'Adams', 30, N'Athens');

INSERT [dbo].[Peça] ([id], [nome], [cor], [peso], [cidade]) VALUES (N'P1', N'Nut', N'Red', 12, N'London');
INSERT [dbo].[Peça] ([id], [nome], [cor], [peso], [cidade]) VALUES (N'P2', N'Bolt', N'Green', 17, N'Paris');
INSERT [dbo].[Peça] ([id], [nome], [cor], [peso], [cidade]) VALUES (N'P3', N'Screw', N'Blue', 17, N'Rome');
INSERT [dbo].[Peça] ([id], [nome], [cor], [peso], [cidade]) VALUES (N'P4', N'Screw', N'Red', 14, N'London');
INSERT [dbo].[Peça] ([id], [nome], [cor], [peso], [cidade]) VALUES (N'P5', N'Cam', N'Blue', 12, N'Paris');
INSERT [dbo].[Peça] ([id], [nome], [cor], [peso], [cidade]) VALUES (N'P6', N'Cog', N'Red', 19, N'London');

INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S1', N'P1', 300);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S1', N'P2', 200);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S1', N'P3', 400);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S1', N'P4', 200);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S1', N'P5', 100);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S1', N'P6', 100);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S2', N'P1', 300);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S2', N'P2', 400);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S3', N'P2', 200);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça]) VALUES (N'S4', N'P2');
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S4', N'P4', 300);
INSERT [dbo].[Fornecimento] ([id_fornecedor], [id_peça], [quantidade]) VALUES (N'S4', N'P5', 400);

ALTER TABLE [dbo].[Fornecimento]  WITH CHECK ADD  CONSTRAINT [FK_Fornecimento_Fornecedor] FOREIGN KEY([id_fornecedor])
REFERENCES [dbo].[Fornecedor] ([id])
GO
ALTER TABLE [dbo].[Fornecimento] CHECK CONSTRAINT [FK_Fornecimento_Fornecedor]
GO
ALTER TABLE [dbo].[Fornecimento]  WITH CHECK ADD  CONSTRAINT [FK_Fornecimento_Peça] FOREIGN KEY([id_peça])
REFERENCES [dbo].[Peça] ([id])
GO
ALTER TABLE [dbo].[Fornecimento] CHECK CONSTRAINT [FK_Fornecimento_Peça]
GO
USE [master]
GO
ALTER DATABASE [AulaBDIN207] SET  READ_WRITE 
GO
