USE [BookStores]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [nvarchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discountID] [nvarchar](10) NOT NULL,
	[discountDescription] [nvarchar](15) NULL,
	[percentDiscount] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailID] [int] NOT NULL,
	[orderID] [int] NULL,
	[productID] [nvarchar](10) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] NOT NULL,
	[userID] [nvarchar](10) NULL,
	[date] [date] NULL,
	[total] [float] NULL,
	[discountID] [nvarchar](10) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [nvarchar](10) NOT NULL,
	[productname] [nvarchar](20) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[shortDescription] [nvarchar](500) NULL,
	[productDescription] [nvarchar](100) NULL,
	[status] [bit] NULL,
	[imageUrl] [nvarchar](100) NULL,
	[categoryID] [nvarchar](10) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](10) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[discountID] [varchar](10) NOT NULL,
	[discountDescription] [varchar](50) NULL,
	[percentDiscount] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblDiscount] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [nchar](10) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nchar](30) NOT NULL,
	[discountID] [varchar](10) NULL,
	[date] [date] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nchar](10) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[productImg] [varchar](max) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[categoryID] [nchar](10) NOT NULL,
	[description] [nvarchar](200) NULL,
	[author] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nchar](30) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tlbCategories]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tlbCategories](
	[categoryID] [nchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tlbCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/23/2021 8:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [nvarchar](10) NOT NULL,
	[username] [nvarchar](10) NULL,
	[password] [nvarchar](10) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[roleID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'BM', N'Báo Mới')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'TC', N'Tình Cảm')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'TR', N'Tri Thức')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'TT', N'Tiểu Thuyết')
