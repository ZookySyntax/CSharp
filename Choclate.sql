USE [master]
GO
/****** Object:  Database [Chocolate]    Script Date: 9/11/2022 12:58:28 ******/
CREATE DATABASE [Chocolate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chocolate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chocolate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chocolate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chocolate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Chocolate] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chocolate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chocolate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chocolate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chocolate] SET ANSI_PADDING OFF 

ALTER DATABASE [Chocolate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chocolate] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chocolate] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Chocolate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chocolate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chocolate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chocolate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chocolate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chocolate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chocolate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chocolate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chocolate] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Chocolate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chocolate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chocolate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chocolate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chocolate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chocolate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chocolate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chocolate] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chocolate] SET  MULTI_USER 
GO
ALTER DATABASE [Chocolate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chocolate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chocolate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chocolate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chocolate] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Chocolate] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Chocolate] SET QUERY_STORE = OFF
GO
USE [Chocolate]
GO
/****** Object:  Table [dbo].[DetailDoos]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailDoos](
	[DoosId] [nvarchar](4) NOT NULL,
	[PralineId] [nvarchar](3) NOT NULL,
	[AantalPralinesPerDoos] [smallint] NULL,
 CONSTRAINT [PK_DetailDoos] PRIMARY KEY CLUSTERED 
(
	[DoosId] ASC,
	[PralineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailOrder]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailOrder](
	[OrderId] [int] NOT NULL,
	[DoosId] [nvarchar](4) NOT NULL,
	[AantalDozenPerBestelling] [smallint] NULL,
 CONSTRAINT [PK_DetailOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[DoosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doos]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doos](
	[IdDoos] [nvarchar](4) NOT NULL,
	[DoosNaam] [nvarchar](40) NULL,
	[DoosGewicht] [smallint] NULL,
	[DoosBeschrijving] [nvarchar](max) NULL,
	[DoosPrijs] [float] NULL,
	[DoosInStock] [smallint] NULL,
	[DoosStopgezet] [bit] NULL,
 CONSTRAINT [PK_Doos] PRIMARY KEY CLUSTERED 
(
	[IdDoos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[IdIngredient] [nvarchar](50) NOT NULL,
	[IngredientCategorie] [nvarchar](50) NULL,
	[LeverancierId] [int] NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[IdIngredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klant]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klant](
	[IdKlant] [int] IDENTITY(1,1) NOT NULL,
	[KlantNaam] [nvarchar](20) NULL,
	[KlantVoornaam] [nvarchar](15) NULL,
	[KlantStraat] [nvarchar](30) NULL,
	[KlantGemeente] [nvarchar](15) NULL,
	[KlantProvincie] [nvarchar](20) NULL,
	[KlantPostnummer] [nvarchar](10) NULL,
	[KlantLand] [nvarchar](15) NULL,
	[KlantTelefoon] [nvarchar](24) NULL,
	[KlantInschrijving] [datetime2](0) NULL,
	[KlantInschrijvingsDuur] [smallint] NULL,
	[KlantInschrijvingsHernieuwing] [bit] NULL,
 CONSTRAINT [PK_Klant] PRIMARY KEY CLUSTERED 
(
	[IdKlant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leverancier]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leverancier](
	[IdLeverancier] [int] IDENTITY(1,1) NOT NULL,
	[LeverancierNaam] [nvarchar](50) NULL,
	[LeverancierContactVoornaam] [nvarchar](50) NULL,
	[LeverancierContactNaam] [nvarchar](50) NULL,
	[LeverancierTelefoonNummer] [nvarchar](50) NULL,
	[LeverancierFaxNummer] [nvarchar](50) NULL,
 CONSTRAINT [PK_Leverancier] PRIMARY KEY CLUSTERED 
(
	[IdLeverancier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeverFirma]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeverFirma](
	[IdLeverFirma] [int] IDENTITY(1,1) NOT NULL,
	[LeverFirmaNaam] [nvarchar](50) NULL,
	[LeverMethode] [nvarchar](50) NULL,
 CONSTRAINT [PK_LeverFirma] PRIMARY KEY CLUSTERED 
(
	[IdLeverFirma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levering]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levering](
	[LeverFirmaId] [int] NOT NULL,
	[LeveringProvincie] [nvarchar](20) NOT NULL,
	[LeveringKost] [float] NULL,
 CONSTRAINT [PK_Levering] PRIMARY KEY CLUSTERED 
(
	[LeverFirmaId] ASC,
	[LeveringProvincie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[KlantId] [int] NULL,
	[LeverFirmaId] [int] NULL,
	[OrderDatum] [datetime2](0) NULL,
	[Geschenk] [bit] NULL,
	[OrderMethode] [smallint] NULL,
	[LeverAdresNaam] [nvarchar](20) NULL,
	[LeverAdresVoornaam] [nvarchar](15) NULL,
	[LeverAdresStraat] [nvarchar](30) NULL,
	[LeverAdresGemeente] [nvarchar](15) NULL,
	[LeverAdresProvincie] [nvarchar](20) NULL,
	[LeverAdresPostnummer] [nvarchar](15) NULL,
	[LeverAdresLand] [nvarchar](15) NULL,
	[RekeningNummer] [nvarchar](10) NULL,
	[Vervaldag] [datetime2](0) NULL,
	[SoortKredietKaart] [smallint] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Praline]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Praline](
	[IdPraline] [nvarchar](3) NOT NULL,
	[PralineNaam] [nvarchar](40) NULL,
	[SoortChocolade] [nvarchar](20) NULL,
	[SoortNoot] [nvarchar](20) NULL,
	[SoortVulling] [nvarchar](20) NULL,
	[PralineBeschrijving] [nvarchar](max) NULL,
	[PralineKost] [float] NULL,
	[Tekening] [varbinary](max) NULL,
 CONSTRAINT [PK_Praline] PRIMARY KEY CLUSTERED 
(
	[IdPraline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotie]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotie](
	[WerknemerId] [int] NOT NULL,
	[DoosId] [nvarchar](4) NOT NULL,
	[PromotieNaam] [nvarchar](50) NOT NULL,
	[StartDatum] [datetime2](0) NULL,
 CONSTRAINT [PK_Promotie] PRIMARY KEY CLUSTERED 
(
	[WerknemerId] ASC,
	[DoosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Werknemer]    Script Date: 9/11/2022 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Werknemer](
	[IdWerknemer] [int] IDENTITY(1,1) NOT NULL,
	[WerknemerVoornaam] [nvarchar](50) NULL,
	[WerknemerNaam] [nvarchar](50) NULL,
	[WerknemerAanspreektitel] [nvarchar](20) NULL,
	[WerknemerTelefoonnummer] [nvarchar](30) NULL,
	[WerknemerDepartement] [nvarchar](50) NULL,
	[WerknemerGeboorteDatum] [datetime2](0) NULL,
	[WerknemerInDienstTreding] [datetime2](0) NULL,
 CONSTRAINT [PK_Werknemer] PRIMARY KEY CLUSTERED 
(
	[IdWerknemer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [Order$RelIndex]    Script Date: 9/11/2022 12:58:28 ******/
