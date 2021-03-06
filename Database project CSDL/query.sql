USE [WebCSDL]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/7/2021 11:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[Username] [varchar](20) NOT NULL,
	[ProductID] [varchar](5) NOT NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/7/2021 11:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Username] [varchar](20) NOT NULL,
	[Password] [text] NOT NULL,
	[Name] [ntext] NULL,
	[Address] [ntext] NULL,
	[Phone] [text] NULL,
	[Permission] [varchar](4) NULL,
	[TotalPayment] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/7/2021 11:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [varchar](20) NOT NULL,
	[Username] [varchar](20) NULL,
	[CreateDate] [date] NULL,
	[Total] [decimal](10, 0) NULL,
	[Status] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 1/7/2021 11:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderList](
	[OrderID] [varchar](20) NOT NULL,
	[ProductID] [varchar](5) NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/7/2021 11:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](5) NOT NULL,
	[Name] [ntext] NULL,
	[Price] [decimal](10, 0) NULL,
	[Info] [ntext] NULL,
	[Image] [text] NULL,
	[Category] [ntext] NULL,
	[Sold] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Cart] ([Username], [ProductID], [Quantity]) VALUES (N'lovehangga', N'PZ02', 1)
INSERT [dbo].[Customer] ([Username], [Password], [Name], [Address], [Phone], [Permission], [TotalPayment]) VALUES (N'anh.tn123123', N'$2a$10$RM8HPO5lUhYLdlNsfZ87/ucY20gzIHBKoKXKqv3lP/0rCxfM83/UG', N'T?ng Ng?c Anh', N'C?m Ph? Qu?ng NInh', N'123123123', N'0001', 0)
INSERT [dbo].[Customer] ([Username], [Password], [Name], [Address], [Phone], [Permission], [TotalPayment]) VALUES (N'anh.tn184040', N'$2a$10$spEXi2tq2OTfqhXXM/RPy.BY8jKhct7HA6LgOpeJSGoj58BgSSWxi', N'Tống Ngọc Anh', N'Cẩm Thành Cẩm Phả Quảng Ninh', N'0369037471', N'0001', 340000)
INSERT [dbo].[Customer] ([Username], [Password], [Name], [Address], [Phone], [Permission], [TotalPayment]) VALUES (N'asdasd', N'$2a$10$tSi79N/Mx.ZiJkPk290FfOYterxnsSET9vSl2HeTDi9GpXZmzM5ui', N'asdasd', N'asdasd', N'asdasd', N'0001', 223650)
INSERT [dbo].[Customer] ([Username], [Password], [Name], [Address], [Phone], [Permission], [TotalPayment]) VALUES (N'dat', N'$2a$10$dTp2EiYawxUkkUoEdZo8/.BLZKaBQ.G3aUN3X2LUpBhACcrouZVCS', N'Dat', N'ha noi', N'03434534', N'0001', 762510)
INSERT [dbo].[Customer] ([Username], [Password], [Name], [Address], [Phone], [Permission], [TotalPayment]) VALUES (N'lebaohieu_123', N'$2a$10$IjCaFpgEaCViLAaAYGd0f.KF70tNlnQeZKNAAz.k7.7rZ4.cmAu5i', N'lê bảo hiếu', N'123', N'123123', N'0001', 0)
INSERT [dbo].[Customer] ([Username], [Password], [Name], [Address], [Phone], [Permission], [TotalPayment]) VALUES (N'lovehangga', N'$2a$10$MleOyrgjyUuzl35YdvM4DuvoOzXWu6uej.iK9cn8YSK.kVvCsBhgy', N'undefined', N'12312', N'123123', N'0002', 332850)
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'11212333', N'anh.tn184040', CAST(N'2021-01-30' AS Date), CAST(330000 AS Decimal(10, 0)), N'ok')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1123', N'anh.tn184040', CAST(N'2021-01-30' AS Date), CAST(10000 AS Decimal(10, 0)), N'ok')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1123123', N'anh.tn184040', CAST(N'2021-01-30' AS Date), CAST(10000 AS Decimal(10, 0)), N'ok')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'11233', N'anh.tn184040', CAST(N'2021-01-30' AS Date), CAST(10000 AS Decimal(10, 0)), N'ok')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'123123123', N'anh.tn184040', CAST(N'2021-01-30' AS Date), CAST(10000 AS Decimal(10, 0)), N'ok')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609680338364', N'anh.tn184040', CAST(N'2021-01-03' AS Date), CAST(147000 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609681729992', N'anh.tn184040', CAST(N'2021-01-03' AS Date), CAST(176400 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609682313641', N'lovehangga', CAST(N'2021-01-03' AS Date), CAST(99750 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609684805272', N'lovehangga', CAST(N'2021-01-03' AS Date), CAST(61950 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609685575352', N'lovehangga', CAST(N'2021-01-03' AS Date), CAST(223650 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609685598081', N'lovehangga', CAST(N'2021-01-03' AS Date), CAST(47250 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609686902514', N'asdasd', CAST(N'2021-01-03' AS Date), CAST(223650 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609989183138', N'dat', CAST(N'2021-01-07' AS Date), CAST(48195 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609989472203', N'dat', CAST(N'2021-01-07' AS Date), CAST(123900 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609989510594', N'dat', CAST(N'2021-01-07' AS Date), CAST(47250 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609989635607', N'dat', CAST(N'2021-01-07' AS Date), CAST(321300 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609989810548', N'dat', CAST(N'2021-01-07' AS Date), CAST(221865 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[Order] ([OrderID], [Username], [CreateDate], [Total], [Status]) VALUES (N'1609991073267', N'lovehangga', CAST(N'2021-01-07' AS Date), CAST(61950 AS Decimal(10, 0)), N'Đặt hàng thành công')
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609680338364', N'MT10', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609680338364', N'MT13', 2)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609681729992', N'MT10', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609681729992', N'MT21', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609681729992', N'MT25', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609682313641', N'MT10', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609682313641', N'MT13', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609684805272', N'MT21', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609685575352', N'MT10', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609685575352', N'MT13', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609685575352', N'MT21', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609685575352', N'MT25', 2)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609685598081', N'MT13', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609686902514', N'MT10', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609686902514', N'MT13', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609686902514', N'MT21', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609686902514', N'MT25', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989183138', N'PZ04', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989183138', N'PZ06', 2)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989510594', N'MT13', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989635607', N'HBG01', 2)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989635607', N'HBG02', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989635607', N'HBG03', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989810548', N'MT16', 2)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989810548', N'PZ02', 3)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989810548', N'PZ03', 2)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609989810548', N'PZ04', 1)
INSERT [dbo].[OrderList] ([OrderID], [ProductID], [Quantity]) VALUES (N'1609991073267', N'MT21', 2)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'HBG01', N'BURGER PHI LÊ GÀ ĐẶC BIỆT', CAST(76000 AS Decimal(10, 0)), N'Nhiều lớp gà xen kẽ nhau kết hợp với sốt đặc trưng tạo nên hương vị không thể bỏ lỡ.', N'HBG_01', N'Hamburger', 7)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'HBG02', N'BURGER GÀ PHÔ MAI', CAST(46000 AS Decimal(10, 0)), N'Được tạo nên từ phô mai với công thức đặc biệt suốt hằng trăm năm của đất nước Pháp không thể bỏ lỡ.', N'HBG_09', N'Hamburger', 8)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'HBG03', N'BURGER PHI LÊ SIÊU CAY', CAST(108000 AS Decimal(10, 0)), N'Sự kết hợp độc đáo giữa những miếng cá phi lê trứ danh cùng loại phô mai thượng hạng từ Pháp.', N'HBG_10', N'Hamburger', 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT01', N'BẠC SỈU', CAST(32000 AS Decimal(10, 0)), N'Theo chân những người gốc Hoa đến định cư tại Sài Gòn, Bạc sỉu là cách gọi tắt của Bạc tẩy sỉu phé trong tiếng Quảng Đông, chính là: Ly sữa trắng kèm một chút cà phê.', N'MT_01', N'Milktea', 25)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT02', N'CÀ PHÊ ĐEN', CAST(32000 AS Decimal(10, 0)), N'Một tách cà phê đen thơm ngào ngạt, phảng phất mùi cacao là món quà tự thưởng tuyệt vời nhất cho những ai mê đắm tinh chất nguyên bản nhất của cà phê. Một tách cà phê trầm lắng, thi vị giữa dòng đời vồn vã.', N'MT_02', N'Milktea', 33)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT03', N'CÀ PHÊ SỮA', CAST(32000 AS Decimal(10, 0)), N'Cà phê phin kết hợp cũng sữa đặc là một sáng tạo đầy tự hào của người Việt, được xem món uống thương hiệu của Việt Nam.', N'MT_03', N'Milktea', 10)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT04', N'AMERICANO', CAST(39000 AS Decimal(10, 0)), N'Americano được pha chế bằng cách thêm nước vào một hoặc hai shot Espresso để pha loãng độ đặc của cà phê, từ đó mang lại hương vị nhẹ nhàng, không gắt mạnh và vẫn thơm nồng nàn.', N'MT_04', N'Milktea', 5)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT05', N'CAPPUCCINO', CAST(45000 AS Decimal(10, 0)), N'Cappuccino được gọi vui là thức uống một-phần-ba - 1/3 Espresso, 1/3 Sữa nóng, 1/3 Foam.', N'MT_05', N'Milktea', 21)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT06', N'LATTE', CAST(45000 AS Decimal(10, 0)), N'Khi chuẩn bị Latte, cà phê Espresso và sữa nóng được trộn lẫn vào nhau, bên trên vẫn là lớp foam nhưng mỏng và nhẹ hơn Cappucinno.', N'MT_06', N'Milktea', 42)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT07', N'MOCHA', CAST(49000 AS Decimal(10, 0)), N'Cà phê Mocha được ví von đơn giản là Sốt Sô cô la được pha cùng một tách Espresso.', N'MT_07', N'Milktea', 5)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT08', N'COLD BREW TRUYỀN THỐNG', CAST(45000 AS Decimal(10, 0)), N'Cold Brew được ủ và phục vụ mỗi ngày từ 100% hạt Arabica Cầu Đất với hương gỗ thông, hạt dẻ, nốt sô-cô-la đặc trưng, thoang thoảng hương khói nhẹ giúp Cold Brew giữ nguyên vị tươi mới.', N'MT_08', N'Milktea', 7)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT09', N'COLD BREW PHÚC BỒN TỬ', CAST(50000 AS Decimal(10, 0)), N'Một sự kết hợp đầy thuyết phục cho những người thích cà phê nhưng lại muốn thay đổi vị.', N'MT_09', N'Milktea', 28)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT10', N'COLD BREW SỮA TƯƠI', CAST(50000 AS Decimal(10, 0)), N'Thanh mát và cân b?ng v?i huong v? cà phê nguyên b?n 100% Arabica C?u Ð?t cùng s?a tuoi thom béo cho t?ng ng?m tròn v?, h?p d?n.', N'MT_10', N'Milktea', 111)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT11', N'TRÀ OOLONG VẢI', CAST(45000 AS Decimal(10, 0)), N'Là thức uống "bắt vị" được lấy cảm hứng từ trái Vải - thức quả tròn đầy, quen thuộc trong cuộc sống người Việt - kết hợp cùng Trà Oolong làm từ những lá trà tươi hảo hạng.', N'MT_11', N'Milktea', 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT12', N'TRÀ OOLONG HẠT SEN', CAST(45000 AS Decimal(10, 0)), N'Sự kết hợp của Trà Oolong hương thơm nhẹ, vị nồng hậu cùng Hạt sen tươi mềm có vị ngọt, sáp, vừa ngon miệng vừa có tác dụng an thần, tốt cho cơ thể.', N'MT_12', N'Milktea', 44)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT13', N'TRÀ ĐÀO CAM SẢ', CAST(45000 AS Decimal(10, 0)), N'Vị thanh ngọt của đào Hy Lạp, vị chua dịu của Cam Vàng nguyên vỏ, vị chát của trà đen tươi được ủ mới mỗi 4 tiếng, cùng hương thơm nồng đặc trưng của sả chính là điểm sáng làm nên sức hấp dẫn của thức uống này. Sản phẩm hiện có 2 phiên bản Nóng và Lạnh phù hợp cho mọi thời gian trong năm.', N'MT_13', N'Milktea', 127)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT14', N'TRÀ MATCHA MACCHIATO', CAST(45000 AS Decimal(10, 0)), N'Bột trà xanh Matcha thơm lừng hảo hạng cùng lớp Macchiato béo ngậy là một sự kết hợp tuyệt vời.', N'MT_14', N'Milktea', 20)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT15', N'TRÀ LÀI MACCHIATO', CAST(42000 AS Decimal(10, 0)), N'Ngay ngụm đầu tiên chính là vị beo béo ngọt dịu của lớp macchiato, sau đó được cân bằng lại bởi lớp thanh mát từ nền trà oolong hảo hạng - 1 hương vị tươi mới cho team hảo ngọt nhưng thích thanh mát.', N'MT_15', N'Milktea', 23)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT16', N'TRÀ ĐEN MACCHIATO', CAST(42000 AS Decimal(10, 0)), N'Trà đen được ủ mới mỗi ngày, giữ nguyên được vị chát mạnh mẽ đặc trưng của lá trà, phủ bên trên là lớp Macchiato "homemade" bồng bềnh quyến rũ vị phô mai mặn mặn mà béo béo.', N'MT_16', N'Milktea', 45)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT17', N'TRÀ XOÀI MACCHIATO', CAST(55000 AS Decimal(10, 0)), N'Mang trên mình sắc vàng óng ánh của hương xoài thơm lừng, hòa cùng lớp thanh mát của vị trà đen tinh túy, phía trên được phủ thêm 1 lớp foam macchiato béo ngậy, để mang đến cho bạn 1 hòa vị đỉnh cao của sự thanh mát, cùng chút beo béo và dư vị ngọt ngào miễn chê.', N'MT_17', N'Milktea', 33)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT18', N'CHANH SẢ ĐÁ XAY', CAST(49000 AS Decimal(10, 0)), N'Sự kết hợp hài hoà giữa những nguyên liệu mộc mạc rất đỗi quen thuộc đối với người Việt cho một thức uống thanh mát, giải nhiệt lại tốt cho sức khoẻ.', N'MT_18', N'Milktea', 34)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT19', N'PHÚC BỒN TỬ CAM ĐÁ XAY', CAST(59000 AS Decimal(10, 0)), N'Hòa quyện thêm hương vị chua chua, ngọt ngọt từ trái cam tươi và trái phúc bồn tử 100% tự nhiên, để cho ra một hương vị thanh mát, kích thích vị giác đầy thú vị ngay từ lần đầu thưởng thức.', N'MT_19', N'Milktea', 21)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT20', N'SINH TỐ CAM XOÀI', CAST(59000 AS Decimal(10, 0)), N'Vị mứt cam xoài hòa trộn độc đáo với sữa chua, cho cảm giác chua ngọt rất sướng. Điểm nhấn là những mẩu bánh cookie giòn tan giúp sự thưởng thức thêm thú vị.', N'MT_20', N'Milktea', 54)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT21', N'SINH TỐ VIỆT QUẤT', CAST(59000 AS Decimal(10, 0)), N'Mứt Việt Quất chua thanh, ngòn ngọt, phối hợp nhịp nhàng với dòng sữa chua bổ dưỡng. Là món sinh tố thơm ngon mà cả đầu lưỡi và làn da đều thích.', N'MT_21', N'Milktea', 70)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT22', N'SÔ-CÔ-LA ĐÁ', CAST(55000 AS Decimal(10, 0)), N'Cacao nguyên ch?t hoà cùng s?a tuoi béo ng?y. V? ng?t t? nhiên, không g?t c?, d? l?i m?t chút d?ng nh?, cay cay trên d?u lu?i.', N'MT_22', N'Milktea', 33)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT23', N'SÔ-CÔ-LA ĐÁ XAY', CAST(59000 AS Decimal(10, 0)), N'Vị đắng của cà phê kết hợp cùng vị cacao ngọt ngàocủa sô-cô-la, vị sữa tươi ngọt béo, đem đến trải nghiệm vị giác cực kỳ thú vị.', N'MT_23', N'Milktea', 33)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT24', N'MATCHA ĐÁ XAY', CAST(59000 AS Decimal(10, 0)), N'Matcha thanh, nhẫn, và đắng nhẹ được nhân đôi sảng khoái khi uống lạnh. Nhấn nhá thêm những nét bùi béo của kem và sữa. Gây thương nhớ vô cùng!', N'MT_24', N'Milktea', 44)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'MT25', N'MATCHA LATTE', CAST(59000 AS Decimal(10, 0)), N'Với màu xanh mát mắt của bột trà Matcha, vị ngọt nhẹ nhàng, pha trộn cùng sữa tươi và lớp foam mềm mịn, Matcha Latte là thức uống yêu thích của tất cả mọi người khi ghé quán', N'MT_25', N'Milktea', 59)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'PZ01', N'BÔNG LAN TRỨNG MUỐI', CAST(29000 AS Decimal(10, 0)), N'Chắc chắn bạn sẽ không thể cưỡng lại chiếc bánh bông lan tơi xốp, mềm mịn, vị ngọt dịu kết hợp với trứng muối và chà bông đậm đà, cân bằng vị giác.', N'PZ_01', N'Pizza', 6)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'PZ02', N'CROISSANT TRỨNG MUỐI', CAST(14500 AS Decimal(10, 0)), N'Sự kết hợp không thể hoàn hảo hơn giữa chiếc bánh Croissant và vị mặn nhẹ nhàng của trứng muối', N'PZ_02', N'Pizza', 9)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'PZ03', N'BÁNH MÌ CHÀ BÔNG PHÔ MAI', CAST(25000 AS Decimal(10, 0)), N'Bạn không thể bỏ lỡ chiếc bánh với lớp phô mai vàng sánh mịn bên trong, được bọc ngoài lớp vỏ xốp mềm thơm lừng. Thêm lớp chà bông mằn mặn hấp dẫn bên trên.', N'PZ_03', N'Pizza', 10)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'PZ04', N'MOUSSE GẤU CHOCOLATE', CAST(16900 AS Decimal(10, 0)), N'Với vẻ ngoài đáng yêu và hương vị ngọt ngào, thơm béo nhất định bạn phải thử ít nhất 1 lần.', N'PZ_04', N'Pizza', 6)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'PZ05', N'MOUSSE MATCHA', CAST(29000 AS Decimal(10, 0)), N'Khám phá từng tầng vị trà xanh thơm lừng xen kẽ lớp kéo béo dịu với đậu đỏ.', N'PZ_05', N'Pizza', 15)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'PZ06', N'MOUSSE PASSION CHEESE', CAST(29000 AS Decimal(10, 0)), N'Tận hưởng chiếc bánh mát lạnh với sự kết hợp hoàn hảo của vị béo ngậy của nhân kem phô mai, cân bằng với vị chua thanh từ chanh dây.', N'PZ_06', N'Pizza', 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Info], [Image], [Category], [Sold]) VALUES (N'PZ07', N'MOUSSE TIRAMISU', CAST(32000 AS Decimal(10, 0)), N'Hương vị dễ ghiền được tạo nên bởi chút đắng nhẹ của cà phê, lớp kem trứng béo ngọt dịu hấp dẫn.', N'PZ_07', N'Pizza', 4)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Customer__536C85E4EE36F5BA]    Script Date: 1/7/2021 11:18:40 AM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Customer] ([Username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Customer] ([Username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD  CONSTRAINT [FK_OrderList] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderList] CHECK CONSTRAINT [FK_OrderList]
GO
