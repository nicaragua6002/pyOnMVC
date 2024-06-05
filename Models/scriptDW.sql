USE [VentasDW]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 5/6/2024 10:00:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
	[CustomerSegment] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 5/6/2024 10:00:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductID] [int] NOT NULL,
	[ProductCategory] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimSalesRegion]    Script Date: 5/6/2024 10:00:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalesRegion](
	[RegionID] [int] NOT NULL,
	[RegionName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimTime]    Script Date: 5/6/2024 10:00:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTime](
	[DateKey] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Year] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Day] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 5/6/2024 10:00:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[SalesID] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[RegionID] [int] NOT NULL,
	[SalesAmount] [decimal](18, 2) NOT NULL,
	[OrderQuantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DimCustomer] ([CustomerID], [CustomerSegment]) VALUES (1, N'Segment X')
GO
INSERT [dbo].[DimCustomer] ([CustomerID], [CustomerSegment]) VALUES (2, N'Segment Y')
GO
INSERT [dbo].[DimCustomer] ([CustomerID], [CustomerSegment]) VALUES (3, N'Segment Z')
GO
INSERT [dbo].[DimCustomer] ([CustomerID], [CustomerSegment]) VALUES (4, N'Segment W')
GO
INSERT [dbo].[DimProduct] ([ProductID], [ProductCategory]) VALUES (1, N'Category A')
GO
INSERT [dbo].[DimProduct] ([ProductID], [ProductCategory]) VALUES (2, N'Category B')
GO
INSERT [dbo].[DimProduct] ([ProductID], [ProductCategory]) VALUES (3, N'Category C')
GO
INSERT [dbo].[DimProduct] ([ProductID], [ProductCategory]) VALUES (4, N'Category D')
GO
INSERT [dbo].[DimSalesRegion] ([RegionID], [RegionName]) VALUES (1, N'North America')
GO
INSERT [dbo].[DimSalesRegion] ([RegionID], [RegionName]) VALUES (2, N'Europe')
GO
INSERT [dbo].[DimSalesRegion] ([RegionID], [RegionName]) VALUES (3, N'Asia')
GO
INSERT [dbo].[DimSalesRegion] ([RegionID], [RegionName]) VALUES (4, N'South America')
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230101, CAST(N'2023-01-01' AS Date), 2023, 1, 1, 1, 1)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230102, CAST(N'2023-01-02' AS Date), 2023, 1, 1, 2, 2)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230103, CAST(N'2023-01-03' AS Date), 2023, 1, 1, 3, 3)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230104, CAST(N'2023-01-04' AS Date), 2023, 1, 1, 4, 4)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230105, CAST(N'2023-01-05' AS Date), 2023, 1, 1, 5, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230201, CAST(N'2023-02-01' AS Date), 2023, 1, 2, 1, 1)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230202, CAST(N'2023-02-02' AS Date), 2023, 1, 2, 2, 2)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230203, CAST(N'2023-02-03' AS Date), 2023, 1, 2, 3, 3)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230204, CAST(N'2023-02-04' AS Date), 2023, 1, 2, 4, 4)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230205, CAST(N'2023-02-05' AS Date), 2023, 1, 2, 5, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230301, CAST(N'2023-03-01' AS Date), 2023, 1, 3, 1, 1)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230302, CAST(N'2023-03-02' AS Date), 2023, 1, 3, 2, 2)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230303, CAST(N'2023-03-03' AS Date), 2023, 1, 3, 3, 3)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230304, CAST(N'2023-03-04' AS Date), 2023, 1, 3, 4, 4)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230305, CAST(N'2023-03-05' AS Date), 2023, 1, 3, 5, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230401, CAST(N'2023-04-01' AS Date), 2023, 2, 4, 1, 6)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230402, CAST(N'2023-04-02' AS Date), 2023, 2, 4, 2, 7)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230403, CAST(N'2023-04-03' AS Date), 2023, 2, 4, 3, 1)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230404, CAST(N'2023-04-04' AS Date), 2023, 2, 4, 4, 2)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230405, CAST(N'2023-04-05' AS Date), 2023, 2, 4, 5, 3)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230501, CAST(N'2023-05-01' AS Date), 2023, 2, 5, 1, 4)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230502, CAST(N'2023-05-02' AS Date), 2023, 2, 5, 2, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230503, CAST(N'2023-05-03' AS Date), 2023, 2, 5, 3, 6)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230504, CAST(N'2023-05-04' AS Date), 2023, 2, 5, 4, 7)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230505, CAST(N'2023-05-05' AS Date), 2023, 2, 5, 5, 1)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230601, CAST(N'2023-06-01' AS Date), 2023, 2, 6, 1, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230602, CAST(N'2023-06-02' AS Date), 2023, 2, 6, 2, 6)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230603, CAST(N'2023-06-03' AS Date), 2023, 2, 6, 3, 7)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230604, CAST(N'2023-06-04' AS Date), 2023, 2, 6, 4, 1)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230605, CAST(N'2023-06-05' AS Date), 2023, 2, 6, 5, 2)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230701, CAST(N'2023-07-01' AS Date), 2023, 3, 7, 1, 3)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230702, CAST(N'2023-07-02' AS Date), 2023, 3, 7, 2, 4)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230703, CAST(N'2023-07-03' AS Date), 2023, 3, 7, 3, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230704, CAST(N'2023-07-04' AS Date), 2023, 3, 7, 4, 6)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230705, CAST(N'2023-07-05' AS Date), 2023, 3, 7, 5, 7)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230801, CAST(N'2023-08-01' AS Date), 2023, 3, 8, 1, 1)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230802, CAST(N'2023-08-02' AS Date), 2023, 3, 8, 2, 2)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230803, CAST(N'2023-08-03' AS Date), 2023, 3, 8, 3, 3)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230804, CAST(N'2023-08-04' AS Date), 2023, 3, 8, 4, 4)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230805, CAST(N'2023-08-05' AS Date), 2023, 3, 8, 5, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230901, CAST(N'2023-09-01' AS Date), 2023, 3, 9, 1, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230902, CAST(N'2023-09-02' AS Date), 2023, 3, 9, 2, 6)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230903, CAST(N'2023-09-03' AS Date), 2023, 3, 9, 3, 7)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230904, CAST(N'2023-09-04' AS Date), 2023, 3, 9, 4, 1)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20230905, CAST(N'2023-09-05' AS Date), 2023, 3, 9, 5, 2)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231001, CAST(N'2023-10-01' AS Date), 2023, 4, 10, 1, 3)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231002, CAST(N'2023-10-02' AS Date), 2023, 4, 10, 2, 4)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231003, CAST(N'2023-10-03' AS Date), 2023, 4, 10, 3, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231004, CAST(N'2023-10-04' AS Date), 2023, 4, 10, 4, 6)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231005, CAST(N'2023-10-05' AS Date), 2023, 4, 10, 5, 7)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231101, CAST(N'2023-11-01' AS Date), 2023, 4, 11, 1, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231102, CAST(N'2023-11-02' AS Date), 2023, 4, 11, 2, 6)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231103, CAST(N'2023-11-03' AS Date), 2023, 4, 11, 3, 7)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231104, CAST(N'2023-11-04' AS Date), 2023, 4, 11, 4, 1)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231105, CAST(N'2023-11-05' AS Date), 2023, 4, 11, 5, 2)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231201, CAST(N'2023-12-01' AS Date), 2023, 4, 12, 1, 3)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231202, CAST(N'2023-12-02' AS Date), 2023, 4, 12, 2, 4)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231203, CAST(N'2023-12-03' AS Date), 2023, 4, 12, 3, 5)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231204, CAST(N'2023-12-04' AS Date), 2023, 4, 12, 4, 6)
GO
INSERT [dbo].[DimTime] ([DateKey], [Date], [Year], [Quarter], [Month], [Day], [DayOfWeek]) VALUES (20231205, CAST(N'2023-12-05' AS Date), 2023, 4, 12, 5, 7)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (1, 20230101, 1, 1, 1, CAST(100.00 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (2, 20230102, 2, 2, 2, CAST(200.00 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (3, 20230103, 3, 3, 3, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (4, 20230104, 4, 4, 4, CAST(400.00 AS Decimal(18, 2)), 40)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (5, 20230105, 1, 1, 1, CAST(150.00 AS Decimal(18, 2)), 15)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (6, 20230201, 1, 1, 1, CAST(200.00 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (7, 20230202, 2, 2, 2, CAST(250.00 AS Decimal(18, 2)), 25)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (8, 20230203, 3, 3, 3, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (9, 20230204, 4, 4, 4, CAST(350.00 AS Decimal(18, 2)), 35)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (10, 20230205, 1, 1, 1, CAST(400.00 AS Decimal(18, 2)), 40)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (11, 20230301, 1, 1, 1, CAST(250.00 AS Decimal(18, 2)), 25)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (12, 20230302, 2, 2, 2, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (13, 20230303, 3, 3, 3, CAST(350.00 AS Decimal(18, 2)), 35)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (14, 20230304, 4, 4, 4, CAST(400.00 AS Decimal(18, 2)), 40)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (15, 20230305, 1, 1, 1, CAST(450.00 AS Decimal(18, 2)), 45)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (16, 20230601, 1, 1, 1, CAST(100.00 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (17, 20230602, 2, 2, 2, CAST(200.00 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (18, 20230603, 3, 3, 3, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (19, 20230604, 4, 4, 4, CAST(400.00 AS Decimal(18, 2)), 40)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (20, 20230605, 1, 1, 1, CAST(150.00 AS Decimal(18, 2)), 15)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (21, 20230701, 1, 1, 1, CAST(200.00 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (22, 20230702, 2, 2, 2, CAST(250.00 AS Decimal(18, 2)), 25)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (23, 20230703, 3, 3, 3, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (24, 20230704, 4, 4, 4, CAST(350.00 AS Decimal(18, 2)), 35)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (25, 20230705, 1, 1, 1, CAST(400.00 AS Decimal(18, 2)), 40)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (26, 20230801, 1, 1, 1, CAST(250.00 AS Decimal(18, 2)), 25)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (27, 20230802, 2, 2, 2, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (28, 20230803, 3, 3, 3, CAST(350.00 AS Decimal(18, 2)), 35)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (29, 20230804, 4, 4, 4, CAST(400.00 AS Decimal(18, 2)), 40)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (30, 20230805, 1, 1, 1, CAST(450.00 AS Decimal(18, 2)), 45)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (31, 20230901, 1, 1, 1, CAST(100.00 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (32, 20230902, 2, 2, 2, CAST(200.00 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (33, 20230903, 3, 3, 3, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (34, 20230904, 4, 4, 4, CAST(400.00 AS Decimal(18, 2)), 40)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (35, 20230905, 1, 1, 1, CAST(150.00 AS Decimal(18, 2)), 15)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (36, 20231001, 1, 1, 1, CAST(200.00 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (37, 20231002, 2, 2, 2, CAST(250.00 AS Decimal(18, 2)), 25)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (38, 20231003, 3, 3, 3, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (39, 20231004, 4, 4, 4, CAST(350.00 AS Decimal(18, 2)), 35)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (40, 20231005, 1, 1, 1, CAST(400.00 AS Decimal(18, 2)), 40)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (41, 20231101, 1, 1, 1, CAST(110.00 AS Decimal(18, 2)), 11)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (42, 20231102, 2, 2, 2, CAST(220.00 AS Decimal(18, 2)), 22)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (43, 20231103, 3, 3, 3, CAST(330.00 AS Decimal(18, 2)), 33)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (44, 20231104, 4, 4, 4, CAST(440.00 AS Decimal(18, 2)), 44)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (45, 20231105, 1, 1, 1, CAST(165.00 AS Decimal(18, 2)), 16)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (46, 20231201, 1, 1, 1, CAST(220.00 AS Decimal(18, 2)), 22)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (47, 20231202, 2, 2, 2, CAST(275.00 AS Decimal(18, 2)), 27)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (48, 20231203, 3, 3, 3, CAST(330.00 AS Decimal(18, 2)), 33)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (49, 20231204, 4, 4, 4, CAST(385.00 AS Decimal(18, 2)), 38)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (50, 20231205, 1, 1, 1, CAST(440.00 AS Decimal(18, 2)), 44)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (51, 20230401, 1, 1, 1, CAST(100.00 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (52, 20230402, 2, 2, 2, CAST(200.00 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (53, 20230403, 3, 3, 3, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (54, 20230404, 4, 4, 4, CAST(400.00 AS Decimal(18, 2)), 40)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (55, 20230405, 1, 1, 1, CAST(150.00 AS Decimal(18, 2)), 15)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (56, 20230501, 1, 1, 1, CAST(200.00 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (57, 20230502, 2, 2, 2, CAST(250.00 AS Decimal(18, 2)), 25)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (58, 20230503, 3, 3, 3, CAST(300.00 AS Decimal(18, 2)), 30)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (59, 20230504, 4, 4, 4, CAST(350.00 AS Decimal(18, 2)), 35)
GO
INSERT [dbo].[FactSales] ([SalesID], [DateKey], [ProductID], [CustomerID], [RegionID], [SalesAmount], [OrderQuantity]) VALUES (60, 20230505, 1, 1, 1, CAST(400.00 AS Decimal(18, 2)), 40)
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[DimCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimTime] ([DateKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[DimProduct] ([ProductID])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([RegionID])
REFERENCES [dbo].[DimSalesRegion] ([RegionID])
GO
