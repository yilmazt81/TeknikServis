

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
INSERT [dbo].[CihazKargoGonderim] ([Id], [TamirTeslimId], [GonderenPersonelId], [GondermeTarihi], [KargoFirmaId], [GonderiNumarasi], [IlId], [IlceId], [Adres], [MusteriAdi], [GsmNo]) VALUES (5, 5, 2, CAST(N'2021-08-25T16:59:17.107' AS DateTime), 1, N'999s79s99ss', 36, 2562, N'', N'KEMAL UFUK BAŞCİL', N'536 369 36 36')
GO
INSERT [dbo].[CihazKargoGonderim] ([Id], [TamirTeslimId], [GonderenPersonelId], [GondermeTarihi], [KargoFirmaId], [GonderiNumarasi], [IlId], [IlceId], [Adres], [MusteriAdi], [GsmNo]) VALUES (6, 8, 2, CAST(N'2021-08-25T16:59:26.577' AS DateTime), 1, N'232323', 26, 2681, N'qqwqw', N'AHMET MİTHAT PINARER', N'536 369 48 36')
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
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (16, N'Dış Kasa', N'9959595999', 200.0000, 10, 50.0000, N'Apple', N'iPhone11')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (17, N'Dış Kasa', N'9959595999', 200.0000, 10, 50.0000, N'Huawei', N'P Smart S')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (18, N'Dış Kasa', N'9959595999', 200.0000, 10, 50.0000, N'LG', N'P40 Lite')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (19, N'Dış Kasa', N'9959595999', 200.0000, 10, 50.0000, N'Oppo', N'A73')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (20, N'Dış Kasa', N'9959595999', 200.0000, 9, 50.0000, N'Samsung', N'Galaxy A02s')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (21, N'Sim Kart yuvası', N'995959522999', 100.0000, 10, 20.0000, N'Apple', N'iPhone11')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (22, N'Sim Kart yuvası', N'995959522999', 100.0000, 10, 20.0000, N'Huawei', N'P Smart S')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (23, N'Sim Kart yuvası', N'995959522999', 100.0000, 9, 20.0000, N'LG', N'P40 Lite')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (24, N'Sim Kart yuvası', N'995959522999', 100.0000, 10, 20.0000, N'Oppo', N'A73')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (25, N'Sim Kart yuvası', N'995959522999', 100.0000, 10, 20.0000, N'Samsung', N'Galaxy A02s')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (26, N'Hoparlör', N'895959522999', 80.0000, 10, 15.0000, N'Apple', N'iPhone11')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (27, N'Hoparlör', N'895959522999', 80.0000, 10, 15.0000, N'Huawei', N'P Smart S')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (28, N'Hoparlör', N'895959522999', 80.0000, 10, 15.0000, N'LG', N'P40 Lite')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (29, N'Hoparlör', N'895959522999', 80.0000, 9, 15.0000, N'Oppo', N'A73')
GO
INSERT [dbo].[CihazParca] ([Id], [ParcaAdi], [Barkod], [Fiyat], [StokAdet], [MontajUcreti], [Marka], [Model]) VALUES (30, N'Hoparlör', N'895959522999', 80.0000, 10, 15.0000, N'Samsung', N'Galaxy A02s')
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
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (3, N'AFYONKARAHİSAR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (4, N'AĞRI')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (5, N'AMASYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (6, N'ANKARA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (7, N'ANTALYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (8, N'ARTVİN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (9, N'AYDIN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (10, N'BALIKESİR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (11, N'BİLECİK')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (12, N'BİNGÖL')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (13, N'BİTLİS')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (14, N'BOLU')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (15, N'BURDUR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (16, N'BURSA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (17, N'ÇANAKKALE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (18, N'ÇANKIRI')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (19, N'ÇORUM')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (20, N'DENİZLİ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (21, N'DİYARBAKIR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (22, N'EDİRNE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (23, N'ELAZIĞ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (24, N'ERZİNCAN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (25, N'ERZURUM')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (26, N'ESKİŞEHİR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (27, N'GAZİANTEP')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (28, N'GİRESUN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (29, N'GÜMÜŞHANE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (30, N'HAKKARİ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (31, N'HATAY')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (32, N'ISPARTA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (33, N'MERSİN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (34, N'İSTANBUL')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (35, N'İZMİR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (36, N'KARS')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (37, N'KASTAMONU')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (38, N'KAYSERİ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (39, N'KIRKLARELİ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (40, N'KIRŞEHİR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (41, N'KOCAELİ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (42, N'KONYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (43, N'KÜTAHYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (44, N'MALATYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (45, N'MANİSA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (46, N'KAHRAMANMARAŞ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (47, N'MARDİN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (48, N'MUĞLA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (49, N'MUŞ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (50, N'NEVŞEHİR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (51, N'NİĞDE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (52, N'ORDU')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (53, N'RİZE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (54, N'SAKARYA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (55, N'SAMSUN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (56, N'SİİRT')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (57, N'SİNOP')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (58, N'SİVAS')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (59, N'TEKİRDAĞ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (60, N'TOKAT')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (61, N'TRABZON')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (62, N'TUNCELİ')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (63, N'ŞANLIURFA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (64, N'UŞAK')
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
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (73, N'ŞIRNAK')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (74, N'BARTIN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (75, N'ARDAHAN')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (76, N'IĞDIR')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (77, N'YALOVA')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (78, N'KARABÜK')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (79, N'KİLİS')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (80, N'OSMANİYE')
GO
INSERT [dbo].[Il] ([Id], [IlAdi]) VALUES (81, N'DÜZCE')
GO
SET IDENTITY_INSERT [dbo].[Ilce] ON 
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2016, 37, N'ABANA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2017, 50, N'ACIGÖL')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2023, 13, N'ADİLCEVAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2024, 46, N'AFŞİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2025, 3, N'AFYONKARAHİSAR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2026, 68, N'AĞAÇÖREN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2027, 23, N'AĞIN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2028, 15, N'AĞLASUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2029, 37, N'AĞLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2030, 4, N'AĞRI MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2031, 42, N'AHIRLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2032, 13, N'AHLAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2033, 45, N'AHMETLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2034, 61, N'AKÇAABAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2035, 44, N'AKÇADAĞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2036, 63, N'AKÇAKALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2037, 40, N'AKÇAKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2038, 81, N'AKÇAKOCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2039, 66, N'AKDAĞMADENİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2040, 33, N'AKDENİZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2041, 45, N'AKHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2042, 58, N'AKINCILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2043, 38, N'AKKIŞLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2044, 20, N'AKKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2045, 52, N'AKKUŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2046, 42, N'AKÖREN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2047, 40, N'AKPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2048, 68, N'AKSARAY MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2049, 7, N'AKSEKİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2050, 7, N'AKSU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2051, 32, N'AKSU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2052, 42, N'AKŞEHİR')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2058, 55, N'ALAÇAM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2059, 1, N'ALADAĞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2060, 7, N'ALANYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2061, 67, N'ALAPLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2062, 45, N'ALAŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2063, 35, N'ALİAĞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2064, 60, N'ALMUS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2065, 26, N'ALPU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2066, 6, N'ALTINDAĞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2067, 42, N'ALTINEKİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2068, 77, N'ALTINOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2069, 31, N'ALTINÖZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2070, 43, N'ALTINTAŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2071, 15, N'ALTINYAYLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2072, 58, N'ALTINYAYLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2073, 51, N'ALTUNHİSAR')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2081, 37, N'ARAÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2082, 61, N'ARAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2083, 76, N'ARALIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2084, 44, N'ARAPGİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2085, 75, N'ARDAHAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2086, 8, N'ARDANUÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2087, 53, N'ARDEŞEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2088, 44, N'ARGUVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2089, 8, N'ARHAVİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2090, 23, N'ARICAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2091, 54, N'ARİFİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2092, 77, N'ARMUTLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2093, 34, N'ARNAVUTKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2094, 36, N'ARPAÇAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2095, 61, N'ARSİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2096, 60, N'ARTOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2097, 8, N'ARTVİN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2098, 55, N'ASARCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2099, 43, N'ASLANAPA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2100, 25, N'AŞKALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2101, 32, N'ATABEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2102, 55, N'ATAKUM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2103, 34, N'ATAŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2104, 18, N'ATKARACALAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2105, 50, N'AVANOS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2106, 34, N'AVCILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2107, 57, N'AYANCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2108, 6, N'AYAŞ')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2120, 25, N'AZİZİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2121, 20, N'BABADAĞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2122, 39, N'BABAESKİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2123, 55, N'BAFRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2124, 34, N'BAĞCILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2125, 21, N'BAĞLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2126, 80, N'BAHÇE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2127, 34, N'BAHÇELİEVLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2128, 65, N'BAHÇESARAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2129, 71, N'BAHŞİLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2130, 34, N'BAKIRKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2131, 20, N'BAKLAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2132, 6, N'BALA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2133, 35, N'BALÇOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2134, 10, N'BALIKESİR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2135, 71, N'BALIŞEYH')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2136, 10, N'BALYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2137, 64, N'BANAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2138, 10, N'BANDIRMA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2139, 74, N'BARTIN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2140, 23, N'BASKİL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2141, 34, N'BAŞAKŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2142, 60, N'BAŞÇİFTLİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2143, 41, N'BAŞİSKELE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2144, 65, N'BAŞKALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2145, 3, N'BAŞMAKÇI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2146, 70, N'BAŞYAYLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2147, 72, N'BATMAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2148, 44, N'BATTALGAZİ')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2155, 17, N'BAYRAMİÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2156, 18, N'BAYRAMÖREN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2157, 34, N'BAYRAMPAŞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2158, 20, N'BEKİLLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2159, 31, N'BELEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2160, 35, N'BERGAMA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2161, 2, N'BESNİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2162, 61, N'BEŞİKDÜZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2163, 34, N'BEŞİKTAŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2164, 72, N'BEŞİRİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2165, 20, N'BEYAĞAÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2166, 35, N'BEYDAĞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2167, 34, N'BEYKOZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2168, 34, N'BEYLİKDÜZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2169, 26, N'BEYLİKOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2170, 34, N'BEYOĞLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2171, 6, N'BEYPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2172, 42, N'BEYŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2173, 73, N'BEYTÜŞŞEBAP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2174, 17, N'BİGA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2175, 10, N'BİGADİÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2176, 11, N'BİLECİK MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2177, 12, N'BİNGÖL MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2178, 63, N'BİRECİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2179, 21, N'BİSMİL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2180, 13, N'BİTLİS MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2181, 48, N'BODRUM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2182, 19, N'BOĞAZKALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2183, 66, N'BOĞAZLIYAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2184, 14, N'BOLU MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2185, 3, N'BOLVADİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2186, 51, N'BOR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2187, 8, N'BORÇKA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2188, 35, N'BORNOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2189, 57, N'BOYABAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2190, 17, N'BOZCAADA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2191, 9, N'BOZDOĞAN')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2197, 11, N'BOZÜYÜK')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2206, 10, N'BURHANİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2207, 38, N'BÜNYAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2208, 34, N'BÜYÜKÇEKMECE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2209, 16, N'BÜYÜKORHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2210, 55, N'CANİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2211, 1, N'CEYHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2212, 63, N'CEYLANPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2213, 37, N'CİDE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2214, 42, N'CİHANBEYLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2215, 73, N'CİZRE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2216, 81, N'CUMAYERİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2217, 46, N'ÇAĞLIYANCERİT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2218, 20, N'ÇAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2219, 65, N'ÇALDIRAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2220, 51, N'ÇAMARDI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2221, 52, N'ÇAMAŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2222, 20, N'ÇAMELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2223, 6, N'ÇAMLIDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2224, 53, N'ÇAMLIHEMŞİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2225, 33, N'ÇAMLIYAYLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2226, 28, N'ÇAMOLUK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2227, 17, N'ÇAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2228, 28, N'ÇANAKÇI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2229, 17, N'ÇANAKKALE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2230, 66, N'ÇANDIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2231, 6, N'ÇANKAYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2232, 18, N'ÇANKIRI MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2233, 20, N'ÇARDAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2234, 55, N'ÇARŞAMBA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2235, 61, N'ÇARŞIBAŞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2236, 25, N'ÇAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2237, 65, N'ÇATAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2238, 34, N'ÇATALCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2239, 52, N'ÇATALPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2240, 37, N'ÇATALZEYTİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2241, 43, N'ÇAVDARHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2242, 15, N'ÇAVDIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2243, 3, N'ÇAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2244, 52, N'ÇAYBAŞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2245, 67, N'ÇAYCUMA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2246, 53, N'ÇAYELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2247, 66, N'ÇAYIRALAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2248, 24, N'ÇAYIRLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2249, 41, N'ÇAYIROVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2250, 61, N'ÇAYKARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2251, 66, N'ÇEKEREK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2252, 34, N'ÇEKMEKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2253, 71, N'ÇELEBİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2254, 2, N'ÇELİKHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2255, 42, N'ÇELTİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2256, 15, N'ÇELTİKÇİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2257, 62, N'ÇEMİŞGEZEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2258, 18, N'ÇERKEŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2259, 59, N'ÇERKEZKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2260, 21, N'ÇERMİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2261, 35, N'ÇEŞME')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2262, 75, N'ÇILDIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2263, 21, N'ÇINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2264, 77, N'ÇINARCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2265, 40, N'ÇİÇEKDAĞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2266, 26, N'ÇİFTELER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2267, 51, N'ÇİFTLİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2268, 77, N'ÇİFTLİKKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2269, 35, N'ÇİĞLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2270, 81, N'ÇİLİMLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2271, 9, N'ÇİNE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2272, 20, N'ÇİVRİL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2273, 3, N'ÇOBANLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2274, 59, N'ÇORLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2275, 19, N'ÇORUM MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2276, 6, N'ÇUBUK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2277, 30, N'ÇUKURCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2278, 1, N'ÇUKUROVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2279, 42, N'ÇUMRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2280, 21, N'ÇÜNGÜŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2281, 37, N'DADAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2282, 48, N'DALAMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2283, 75, N'DAMAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2284, 44, N'DARENDE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2285, 47, N'DARGEÇİT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2286, 41, N'DARICA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2287, 48, N'DATÇA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2288, 3, N'DAZKIRI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2289, 71, N'DELİCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2290, 45, N'DEMİRCİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2291, 39, N'DEMİRKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2292, 69, N'DEMİRÖZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2293, 7, N'DEMRE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2294, 20, N'DENİZLİ MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2295, 42, N'DERBENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2296, 42, N'DEREBUCAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2297, 28, N'DERELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2298, 53, N'DEREPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2299, 47, N'DERİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2300, 41, N'DERİNCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2301, 50, N'DERİNKUYU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2302, 61, N'DERNEKPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2303, 38, N'DEVELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2304, 67, N'DEVREK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2305, 37, N'DEVREKANİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2306, 21, N'DİCLE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2307, 9, N'DİDİM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2308, 36, N'DİGOR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2309, 35, N'DİKİLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2310, 57, N'DİKMEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2311, 41, N'DİLOVASI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2312, 3, N'DİNAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2313, 58, N'DİVRİĞİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2314, 4, N'DİYADİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2315, 21, N'DİYARBAKIR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2316, 19, N'DODURGA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2317, 42, N'DOĞANHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2318, 28, N'DOĞANKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2319, 58, N'DOĞANŞAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2320, 44, N'DOĞANŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2321, 44, N'DOĞANYOL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2322, 37, N'DOĞANYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2323, 4, N'DOĞUBAYAZIT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2324, 43, N'DOMANİÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2325, 14, N'DÖRTDİVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2326, 31, N'DÖRTYOL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2327, 7, N'DÖŞEMEALTI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2328, 43, N'DUMLUPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2329, 57, N'DURAĞAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2330, 10, N'DURSUNBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2331, 81, N'DÜZCE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2332, 80, N'DÜZİÇİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2333, 61, N'DÜZKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2334, 17, N'ECEABAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2335, 22, N'EDİRNE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2336, 10, N'EDREMİT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2337, 65, N'EDREMİT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2338, 78, N'EFLANİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2339, 21, N'EĞİL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2340, 32, N'EĞİRDİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2341, 46, N'EKİNÖZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2342, 23, N'ELAZIĞ MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2343, 79, N'ELBEYLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2344, 46, N'ELBİSTAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2345, 18, N'ELDİVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2346, 4, N'ELEŞKİRT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2347, 6, N'ELMADAĞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2348, 7, N'ELMALI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2349, 43, N'EMET')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2350, 34, N'EMİNÖNÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2351, 3, N'EMİRDAĞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2352, 42, N'EMİRGAZİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2353, 22, N'ENEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2354, 60, N'ERBAA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2355, 65, N'ERCİŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2356, 10, N'ERDEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2357, 33, N'ERDEMLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2358, 42, N'EREĞLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2359, 67, N'EREĞLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2360, 54, N'ERENLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2361, 57, N'ERFELEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2362, 21, N'ERGANİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2363, 70, N'ERMENEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2364, 56, N'ERUH')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2365, 31, N'ERZİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2366, 24, N'ERZİNCAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2367, 25, N'ERZURUM MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2368, 34, N'ESENLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2369, 34, N'ESENYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2370, 68, N'ESKİL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2371, 78, N'ESKİPAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2372, 26, N'ESKİŞEHİR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2373, 28, N'ESPİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2374, 64, N'EŞME')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2375, 6, N'ETİMESGUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2376, 3, N'EVCİLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2377, 6, N'EVREN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2378, 28, N'EYNESİL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2379, 34, N'EYÜP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2380, 17, N'EZİNE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2381, 34, N'FATİH')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2382, 52, N'FATSA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2383, 1, N'FEKE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2384, 38, N'FELAHİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2385, 54, N'FERİZLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2386, 48, N'FETHİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2387, 53, N'FINDIKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2388, 7, N'FİNİKE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2389, 35, N'FOÇA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2390, 35, N'GAZİEMİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2391, 34, N'GAZİOSMANPAŞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2392, 7, N'GAZİPAŞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2393, 41, N'GEBZE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2394, 43, N'GEDİZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2395, 32, N'GELENDOST')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2396, 17, N'GELİBOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2397, 58, N'GEMEREK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2398, 16, N'GEMLİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2399, 12, N'GENÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2400, 72, N'GERCÜŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2401, 14, N'GEREDE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2402, 2, N'GERGER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2403, 9, N'GERMENCİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2404, 57, N'GERZE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2405, 65, N'GEVAŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2406, 54, N'GEYVE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2407, 28, N'GİRESUN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2408, 17, N'GÖKÇEADA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2409, 67, N'GÖKÇEBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2410, 46, N'GÖKSUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2411, 2, N'GÖLBAŞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2412, 6, N'GÖLBAŞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2413, 41, N'GÖLCÜK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2414, 75, N'GÖLE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2415, 15, N'GÖLHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2416, 52, N'GÖLKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2417, 45, N'GÖLMARMARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2418, 58, N'GÖLOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2419, 11, N'GÖLPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2420, 81, N'GÖLYAKA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2421, 10, N'GÖMEÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2422, 10, N'GÖNEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2423, 32, N'GÖNEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2424, 45, N'GÖRDES')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2425, 28, N'GÖRELE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2426, 5, N'GÖYNÜCEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2427, 14, N'GÖYNÜK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2428, 28, N'GÜCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2429, 73, N'GÜÇLÜKONAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2430, 6, N'GÜDÜL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2431, 68, N'GÜLAĞAÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2432, 33, N'GÜLNAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2433, 50, N'GÜLŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2434, 52, N'GÜLYALI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2435, 5, N'GÜMÜŞHACIKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2436, 29, N'GÜMÜŞHANE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2437, 81, N'GÜMÜŞOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2438, 7, N'GÜNDOĞMUŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2439, 20, N'GÜNEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2440, 42, N'GÜNEYSINIR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2441, 53, N'GÜNEYSU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2442, 34, N'GÜNGÖREN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2443, 26, N'GÜNYÜZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2444, 52, N'GÜRGENTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2445, 13, N'GÜROYMAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2446, 65, N'GÜRPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2447, 16, N'GÜRSU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2448, 58, N'GÜRÜN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2449, 35, N'GÜZELBAHÇE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2450, 68, N'GÜZELYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2451, 50, N'HACIBEKTAŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2452, 38, N'HACILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2453, 42, N'HADİM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2454, 58, N'HAFİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2455, 30, N'HAKKARİ MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2456, 63, N'HALFETİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2457, 42, N'HALKAPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2458, 5, N'HAMAMÖZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2459, 4, N'HAMUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2460, 26, N'HAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2461, 75, N'HANAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2462, 21, N'HANİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2463, 37, N'HANÖNÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2464, 16, N'HARMANCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2465, 63, N'HARRAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2466, 80, N'HASANBEYLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2467, 72, N'HASANKEYF')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2468, 49, N'HASKÖY')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2478, 44, N'HEKİMHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2479, 53, N'HEMŞİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2480, 54, N'HENDEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2481, 25, N'HINIS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2482, 63, N'HİLVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2483, 43, N'HİSARCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2484, 13, N'HİZAN')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2490, 42, N'HÜYÜK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2491, 76, N'IĞDIR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2492, 18, N'ILGAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2493, 42, N'ILGIN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2494, 32, N'ISPARTA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2495, 7, N'İBRADI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2496, 73, N'İDİL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2497, 37, N'İHSANGAZİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2498, 3, N'İHSANİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2499, 52, N'İKİZCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2500, 53, N'İKİZDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2501, 24, N'İLİÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2502, 55, N'İLKADIM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2503, 1, N'İMAMOĞLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2504, 58, N'İMRANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2505, 38, N'İNCESU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2506, 9, N'İNCİRLİOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2507, 37, N'İNEBOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2508, 16, N'İNEGÖL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2509, 11, N'İNHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2510, 26, N'İNÖNÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2511, 22, N'İPSALA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2512, 3, N'İSCEHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2513, 31, N'İSKENDERUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2514, 19, N'İSKİLİP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2515, 27, N'İSLAHİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2516, 25, N'İSPİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2517, 10, N'İVRİNDİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2518, 53, N'İYİDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2519, 41, N'İZMİT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2520, 16, N'İZNİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2521, 52, N'KABADÜZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2522, 52, N'KABATAŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2523, 34, N'KADIKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2524, 42, N'KADINHANI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2525, 66, N'KADIŞEHRİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2526, 80, N'KADİRLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2527, 34, N'KAĞITHANE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2528, 36, N'KAĞIZMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2529, 46, N'KAHRAMANMARAŞ MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2530, 2, N'KAHTA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2531, 20, N'KALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2532, 44, N'KALE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2533, 6, N'KALECİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2534, 53, N'KALKANDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2535, 40, N'KAMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2536, 41, N'KANDIRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2537, 58, N'KANGAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2538, 35, N'KARABAĞLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2539, 35, N'KARABURUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2540, 78, N'KARABÜK MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2541, 16, N'KARACABEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2542, 9, N'KARACASU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2543, 25, N'KARAÇOBAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2544, 64, N'KARAHALLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2545, 1, N'KARAİSALI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2546, 71, N'KARAKEÇİLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2547, 23, N'KARAKOÇAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2548, 76, N'KARAKOYUNLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2549, 70, N'KARAMAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2550, 15, N'KARAMANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2551, 41, N'KARAMÜRSEL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2552, 42, N'KARAPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2553, 54, N'KARAPÜRÇEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2554, 54, N'KARASU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2555, 1, N'KARATAŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2556, 42, N'KARATAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2557, 25, N'KARAYAZI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2558, 19, N'KARGI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2559, 27, N'KARKAMIŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2560, 12, N'KARLIOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2561, 9, N'KARPUZLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2562, 36, N'KARS MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2563, 35, N'KARŞIYAKA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2564, 34, N'KARTAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2565, 41, N'KARTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2566, 37, N'KASTAMONU MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2567, 7, N'KAŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2568, 55, N'KAVAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2569, 48, N'KAVAKLIDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2570, 21, N'KAYAPINAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2571, 54, N'KAYNARCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2572, 81, N'KAYNAŞLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2573, 6, N'KAZAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2574, 70, N'KAZIMKARABEKİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2575, 23, N'KEBAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2576, 32, N'KEÇİBORLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2577, 6, N'KEÇİÖREN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2578, 16, N'KELES')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2579, 29, N'KELKİT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2580, 24, N'KEMAH')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2581, 24, N'KEMALİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2582, 35, N'KEMALPAŞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2583, 7, N'KEMER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2584, 15, N'KEMER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2585, 7, N'KEPEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2586, 10, N'KEPSUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2587, 71, N'KESKİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2588, 16, N'KESTEL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2589, 22, N'KEŞAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2590, 28, N'KEŞAP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2591, 14, N'KIBRISCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2592, 35, N'KINIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2593, 31, N'KIRIKHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2594, 71, N'KIRIKKALE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2595, 45, N'KIRKAĞAÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2596, 39, N'KIRKLARELİ MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2597, 40, N'KIRŞEHİR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2598, 6, N'KIZILCAHAMAM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2599, 18, N'KIZILIRMAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2600, 3, N'KIZILÖREN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2601, 47, N'KIZILTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2602, 12, N'KİĞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2603, 79, N'KİLİS MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2604, 35, N'KİRAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2605, 54, N'KOCAALİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2606, 41, N'KOCAELİ MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2607, 21, N'KOCAKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2608, 38, N'KOCASİNAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2609, 9, N'KOÇARLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2610, 39, N'KOFÇAZ')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2616, 7, N'KORKUTELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2617, 23, N'KOVANCILAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2618, 58, N'KOYULHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2619, 50, N'KOZAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2620, 1, N'KOZAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2621, 72, N'KOZLUK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2622, 45, N'KÖPRÜBAŞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2623, 61, N'KÖPRÜBAŞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2624, 25, N'KÖPRÜKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2625, 41, N'KÖRFEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2626, 29, N'KÖSE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2627, 9, N'KÖŞK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2628, 48, N'KÖYCEĞİZ')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2636, 18, N'KURŞUNLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2637, 56, N'KURTALAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2638, 74, N'KURUCAŞİLE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2639, 9, N'KUŞADASI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2640, 9, N'KUYUCAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2641, 34, N'KÜÇÜKÇEKMECE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2642, 37, N'KÜRE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2643, 29, N'KÜRTÜN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2644, 43, N'KÜTAHYA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2645, 19, N'LAÇİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2646, 55, N'LADİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2647, 22, N'LALAPAŞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2648, 17, N'LAPSEKİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2649, 21, N'LİCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2650, 39, N'LÜLEBURGAZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2651, 61, N'MAÇKA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2652, 23, N'MADEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2653, 26, N'MAHMUDİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2654, 44, N'MALATYA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2655, 49, N'MALAZGİRT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2656, 59, N'MALKARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2657, 34, N'MALTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2658, 6, N'MAMAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2659, 7, N'MANAVGAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2660, 45, N'MANİSA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2661, 10, N'MANYAS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2662, 47, N'MARDİN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2663, 10, N'MARMARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2664, 59, N'MARMARAEREĞLİSİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2665, 48, N'MARMARİS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2666, 62, N'MAZGİRT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2667, 47, N'MAZIDAĞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2668, 19, N'MECİTÖZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2669, 38, N'MELİKGAZİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2670, 35, N'MENDERES')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2671, 35, N'MENEMEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2672, 14, N'MENGEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2673, 42, N'MERAM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2674, 22, N'MERİÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2675, 33, N'MERSİN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2676, 5, N'MERZİFON')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2677, 52, N'MESUDİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2678, 33, N'MEZİTLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2679, 47, N'MİDYAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2680, 26, N'MİHALGAZİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2681, 26, N'MİHALIÇÇIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2682, 48, N'MİLAS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2683, 40, N'MUCUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2684, 16, N'MUDANYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2685, 14, N'MUDURNU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2686, 48, N'MUĞLA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2687, 65, N'MURADİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2688, 59, N'MURATLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2689, 7, N'MURATPAŞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2690, 8, N'MURGUL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2691, 79, N'MUSABEYLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2692, 16, N'MUSTAFA K.PAŞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2693, 49, N'MUŞ MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2694, 33, N'MUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2695, 13, N'MUTKİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2696, 6, N'NALLIHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2697, 35, N'NARLIDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2698, 25, N'NARMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2699, 62, N'NAZIMİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2700, 9, N'NAZİLLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2701, 50, N'NEVŞEHİR MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2702, 51, N'NİĞDE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2703, 60, N'NİKSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2704, 16, N'NİLÜFER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2705, 27, N'NİZİP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2706, 27, N'NURDAĞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2707, 46, N'NURHAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2708, 47, N'NUSAYBİN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2709, 26, N'ODUNPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2710, 61, N'OF')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2711, 27, N'OĞUZELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2712, 19, N'OĞUZLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2713, 25, N'OLTU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2714, 25, N'OLUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2715, 55, N'ONDOKUZMAYIS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2716, 52, N'ORDU MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2717, 16, N'ORHANELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2718, 16, N'ORHANGAZİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2719, 18, N'ORTA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2720, 48, N'ORTACA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2721, 68, N'ORTAKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2722, 19, N'ORTAKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2723, 19, N'OSMANCIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2724, 11, N'OSMANELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2725, 16, N'OSMANGAZİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2726, 80, N'OSMANİYE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2727, 24, N'OTLUKBELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2728, 78, N'OVACIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2729, 62, N'OVACIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2730, 35, N'ÖDEMİŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2731, 47, N'ÖMERLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2732, 65, N'ÖZALP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2733, 38, N'ÖZVATAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2734, 25, N'PALANDÖKEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2735, 23, N'PALU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2736, 54, N'PAMUKOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2737, 25, N'PASİNLER')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2743, 11, N'PAZARYERİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2744, 25, N'PAZARYOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2745, 39, N'PEHLİVANKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2746, 34, N'PENDİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2747, 52, N'PERŞEMBE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2748, 62, N'PERTEK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2749, 56, N'PERVARİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2750, 37, N'PINARBAŞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2751, 38, N'PINARBAŞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2752, 39, N'PINARHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2753, 28, N'PİRAZİZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2754, 79, N'POLATELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2755, 6, N'POLATLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2756, 75, N'POSOF')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2757, 1, N'POZANTI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2758, 6, N'PURSAKLAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2759, 62, N'PÜLÜMÜR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2760, 44, N'PÜTÜRGE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2761, 24, N'REFAHİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2762, 60, N'REŞADİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2763, 31, N'REYHANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2764, 53, N'RİZE MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2765, 78, N'SAFRANBOLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2766, 1, N'SAİMBEYLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2767, 54, N'SAKARYA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2768, 55, N'SALIPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2769, 45, N'SALİHLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2770, 31, N'SAMANDAĞ')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2778, 57, N'SARAYDÜZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2779, 66, N'SARAYKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2780, 20, N'SARAYKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2781, 42, N'SARAYÖNÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2782, 26, N'SARICAKAYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2783, 1, N'SARIÇAM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2784, 45, N'SARIGÖL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2785, 36, N'SARIKAMIŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2786, 66, N'SARIKAYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2787, 38, N'SARIOĞLAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2788, 70, N'SARIVELİLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2789, 68, N'SARIYAHŞİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2790, 34, N'SARIYER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2791, 38, N'SARIZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2792, 45, N'SARUHANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2793, 72, N'SASON')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2794, 10, N'SAVAŞTEPE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2795, 47, N'SAVUR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2796, 14, N'SEBEN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2797, 35, N'SEFERİHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2798, 35, N'SELÇUK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2799, 42, N'SELÇUKLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2800, 45, N'SELENDİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2801, 36, N'SELİM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2802, 32, N'SENİRKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2803, 54, N'SERDİVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2804, 7, N'SERİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2805, 20, N'SERİNHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2806, 37, N'SEYDİLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2807, 42, N'SEYDİŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2808, 1, N'SEYHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2809, 26, N'SEYİTGAZİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2810, 10, N'SINDIRGI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2811, 56, N'SİİRT MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2812, 33, N'SİLİFKE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2813, 34, N'SİLİVRİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2814, 73, N'SİLOPİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2815, 21, N'SİLVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2816, 43, N'SİMAV')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2817, 3, N'SİNANPAŞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2818, 6, N'SİNCAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2819, 2, N'SİNCİK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2820, 57, N'SİNOP MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2821, 58, N'SİVAS MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2822, 64, N'SİVASLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2823, 63, N'SİVEREK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2824, 23, N'SİVRİCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2825, 26, N'SİVRİHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2826, 12, N'SOLHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2827, 45, N'SOMA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2828, 66, N'SORGUN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2829, 11, N'SÖĞÜT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2830, 54, N'SÖĞÜTLÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2831, 9, N'SÖKE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2832, 71, N'SULAKYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2833, 34, N'SULTANBEYLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2834, 3, N'SULTANDAĞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2835, 34, N'SULTANGAZİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2836, 9, N'SULTANHİSAR')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2842, 63, N'SURUÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2843, 10, N'SUSURLUK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2844, 36, N'SUSUZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2845, 58, N'SUŞEHRİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2846, 22, N'SÜLOĞLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2847, 61, N'SÜRMENE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2848, 32, N'SÜTÇÜLER')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2849, 18, N'ŞABANÖZÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2850, 27, N'ŞAHİNBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2851, 61, N'ŞALPAZARI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2852, 63, N'ŞANLIURFA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2853, 43, N'ŞAPHANE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2854, 58, N'ŞARKIŞLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2855, 32, N'ŞARKİKARAAĞAÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2856, 59, N'ŞARKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2857, 8, N'ŞAVŞAT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2858, 28, N'ŞEBİNKARAHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2859, 66, N'ŞEFAATLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2860, 27, N'ŞEHİTKAMİL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2861, 30, N'ŞEMDİNLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2862, 25, N'ŞENKAYA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2863, 37, N'ŞENPAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2864, 6, N'ŞEREFLİKOÇHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2865, 73, N'ŞIRNAK MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2866, 34, N'ŞİLE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2867, 29, N'ŞİRAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2868, 56, N'ŞİRVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2869, 34, N'ŞİŞLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2870, 3, N'ŞUHUT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2871, 38, N'TALAS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2872, 54, N'TARAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2873, 33, N'TARSUS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2874, 42, N'TAŞKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2875, 37, N'TAŞKÖPRÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2876, 4, N'TAŞLIÇAY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2877, 5, N'TAŞOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2878, 13, N'TATVAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2879, 20, N'TAVAS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2880, 43, N'TAVŞANLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2881, 15, N'TEFENNİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2882, 59, N'TEKİRDAĞ MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2883, 55, N'TEKKEKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2884, 25, N'TEKMAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2885, 26, N'TEPEBAŞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2886, 24, N'TERCAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2887, 77, N'TERMAL')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2888, 55, N'TERME')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2889, 35, N'TİRE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2890, 28, N'TİREBOLU')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2901, 1, N'TUFANBEYLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2902, 62, N'TUNCELİ MERKEZ')
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
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2909, 42, N'TUZLUKÇU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2910, 57, N'TÜRKELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2911, 46, N'TÜRKOĞLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2912, 19, N'UĞURLUDAĞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2913, 48, N'ULA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2914, 58, N'ULAŞ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2915, 52, N'ULUBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2916, 64, N'ULUBEY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2917, 32, N'ULUBORLU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2918, 73, N'ULUDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2919, 51, N'ULUKIŞLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2920, 74, N'ULUS')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2921, 35, N'URLA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2922, 64, N'UŞAK MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2923, 25, N'UZUNDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2924, 22, N'UZUNKÖPRÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2925, 34, N'ÜMRANİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2926, 52, N'ÜNYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2927, 50, N'ÜRGÜP')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2928, 34, N'ÜSKÜDAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2929, 24, N'ÜZÜMLÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2930, 61, N'VAKFIKEBİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2931, 65, N'VAN MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2932, 49, N'VARTO')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2933, 55, N'VEZİRKÖPRÜ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2934, 63, N'VİRANŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2935, 39, N'VİZE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2936, 28, N'YAĞLIDERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2937, 71, N'YAHŞİHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2938, 38, N'YAHYALI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2939, 55, N'YAKAKENT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2940, 25, N'YAKUTİYE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2941, 42, N'YALIHÜYÜK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2942, 77, N'YALOVA MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2943, 32, N'YALVAÇ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2944, 18, N'YAPRAKLI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2945, 48, N'YATAĞAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2946, 27, N'YAVUZELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2947, 31, N'YAYLADAĞI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2948, 12, N'YAYLADERE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2949, 44, N'YAZIHAN')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2950, 12, N'YEDİSU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2951, 17, N'YENİCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2952, 78, N'YENİCE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2953, 14, N'YENİÇAĞA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2954, 66, N'YENİFAKILI')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2955, 6, N'YENİMAHALLE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2956, 9, N'YENİPAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2957, 11, N'YENİPAZAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2958, 32, N'YENİŞARBADEMLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2959, 16, N'YENİŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2960, 21, N'YENİŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2961, 33, N'YENİŞEHİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2962, 66, N'YERKÖY')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2963, 38, N'YEŞİLHİSAR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2964, 47, N'YEŞİLLİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2965, 15, N'YEŞİLOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2966, 44, N'YEŞİLYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2967, 60, N'YEŞİLYURT')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2968, 81, N'YIĞILCA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2969, 16, N'YILDIRIM')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2970, 58, N'YILDIZELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2971, 61, N'YOMRA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2972, 66, N'YOZGAT MERKEZ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2973, 1, N'YUMURTALIK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2974, 42, N'YUNAK')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2975, 8, N'YUSUFELİ')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2976, 30, N'YÜKSEKOVA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2977, 1, N'YÜREĞİR')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2978, 58, N'ZARA')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2979, 34, N'ZEYTİNBURNU')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2980, 60, N'ZİLE')
GO
INSERT [dbo].[Ilce] ([Id], [IlId], [IlceAdi]) VALUES (2981, 67, N'ZONGULDAK MERKEZ')
GO
SET IDENTITY_INSERT [dbo].[Ilce] OFF
GO
SET IDENTITY_INSERT [dbo].[KargoFirma] ON 
GO
INSERT [dbo].[KargoFirma] ([Id], [FirmaAdi]) VALUES (1, N'Mng Kargo')
GO
INSERT [dbo].[KargoFirma] ([Id], [FirmaAdi]) VALUES (2, N'Yurtiçi Kargo')
GO
INSERT [dbo].[KargoFirma] ([Id], [FirmaAdi]) VALUES (3, N'Aras Kargo')
GO
INSERT [dbo].[KargoFirma] ([Id], [FirmaAdi]) VALUES (4, N'UPS')
GO
SET IDENTITY_INSERT [dbo].[KargoFirma] OFF
GO
SET IDENTITY_INSERT [dbo].[KargoSube] ON 
GO
INSERT [dbo].[KargoSube] ([Id], [KargoFirmaId], [SubeAdi], [TelefonNo]) VALUES (1, 1, N'Avcılar', N'0212 245 36 36')
GO
INSERT [dbo].[KargoSube] ([Id], [KargoFirmaId], [SubeAdi], [TelefonNo]) VALUES (2, 1, N'Beylikdüzü', N'0212 155 66 66')
GO
SET IDENTITY_INSERT [dbo].[KargoSube] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteri] ON 
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1004, N'HÜSEYİN NECMİ GİDERSU', N'536 369 36 36', N'HÜSEYİNNECMİ@gmail.com', 66, 2251, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1005, N'ASENA SEVİLAY PİŞKİNSOY', N'536 369 36 36', N'ASENASEVİLAY@gmail.com', 13, 2878, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1006, N'ZEYAT KESTEVUR', N'536 369 36 36', N'zeyat@gmail.com', 37, 2642, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1007, N'SELMAN HİLMİ KESTANE', N'536 369 36 36', N'selmanhilmi@gmail.com', 37, 2119, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1008, N'KEMAL UFUK BAŞCİL', N'536 369 36 36', N'kemalufuk@gmail.com', 36, 2562, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1009, N'TAGİ KASAPCI', N'536 369 48 36', N'tagi@gmail.com', 6, 2598, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1010, N'OĞUZ ALİ AYKER', N'536 369 48 36', N'oğuzali@gmail.com', 28, 2425, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1011, N'AŞIR AKREP', N'536 369 48 36', N'aşır@gmail.com', 36, 2801, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1012, N'BEYAZIT SALUÇ İLMİN', N'536 369 48 36', N'beyazıtsaluç@gmail.com', 29, 2643, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1013, N'LEVENT OKTAY KOL', N'536 369 48 36', N'leventoktay@gmail.com', 33, 2432, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1014, N'KÜBRA ELİF BURKAN', N'536 369 48 36', N'kübraelif@gmail.com', 67, 2409, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1015, N'SEZAİ MANDAL CİNDİR', N'536 369 48 36', N'sezaimandal@gmail.com', 61, 2930, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1016, N'BÖRTEÇİN DÜZALAN', N'536 369 48 36', N'börteçin@gmail.com', 23, 2652, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1017, N'FIRAT MAHİR SIVACIOĞLU', N'536 369 48 36', N'fıratmahir@gmail.com', 9, 2836, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1018, N'DEMET BİÇERER', N'536 369 48 36', N'demet@gmail.com', 45, 2784, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1019, N'ONUR GÜVEN BİKİR', N'536 369 48 36', N'onurgüven@gmail.com', 73, 2215, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1020, N'ŞAHİN TEKSTİL ŞİRİKÇİ', N'536 369 48 36', N'şahintekstil@gmail.com', 57, 2361, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1021, N'ERDAĞI TANTALKAYA', N'536 369 48 36', N'erdağı@gmail.com', 37, 2119, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1022, N'SAFURE SARIFEDAİ', N'536 369 48 36', N'safure@gmail.com', 36, 2785, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1023, N'NUR ZİYNET BÜYÜKBOSTANCIOĞLU', N'536 369 48 36', N'nurziynet@gmail.com', 10, 2118, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1024, N'HARUN TOLGA TANCAN', N'536 369 48 36', N'haruntolga@gmail.com', 26, 2709, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1025, N'ALPER FUAT KINAY', N'536 369 48 36', N'alperfuat@gmail.com', 77, 2268, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1026, N'KOZA TEKSTİL CELEPÇİ', N'536 369 48 36', N'kozatekstil@gmail.com', 10, 2336, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1027, N'MUBİNE SINAK', N'536 369 48 36', N'mubine@gmail.com', 42, 2052, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1028, N'AHMET MİTHAT PINARER', N'536 369 48 36', N'ahmetmithat@gmail.com', 26, 2681, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1029, N'YILMAZ GENÇ ALPSOY', N'536 369 48 36', N'yılmazgenç@gmail.com', 53, 2087, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1030, N'TEMEL ÖNDER BEYGE', N'536 369 48 36', N'temelönder@gmail.com', 45, 2595, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1031, N'SÜLEYMAN TOLGA CUNİ', N'536 369 48 36', N'süleymantolga@gmail.com', 73, 2429, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1032, N'KENAL ÖK', N'536 769 48 36', N'kenal@gmail.com', 24, 2366, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1033, N'YAŞETTİN GEBECİ', N'556 769 48 36', N'yaşettin@gmail.com', 22, 2353, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1034, N'ÖMER ŞİNASİ BAYSAK', N'556 769 48 96', N'ömerşinasi@gmail.com', 81, 2270, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1035, N'ORHAN BAYRAM MELİK', N'556 769 48 96', N'orhanbayram@gmail.com', 16, 2541, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1036, N'HİLMİ YALÇIN MALAYMAR', N'556 769 48 96', N'hilmiyalçın@gmail.com', 77, 2268, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1037, N'ÖZLEM GÖK GENÇTAN', N'556 769 48 96', N'özlemgök@gmail.com', 39, 2610, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1038, N'KAZIM MUSTAFA PASTIRMACI', N'556 769 48 96', N'kazımmustafa@gmail.com', 14, 2953, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1039, N'CELAL BORA ALTİN', N'556 769 48 96', N'celalbora@gmail.com', 56, 2364, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1040, N'ZEKAYI ÇAPUTCU', N'556 769 48 96', N'zekayı@gmail.com', 54, 2830, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1041, N'NAZIMEMRAH KAYNAKLI', N'556 769 48 96', N'nazımemrah@gmail.com', 39, 2752, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1042, N'UMUT FURKAN TEMİZSOYLU', N'556 769 48 96', N'umutfurkan@gmail.com', 76, 2548, N'')
GO
INSERT [dbo].[Musteri] ([Id], [TamAdi], [GsmNo], [Eposta], [IlId], [IlceId], [Adres]) VALUES (1043, N'NEDİME DEMET ÇİFFİLİZ', N'556 769 48 96', N'nedimedemet@gmail.com', 5, 2435, N'')
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
INSERT [dbo].[PerformansRapor] ([Id], [RaportAdi], [ProcedureName]) VALUES (5, N'Ürün Teslim Performans', N'pReportIadePersonelPerformans')
GO
SET IDENTITY_INSERT [dbo].[PerformansRapor] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 
GO
INSERT [dbo].[Personel] ([Id], [KullaniciAdi], [Sifre], [Adi], [Soyadi], [Pasif], [Gorev], [UstPersonelId]) VALUES (1, N'Admin', N'Admin', N'System', N'Admin', 0, N'Admin', 0)
GO
INSERT [dbo].[Personel] ([Id], [KullaniciAdi], [Sifre], [Adi], [Soyadi], [Pasif], [Gorev], [UstPersonelId]) VALUES (2, N'Kdr', N'1', N'Kadir', N'Şahin', 0, N'Admin', 1)
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
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (2, N'Parça Bekliyor')
GO
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (3, N'Kalite Kontrol')
GO
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (4, N'Tamir Bitti')
GO
INSERT [dbo].[TamirDurum] ([Id], [Aciklama]) VALUES (5, N'Gönderildi')
GO
SET IDENTITY_INSERT [dbo].[TamirTeslim] ON 
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (5, 1008, 3, 2, 2, N'Apple', N'iPhone11', N'9s5d9fasd92asdasd', N'Ekran kırılması', N'Ekran Değişimi yapıldı sağlıklı çalışıyor', CAST(N'2021-08-25T16:43:49.403' AS DateTime), NULL, N'Şaj Cihazı', 170.0000, N'eac2e6c5-f55e-4a1c-934e-2762c588c559', 0, 5, CAST(N'2021-08-25T16:58:54.163' AS DateTime), NULL, NULL, 1, NULL)
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (6, 1013, 3, 3, 2, N'Samsung', N'Galaxy A02s', N'56996449513394139', N'Kasa Arızası', N'Kasa Değiştirildi.', CAST(N'2021-08-25T16:44:41.530' AS DateTime), NULL, N'', 250.0000, N'f1c24742-4806-4545-b068-fe597bcdd2cb', 0, 5, CAST(N'2021-08-25T16:59:02.210' AS DateTime), NULL, NULL, 0, N'Levent Oktay')
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (7, 1006, 3, NULL, 1, N'Oppo', N'A73', N'989232691233', N'Ses gelmiyor.', N'değiştirildi.', CAST(N'2021-08-25T16:46:11.393' AS DateTime), NULL, N'', 95.0000, N'0521f232-edf8-474d-a419-4b9b9885b401', 0, 3, CAST(N'2021-08-25T16:55:49.677' AS DateTime), NULL, NULL, 0, NULL)
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (8, 1028, 3, 2, 2, N'Huawei', N'P Smart S', N'98926994956', N'Ekran kırık', N'', CAST(N'2021-08-25T16:47:06.160' AS DateTime), NULL, N'', 170.0000, N'4c8f29a6-d98b-4793-9a05-61c10a1b3a3e', 0, 5, CAST(N'2021-08-25T16:59:07.143' AS DateTime), NULL, NULL, 1, NULL)
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (9, 1010, 3, 3, 2, N'LG', N'P40 Lite', N'9795994158', N'Sim kart yuvası kırık', N'tamir edildi', CAST(N'2021-08-25T16:48:06.547' AS DateTime), NULL, N'', 120.0000, N'2791c7d1-c32f-433b-a51a-ce4c467ff3c8', 0, 5, CAST(N'2021-08-25T16:59:11.440' AS DateTime), NULL, NULL, 0, N'Oğuz Ali ayker')
GO
INSERT [dbo].[TamirTeslim] ([Id], [MusteriId], [TeslimAlanPersonelId], [IadeEdenPersonelId], [TamirEdenPersonelId], [Marka], [Model], [SeriNo], [MusteriSorunAciklama], [TeknikPersonelAciklama], [TeslimTarihi], [IadeTarihi], [TeslimAlinanAksesuar], [TamirFiyat], [Barcode], [KargoIleGeldi], [TamirDurumId], [TamirTarihi], [KontrolEdenPersonelId], [KontrolTarihi], [KargoIleGonderilecek], [TeslimAlan]) VALUES (10, 1028, 1, NULL, NULL, N'Apple', N'iPhone11', N'9899sd9sdsdsd', N'Ekran arızası', NULL, CAST(N'2021-08-25T17:33:01.157' AS DateTime), NULL, N'', 170.0000, N'd0b2b52d-2842-469b-aea0-8a9c5067db58', 0, 1, NULL, NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[TamirTeslim] OFF
GO
SET IDENTITY_INSERT [dbo].[UygulamaMenu] ON 
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (1, N'Karşılama', 0, NULL, 0)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (2, N'Ürün Teslim Alma', 1, N'Kdr.TeknikServis.controls.UserControlUrunTeslimAl', 1)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (4, N'Teknik Servis', 0, NULL, 3)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (5, N'İşlem Bekleyenler', 4, N'Kdr.TeknikServis.controls.UserControlIslemBekleyen', 4)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (6, N'Parça Bekleyenler', 4, N'Kdr.TeknikServis.controls.UserControlParcaBekleyen', 5)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (7, N'Sistem', 0, NULL, 6)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (8, N'Kullanıcılar', 7, N'Kdr.TeknikServis.controls.UserControlPersonel', 7)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (9, N'Kargo Firma', 7, N'Kdr.TeknikServis.controls.UserControlKargoFirma', 8)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (10, N'Ürün Parça', 7, N'Kdr.TeknikServis.controls.UserControlUrunParca', 9)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (11, N'Raporlar', 7, N'Kdr.TeknikServis.controls.UserControlRaporlar', 10)
GO
INSERT [dbo].[UygulamaMenu] ([Id], [MenuName], [UstMenuId], [MenuClass], [IconIndex]) VALUES (12, N'Ürün Kargo', 0, N'Kdr.TeknikServis.controls.UserControlUrunKargo', 8)
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