CREATE NONCLUSTERED INDEX [Order$RelIndex] ON [dbo].[Order]
(
	[KlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Werknemer$DepartmentName]    Script Date: 9/11/2022 12:58:28 ******/
CREATE NONCLUSTERED INDEX [Werknemer$DepartmentName] ON [dbo].[Werknemer]
(
	[WerknemerDepartement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Werknemer$LastName]    Script Date: 9/11/2022 12:58:28 ******/
CREATE NONCLUSTERED INDEX [Werknemer$LastName] ON [dbo].[Werknemer]
(
	[WerknemerNaam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetailDoos]  WITH CHECK ADD  CONSTRAINT [FK_DetailDoos_Doos] FOREIGN KEY([DoosId])
REFERENCES [dbo].[Doos] ([IdDoos])
GO
ALTER TABLE [dbo].[DetailDoos] CHECK CONSTRAINT [FK_DetailDoos_Doos]
GO
ALTER TABLE [dbo].[DetailDoos]  WITH CHECK ADD  CONSTRAINT [FK_DetailDoos_Praline] FOREIGN KEY([PralineId])
REFERENCES [dbo].[Praline] ([IdPraline])
GO
ALTER TABLE [dbo].[DetailDoos] CHECK CONSTRAINT [FK_DetailDoos_Praline]
GO
ALTER TABLE [dbo].[DetailOrder]  WITH CHECK ADD  CONSTRAINT [FK_DetailOrder_Doos] FOREIGN KEY([DoosId])
REFERENCES [dbo].[Doos] ([IdDoos])
GO
ALTER TABLE [dbo].[DetailOrder] CHECK CONSTRAINT [FK_DetailOrder_Doos]
GO
ALTER TABLE [dbo].[DetailOrder]  WITH CHECK ADD  CONSTRAINT [FK_DetailOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[DetailOrder] CHECK CONSTRAINT [FK_DetailOrder_Order]
GO
ALTER TABLE [dbo].[Ingredient]  WITH CHECK ADD  CONSTRAINT [FK_Ingredient_Leverancier] FOREIGN KEY([LeverancierId])
REFERENCES [dbo].[Leverancier] ([IdLeverancier])
GO
ALTER TABLE [dbo].[Ingredient] CHECK CONSTRAINT [FK_Ingredient_Leverancier]
GO
ALTER TABLE [dbo].[Levering]  WITH CHECK ADD  CONSTRAINT [FK_Levering_LeverFirma] FOREIGN KEY([LeverFirmaId])
REFERENCES [dbo].[LeverFirma] ([IdLeverFirma])
GO
ALTER TABLE [dbo].[Levering] CHECK CONSTRAINT [FK_Levering_LeverFirma]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Klant] FOREIGN KEY([KlantId])
REFERENCES [dbo].[Klant] ([IdKlant])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Klant]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_LeverFirma] FOREIGN KEY([LeverFirmaId])
REFERENCES [dbo].[LeverFirma] ([IdLeverFirma])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_LeverFirma]
GO
ALTER TABLE [dbo].[Promotie]  WITH CHECK ADD  CONSTRAINT [FK_Promotie_Doos] FOREIGN KEY([DoosId])
REFERENCES [dbo].[Doos] ([IdDoos])
GO
ALTER TABLE [dbo].[Promotie] CHECK CONSTRAINT [FK_Promotie_Doos]
GO
ALTER TABLE [dbo].[Promotie]  WITH CHECK ADD  CONSTRAINT [FK_Promotie_Werknemer] FOREIGN KEY([WerknemerId])
REFERENCES [dbo].[Werknemer] ([IdWerknemer])
GO
ALTER TABLE [dbo].[Promotie] CHECK CONSTRAINT [FK_Promotie_Werknemer]
GO
USE [master]
GO
ALTER DATABASE [Chocolate] SET  READ_WRITE 
GO
