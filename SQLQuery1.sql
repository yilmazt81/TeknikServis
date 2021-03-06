

CREATE DATABASE [TeknikProje]

USE [TeknikProje]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](20) NULL,
	[Sifre] [nvarchar](20) NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Pasif] [bit] NULL,
	[Gorev] [nvarchar](20) NULL,
	[UstPersonelId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TamAdi] [nvarchar](100) NULL,
	[GsmNo] [nvarchar](20) NULL,
	[Eposta] [nvarchar](70) NULL,
	[IlId] [int] NULL,
	[IlceId] [int] NULL,
	[Adres] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TamirTeslim]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TamirTeslim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MusteriId] [int] NOT NULL,
	[TeslimAlanPersonelId] [int] NOT NULL,
	[IadeEdenPersonelId] [int] NULL,
	[TamirEdenPersonelId] [int] NULL,
	[Marka] [nvarchar](20) NULL,
	[Model] [nvarchar](20) NULL,
	[SeriNo] [nvarchar](30) NULL,
	[MusteriSorunAciklama] [nvarchar](max) NULL,
	[TeknikPersonelAciklama] [nvarchar](max) NULL,
	[TeslimTarihi] [datetime] NULL,
	[IadeTarihi] [datetime] NULL,
	[TeslimAlinanAksesuar] [nvarchar](250) NULL,
	[TamirFiyat] [money] NULL,
	[Barcode] [nvarchar](50) NULL,
	[KargoIleGeldi] [bit] NULL,
	[TamirDurumId] [tinyint] NULL,
	[TamirTarihi] [datetime] NULL,
	[KontrolEdenPersonelId] [int] NULL,
	[KontrolTarihi] [datetime] NULL,
	[KargoIleGonderilecek] [bit] NULL,
	[TeslimAlan] [nvarchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ilce]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilce](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IlId] [int] NOT NULL,
	[IlceAdi] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Il]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Il](
	[Id] [int] NOT NULL,
	[IlAdi] [nvarchar](40) NULL,
 CONSTRAINT [PK__Il__3214EC077254FB8E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TamirDurum]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TamirDurum](
	[Id] [tinyint] NOT NULL,
	[Aciklama] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vTamirTeslim]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

 CREATE VIEW [dbo].[vTamirTeslim]

 AS
 

 SELECT  t.Id,
		 m.TamAdi AS MusteriAdi,
		 m.GsmNo,
		 m.Eposta,
		 i.IlAdi,
		 ic.IlceAdi,
		 t.Marka,
		 t.Model,
		 t.SeriNo,
		 t.TeslimTarihi,
		 t.Barcode ,
		 td.Aciklama AS TamirDurum,
		 t.TamirDurumId,
		 t.TeknikPersonelAciklama,
		 p.Adi+' '+p.Soyadi AS TamirPersonel,
		 p.UstPersonelId AS PersonelUstId ,
		 t.KargoIleGonderilecek
 FROM TamirTeslim AS t INNER JOIN
			Musteri AS m ON m.Id = t.MusteriId INNER JOIN
			Il AS i ON i.Id = m.IlId INNER JOIN
			Ilce AS ic ON ic.Id = m.IlceId INNER JOIN
			TamirDurum AS td ON td.Id = t.TamirDurumId LEFT JOIN
			Personel AS p ON p.Id=t.TamirEdenPersonelId 
