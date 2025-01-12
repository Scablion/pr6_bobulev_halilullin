USE [master]
GO
/****** Object:  Database [user23]    Script Date: 29.03.2024 10:51:11 ******/
CREATE DATABASE [user23]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user23', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\user23.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'user23_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\user23_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [user23] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user23].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user23] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user23] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user23] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user23] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user23] SET ARITHABORT OFF 
GO
ALTER DATABASE [user23] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [user23] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user23] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user23] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user23] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user23] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user23] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user23] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user23] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user23] SET  DISABLE_BROKER 
GO
ALTER DATABASE [user23] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user23] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user23] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user23] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user23] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user23] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user23] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user23] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [user23] SET  MULTI_USER 
GO
ALTER DATABASE [user23] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user23] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user23] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user23] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user23] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user23] SET QUERY_STORE = OFF
GO
USE [user23]
GO
/****** Object:  Table [dbo].[Poezdka]    Script Date: 29.03.2024 10:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poezdka](
	[IDP] [int] IDENTITY(1,1) NOT NULL,
	[date_n] [date] NOT NULL,
	[date_o] [date] NOT NULL,
	[cday] [tinyint] NOT NULL,
 CONSTRAINT [PK_Poezdka] PRIMARY KEY CLUSTERED 
(
	[IDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Map]    Script Date: 29.03.2024 10:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Map](
	[IDM] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Cel] [nvarchar](50) NOT NULL,
	[Cost_p_d] [decimal](8, 2) NOT NULL,
	[Cost_t_y] [decimal](8, 2) NOT NULL,
	[Cost_o_v] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Map] PRIMARY KEY CLUSTERED 
(
	[IDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 29.03.2024 10:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Familia] [nvarchar](50) NOT NULL,
	[Imia] [nvarchar](50) NOT NULL,
	[Otchestvo] [nvarchar](50) NOT NULL,
	[IDC] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[IDC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Org_poezdok]    Script Date: 29.03.2024 10:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Org_poezdok](
	[IDOP] [int] IDENTITY(1,1) NOT NULL,
	[idc] [int] NOT NULL,
	[idm] [int] NOT NULL,
	[idp] [int] NOT NULL,
 CONSTRAINT [PK_Org_poezdok] PRIMARY KEY CLUSTERED 
(
	[IDOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 29.03.2024 10:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.Clients.Familia, dbo.Clients.Imia, dbo.Clients.Otchestvo, dbo.Map.IDM, dbo.Map.Country, dbo.Map.Cel, dbo.Map.Cost_p_d, dbo.Map.Cost_t_y, dbo.Map.Cost_o_v, dbo.Poezdka.date_n, dbo.Poezdka.date_o, 
                         dbo.Poezdka.cday
FROM            dbo.Clients INNER JOIN
                         dbo.Org_poezdok ON dbo.Clients.IDC = dbo.Org_poezdok.idc INNER JOIN
                         dbo.Map ON dbo.Org_poezdok.idm = dbo.Map.IDM INNER JOIN
                         dbo.Poezdka ON dbo.Org_poezdok.idp = dbo.Poezdka.IDP
WHERE        ('where' = 'Таламанов')
GO
/****** Object:  View [dbo].[View_3]    Script Date: 29.03.2024 10:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT        dbo.Clients.Familia, dbo.Clients.Imia, dbo.Clients.Otchestvo, dbo.Map.Country, dbo.Map.Cel, dbo.Map.Cost_p_d, dbo.Map.Cost_t_y, dbo.Map.Cost_o_v, dbo.Org_poezdok.idc, dbo.Org_poezdok.idm, 
                         dbo.Org_poezdok.IDOP
FROM            dbo.Clients INNER JOIN
                         dbo.Org_poezdok ON dbo.Clients.IDC = dbo.Org_poezdok.idc INNER JOIN
                         dbo.Map ON dbo.Org_poezdok.idm = dbo.Map.IDM
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Familia], [Imia], [Otchestvo], [IDC]) VALUES (N'Таламанов', N'Игнат', N'Павлович', 1)
INSERT [dbo].[Clients] ([Familia], [Imia], [Otchestvo], [IDC]) VALUES (N'Полоумкин', N'Виктор', N'Олегович', 2)
INSERT [dbo].[Clients] ([Familia], [Imia], [Otchestvo], [IDC]) VALUES (N'Разлучкин', N'Николай', N'Петрович', 3)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Map] ON 

INSERT [dbo].[Map] ([IDM], [Country], [Cel], [Cost_p_d], [Cost_t_y], [Cost_o_v]) VALUES (1, N'Казань', N'курорт', CAST(1200.00 AS Decimal(8, 2)), CAST(2032.00 AS Decimal(8, 2)), CAST(5400.00 AS Decimal(8, 2)))
INSERT [dbo].[Map] ([IDM], [Country], [Cel], [Cost_p_d], [Cost_t_y], [Cost_o_v]) VALUES (2, N'Питер', N'Деловая встреча', CAST(1500.00 AS Decimal(8, 2)), CAST(2500.00 AS Decimal(8, 2)), CAST(5400.00 AS Decimal(8, 2)))
INSERT [dbo].[Map] ([IDM], [Country], [Cel], [Cost_p_d], [Cost_t_y], [Cost_o_v]) VALUES (4, N'Киев', N'путешествие', CAST(1000.00 AS Decimal(8, 2)), CAST(200.00 AS Decimal(8, 2)), CAST(500.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[Map] OFF
GO
SET IDENTITY_INSERT [dbo].[Org_poezdok] ON 

INSERT [dbo].[Org_poezdok] ([IDOP], [idc], [idm], [idp]) VALUES (2, 1, 1, 1)
INSERT [dbo].[Org_poezdok] ([IDOP], [idc], [idm], [idp]) VALUES (4, 2, 2, 9)
INSERT [dbo].[Org_poezdok] ([IDOP], [idc], [idm], [idp]) VALUES (5, 3, 4, 10)
SET IDENTITY_INSERT [dbo].[Org_poezdok] OFF
GO
SET IDENTITY_INSERT [dbo].[Poezdka] ON 

INSERT [dbo].[Poezdka] ([IDP], [date_n], [date_o], [cday]) VALUES (1, CAST(N'2025-03-04' AS Date), CAST(N'2025-03-22' AS Date), 18)
INSERT [dbo].[Poezdka] ([IDP], [date_n], [date_o], [cday]) VALUES (9, CAST(N'2025-03-20' AS Date), CAST(N'2025-03-24' AS Date), 4)
INSERT [dbo].[Poezdka] ([IDP], [date_n], [date_o], [cday]) VALUES (10, CAST(N'2022-05-02' AS Date), CAST(N'2022-05-03' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Poezdka] OFF
GO
ALTER TABLE [dbo].[Org_poezdok]  WITH CHECK ADD  CONSTRAINT [FK_Org_poezdok_Clients] FOREIGN KEY([idc])
REFERENCES [dbo].[Clients] ([IDC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Org_poezdok] CHECK CONSTRAINT [FK_Org_poezdok_Clients]
GO
ALTER TABLE [dbo].[Org_poezdok]  WITH CHECK ADD  CONSTRAINT [FK_Org_poezdok_Map] FOREIGN KEY([idm])
REFERENCES [dbo].[Map] ([IDM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Org_poezdok] CHECK CONSTRAINT [FK_Org_poezdok_Map]
GO
ALTER TABLE [dbo].[Org_poezdok]  WITH CHECK ADD  CONSTRAINT [FK_Org_poezdok_Poezdka] FOREIGN KEY([idp])
REFERENCES [dbo].[Poezdka] ([IDP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Org_poezdok] CHECK CONSTRAINT [FK_Org_poezdok_Poezdka]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Clients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Map"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Org_poezdok"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Poezdka"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 136
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 2925
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Clients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Map"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Org_poezdok"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
USE [master]
GO
ALTER DATABASE [user23] SET  READ_WRITE 
GO