GO
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'AL', N'Giam 28%', 28, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'AT        ', N'Giamr 50%      ', 50, 0)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'BT        ', N'Giam 10%       ', 10, 0)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'CT        ', N'Giam 20%       ', 20, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'DT        ', N'Giam 80%       ', 80, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'ET        ', N'Giam 70%       ', 70, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'FT', N'Giam 30%', 30, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'IT', N'giam 12%', 12, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'MT', N'giam 18%', 18, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'NT', N'giam 12%', 12, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'OT', N'giam 31%', 31, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'QT', N'giam 60%', 60, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'RT', N'giam 12%', 12, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SQ', N'Giam 80%', 80, 1)
INSERT [dbo].[Discount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'WE', N'giam 60%', 60, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1, 1, N'T001', 16000, 47)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (2, 2, N'T002', 17000, 18)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (3, 7, N'T002', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (4, 8, N'T002', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (5, 9, N'T002', 170000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (6, 10, N'T002', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (7, 11, N'T003', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (8, 12, N'T003', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (9, 13, N'T003', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (10, 14, N'T002', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (11, 15, N'T003', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (12, 16, N'T003', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (13, 17, N'T002', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (14, 18, N'T002', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (15, 19, N'T001', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (16, 19, N'T002', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (17, 20, N'T001', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (18, 20, N'T002', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (19, 21, N'T001', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (20, 21, N'T002', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (21, 22, N'T001', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (22, 22, N'T002', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (23, 23, N'T002', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (24, 23, N'T003', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (25, 24, N'T002', 170000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (26, 25, N'T002', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (27, 25, N'T003', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (28, 26, N'T002', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (29, 26, N'T003', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (30, 27, N'T002', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (31, 27, N'T003', 340000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (32, 28, N'T006', 12000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (33, 30, N'T002', 170000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (34, 31, N'T002', 161920, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (35, 31, N'T001', 161920, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (36, 32, N'T001', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (37, 33, N'T002', 340000, 2)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (38, 34, N'T002', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (39, 34, N'T001', 184000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (40, 35, N'T001', 12320, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (41, 36, N'T001', 277200, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (42, 36, N'T002', 277200, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (43, 37, N'T001', 145000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (44, 40, N'T001', 145000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (45, 41, N'T002', 149600, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (46, 42, N'T001', 145000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (47, 43, N'T001', 127600, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (48, 44, N'T003', 149600, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (49, 45, N'T011', 559592, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (50, 46, N'T009', 227040, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (51, 47, N'T009', 227040, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (52, 48, N'T003', 149600, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (53, 49, N'T003', 149600, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (54, 50, N'T002', 149600, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (55, 51, N'T011', 1271800, 2)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (56, 52, N'T002', 170000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (57, 53, N'T002', 170000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (58, 54, N'T011', 1271800, 2)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (59, 57, N'T011', 635900, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (60, 59, N'T002', 170000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (61, 61, N'T001', 190000, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (62, 62, N'T001', 190000, 1)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (1, N'U04', CAST(N'2018-09-05' AS Date), 1354350000, N'AT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (2, N'U05', CAST(N'2017-09-06' AS Date), 245030000, N'AT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (3, N'U05', CAST(N'2009-02-20' AS Date), 352000000, N'BT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (4, N'U04', CAST(N'2000-05-07' AS Date), 483525000, N'BT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (5, N'U05', CAST(N'2010-12-12' AS Date), 385000000, N'CT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (6, N'123', CAST(N'2021-05-06' AS Date), 9299000, N'BT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (7, N'1058', CAST(N'2021-05-28' AS Date), 184000, N'CT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (8, N'1058', CAST(N'2021-05-28' AS Date), 184000, N'AT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (9, N'1058', CAST(N'2021-05-28' AS Date), 170000, N'AT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (10, N'1058', CAST(N'2021-05-29' AS Date), 184000, N'AT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (11, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'AT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (12, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'AT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (13, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'AT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (14, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'CT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (15, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'CT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (16, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'CT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (17, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'CT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (18, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'CT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (19, N'1058', CAST(N'2021-05-29' AS Date), 184000, N'ET')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (20, N'1058', CAST(N'2021-05-29' AS Date), 184000, N'ET')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (21, N'1058', CAST(N'2021-05-29' AS Date), 184000, N'ET')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (22, N'1058', CAST(N'2021-05-29' AS Date), 184000, N'ET')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (23, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'ET')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (24, N'1058', CAST(N'2021-05-29' AS Date), 170000, N'ET')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (25, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'ET')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (26, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'ET')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (27, N'1058', CAST(N'2021-05-29' AS Date), 340000, N'ET')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (28, N'U04', CAST(N'2021-05-31' AS Date), 12000, N'DT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (29, N'U04', CAST(N'2021-06-01' AS Date), 178000, N'CT')
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (30, N'1058', CAST(N'2021-06-01' AS Date), 170000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (31, N'1058', CAST(N'2021-06-01' AS Date), 161920, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (32, N'1058', CAST(N'2021-06-01' AS Date), 184000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (33, N'1058', CAST(N'2021-06-01' AS Date), 340000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (34, N'1058', CAST(N'2021-06-01' AS Date), 184000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (35, N'U01', CAST(N'2021-06-01' AS Date), 12320, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (36, N'123', CAST(N'2021-06-02' AS Date), 277200, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (37, N'123', CAST(N'2021-06-02' AS Date), 145000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (38, N'123', CAST(N'2021-06-02' AS Date), 145000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (39, N'123', CAST(N'2021-06-02' AS Date), 145000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (40, N'123', CAST(N'2021-06-02' AS Date), 145000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (41, N'123', CAST(N'2021-06-03' AS Date), 149600, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (42, N'123', CAST(N'2021-06-03' AS Date), 145000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (43, N'123', CAST(N'2021-06-03' AS Date), 127600, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (44, N'123', CAST(N'2021-06-03' AS Date), 149600, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (45, N'123', CAST(N'2021-06-03' AS Date), 559592, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (46, N'123', CAST(N'2021-06-03' AS Date), 227040, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (47, N'123', CAST(N'2021-06-03' AS Date), 227040, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (48, N'123', CAST(N'2021-06-03' AS Date), 149600, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (49, N'123', CAST(N'2021-06-03' AS Date), 149600, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (50, N'123', CAST(N'2021-06-03' AS Date), 149600, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (51, N'123', CAST(N'2021-06-04' AS Date), 1271800, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (52, N'123', CAST(N'2021-06-04' AS Date), 170000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (53, N'123', CAST(N'2021-06-04' AS Date), 170000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (54, N'123', CAST(N'2021-06-04' AS Date), 1271800, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (55, N'123', CAST(N'2021-06-04' AS Date), 1271800, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (56, N'123', CAST(N'2021-06-04' AS Date), 1271800, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (57, N'123', CAST(N'2021-06-04' AS Date), 635900, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (58, N'123', CAST(N'2021-06-04' AS Date), 635900, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (59, N'123', CAST(N'2021-06-04' AS Date), 170000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (60, N'123', CAST(N'2021-06-04' AS Date), 170000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (61, N'123', CAST(N'2021-06-04' AS Date), 190000, NULL)
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total], [discountID]) VALUES (62, N'123', CAST(N'2021-06-04' AS Date), 190000, NULL)
GO
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T001', N'Truyện Xuân', 190000, 21, N'Truyen ke ve ngoai truyen', N'truyen truyen thuyet', 1, N'tamcam1.png', N'TT')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T002', N'Sơn tinh', 170000, 87, N'Truyện Sơn tinh', N'Sơn tinh và mị nương', 1, N'sontinh1.png', N'TT')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T003', N'Thủy Tinh', 170000, 88, N'Thủy tinh và sơn tinh', N'Truyện kể về ngày xưa', 1, N'thuytinh1.png', N'TT')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T004', N'Truyện Demac', 180000, 20, N'Biến giữa các drama', N'Hồi kết sau nhiều năm chống chọi', 1, N'hai.jpg', N'TT')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T005', N'Truyện Tinh Hoa', 172000, 25, N'Giới thiệu sản phẩm', N'Giới thiệu nhiều về tinh hoa đất trời', 1, N'mot.jpg', N'TC')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T006', N'Truyện Hồng Hà', 12000, 68, N'Kể về kịch tính', N'Hồn nhiên tuổi 18', 1, N'ba.jpg', N'BM')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T007', N'Truyện Tâm Hồn', 5000, 35, N'Hướng dẫn tâm lí', N'Tâm hồn sức mẻ tuổi trẻ', 1, N'bon.jpg', N'TR')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T008', N'Sách Toán', 187900, 56, N'Dạy toán cơ bản', N'Toán cơ bản cho trẻ', 1, N'nam.jpg', N'BM')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T009', N'Sách Ngữ Văn', 258000, 356, N'Dạy ngữ văn siêu hay', N'Ngữ văn Truyện Kiều ', 1, N'sau.jpg', N'BM')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T010', N'Sách Khoa học', 892500, 45, N'Học khoa học siêu dễ', N'Nhà thiên văn tài ba ', 1, N'bay.jpg', N'TC')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T011', N'Sách Tin Học', 635900, 0, N'Học tin học code', N'Code siêu nhanh trong 30 ngày', 1, N'tam.jpg', N'TR')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T012', N'Truyện ', 15000, 14, N'Truyá»n xuÃ¢n vui váº»', N'Truyá»n xuÃ¢n vui váº»', 1, N'sontinh1.png', N'TT')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T013', N'Hamster', 194500, 78, N'Science Fiction Books', N'Science Fiction Books', 1, N'sontinh1.png', N'TT')
INSERT [dbo].[Products] ([productID], [productname], [price], [quantity], [shortDescription], [productDescription], [status], [imageUrl], [categoryID]) VALUES (N'T014', N'NoteBook', 575775, 56, N'sfg', N'sf', 0, N'sontinh1.png', N'TC')
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (1, N'admin')
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (2, N'user')
GO
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'FALL', N'discount 40', 0.40000000596046448, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'OUT', N'giam gia 50 phan tram', 0.5, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SPRING', N'giam gia 15 phan tram', 0.15, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SUM', N'giam gia 20 phan tram', 0.2, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SUMM', N'giam gia 50', 0.5, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'VND', N'giam gia 50', 0.5, 1)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1, 1, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (2, 2, N'P01       ', 180, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (3, 2, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (4, 2, N'P02       ', 222, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (5, 2, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (6, 2, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (7, 3, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (8, 3, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (9, 4, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (10, 4, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (11, 5, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (12, 5, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (13, 6, N'P03       ', 300, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (14, 6, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (15, 6, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (16, 7, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (17, 7, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (18, 7, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (19, 8, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (20, 9, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (21, 9, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (22, 9, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (23, 10, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (24, 13, N'P04       ', 400, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (1, N'khoa1                         ', NULL, CAST(N'2021-05-16' AS Date), 222)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (2, N'khoa1                         ', NULL, CAST(N'2021-05-16' AS Date), 1824)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (3, N'khoa1                         ', NULL, CAST(N'2021-05-21' AS Date), 104.40000152587892)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (4, N'khoa1                         ', NULL, CAST(N'2021-05-21' AS Date), 522)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (5, N'khoa2                         ', N'SUM', CAST(N'2021-05-21' AS Date), 124.40000152587892)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (6, N'khoa1                         ', NULL, CAST(N'2021-05-23' AS Date), 1222)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (7, N'khoa3                         ', NULL, CAST(N'2021-05-23' AS Date), 922)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (8, N'khoa3                         ', NULL, CAST(N'2021-05-23' AS Date), 300)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (9, N'khoa4                         ', N'SUM', CAST(N'2021-05-24' AS Date), 737.5999755859375)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (10, N'khoa1                         ', NULL, CAST(N'2021-05-24' AS Date), 222)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (13, N'khoa4                         ', N'OUT', CAST(N'2021-05-24' AS Date), 200)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P01       ', N'Không Gia Đình', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_223588.jpg', 180, 0, N'C01       ', N'Cuốn sách dành cho những bạn trẻ chênh vênh và đầy hoang mang nhưng không ngừng theo đuổi sự nỗ lực', N'Bạch Tô')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P02       ', N'Tiếng Gọi Hoang Dã', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_223386.jpg', 222, 0, N'C01       ', N'Cơ Thể Tuổi Dậy Thì Một phút trước bạn vẫn còn là chú vịt con “xấu xí”, đến phút thứ hai thì đã biến thành nàng thiên nga xinh đẹp', N'Sonya Renee Taylor')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P03       ', N'Cánh Buồn Đỏ Thắm', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_223385.jpg', 300, 0, N'C01       ', N'Thì thầm chuyện nhỏ chuyện to là cuốn sách tập hợp những bài viết và những lời “tâm sự mỏng” từ những năm tháng tác giả ', N'Nguyễn Lan Hải')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P04       ', N'Tây Du Ký', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_221561.jpg', 400, 24, N'C02       ', N'Quan tâm đến một chế độ ăn uống lành mạnh, đầy đủ dưỡng chất cho cơ thể', N'Dragana Vilinac')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P05       ', N'Búp Bê', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/8/9/8935212346740.jpg', 500, 39, N'C02       ', N'Từ Vựng Tiếng Nhật Qua Hội Thoại Giao Tiếp Bạn yêu thích văn hóa Nhật Bản', N'Saiwai Hoàng Quỳnh')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P06       ', N'Thần Thoại Hy Lạp', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_175281.jpg', 600, 50, N'C02       ', N' Tiếng Anh là ngôn ngữ toàn cầu và đã gần như phổ biến với mọi người', N'Mẹ Tưởng')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P07       ', N'ENGLISH BUSINESS', N'https://newshop.vn/public/uploads/products/40631/sach-song-sot-noi-cong-so-english-business-conversation-noi-sao-cho-ngau_L.jpg', 700, 70, N'C03       ', N'Step by step guidance to achieving the IELTS score you need Build up to IELTS is a compact IELTS course designed for students who want to achieve a score of 5.5-6.0 in the Academic IELTS test.', N'Lewis Richards')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P08       ', N'Chữ Hán', N'https://newshop.vn/public/uploads/products/40572/sach-tu-hoc-chu-han_L.jpg', 800, 80, N'C03       ', N'Giáo sư, Tiến sĩ Mai Ngọc Chừ là nhà ngôn ngữ học. Ông dạy tiếng Việt và Ngôn ngữ học tại Đại học Tổng hợp Hà Nội từ năm 1974', N'Giáo Sư')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P09       ', N'Thành Ngữ Anh Việt', N'https://newshop.vn/public/uploads/products/39784/sach-chuyen-ke-thanh-ngu-anh-viet_L.jpg', 900, 90, N'C03       ', N'Đừng Sợ Lỡ Cuộc Chơi Cứ năm phút, bạn lại kiểm tra Facebook để chắc chắn rằng mình không bỏ lỡ một sự kiện nào đó hay một thái độ, comment của ai đó trên dòng trạng thái của bạn', N'PATRICK J. McGINNIS')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P10       ', N'Sống Ảo Đi Thật', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_232601.jpg', 1000, 100, N'C03       ', N'Sống Ảo Đi Thật Mở đầu cuốn sách tác giả nêu ra một vấn đề, đó là con người trong xã hội hiện đại trở nên phụ thuộc vào chiếc smartphone', N'Ngọc Lâm Phan Lâm')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P11       ', N'SaiKi', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/s/a/saiki-ke-sieu-nang-khon-kho---tap-8.jpg', 100, 10, N'C03       ', N'Ngã Ở Đâu Đứng Lên Ở Đó “Một ngày thường bắt đầu bằng ánh bình minh, một năm thường bắt đầu bằng mùa xuân ấm áp và một đời người thường bắt đầu bằng những lần tự đứng lên sau vấp ngã.”', N'Trang Peace')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P12       ', N'Một Vòng Thời Gian', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/h/o/horimiya-3---bia-1.jpg', 200, 20, N'C03       ', N'Một Vòng Thời Gian “Một vòng thời gian” là cuốn sách được tác giả Thiện Nhân ấp ủ từ từ khi còn ở độ tuổi đôi mươi', N'Thiện Nhân')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P13       ', N'Hành Trang Lập Trình', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/d/o/doi-quan-nhi-nho---tap-23.jpg', 300, 30, N'C04       ', N'Phần này trình bày những suy nghĩ và kĩ năng mềm cần thiết để bạn có thể hòa nhập và tiến xa được trong lĩnh vực công nghệ phần mềm', N'Vũ Công Tấn Tài')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P14       ', N'Tự Động Hóa ', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/n/x/nxbtre_full_18282021_042854.jpg', 400, 40, N'C04       ', N'Tự Động Hóa PLC S7-1200 Với Tia Portal Trong lần tái bản mới này, tác giả dành nhiều thời gian chỉnh sửa lỗi chính tả, một số sai sót khác và bổ sung thêm nội dung', N'Trần Văn Hiếu')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P15       ', N'Lanh Quy', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/n/x/nxbtre_full_18262021_042619.jpg', 500, 50, N'C04       ', N'Grammar Gateway Intermediate là sách ngữ pháp Tiếng Anh trung cấp giúp người học có thể nâng cao trình độ của mình thông qua các bài tập ngữ pháp chuyên sâu', N'Đăng Khoa')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P16       ', N'Kimetsu', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/b/l/bleach-49_the-lost-agent.jpg', 600, 60, N'C04       ', N'Lập Trình Viên - Phù Thủy Thế Giới Mạng "...Khi viết mã, thích nhất là ta có thể nắm thế kiểm soát', N'Jane (J.M) Bedell')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P44       ', N'ReactJS', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_184063.jpg', 200, 0, N'C01       ', N'reactjs', N'Binz')
GO
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'GU', N'guest')
GO
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa                          ', N'khoa', N'123/456', N'1234567890', N'AD', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa1                         ', N'khoa', N'123/456', N'1234567890', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa2                         ', N'khoa', N'123/456', N'1231232312', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa3                         ', N'khoa', N'123/456', N'1234567890', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa4                         ', N'khoa', N'123/456', N'1234567890', N'GU', N'1')
GO
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C01       ', N'Văn Học')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C02       ', N'Truyện Tranh')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C03       ', N'Ngoại Ngữ')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C04       ', N'Tin Học')
GO
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'1058', N'Tan', N'123456', N'Tran', N'0901245555', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'123', N'Tai', N'taipham', N'khb', N'6345001200', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U01', N'Tai', N'123456', N'Bình Hưng Hòa', N'0898121579', 1)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U02', N'Nhan', N'123456', N'Nam từ Liêm', N'0898512457', 1)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U04', N'Kiet', N'123456', N'Linh Trung', N'0854126985', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U05', N'Xanh', N'123456', N'Linh Chiểu', N'0215463258', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U5471', N'Tam', N'taipham', N'Binh Hung Hoa', N'(+84) 898121579', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U56', N'123', N'phamvie', N'BinhHung', N'0356530125', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U7501', N'878', N'68435', N'Nguyen Thi Tu', N'0891254788', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U7671', N'Truyen', N'taipham', N'Binh Hung Hoa', N'(+84) 898121579', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U7741', N'dat', N'taipham', N'Binh Hung Hoa', N'(+84) 898121579', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U7951', N'Thuyen', N'taipham', N'Binh Hung Hoa', N'2401254896', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U8171', N'Tin', N'12345678', N'Tran Hung Dao', N'6835420000', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U8491', N'Phat', N'taipham', N'Binh Hung Hoa', N'(+84) 898121579', 2)
INSERT [dbo].[Users] ([userID], [username], [password], [address], [phone], [roleID]) VALUES (N'U8551', N'Ta', N'1', N'Binh Hung Hoa', N'(+84) 898121579', 2)
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Discount] FOREIGN KEY([discountID])
REFERENCES [dbo].[Discount] ([discountID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Discount]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([categoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblDiscount] FOREIGN KEY([discountID])
REFERENCES [dbo].[tblDiscount] ([discountID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblDiscount]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tlbCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tlbCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tlbCategories]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