GO
/****** Object:  Table [dbo].[CihazKargoGonderim]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CihazKargoGonderim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TamirTeslimId] [int] NOT NULL,
	[GonderenPersonelId] [int] NOT NULL,
	[GondermeTarihi] [datetime] NOT NULL,
	[KargoFirmaId] [int] NOT NULL,
	[GonderiNumarasi] [nvarchar](50) NULL,
	[IlId] [int] NOT NULL,
	[IlceId] [int] NOT NULL,
	[Adres] [nvarchar](250) NULL,
	[MusteriAdi] [nvarchar](70) NULL,
	[GsmNo] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CihazParca]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CihazParca](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParcaAdi] [nvarchar](250) NULL,
	[Barkod] [nvarchar](20) NULL,
	[Fiyat] [money] NULL,
	[StokAdet] [int] NULL,
	[MontajUcreti] [money] NULL,
	[Marka] [nvarchar](20) NULL,
	[Model] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CihazTamirParca]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CihazTamirParca](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TamirTeslimId] [int] NOT NULL,
	[CihazParcaId] [int] NOT NULL,
	[EkleyenPersonel] [int] NULL,
	[EklemeTarihi] [datetime] NULL,
	[ParcaBekliyor] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KargoFirma]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KargoFirma](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KargoSube]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KargoSube](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KargoFirmaId] [int] NOT NULL,
	[SubeAdi] [nvarchar](50) NULL,
	[TelefonNo] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerformansRapor]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerformansRapor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RaportAdi] [nvarchar](50) NULL,
	[ProcedureName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelLoginSession]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelLoginSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonelId] [int] NOT NULL,
	[GirisTarihi] [datetime] NULL,
	[CikisTarihi] [datetime] NULL,
	[BilgisayarAdi] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UygulamaMenu]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UygulamaMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](30) NULL,
	[UstMenuId] [int] NULL,
	[MenuClass] [nvarchar](100) NULL,
	[IconIndex] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UygulamaMenuYetki]    Script Date: 25.08.2021 19:23:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UygulamaMenuYetki](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YetkiAdi] [nvarchar](20) NULL,
	[UygulamaMenuId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CihazKargoGonderim] ON 
GO
INSERT [dbo].[CihazKargoGonderim] ([Id], [TamirTeslimId], [GonderenPersonelId], [GondermeTarihi], [KargoFirmaId], [GonderiNumarasi], [IlId], [IlceId], [Adres], [MusteriAdi], [GsmNo]) VALUES (5, 5, 2, CAST(N'2021-08-25T16:59:17.107' AS DateTime), 1, N'999s79s99ss', 36, 2562, N'', N'KEMAL UFUK BA??C??L', N'536 369 36 36')
GO
INSERT [dbo].[CihazKargoGonderim] ([Id], [TamirTeslimId], [GonderenPersonelId], [GondermeTarihi], [KargoFirmaId], [GonderiNumarasi], [IlId], [IlceId], [Adres], [MusteriAdi], [GsmNo]) VALUES (6, 8, 2, CAST(N'2021-08-25T16:59:26.577' AS DateTime), 1, N'232323', 26, 2681, N'qqwqw', N'AHMET M??THAT PINARER', N'536 369 48 36')
GO
SET IDENTITY_INSERT [dbo].[CihazKargoGonderim] OFF
GO
SET IDENTITY_INSERT [dbo].[CihazParca] ON 
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (11, N'LCD Ekran', N'9959595999', 150.0000, 18, 20.0000, N'Apple', N'iPhone11')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (12, N'LCD Ekran', N'9959595999', 150.0000, 19, 20.0000, N'Huawei', N'P Smart S')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (13, N'LCD Ekran', N'9959595999', 150.0000, 20, 20.0000, N'LG', N'P40 Lite')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (14, N'LCD Ekran', N'9959595999', 150.0000, 20, 20.0000, N'Oppo', N'A73')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (15, N'LCD Ekran', N'9959595999', 150.0000, 20, 20.0000, N'Samsung', N'Galaxy A02s')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (16, N'D???? Kasa', N'9959595999', 200.0000, 10, 50.0000, N'Apple', N'iPhone11')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (17, N'D???? Kasa', N'9959595999', 200.0000, 10, 50.0000, N'Huawei', N'P Smart S')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (18, N'D???? Kasa', N'9959595999', 200.0000, 10, 50.0000, N'LG', N'P40 Lite')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (19, N'D???? Kasa', N'9959595999', 200.0000, 10, 50.0000, N'Oppo', N'A73')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (20, N'D???? Kasa', N'9959595999', 200.0000, 9, 50.0000, N'Samsung', N'Galaxy A02s')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (21, N'Sim Kart yuvas??', N'995959522999', 100.0000, 10, 20.0000, N'Apple', N'iPhone11')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (22, N'Sim Kart yuvas??', N'995959522999', 100.0000, 10, 20.0000, N'Huawei', N'P Smart S')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (23, N'Sim Kart yuvas??', N'995959522999', 100.0000, 9, 20.0000, N'LG', N'P40 Lite')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (24, N'Sim Kart yuvas??', N'995959522999', 100.0000, 10, 20.0000, N'Oppo', N'A73')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (25, N'Sim Kart yuvas??', N'995959522999', 100.0000, 10, 20.0000, N'Samsung', N'Galaxy A02s')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (26, N'Hoparl??r', N'895959522999', 80.0000, 10, 15.0000, N'Apple', N'iPhone11')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (27, N'Hoparl??r', N'895959522999', 80.0000, 10, 15.0000, N'Huawei', N'P Smart S')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (28, N'Hoparl??r', N'895959522999', 80.0000, 10, 15.0000, N'LG', N'P40 Lite')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (29, N'Hoparl??r', N'895959522999', 80.0000, 9, 15.0000, N'Oppo', N'A73')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (30, N'Hoparl??r', N'895959522999', 80.0000, 10, 15.0000, N'Samsung', N'Galaxy A02s')
GO
SET IDENTITY_INSERT [dbo].[CihazParca] OFF
GO
SET IDENTITY_INSERT [dbo].[CihazTamirParca] ON 
GO
INSERT [dbo].[CihazTamirParca] ([Id], [TamirTeslimId], [CihazParcaId], [EkleyenPersonel], [EklemeTarihi], [ParcaBekliyor]) VALUES (8, 5, 11, 4, CAST(N'2021-08-25T16:51:34.140' AS DateTime), 0)
GO
INSERT [dbo].[CihazTamirParca] ([Id], [TamirTeslimId], [CihazParcaId], [EkleyenPersonel], [EklemeTarihi], [ParcaBekliyor]) VALUES (9, 6, 20, 4, CAST(N'2021-08-25T16:52:12.627' AS DateTime), 0)
GO
INSERT [dbo].[CihazTamirParca] ([Id], [TamirTeslimId], [CihazParcaId], [EkleyenPersonel], [EklemeTarihi], [ParcaBekliyor]) VALUES (10, 8, 12, 4, CAST(N'2021-08-25T16:52:39.900' AS DateTime), 0)
GO
INSERT [dbo].[CihazTamirParca] ([Id], [TamirTeslimId], [CihazParcaId], [EkleyenPersonel], [EklemeTarihi], [ParcaBekliyor]) VALUES (11, 7, 29, 1, CAST(N'2021-08-25T16:55:02.313' AS DateTime), 0)
GO
INSERT [dbo].[CihazTamirParca] ([Id], [TamirTeslimId], [CihazParcaId], [EkleyenPersonel], [EklemeTarihi], [ParcaBekliyor]) VALUES (12, 9, 23, 4, CAST(N'2021-08-25T16:56:39.003' AS DateTime), 0)
GO
INSERT [dbo].[CihazTamirParca] ([Id], [TamirTeslimId], [CihazParcaId], [EkleyenPersonel], [EklemeTarihi], [ParcaBekliyor]) VALUES (13, 10, 11, 1, CAST(N'2021-08-25T17:33:01.263' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[CihazTamirParca] OFF
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (1, N'ADANA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (2, N'ADIYAMAN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (3, N'AFYONKARAH??SAR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (4, N'A??RI')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (5, N'AMASYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (6, N'ANKARA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (7, N'ANTALYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (8, N'ARTV??N')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (9, N'AYDIN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (10, N'BALIKES??R')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (11, N'B??LEC??K')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (12, N'B??NG??L')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (13, N'B??TL??S')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (14, N'BOLU')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (15, N'BURDUR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (16, N'BURSA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (17, N'??ANAKKALE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (18, N'??ANKIRI')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (19, N'??ORUM')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (20, N'DEN??ZL??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (21, N'D??YARBAKIR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (22, N'ED??RNE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (23, N'ELAZI??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (24, N'ERZ??NCAN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (25, N'ERZURUM')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (26, N'ESK????EH??R')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (27, N'GAZ??ANTEP')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (28, N'G??RESUN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (29, N'G??M????HANE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (30, N'HAKKAR??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (31, N'HATAY')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (32, N'ISPARTA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (33, N'MERS??N')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (34, N'??STANBUL')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (35, N'??ZM??R')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (36, N'KARS')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (37, N'KASTAMONU')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (38, N'KAYSER??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (39, N'KIRKLAREL??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (40, N'KIR??EH??R')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (41, N'KOCAEL??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (42, N'KONYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (43, N'K??TAHYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (44, N'MALATYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (45, N'MAN??SA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (46, N'KAHRAMANMARA??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (47, N'MARD??N')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (48, N'MU??LA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (49, N'MU??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (50, N'NEV??EH??R')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (51, N'N????DE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (52, N'ORDU')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (53, N'R??ZE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (54, N'SAKARYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (55, N'SAMSUN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (56, N'S????RT')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (57, N'S??NOP')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (58, N'S??VAS')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (59, N'TEK??RDA??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (60, N'TOKAT')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (61, N'TRABZON')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (62, N'TUNCEL??')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (63, N'??ANLIURFA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (64, N'U??AK')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (65, N'VAN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (66, N'YOZGAT')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (67, N'ZONGULDAK')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (68, N'AKSARAY')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (69, N'BAYBURT')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (70, N'KARAMAN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (71, N'KIRIKKALE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (72, N'BATMAN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (73, N'??IRNAK')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (74, N'BARTIN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (75, N'ARDAHAN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (76, N'I??DIR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (77, N'YALOVA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (78, N'KARAB??K')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (79, N'K??L??S')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (80, N'OSMAN??YE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (81, N'D??ZCE')
GO
SET IDENTITY_INSERT [dbo].[Ilce] ON 
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2016, 37, N'ABANA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2017, 50, N'ACIG??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2018, 20, N'ACIPAYAM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2019, 12, N'ADAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2020, 34, N'ADALAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2021, 54, N'ADAPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2022, 2, N'ADIYAMAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2023, 13, N'AD??LCEVAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2024, 46, N'AF????N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2025, 3, N'AFYONKARAH??SAR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2026, 68, N'A??A????REN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2027, 23, N'A??IN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2028, 15, N'A??LASUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2029, 37, N'A??LI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2030, 4, N'A??RI MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2031, 42, N'AHIRLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2032, 13, N'AHLAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2033, 45, N'AHMETL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2034, 61, N'AK??AABAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2035, 44, N'AK??ADA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2036, 63, N'AK??AKALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2037, 40, N'AK??AKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2038, 81, N'AK??AKOCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2039, 66, N'AKDA??MADEN??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2040, 33, N'AKDEN??Z')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2041, 45, N'AKH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2042, 58, N'AKINCILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2043, 38, N'AKKI??LA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2044, 20, N'AKK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2045, 52, N'AKKU??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2046, 42, N'AK??REN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2047, 40, N'AKPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2048, 68, N'AKSARAY MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2049, 7, N'AKSEK??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2050, 7, N'AKSU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2051, 32, N'AKSU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2052, 42, N'AK??EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2053, 36, N'AKYAKA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2054, 54, N'AKYAZI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2055, 6, N'AKYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2056, 19, N'ALACA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2057, 23, N'ALACAKAYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2058, 55, N'ALA??AM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2059, 1, N'ALADA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2060, 7, N'ALANYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2061, 67, N'ALAPLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2062, 45, N'ALA??EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2063, 35, N'AL??A??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2064, 60, N'ALMUS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2065, 26, N'ALPU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2066, 6, N'ALTINDA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2067, 42, N'ALTINEK??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2068, 77, N'ALTINOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2069, 31, N'ALTIN??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2070, 43, N'ALTINTA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2071, 15, N'ALTINYAYLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2072, 58, N'ALTINYAYLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2073, 51, N'ALTUNH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2074, 28, N'ALUCRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2075, 74, N'AMASRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2076, 5, N'AMASYA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2077, 33, N'ANAMUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2078, 46, N'ANDIRIN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2079, 7, N'ANTALYA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2080, 27, N'ARABAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2081, 37, N'ARA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2082, 61, N'ARAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2083, 76, N'ARALIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2084, 44, N'ARAPG??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2085, 75, N'ARDAHAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2086, 8, N'ARDANU??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2087, 53, N'ARDE??EN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2088, 44, N'ARGUVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2089, 8, N'ARHAV??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2090, 23, N'ARICAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2091, 54, N'AR??F??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2092, 77, N'ARMUTLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2093, 34, N'ARNAVUTK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2094, 36, N'ARPA??AY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2095, 61, N'ARS??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2096, 60, N'ARTOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2097, 8, N'ARTV??N MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2098, 55, N'ASARCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2099, 43, N'ASLANAPA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2100, 25, N'A??KALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2101, 32, N'ATABEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2102, 55, N'ATAKUM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2103, 34, N'ATA??EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2104, 18, N'ATKARACALAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2105, 50, N'AVANOS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2106, 34, N'AVCILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2107, 57, N'AYANCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2108, 6, N'AYA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2109, 52, N'AYBASTI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2110, 9, N'AYDIN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2111, 33, N'AYDINCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2112, 66, N'AYDINCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2113, 56, N'AYDINLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2114, 69, N'AYDINTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2115, 70, N'AYRANCI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2116, 17, N'AYVACIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2117, 55, N'AYVACIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2118, 10, N'AYVALIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2119, 37, N'AZDAVAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2120, 25, N'AZ??Z??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2121, 20, N'BABADA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2122, 39, N'BABAESK??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2123, 55, N'BAFRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2124, 34, N'BA??CILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2125, 21, N'BA??LAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2126, 80, N'BAH??E')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2127, 34, N'BAH??EL??EVLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2128, 65, N'BAH??ESARAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2129, 71, N'BAH????L??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2130, 34, N'BAKIRK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2131, 20, N'BAKLAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2132, 6, N'BALA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2133, 35, N'BAL??OVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2134, 10, N'BALIKES??R MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2135, 71, N'BALI??EYH')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2136, 10, N'BALYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2137, 64, N'BANAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2138, 10, N'BANDIRMA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2139, 74, N'BARTIN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2140, 23, N'BASK??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2141, 34, N'BA??AK??EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2142, 60, N'BA??????FTL??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2143, 41, N'BA????SKELE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2144, 65, N'BA??KALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2145, 3, N'BA??MAK??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2146, 70, N'BA??YAYLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2147, 72, N'BATMAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2148, 44, N'BATTALGAZ??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2149, 3, N'BAYAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2150, 19, N'BAYAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2151, 69, N'BAYBURT MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2152, 35, N'BAYINDIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2153, 56, N'BAYKAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2154, 35, N'BAYRAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2155, 17, N'BAYRAM????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2156, 18, N'BAYRAM??REN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2157, 34, N'BAYRAMPA??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2158, 20, N'BEK??LL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2159, 31, N'BELEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2160, 35, N'BERGAMA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2161, 2, N'BESN??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2162, 61, N'BE????KD??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2163, 34, N'BE????KTA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2164, 72, N'BE????R??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2165, 20, N'BEYA??A??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2166, 35, N'BEYDA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2167, 34, N'BEYKOZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2168, 34, N'BEYL??KD??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2169, 26, N'BEYL??KOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2170, 34, N'BEYO??LU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2171, 6, N'BEYPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2172, 42, N'BEY??EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2173, 73, N'BEYT??????EBAP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2174, 17, N'B??GA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2175, 10, N'B??GAD????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2176, 11, N'B??LEC??K MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2177, 12, N'B??NG??L MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2178, 63, N'B??REC??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2179, 21, N'B??SM??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2180, 13, N'B??TL??S MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2181, 48, N'BODRUM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2182, 19, N'BO??AZKALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2183, 66, N'BO??AZLIYAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2184, 14, N'BOLU MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2185, 3, N'BOLVAD??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2186, 51, N'BOR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2187, 8, N'BOR??KA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2188, 35, N'BORNOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2189, 57, N'BOYABAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2190, 17, N'BOZCAADA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2191, 9, N'BOZDO??AN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2192, 42, N'BOZKIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2193, 20, N'BOZKURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2194, 37, N'BOZKURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2195, 63, N'BOZOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2196, 40, N'BOZTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2197, 11, N'BOZ??Y??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2198, 33, N'BOZYAZI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2199, 35, N'BUCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2200, 15, N'BUCAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2201, 9, N'BUHARKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2202, 28, N'BULANCAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2203, 49, N'BULANIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2204, 20, N'BULDAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2205, 15, N'BURDUR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2206, 10, N'BURHAN??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2207, 38, N'B??NYAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2208, 34, N'B??Y??K??EKMECE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2209, 16, N'B??Y??KORHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2210, 55, N'CAN??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2211, 1, N'CEYHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2212, 63, N'CEYLANPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2213, 37, N'C??DE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2214, 42, N'C??HANBEYL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2215, 73, N'C??ZRE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2216, 81, N'CUMAYER??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2217, 46, N'??A??LIYANCER??T')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2218, 20, N'??AL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2219, 65, N'??ALDIRAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2220, 51, N'??AMARDI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2221, 52, N'??AMA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2222, 20, N'??AMEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2223, 6, N'??AMLIDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2224, 53, N'??AMLIHEM????N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2225, 33, N'??AMLIYAYLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2226, 28, N'??AMOLUK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2227, 17, N'??AN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2228, 28, N'??ANAK??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2229, 17, N'??ANAKKALE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2230, 66, N'??ANDIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2231, 6, N'??ANKAYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2232, 18, N'??ANKIRI MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2233, 20, N'??ARDAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2234, 55, N'??AR??AMBA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2235, 61, N'??AR??IBA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2236, 25, N'??AT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2237, 65, N'??ATAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2238, 34, N'??ATALCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2239, 52, N'??ATALPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2240, 37, N'??ATALZEYT??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2241, 43, N'??AVDARH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2242, 15, N'??AVDIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2243, 3, N'??AY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2244, 52, N'??AYBA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2245, 67, N'??AYCUMA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2246, 53, N'??AYEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2247, 66, N'??AYIRALAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2248, 24, N'??AYIRLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2249, 41, N'??AYIROVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2250, 61, N'??AYKARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2251, 66, N'??EKEREK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2252, 34, N'??EKMEK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2253, 71, N'??ELEB??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2254, 2, N'??EL??KHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2255, 42, N'??ELT??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2256, 15, N'??ELT??K????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2257, 62, N'??EM????GEZEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2258, 18, N'??ERKE??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2259, 59, N'??ERKEZK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2260, 21, N'??ERM??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2261, 35, N'??E??ME')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2262, 75, N'??ILDIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2263, 21, N'??INAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2264, 77, N'??INARCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2265, 40, N'??????EKDA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2266, 26, N'????FTELER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2267, 51, N'????FTL??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2268, 77, N'????FTL??KK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2269, 35, N'??????L??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2270, 81, N'????L??ML??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2271, 9, N'????NE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2272, 20, N'????VR??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2273, 3, N'??OBANLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2274, 59, N'??ORLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2275, 19, N'??ORUM MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2276, 6, N'??UBUK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2277, 30, N'??UKURCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2278, 1, N'??UKUROVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2279, 42, N'??UMRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2280, 21, N'????NG????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2281, 37, N'DADAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2282, 48, N'DALAMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2283, 75, N'DAMAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2284, 44, N'DARENDE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2285, 47, N'DARGE????T')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2286, 41, N'DARICA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2287, 48, N'DAT??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2288, 3, N'DAZKIRI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2289, 71, N'DEL??CE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2290, 45, N'DEM??RC??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2291, 39, N'DEM??RK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2292, 69, N'DEM??R??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2293, 7, N'DEMRE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2294, 20, N'DEN??ZL?? MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2295, 42, N'DERBENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2296, 42, N'DEREBUCAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2297, 28, N'DEREL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2298, 53, N'DEREPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2299, 47, N'DER??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2300, 41, N'DER??NCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2301, 50, N'DER??NKUYU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2302, 61, N'DERNEKPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2303, 38, N'DEVEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2304, 67, N'DEVREK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2305, 37, N'DEVREKAN??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2306, 21, N'D??CLE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2307, 9, N'D??D??M')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2308, 36, N'D??GOR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2309, 35, N'D??K??L??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2310, 57, N'D??KMEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2311, 41, N'D??LOVASI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2312, 3, N'D??NAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2313, 58, N'D??VR??????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2314, 4, N'D??YAD??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2315, 21, N'D??YARBAKIR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2316, 19, N'DODURGA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2317, 42, N'DO??ANH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2318, 28, N'DO??ANKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2319, 58, N'DO??AN??AR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2320, 44, N'DO??AN??EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2321, 44, N'DO??ANYOL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2322, 37, N'DO??ANYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2323, 4, N'DO??UBAYAZIT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2324, 43, N'DOMAN????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2325, 14, N'D??RTD??VAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2326, 31, N'D??RTYOL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2327, 7, N'D????EMEALTI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2328, 43, N'DUMLUPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2329, 57, N'DURA??AN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2330, 10, N'DURSUNBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2331, 81, N'D??ZCE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2332, 80, N'D??Z??????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2333, 61, N'D??ZK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2334, 17, N'ECEABAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2335, 22, N'ED??RNE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2336, 10, N'EDREM??T')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2337, 65, N'EDREM??T')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2338, 78, N'EFLAN??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2339, 21, N'E????L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2340, 32, N'E????RD??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2341, 46, N'EK??N??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2342, 23, N'ELAZI?? MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2343, 79, N'ELBEYL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2344, 46, N'ELB??STAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2345, 18, N'ELD??VAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2346, 4, N'ELE??K??RT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2347, 6, N'ELMADA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2348, 7, N'ELMALI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2349, 43, N'EMET')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2350, 34, N'EM??N??N??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2351, 3, N'EM??RDA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2352, 42, N'EM??RGAZ??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2353, 22, N'ENEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2354, 60, N'ERBAA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2355, 65, N'ERC????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2356, 10, N'ERDEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2357, 33, N'ERDEML??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2358, 42, N'ERE??L??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2359, 67, N'ERE??L??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2360, 54, N'ERENLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2361, 57, N'ERFELEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2362, 21, N'ERGAN??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2363, 70, N'ERMENEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2364, 56, N'ERUH')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2365, 31, N'ERZ??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2366, 24, N'ERZ??NCAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2367, 25, N'ERZURUM MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2368, 34, N'ESENLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2369, 34, N'ESENYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2370, 68, N'ESK??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2371, 78, N'ESK??PAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2372, 26, N'ESK????EH??R MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2373, 28, N'ESP??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2374, 64, N'E??ME')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2375, 6, N'ET??MESGUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2376, 3, N'EVC??LER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2377, 6, N'EVREN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2378, 28, N'EYNES??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2379, 34, N'EY??P')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2380, 17, N'EZ??NE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2381, 34, N'FAT??H')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2382, 52, N'FATSA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2383, 1, N'FEKE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2384, 38, N'FELAH??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2385, 54, N'FER??ZL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2386, 48, N'FETH??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2387, 53, N'FINDIKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2388, 7, N'F??N??KE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2389, 35, N'FO??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2390, 35, N'GAZ??EM??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2391, 34, N'GAZ??OSMANPA??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2392, 7, N'GAZ??PA??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2393, 41, N'GEBZE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2394, 43, N'GED??Z')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2395, 32, N'GELENDOST')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2396, 17, N'GEL??BOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2397, 58, N'GEMEREK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2398, 16, N'GEML??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2399, 12, N'GEN??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2400, 72, N'GERC????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2401, 14, N'GEREDE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2402, 2, N'GERGER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2403, 9, N'GERMENC??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2404, 57, N'GERZE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2405, 65, N'GEVA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2406, 54, N'GEYVE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2407, 28, N'G??RESUN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2408, 17, N'G??K??EADA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2409, 67, N'G??K??EBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2410, 46, N'G??KSUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2411, 2, N'G??LBA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2412, 6, N'G??LBA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2413, 41, N'G??LC??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2414, 75, N'G??LE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2415, 15, N'G??LH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2416, 52, N'G??LK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2417, 45, N'G??LMARMARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2418, 58, N'G??LOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2419, 11, N'G??LPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2420, 81, N'G??LYAKA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2421, 10, N'G??ME??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2422, 10, N'G??NEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2423, 32, N'G??NEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2424, 45, N'G??RDES')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2425, 28, N'G??RELE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2426, 5, N'G??YN??CEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2427, 14, N'G??YN??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2428, 28, N'G??CE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2429, 73, N'G????L??KONAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2430, 6, N'G??D??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2431, 68, N'G??LA??A??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2432, 33, N'G??LNAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2433, 50, N'G??L??EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2434, 52, N'G??LYALI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2435, 5, N'G??M????HACIK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2436, 29, N'G??M????HANE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2437, 81, N'G??M????OVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2438, 7, N'G??NDO??MU??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2439, 20, N'G??NEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2440, 42, N'G??NEYSINIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2441, 53, N'G??NEYSU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2442, 34, N'G??NG??REN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2443, 26, N'G??NY??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2444, 52, N'G??RGENTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2445, 13, N'G??ROYMAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2446, 65, N'G??RPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2447, 16, N'G??RSU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2448, 58, N'G??R??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2449, 35, N'G??ZELBAH??E')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2450, 68, N'G??ZELYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2451, 50, N'HACIBEKTA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2452, 38, N'HACILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2453, 42, N'HAD??M')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2454, 58, N'HAF??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2455, 30, N'HAKKAR?? MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2456, 63, N'HALFET??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2457, 42, N'HALKAPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2458, 5, N'HAMAM??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2459, 4, N'HAMUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2460, 26, N'HAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2461, 75, N'HANAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2462, 21, N'HAN??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2463, 37, N'HAN??N??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2464, 16, N'HARMANCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2465, 63, N'HARRAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2466, 80, N'HASANBEYL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2467, 72, N'HASANKEYF')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2468, 49, N'HASK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2469, 31, N'HASSA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2470, 31, N'HATAY MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2471, 10, N'HAVRAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2472, 22, N'HAVSA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2473, 55, N'HAVZA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2474, 6, N'HAYMANA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2475, 59, N'HAYRABOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2476, 61, N'HAYRAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2477, 21, N'HAZRO')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2478, 44, N'HEK??MHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2479, 53, N'HEM????N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2480, 54, N'HENDEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2481, 25, N'HINIS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2482, 63, N'H??LVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2483, 43, N'H??SARCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2484, 13, N'H??ZAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2485, 3, N'HOCALAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2486, 20, N'HONAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2487, 8, N'HOPA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2488, 25, N'HORASAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2489, 62, N'HOZAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2490, 42, N'H??Y??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2491, 76, N'I??DIR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2492, 18, N'ILGAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2493, 42, N'ILGIN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2494, 32, N'ISPARTA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2495, 7, N'??BRADI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2496, 73, N'??D??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2497, 37, N'??HSANGAZ??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2498, 3, N'??HSAN??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2499, 52, N'??K??ZCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2500, 53, N'??K??ZDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2501, 24, N'??L????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2502, 55, N'??LKADIM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2503, 1, N'??MAMO??LU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2504, 58, N'??MRANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2505, 38, N'??NCESU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2506, 9, N'??NC??RL??OVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2507, 37, N'??NEBOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2508, 16, N'??NEG??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2509, 11, N'??NH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2510, 26, N'??N??N??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2511, 22, N'??PSALA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2512, 3, N'??SCEH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2513, 31, N'??SKENDERUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2514, 19, N'??SK??L??P')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2515, 27, N'??SLAH??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2516, 25, N'??SP??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2517, 10, N'??VR??ND??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2518, 53, N'??Y??DERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2519, 41, N'??ZM??T')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2520, 16, N'??ZN??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2521, 52, N'KABAD??Z')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2522, 52, N'KABATA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2523, 34, N'KADIK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2524, 42, N'KADINHANI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2525, 66, N'KADI??EHR??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2526, 80, N'KAD??RL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2527, 34, N'KA??ITHANE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2528, 36, N'KA??IZMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2529, 46, N'KAHRAMANMARA?? MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2530, 2, N'KAHTA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2531, 20, N'KALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2532, 44, N'KALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2533, 6, N'KALEC??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2534, 53, N'KALKANDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2535, 40, N'KAMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2536, 41, N'KANDIRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2537, 58, N'KANGAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2538, 35, N'KARABA??LAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2539, 35, N'KARABURUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2540, 78, N'KARAB??K MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2541, 16, N'KARACABEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2542, 9, N'KARACASU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2543, 25, N'KARA??OBAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2544, 64, N'KARAHALLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2545, 1, N'KARA??SALI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2546, 71, N'KARAKE????L??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2547, 23, N'KARAKO??AN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2548, 76, N'KARAKOYUNLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2549, 70, N'KARAMAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2550, 15, N'KARAMANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2551, 41, N'KARAM??RSEL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2552, 42, N'KARAPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2553, 54, N'KARAP??R??EK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2554, 54, N'KARASU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2555, 1, N'KARATA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2556, 42, N'KARATAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2557, 25, N'KARAYAZI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2558, 19, N'KARGI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2559, 27, N'KARKAMI??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2560, 12, N'KARLIOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2561, 9, N'KARPUZLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2562, 36, N'KARS MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2563, 35, N'KAR??IYAKA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2564, 34, N'KARTAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2565, 41, N'KARTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2566, 37, N'KASTAMONU MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2567, 7, N'KA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2568, 55, N'KAVAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2569, 48, N'KAVAKLIDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2570, 21, N'KAYAPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2571, 54, N'KAYNARCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2572, 81, N'KAYNA??LI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2573, 6, N'KAZAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2574, 70, N'KAZIMKARABEK??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2575, 23, N'KEBAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2576, 32, N'KE????BORLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2577, 6, N'KE??????REN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2578, 16, N'KELES')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2579, 29, N'KELK??T')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2580, 24, N'KEMAH')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2581, 24, N'KEMAL??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2582, 35, N'KEMALPA??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2583, 7, N'KEMER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2584, 15, N'KEMER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2585, 7, N'KEPEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2586, 10, N'KEPSUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2587, 71, N'KESK??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2588, 16, N'KESTEL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2589, 22, N'KE??AN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2590, 28, N'KE??AP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2591, 14, N'KIBRISCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2592, 35, N'KINIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2593, 31, N'KIRIKHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2594, 71, N'KIRIKKALE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2595, 45, N'KIRKA??A??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2596, 39, N'KIRKLAREL?? MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2597, 40, N'KIR??EH??R MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2598, 6, N'KIZILCAHAMAM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2599, 18, N'KIZILIRMAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2600, 3, N'KIZIL??REN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2601, 47, N'KIZILTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2602, 12, N'K????I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2603, 79, N'K??L??S MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2604, 35, N'K??RAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2605, 54, N'KOCAAL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2606, 41, N'KOCAEL?? MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2607, 21, N'KOCAK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2608, 38, N'KOCAS??NAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2609, 9, N'KO??ARLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2610, 39, N'KOF??AZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2611, 35, N'KONAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2612, 7, N'KONYAALTI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2613, 52, N'KORGAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2614, 18, N'KORGUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2615, 49, N'KORKUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2616, 7, N'KORKUTEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2617, 23, N'KOVANCILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2618, 58, N'KOYULH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2619, 50, N'KOZAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2620, 1, N'KOZAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2621, 72, N'KOZLUK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2622, 45, N'K??PR??BA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2623, 61, N'K??PR??BA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2624, 25, N'K??PR??K??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2625, 41, N'K??RFEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2626, 29, N'K??SE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2627, 9, N'K????K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2628, 48, N'K??YCE????Z')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2629, 45, N'KULA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2630, 21, N'KULP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2631, 42, N'KULU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2632, 44, N'KULUNCAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2633, 31, N'KUMLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2634, 7, N'KUMLUCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2635, 52, N'KUMRU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2636, 18, N'KUR??UNLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2637, 56, N'KURTALAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2638, 74, N'KURUCA????LE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2639, 9, N'KU??ADASI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2640, 9, N'KUYUCAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2641, 34, N'K??????K??EKMECE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2642, 37, N'K??RE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2643, 29, N'K??RT??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2644, 43, N'K??TAHYA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2645, 19, N'LA????N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2646, 55, N'LAD??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2647, 22, N'LALAPA??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2648, 17, N'LAPSEK??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2649, 21, N'L??CE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2650, 39, N'L??LEBURGAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2651, 61, N'MA??KA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2652, 23, N'MADEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2653, 26, N'MAHMUD??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2654, 44, N'MALATYA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2655, 49, N'MALAZG??RT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2656, 59, N'MALKARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2657, 34, N'MALTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2658, 6, N'MAMAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2659, 7, N'MANAVGAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2660, 45, N'MAN??SA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2661, 10, N'MANYAS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2662, 47, N'MARD??N MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2663, 10, N'MARMARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2664, 59, N'MARMARAERE??L??S??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2665, 48, N'MARMAR??S')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2666, 62, N'MAZG??RT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2667, 47, N'MAZIDA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2668, 19, N'MEC??T??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2669, 38, N'MEL??KGAZ??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2670, 35, N'MENDERES')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2671, 35, N'MENEMEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2672, 14, N'MENGEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2673, 42, N'MERAM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2674, 22, N'MER????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2675, 33, N'MERS??N MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2676, 5, N'MERZ??FON')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2677, 52, N'MESUD??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2678, 33, N'MEZ??TL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2679, 47, N'M??DYAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2680, 26, N'M??HALGAZ??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2681, 26, N'M??HALI????IK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2682, 48, N'M??LAS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2683, 40, N'MUCUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2684, 16, N'MUDANYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2685, 14, N'MUDURNU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2686, 48, N'MU??LA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2687, 65, N'MURAD??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2688, 59, N'MURATLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2689, 7, N'MURATPA??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2690, 8, N'MURGUL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2691, 79, N'MUSABEYL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2692, 16, N'MUSTAFA K.PA??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2693, 49, N'MU?? MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2694, 33, N'MUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2695, 13, N'MUTK??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2696, 6, N'NALLIHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2697, 35, N'NARLIDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2698, 25, N'NARMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2699, 62, N'NAZIM??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2700, 9, N'NAZ??LL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2701, 50, N'NEV??EH??R MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2702, 51, N'N????DE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2703, 60, N'N??KSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2704, 16, N'N??L??FER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2705, 27, N'N??Z??P')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2706, 27, N'NURDA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2707, 46, N'NURHAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2708, 47, N'NUSAYB??N')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2709, 26, N'ODUNPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2710, 61, N'OF')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2711, 27, N'O??UZEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2712, 19, N'O??UZLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2713, 25, N'OLTU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2714, 25, N'OLUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2715, 55, N'ONDOKUZMAYIS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2716, 52, N'ORDU MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2717, 16, N'ORHANEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2718, 16, N'ORHANGAZ??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2719, 18, N'ORTA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2720, 48, N'ORTACA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2721, 68, N'ORTAK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2722, 19, N'ORTAK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2723, 19, N'OSMANCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2724, 11, N'OSMANEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2725, 16, N'OSMANGAZ??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2726, 80, N'OSMAN??YE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2727, 24, N'OTLUKBEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2728, 78, N'OVACIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2729, 62, N'OVACIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2730, 35, N'??DEM????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2731, 47, N'??MERL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2732, 65, N'??ZALP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2733, 38, N'??ZVATAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2734, 25, N'PALAND??KEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2735, 23, N'PALU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2736, 54, N'PAMUKOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2737, 25, N'PAS??NLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2738, 4, N'PATNOS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2739, 53, N'PAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2740, 60, N'PAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2741, 46, N'PAZARCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2742, 43, N'PAZARLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2743, 11, N'PAZARYER??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2744, 25, N'PAZARYOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2745, 39, N'PEHL??VANK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2746, 34, N'PEND??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2747, 52, N'PER??EMBE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2748, 62, N'PERTEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2749, 56, N'PERVAR??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2750, 37, N'PINARBA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2751, 38, N'PINARBA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2752, 39, N'PINARH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2753, 28, N'P??RAZ??Z')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2754, 79, N'POLATEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2755, 6, N'POLATLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2756, 75, N'POSOF')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2757, 1, N'POZANTI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2758, 6, N'PURSAKLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2759, 62, N'P??L??M??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2760, 44, N'P??T??RGE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2761, 24, N'REFAH??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2762, 60, N'RE??AD??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2763, 31, N'REYHANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2764, 53, N'R??ZE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2765, 78, N'SAFRANBOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2766, 1, N'SA??MBEYL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2767, 54, N'SAKARYA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2768, 55, N'SALIPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2769, 45, N'SAL??HL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2770, 31, N'SAMANDA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2771, 2, N'SAMSAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2772, 55, N'SAMSUN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2773, 34, N'SANCAKTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2774, 3, N'SANDIKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2775, 54, N'SAPANCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2776, 59, N'SARAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2777, 65, N'SARAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2778, 57, N'SARAYD??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2779, 66, N'SARAYKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2780, 20, N'SARAYK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2781, 42, N'SARAY??N??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2782, 26, N'SARICAKAYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2783, 1, N'SARI??AM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2784, 45, N'SARIG??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2785, 36, N'SARIKAMI??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2786, 66, N'SARIKAYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2787, 38, N'SARIO??LAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2788, 70, N'SARIVEL??LER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2789, 68, N'SARIYAH????')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2790, 34, N'SARIYER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2791, 38, N'SARIZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2792, 45, N'SARUHANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2793, 72, N'SASON')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2794, 10, N'SAVA??TEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2795, 47, N'SAVUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2796, 14, N'SEBEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2797, 35, N'SEFER??H??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2798, 35, N'SEL??UK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2799, 42, N'SEL??UKLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2800, 45, N'SELEND??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2801, 36, N'SEL??M')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2802, 32, N'SEN??RKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2803, 54, N'SERD??VAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2804, 7, N'SER??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2805, 20, N'SER??NH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2806, 37, N'SEYD??LER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2807, 42, N'SEYD????EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2808, 1, N'SEYHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2809, 26, N'SEY??TGAZ??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2810, 10, N'SINDIRGI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2811, 56, N'S????RT MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2812, 33, N'S??L??FKE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2813, 34, N'S??L??VR??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2814, 73, N'S??LOP??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2815, 21, N'S??LVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2816, 43, N'S??MAV')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2817, 3, N'S??NANPA??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2818, 6, N'S??NCAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2819, 2, N'S??NC??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2820, 57, N'S??NOP MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2821, 58, N'S??VAS MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2822, 64, N'S??VASLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2823, 63, N'S??VEREK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2824, 23, N'S??VR??CE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2825, 26, N'S??VR??H??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2826, 12, N'SOLHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2827, 45, N'SOMA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2828, 66, N'SORGUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2829, 11, N'S??????T')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2830, 54, N'S??????TL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2831, 9, N'S??KE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2832, 71, N'SULAKYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2833, 34, N'SULTANBEYL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2834, 3, N'SULTANDA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2835, 34, N'SULTANGAZ??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2836, 9, N'SULTANH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2837, 5, N'SULUOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2838, 60, N'SULUSARAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2839, 80, N'SUMBAS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2840, 19, N'SUNGURLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2841, 21, N'SUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2842, 63, N'SURU??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2843, 10, N'SUSURLUK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2844, 36, N'SUSUZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2845, 58, N'SU??EHR??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2846, 22, N'S??LO??LU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2847, 61, N'S??RMENE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2848, 32, N'S??T????LER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2849, 18, N'??ABAN??Z??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2850, 27, N'??AH??NBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2851, 61, N'??ALPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2852, 63, N'??ANLIURFA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2853, 43, N'??APHANE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2854, 58, N'??ARKI??LA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2855, 32, N'??ARK??KARAA??A??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2856, 59, N'??ARK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2857, 8, N'??AV??AT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2858, 28, N'??EB??NKARAH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2859, 66, N'??EFAATL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2860, 27, N'??EH??TKAM??L')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2861, 30, N'??EMD??NL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2862, 25, N'??ENKAYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2863, 37, N'??ENPAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2864, 6, N'??EREFL??KO??H??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2865, 73, N'??IRNAK MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2866, 34, N'????LE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2867, 29, N'????RAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2868, 56, N'????RVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2869, 34, N'??????L??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2870, 3, N'??UHUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2871, 38, N'TALAS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2872, 54, N'TARAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2873, 33, N'TARSUS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2874, 42, N'TA??KENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2875, 37, N'TA??K??PR??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2876, 4, N'TA??LI??AY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2877, 5, N'TA??OVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2878, 13, N'TATVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2879, 20, N'TAVAS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2880, 43, N'TAV??ANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2881, 15, N'TEFENN??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2882, 59, N'TEK??RDA?? MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2883, 55, N'TEKKEK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2884, 25, N'TEKMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2885, 26, N'TEPEBA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2886, 24, N'TERCAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2887, 77, N'TERMAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2888, 55, N'TERME')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2889, 35, N'T??RE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2890, 28, N'T??REBOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2891, 60, N'TOKAT MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2892, 38, N'TOMARZA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2893, 61, N'TONYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2894, 80, N'TOPRAKKALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2895, 35, N'TORBALI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2896, 33, N'TOROSLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2897, 25, N'TORTUM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2898, 29, N'TORUL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2899, 37, N'TOSYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2900, 61, N'TRABZON MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2901, 1, N'TUFANBEYL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2902, 62, N'TUNCEL?? MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2903, 45, N'TURGUTLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2904, 60, N'TURHAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2905, 2, N'TUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2906, 4, N'TUTAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2907, 34, N'TUZLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2908, 76, N'TUZLUCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2909, 42, N'TUZLUK??U')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2910, 57, N'T??RKEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2911, 46, N'T??RKO??LU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2912, 19, N'U??URLUDA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2913, 48, N'ULA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2914, 58, N'ULA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2915, 52, N'ULUBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2916, 64, N'ULUBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2917, 32, N'ULUBORLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2918, 73, N'ULUDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2919, 51, N'ULUKI??LA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2920, 74, N'ULUS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2921, 35, N'URLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2922, 64, N'U??AK MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2923, 25, N'UZUNDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2924, 22, N'UZUNK??PR??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2925, 34, N'??MRAN??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2926, 52, N'??NYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2927, 50, N'??RG??P')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2928, 34, N'??SK??DAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2929, 24, N'??Z??ML??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2930, 61, N'VAKFIKEB??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2931, 65, N'VAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2932, 49, N'VARTO')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2933, 55, N'VEZ??RK??PR??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2934, 63, N'V??RAN??EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2935, 39, N'V??ZE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2936, 28, N'YA??LIDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2937, 71, N'YAH????HAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2938, 38, N'YAHYALI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2939, 55, N'YAKAKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2940, 25, N'YAKUT??YE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2941, 42, N'YALIH??Y??K')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2942, 77, N'YALOVA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2943, 32, N'YALVA??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2944, 18, N'YAPRAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2945, 48, N'YATA??AN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2946, 27, N'YAVUZEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2947, 31, N'YAYLADA??I')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2948, 12, N'YAYLADERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2949, 44, N'YAZIHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2950, 12, N'YED??SU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2951, 17, N'YEN??CE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2952, 78, N'YEN??CE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2953, 14, N'YEN????A??A')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2954, 66, N'YEN??FAKILI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2955, 6, N'YEN??MAHALLE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2956, 9, N'YEN??PAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2957, 11, N'YEN??PAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2958, 32, N'YEN????ARBADEML??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2959, 16, N'YEN????EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2960, 21, N'YEN????EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2961, 33, N'YEN????EH??R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2962, 66, N'YERK??Y')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2963, 38, N'YE????LH??SAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2964, 47, N'YE????LL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2965, 15, N'YE????LOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2966, 44, N'YE????LYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2967, 60, N'YE????LYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2968, 81, N'YI??ILCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2969, 16, N'YILDIRIM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2970, 58, N'YILDIZEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2971, 61, N'YOMRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2972, 66, N'YOZGAT MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2973, 1, N'YUMURTALIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2974, 42, N'YUNAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2975, 8, N'YUSUFEL??')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2976, 30, N'Y??KSEKOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2977, 1, N'Y??RE????R')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2978, 58, N'ZARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2979, 34, N'ZEYT??NBURNU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2980, 60, N'Z??LE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2981, 67, N'ZONGULDAK MERKEZ')
GO
SET IDENTITY_INSERT [dbo].[Ilce] OFF
GO
SET IDENTITY_INSERT [dbo].[KargoFirma] ON 
GO
INSERT [dbo].[KargoFirma] ([Id], [FirmaAdi]) VALUES (1, N'Mng Kargo')
GO
INSERT [dbo].[KargoFirma] ([Id], [FirmaAdi]) VALUES (2, N'Yurti??i Kargo')
GO
INSERT [dbo].[KargoFirma] ([Id], [FirmaAdi]) VALUES (3, N'Aras Kargo')
GO
INSERT [dbo].[KargoFirma] ([Id], [FirmaAdi]) VALUES (4, N'UPS')
GO
SET IDENTITY_INSERT [dbo].[KargoFirma] OFF
GO
SET IDENTITY_INSERT [dbo].[KargoSube] ON 
GO
INSERT [dbo].[KargoSube] ([Id], [KargoFirmaId], [SubeAdi], [TelefonNo]) VALUES (1, 1, N'Avc??lar', N'0212 245 36 36')
GO
INSERT [dbo].[KargoSube] ([Id], [KargoFirmaId], [SubeAdi], [TelefonNo]) VALUES (2, 1, N'Beylikd??z??', N'0212 155 66 66')
GO
SET IDENTITY_INSERT [dbo].[KargoSube] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteri] ON 
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1004, N'H??SEY??N NECM?? G??DERSU', N'536 369 36 36', N'H??SEY??NNECM??@gmail.com', 66, 2251, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1005, N'ASENA SEV??LAY P????K??NSOY', N'536 369 36 36', N'ASENASEV??LAY@gmail.com', 13, 2878, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1006, N'ZEYAT KESTEVUR', N'536 369 36 36', N'zeyat@gmail.com', 37, 2642, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1007, N'SELMAN H??LM?? KESTANE', N'536 369 36 36', N'selmanhilmi@gmail.com', 37, 2119, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1008, N'KEMAL UFUK BA??C??L', N'536 369 36 36', N'kemalufuk@gmail.com', 36, 2562, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1009, N'TAG?? KASAPCI', N'536 369 48 36', N'tagi@gmail.com', 6, 2598, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1010, N'O??UZ AL?? AYKER', N'536 369 48 36', N'o??uzali@gmail.com', 28, 2425, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1011, N'A??IR AKREP', N'536 369 48 36', N'a????r@gmail.com', 36, 2801, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1012, N'BEYAZIT SALU?? ??LM??N', N'536 369 48 36', N'beyaz??tsalu??@gmail.com', 29, 2643, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1013, N'LEVENT OKTAY KOL', N'536 369 48 36', N'leventoktay@gmail.com', 33, 2432, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1014, N'K??BRA EL??F BURKAN', N'536 369 48 36', N'k??braelif@gmail.com', 67, 2409, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1015, N'SEZA?? MANDAL C??ND??R', N'536 369 48 36', N'sezaimandal@gmail.com', 61, 2930, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1016, N'B??RTE????N D??ZALAN', N'536 369 48 36', N'b??rte??in@gmail.com', 23, 2652, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1017, N'FIRAT MAH??R SIVACIO??LU', N'536 369 48 36', N'f??ratmahir@gmail.com', 9, 2836, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1018, N'DEMET B????ERER', N'536 369 48 36', N'demet@gmail.com', 45, 2784, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1019, N'ONUR G??VEN B??K??R', N'536 369 48 36', N'onurg??ven@gmail.com', 73, 2215, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1020, N'??AH??N TEKST??L ????R??K????', N'536 369 48 36', N'??ahintekstil@gmail.com', 57, 2361, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1021, N'ERDA??I TANTALKAYA', N'536 369 48 36', N'erda????@gmail.com', 37, 2119, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1022, N'SAFURE SARIFEDA??', N'536 369 48 36', N'safure@gmail.com', 36, 2785, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1023, N'NUR Z??YNET B??Y??KBOSTANCIO??LU', N'536 369 48 36', N'nurziynet@gmail.com', 10, 2118, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1024, N'HARUN TOLGA TANCAN', N'536 369 48 36', N'haruntolga@gmail.com', 26, 2709, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1025, N'ALPER FUAT KINAY', N'536 369 48 36', N'alperfuat@gmail.com', 77, 2268, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1026, N'KOZA TEKST??L CELEP????', N'536 369 48 36', N'kozatekstil@gmail.com', 10, 2336, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1027, N'MUB??NE SINAK', N'536 369 48 36', N'mubine@gmail.com', 42, 2052, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1028, N'AHMET M??THAT PINARER', N'536 369 48 36', N'ahmetmithat@gmail.com', 26, 2681, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1029, N'YILMAZ GEN?? ALPSOY', N'536 369 48 36', N'y??lmazgen??@gmail.com', 53, 2087, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1030, N'TEMEL ??NDER BEYGE', N'536 369 48 36', N'temel??nder@gmail.com', 45, 2595, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1031, N'S??LEYMAN TOLGA CUN??', N'536 369 48 36', N's??leymantolga@gmail.com', 73, 2429, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1032, N'KENAL ??K', N'536 769 48 36', N'kenal@gmail.com', 24, 2366, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1033, N'YA??ETT??N GEBEC??', N'556 769 48 36', N'ya??ettin@gmail.com', 22, 2353, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1034, N'??MER ????NAS?? BAYSAK', N'556 769 48 96', N'??mer??inasi@gmail.com', 81, 2270, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1035, N'ORHAN BAYRAM MEL??K', N'556 769 48 96', N'orhanbayram@gmail.com', 16, 2541, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1036, N'H??LM?? YAL??IN MALAYMAR', N'556 769 48 96', N'hilmiyal????n@gmail.com', 77, 2268, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1037, N'??ZLEM G??K GEN??TAN', N'556 769 48 96', N'??zlemg??k@gmail.com', 39, 2610, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1038, N'KAZIM MUSTAFA PASTIRMACI', N'556 769 48 96', N'kaz??mmustafa@gmail.com', 14, 2953, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1039, N'CELAL BORA ALT??N', N'556 769 48 96', N'celalbora@gmail.com', 56, 2364, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1040, N'ZEKAYI ??APUTCU', N'556 769 48 96', N'zekay??@gmail.com', 54, 2830, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1041, N'NAZIMEMRAH KAYNAKLI', N'556 769 48 96', N'naz??memrah@gmail.com', 39, 2752, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1042, N'UMUT FURKAN TEM??ZSOYLU', N'556 769 48 96', N'umutfurkan@gmail.com', 76, 2548, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1043, N'NED??ME DEMET ????FF??L??Z', N'556 769 48 96', N'nedimedemet@gmail.com', 5, 2435, N'')
GO
SET IDENTITY_INSERT [dbo].[Musteri] OFF
GO
SET IDENTITY_INSERT [dbo].[PerformansRapor] ON 
GO
INSERT [dbo].[PerformansRapor] ([Id], [RaportAdi], [ProcedureName]) VALUES (2, N'Personel Teslim Raporu', N'pReportTeslimTeslimPerformans')
GO
INSERT [dbo].[PerformansRapor] ([Id], [RaportAdi], [ProcedureName]) VALUES (3, N'Personel Tamir Performans', N'pReportCihazTamirPerformans')
GO
INSERT [dbo].[PerformansRapor] ([Id], [RaportAdi], [ProcedureName]) VALUES (4, N'Kontrol Personel Performans', N'pReportKontrolPersonelPerformans')
GO
INSERT [dbo].[PerformansRapor] ([Id], [RaportAdi], [ProcedureName]) VALUES (5, N'??r??n Teslim Performans', N'pReportIadePersonelPerformans')
GO
SET IDENTITY_INSERT [dbo].[PerformansRapor] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 
GO
INSERT [dbo].[Personel] ([Id], [KullaniciAdi], [Sifre], [Adi], [Soyadi], [Pasif], [Gorev], [UstPersonelId]) VALUES (1, N'Admin', N'Admin', N'System', N'Admin', 0, N'Admin', 0)
GO
INSERT [dbo].[Personel] ([Id], [KullaniciAdi], [Sifre], [Adi], [Soyadi], [Pasif], [Gorev], [UstPersonelId]) VALUES (2, N'Kdr', N'1', N'Kadir', N'??ahin', 0, N'Admin', 1)
GO
INSERT [dbo].[Personel] ([Id], [KullaniciAdi], [Sifre], [Adi], [Soyadi], [Pasif], [Gorev], [UstPersonelId]) VALUES (3, N'ahmetV', N'1', N'Ahmet', N'Veli', 0, N'Karsilama', 2)
GO
INSERT [dbo].[Personel] ([Id], [KullaniciAdi], [Sifre], [Adi], [Soyadi], [Pasif], [Gorev], [UstPersonelId]) VALUES (4, N'MehmetT', N'1', N'Mehmet', N'Tekin', 0, N'TeknikPersonel', 2)
GO
INSERT [dbo].[Personel] ([Id], [KullaniciAdi], [Sifre], [Adi], [Soyadi], [Pasif], [Gorev], [UstPersonelId]) VALUES (5, N'AliY', N'1', N'Ali', N'Yaman', 0, N'UrunKargo', 2)
GO
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonelLoginSession] ON 
GO
INSERT [dbo].[PersonelLoginSession] ([Id], [PersonelId], [GirisTarihi], [CikisTarihi], [BilgisayarAdi]) VALUES (1, 1, CAST(N'2021-08-11T16:00:29.277' AS DateTime), CAST(N'2021-08-11T16:00:58.397' AS DateTime), N'YILMAZOZKN21')
GO
INSERT [dbo].[PersonelLoginSession] ([Id], [PersonelId], [GirisTarihi], [CikisTarihi], [BilgisayarAdi]) VALUES (2, 1, CAST(N'2021-08-11T16:33:43.910' AS DateTime), CAST(N'2021-08-16T11:30:18.403' AS DateTime), N'YILMAZOZKN21')
GO
INSERT [dbo].[PersonelLoginSession] ([Id], [PersonelId], [GirisTarihi], [CikisTarihi], [BilgisayarAdi]) VALUES (3, 1, CAST(N'2021-08-16T12:25:10.347' AS DateTime), CAST(N'2021-08-16T12:26:07.587' AS DateTime), N'YILMAZOZKN21')
GO
INSERT [dbo].[PersonelLoginSession] ([Id], [PersonelId], [GirisTarihi], [CikisTarihi], [BilgisayarAdi]) VALUES (4, 1, CAST(N'2021-08-16T15:16:42.187' AS DateTime), NULL, N'YILMAZOZKN21')
GO
INSERT [dbo].[PersonelLoginSession] ([Id], [PersonelId], [GirisTarihi], [CikisTarihi], [BilgisayarAdi]) VALUES (1003, 3, CAST(N'2021-08-25T16:34:50.587' AS DateTime), CAST(N'2021-08-25T16:48:15.477' AS DateTime), N'YILMAZOZKN21')
GO
INSERT [dbo].[PersonelLoginSession] ([Id], [PersonelId], [GirisTarihi], [CikisTarihi], [BilgisayarAdi]) VALUES (1004, 4, CAST(N'2021-08-25T16:48:40.457' AS DateTime), NULL, N'YILMAZOZKN21')
GO
INSERT [dbo].[PersonelLoginSession] ([Id], [PersonelId], [GirisTarihi], [CikisTarihi], [BilgisayarAdi]) VALUES (1005, 2, CAST(N'2021-08-25T16:53:07.010' AS DateTime), NULL, N'YILMAZOZKN21')
GO
INSERT [dbo].[PersonelLoginSession] ([Id], [PersonelId], [GirisTarihi], [CikisTarihi], [BilgisayarAdi]) VALUES (1006, 3, CAST(N'2021-08-25T16:56:19.887' AS DateTime), CAST(N'2021-08-25T17:12:24.780' AS DateTime), N'YILMAZOZKN21')
GO
SET IDENTITY_INSERT [dbo].[PersonelLoginSession] OFF
GO
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (0, N'Yeni')
GO
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (1, N'Tamir Ediliyor')
GO
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (2, N'Par??a Bekliyor')
GO
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (3, N'Kalite Kontrol')
GO
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (4, N'Tamir Bitti')
GO
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (5, N'G??nderildi')
GO
SET IDENTITY_INSERT [dbo].[TamirTeslim] ON 
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (5, 1008, 3, 2, 2, N'Apple', N'iPhone11', N'9s5d9fasd92asdasd', N'Ekran k??r??lmas??', N'Ekran De??i??imi yap??ld?? sa??l??kl?? ??al??????yor', CAST(N'2021-08-25T16:43:49.403' AS DateTime), NULL, N'??aj Cihaz??', 170.0000, N'eac2e6c5-f55e-4a1c-934e-2762c588c559', 0, 5, CAST(N'2021-08-25T16:58:54.163' AS DateTime), NULL, NULL, 1, NULL)
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (6, 1013, 3, 3, 2, N'Samsung', N'Galaxy A02s', N'56996449513394139', N'Kasa Ar??zas??', N'Kasa De??i??tirildi.', CAST(N'2021-08-25T16:44:41.530' AS DateTime), NULL, N'', 250.0000, N'f1c24742-4806-4545-b068-fe597bcdd2cb', 0, 5, CAST(N'2021-08-25T16:59:02.210' AS DateTime), NULL, NULL, 0, N'Levent Oktay')
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (7, 1006, 3, NULL, 1, N'Oppo', N'A73', N'989232691233', N'Ses gelmiyor.', N'de??i??tirildi.', CAST(N'2021-08-25T16:46:11.393' AS DateTime), NULL, N'', 95.0000, N'0521f232-edf8-474d-a419-4b9b9885b401', 0, 3, CAST(N'2021-08-25T16:55:49.677' AS DateTime), NULL, NULL, 0, NULL)
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (8, 1028, 3, 2, 2, N'Huawei', N'P Smart S', N'98926994956', N'Ekran k??r??k', N'', CAST(N'2021-08-25T16:47:06.160' AS DateTime), NULL, N'', 170.0000, N'4c8f29a6-d98b-4793-9a05-61c10a1b3a3e', 0, 5, CAST(N'2021-08-25T16:59:07.143' AS DateTime), NULL, NULL, 1, NULL)
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (9, 1010, 3, 3, 2, N'LG', N'P40 Lite', N'9795994158', N'Sim kart yuvas?? k??r??k', N'tamir edildi', CAST(N'2021-08-25T16:48:06.547' AS DateTime), NULL, N'', 120.0000, N'2791c7d1-c32f-433b-a51a-ce4c467ff3c8', 0, 5, CAST(N'2021-08-25T16:59:11.440' AS DateTime), NULL, NULL, 0, N'O??uz Ali ayker')
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (10, 1028, 1, NULL, NULL, N'Apple', N'iPhone11', N'9899sd9sdsdsd', N'Ekran ar??zas??', NULL, CAST(N'2021-08-25T17:33:01.157' AS DateTime), NULL, N'', 170.0000, N'd0b2b52d-2842-469b-aea0-8a9c5067db58', 0, 1, NULL, NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[TamirTeslim] OFF
GO
SET IDENTITY_INSERT [dbo].[UygulamaMenu] ON 
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (1, N'Kar????lama', 0, NULL, 0)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (2, N'??r??n Teslim Alma', 1, N'Kdr.TeknikServis.controls.UserControlUrunTeslimAl', 1)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (4, N'Teknik Servis', 0, NULL, 3)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (5, N'????lem Bekleyenler', 4, N'Kdr.TeknikServis.controls.UserControlIslemBekleyen', 4)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (6, N'Par??a Bekleyenler', 4, N'Kdr.TeknikServis.controls.UserControlParcaBekleyen', 5)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (7, N'Sistem', 0, NULL, 6)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (8, N'Kullan??c??lar', 7, N'Kdr.TeknikServis.controls.UserControlPersonel', 7)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (9, N'Kargo Firma', 7, N'Kdr.TeknikServis.controls.UserControlKargoFirma', 8)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (10, N'??r??n Par??a', 7, N'Kdr.TeknikServis.controls.UserControlUrunParca', 9)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (11, N'Raporlar', 7, N'Kdr.TeknikServis.controls.UserControlRaporlar', 10)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (12, N'??r??n Kargo', 0, N'Kdr.TeknikServis.controls.UserControlUrunKargo', 8)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (13, N'Onay Bekleyen', 4, N'Kdr.TeknikServis.controls.UserControlTeknikOnayBekleyen', 11)
GO
SET IDENTITY_INSERT [dbo].[UygulamaMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[UygulamaMenuYetki] ON 
GO
INSERT [dbo].[UygulamaMenuYetki] ([Id], [YetkiAdi], [UygulamaMenuId]) VALUES (1, N'Karsilama', 1)
GO
INSERT [dbo].[UygulamaMenuYetki] ([Id], [YetkiAdi], [UygulamaMenuId]) VALUES (2, N'Karsilama', 2)
GO
INSERT [dbo].[UygulamaMenuYetki] ([Id], [YetkiAdi], [UygulamaMenuId]) VALUES (4, N'TeknikPersonel', 4)
GO
INSERT [dbo].[UygulamaMenuYetki] ([Id], [YetkiAdi], [UygulamaMenuId]) VALUES (5, N'TeknikPersonel', 5)
GO
INSERT [dbo].[UygulamaMenuYetki] ([Id], [YetkiAdi], [UygulamaMenuId]) VALUES (6, N'TeknikPersonel', 6)
GO
INSERT [dbo].[UygulamaMenuYetki] ([Id], [YetkiAdi], [UygulamaMenuId]) VALUES (7, N'UrunKargo', 12)
GO
SET IDENTITY_INSERT [dbo].[UygulamaMenuYetki] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Barcode]    Script Date: 25.08.2021 19:23:45 ******/
CREATE NONCLUSTERED INDEX [IX_Barcode] ON [dbo].[TamirTeslim]
(
	[Barcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ((0)) FOR [Pasif]
GO
ALTER TABLE [dbo].[TamirTeslim] ADD  DEFAULT (getdate()) FOR [TeslimTarihi]
GO
ALTER TABLE [dbo].[CihazKargoGonderim]  WITH CHECK ADD  CONSTRAINT [FK_CihazKargoGonderim_Il] FOREIGN KEY([IlId])
REFERENCES [dbo].[Il] ([Id])
GO
ALTER TABLE [dbo].[CihazKargoGonderim] CHECK CONSTRAINT [FK_CihazKargoGonderim_Il]
GO
ALTER TABLE [dbo].[CihazKargoGonderim]  WITH CHECK ADD  CONSTRAINT [FK_CihazKargoGonderim_Ilce] FOREIGN KEY([IlceId])
REFERENCES [dbo].[Ilce] ([Id])
GO
ALTER TABLE [dbo].[CihazKargoGonderim] CHECK CONSTRAINT [FK_CihazKargoGonderim_Ilce]
GO
ALTER TABLE [dbo].[CihazKargoGonderim]  WITH CHECK ADD  CONSTRAINT [FK_CihazKargoGonderim_KargoFirma] FOREIGN KEY([KargoFirmaId])
REFERENCES [dbo].[KargoFirma] ([Id])
GO
ALTER TABLE [dbo].[CihazKargoGonderim] CHECK CONSTRAINT [FK_CihazKargoGonderim_KargoFirma]
GO
ALTER TABLE [dbo].[CihazKargoGonderim]  WITH CHECK ADD  CONSTRAINT [FK_CihazKargoGonderim_Personel] FOREIGN KEY([GonderenPersonelId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[CihazKargoGonderim] CHECK CONSTRAINT [FK_CihazKargoGonderim_Personel]
GO
ALTER TABLE [dbo].[CihazKargoGonderim]  WITH CHECK ADD  CONSTRAINT [FK_CihazKargoGonderim_TamirTeslim] FOREIGN KEY([TamirTeslimId])
REFERENCES [dbo].[TamirTeslim] ([Id])
GO
ALTER TABLE [dbo].[CihazKargoGonderim] CHECK CONSTRAINT [FK_CihazKargoGonderim_TamirTeslim]
GO
ALTER TABLE [dbo].[CihazTamirParca]  WITH CHECK ADD  CONSTRAINT [FK_CihazTamirParca_CihazParca] FOREIGN KEY([CihazParcaId])
REFERENCES [dbo].[CihazParca] ([Id])
GO
ALTER TABLE [dbo].[CihazTamirParca] CHECK CONSTRAINT [FK_CihazTamirParca_CihazParca]
GO
ALTER TABLE [dbo].[CihazTamirParca]  WITH CHECK ADD  CONSTRAINT [FK_CihazTamirParca_Personel] FOREIGN KEY([EkleyenPersonel])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[CihazTamirParca] CHECK CONSTRAINT [FK_CihazTamirParca_Personel]
GO
ALTER TABLE [dbo].[CihazTamirParca]  WITH CHECK ADD  CONSTRAINT [FK_CihazTamirParca_TamirTeslim] FOREIGN KEY([TamirTeslimId])
REFERENCES [dbo].[TamirTeslim] ([Id])
GO
ALTER TABLE [dbo].[CihazTamirParca] CHECK CONSTRAINT [FK_CihazTamirParca_TamirTeslim]
GO
ALTER TABLE [dbo].[Ilce]  WITH CHECK ADD  CONSTRAINT [FK_Ilce_Il] FOREIGN KEY([IlId])
REFERENCES [dbo].[Il] ([Id])
GO
ALTER TABLE [dbo].[Ilce] CHECK CONSTRAINT [FK_Ilce_Il]
GO
ALTER TABLE [dbo].[KargoSube]  WITH CHECK ADD  CONSTRAINT [FK_KargoSube_KargoFirma] FOREIGN KEY([KargoFirmaId])
REFERENCES [dbo].[KargoFirma] ([Id])
GO
ALTER TABLE [dbo].[KargoSube] CHECK CONSTRAINT [FK_KargoSube_KargoFirma]
GO
ALTER TABLE [dbo].[Musteri]  WITH CHECK ADD  CONSTRAINT [FK_Musteri_Il] FOREIGN KEY([IlId])
REFERENCES [dbo].[Il] ([Id])
GO
ALTER TABLE [dbo].[Musteri] CHECK CONSTRAINT [FK_Musteri_Il]
GO
ALTER TABLE [dbo].[Musteri]  WITH CHECK ADD  CONSTRAINT [FK_Musteri_Ilce] FOREIGN KEY([IlceId])
REFERENCES [dbo].[Ilce] ([Id])
GO
ALTER TABLE [dbo].[Musteri] CHECK CONSTRAINT [FK_Musteri_Ilce]
GO
ALTER TABLE [dbo].[PersonelLoginSession]  WITH CHECK ADD  CONSTRAINT [FK_PersonelLoginSession_Personel] FOREIGN KEY([PersonelId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[PersonelLoginSession] CHECK CONSTRAINT [FK_PersonelLoginSession_Personel]
GO
ALTER TABLE [dbo].[TamirTeslim]  WITH CHECK ADD  CONSTRAINT [FK_TamirTeslim_Musteri] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteri] ([Id])
GO
ALTER TABLE [dbo].[TamirTeslim] CHECK CONSTRAINT [FK_TamirTeslim_Musteri]
GO
ALTER TABLE [dbo].[TamirTeslim]  WITH CHECK ADD  CONSTRAINT [FK_TamirTeslim_Personel] FOREIGN KEY([TeslimAlanPersonelId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[TamirTeslim] CHECK CONSTRAINT [FK_TamirTeslim_Personel]
GO
ALTER TABLE [dbo].[TamirTeslim]  WITH CHECK ADD  CONSTRAINT [FK_TamirTeslim_Personel1] FOREIGN KEY([IadeEdenPersonelId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[TamirTeslim] CHECK CONSTRAINT [FK_TamirTeslim_Personel1]
GO
ALTER TABLE [dbo].[TamirTeslim]  WITH CHECK ADD  CONSTRAINT [FK_TamirTeslim_Personel2] FOREIGN KEY([TamirEdenPersonelId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[TamirTeslim] CHECK CONSTRAINT [FK_TamirTeslim_Personel2]
GO
ALTER TABLE [dbo].[TamirTeslim]  WITH CHECK ADD  CONSTRAINT [FK_TamirTeslim_Personel3] FOREIGN KEY([KontrolEdenPersonelId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[TamirTeslim] CHECK CONSTRAINT [FK_TamirTeslim_Personel3]
GO
ALTER TABLE [dbo].[TamirTeslim]  WITH CHECK ADD  CONSTRAINT [FK_TamirTeslim_TamirDurum] FOREIGN KEY([TamirDurumId])
REFERENCES [dbo].[TamirDurum] ([Id])
GO
ALTER TABLE [dbo].[TamirTeslim] CHECK CONSTRAINT [FK_TamirTeslim_TamirDurum]
GO
ALTER TABLE [dbo].[UygulamaMenuYetki]  WITH CHECK ADD  CONSTRAINT [FK_UygulamaMenuYetki_UygulamaMenu] FOREIGN KEY([UygulamaMenuId])
REFERENCES [dbo].[UygulamaMenu] ([Id])
GO
ALTER TABLE [dbo].[UygulamaMenuYetki] CHECK CONSTRAINT [FK_UygulamaMenuYetki_UygulamaMenu]
GO
/****** Object:  StoredProcedure [dbo].[pReportCihazTamirPerformans]    Script Date: 25.08.2021 19:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pReportCihazTamirPerformans]
@DateStart DATE,
@DateEnd DATE
AS

SELECT CAST(tt.TamirTarihi AS DATE) AS ReportDate,p.Adi+' '+p.Soyadi AS PersonelFullName,COUNT(*) AS CihazAdet,SUM(tt.TamirFiyat) AS TamirFiyat FROM TamirTeslim AS tt INNER JOIN
			  Personel AS p ON p.Id=tt.TamirEdenPersonelId

WHERE tt.TamirTarihi BETWEEN @DateStart AND @DateEnd
GROUP BY CAST(tt.TamirTarihi AS DATE),p.Adi+' '+p.Soyadi
			  
GO
/****** Object:  StoredProcedure [dbo].[pReportIadePersonelPerformans]    Script Date: 25.08.2021 19:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pReportIadePersonelPerformans]
@DateStart DATE,
@DateEnd DATE
AS

SELECT CAST(tt.IadeTarihi AS DATE) AS ReportDate,p.Adi+' '+p.Soyadi AS PersonelFullName,COUNT(*) AS CihazAdet,SUM(tt.TamirFiyat) AS TamirFiyat FROM TamirTeslim AS tt INNER JOIN
			  Personel AS p ON p.Id=tt.IadeEdenPersonelId

WHERE tt.IadeTarihi BETWEEN @DateStart AND @DateEnd
GROUP BY CAST(tt.IadeTarihi AS DATE),p.Adi+' '+p.Soyadi
			  
GO
/****** Object:  StoredProcedure [dbo].[pReportKontrolPersonelPerformans]    Script Date: 25.08.2021 19:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pReportKontrolPersonelPerformans]
@DateStart DATE,
@DateEnd DATE
AS

SELECT CAST(tt.KontrolTarihi AS DATE) AS ReportDate,p.Adi+' '+p.Soyadi AS PersonelFullName,COUNT(*) AS CihazAdet,SUM(tt.TamirFiyat) AS TamirFiyat FROM TamirTeslim AS tt INNER JOIN
			  Personel AS p ON p.Id=tt.KontrolEdenPersonelId

WHERE tt.KontrolTarihi BETWEEN @DateStart AND @DateEnd
GROUP BY CAST(tt.KontrolTarihi AS DATE),p.Adi+' '+p.Soyadi
			  
GO
/****** Object:  StoredProcedure [dbo].[pReportTeslimTeslimPerformans]    Script Date: 25.08.2021 19:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pReportTeslimTeslimPerformans]
@DateStart DATE,
@DateEnd DATE
AS

SELECT CAST(tt.TeslimTarihi AS DATE) AS ReportDate,p.Adi+' '+p.Soyadi AS PersonelFullName,COUNT(*) AS CihazAdet,SUM(tt.TamirFiyat) AS TamirFiyat FROM TamirTeslim AS tt INNER JOIN
			  Personel AS p ON p.Id=tt.TeslimAlanPersonelId

WHERE tt.TeslimTarihi BETWEEN @DateStart AND @DateEnd
GROUP BY CAST(tt.TeslimTarihi AS DATE),p.Adi+' '+p.Soyadi
			  
		
GO
