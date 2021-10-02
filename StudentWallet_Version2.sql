USE [master]
GO
CREATE DATABASE [StudentWallet]
GO
USE [StudentWallet]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](50) NOT NULL,
	[categoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblChannel]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblChannel](
	[channeID] [varchar](50) NOT NULL,
	[channelName] [varchar](50) NOT NULL,
	[channelOffice] [varchar](50) NOT NULL,
	[channelPhone] [varchar](50) NOT NULL,
	[channelStartDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblChannel] PRIMARY KEY CLUSTERED 
(
	[channeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](50) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[totalMoney] [float] NOT NULL,
	[orderDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [varchar](50) NOT NULL,
	[orderID] [varchar](50) NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [varchar](50) NOT NULL,
	[categoryID] [varchar](50) NOT NULL,
	[productName] [varchar](50) NOT NULL,
	[description] [varchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[statusID] [bit] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[image] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblReward]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblReward](
	[rewardID] [varchar](50) NOT NULL,
	[channelID] [varchar](50) NOT NULL,
	[rewardTypeID] [varchar](50) NOT NULL,
	[rewardName] [varchar](50) NOT NULL,
	[rewardPoint] [varchar](50) NOT NULL,
	[rewardDate] [datetime] NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblReward] PRIMARY KEY CLUSTERED 
(
	[rewardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRewardType]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRewardType](
	[rewardTypeID] [varchar](50) NOT NULL,
	[rewardTypename] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblRewardType] PRIMARY KEY CLUSTERED 
(
	[rewardTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStudent]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStudent](
	[userID] [varchar](50) NOT NULL,
	[universityID] [varchar](50) NOT NULL,
	[studentName] [varchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [varchar](100) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[dateCreate] [datetime] NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblStudent] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTransaction]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTransaction](
	[transactionID] [varchar](50) NOT NULL,
	[walletID] [varchar](50) NOT NULL,
	[orderID] [varchar](50) NOT NULL,
	[totalMoney] [float] NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[transactionPoint] [int] NOT NULL,
 CONSTRAINT [PK_tblTransaction] PRIMARY KEY CLUSTERED 
(
	[transactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUniversity]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUniversity](
	[universityID] [varchar](50) NOT NULL,
	[universityName] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phoneNumber] [varchar](50) NOT NULL,
	[email] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblUniversity] PRIMARY KEY CLUSTERED 
(
	[universityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblWallet]    Script Date: 23/09/2021 2:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWallet](
	[walletID] [varchar](50) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[walletName] [varchar](50) NOT NULL,
	[balance] [float] NOT NULL,
	[walletPoint] [int] NOT NULL,
	[walletStatus] [bit] NOT NULL,
	[rewardID] [varchar](50) NULL,
 CONSTRAINT [PK_tblWallet] PRIMARY KEY CLUSTERED 
(
	[walletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'ca1', N'liem')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'ca2', N'sdasd')
INSERT [dbo].[tblChannel] ([channeID], [channelName], [channelOffice], [channelPhone], [channelStartDate]) VALUES (N'cn1', N'7Elevent', N'FPT Xavalon', N'123456', CAST(N'2015-07-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalMoney], [orderDate]) VALUES (N'dsasda', N'us1', 15, CAST(N'2021-02-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or1', N'dsasda', N'pr1', 2, 12)
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr1', N'ca1', N'sdsd', N'dsdsad', 15, 15, 1, CAST(N'2021-02-20 00:00:00.000' AS DateTime), N'sdasd')
INSERT [dbo].[tblReward] ([rewardID], [channelID], [rewardTypeID], [rewardName], [rewardPoint], [rewardDate], [description]) VALUES (N'rewa1', N'cn1', N'rety1', N'Thaycokhen', N'150', CAST(N'2021-09-15 00:00:00.000' AS DateTime), N'Lam nhieu bai tap')
INSERT [dbo].[tblRewardType] ([rewardTypeID], [rewardTypename]) VALUES (N'rety1', N'Bung no cuoi tuan')
INSERT [dbo].[tblStudent] ([userID], [universityID], [studentName], [age], [gender], [address], [email], [dateCreate], [roleID], [status]) VALUES (N'us1', N'ni1', N'liem', 12, 1, N'HCM', N'email', CAST(N'2021-02-10 00:00:00.000' AS DateTime), N'rl1', 1)
INSERT [dbo].[tblTransaction] ([transactionID], [walletID], [orderID], [totalMoney], [orderDate], [transactionPoint]) VALUES (N'tran1', N'wa1', N'dsasda', 15, CAST(N'2021-02-02 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[tblUniversity] ([universityID], [universityName], [address], [phoneNumber], [email]) VALUES (N'ni1', N'unicui', N'HCM', N'07333', N'liemro9x')
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus], [rewardID]) VALUES (N'wa1', N'us1', N'name1', 15, 15, 1, N'rewa1')
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblStudent] FOREIGN KEY([userID])
REFERENCES [dbo].[tblStudent] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblStudent]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct1] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct1]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory1] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory1]
GO
ALTER TABLE [dbo].[tblReward]  WITH CHECK ADD  CONSTRAINT [FK_tblReward_tblChannel] FOREIGN KEY([channelID])
REFERENCES [dbo].[tblChannel] ([channeID])
GO
ALTER TABLE [dbo].[tblReward] CHECK CONSTRAINT [FK_tblReward_tblChannel]
GO
ALTER TABLE [dbo].[tblReward]  WITH CHECK ADD  CONSTRAINT [FK_tblReward_tblRewardType] FOREIGN KEY([rewardTypeID])
REFERENCES [dbo].[tblRewardType] ([rewardTypeID])
GO
ALTER TABLE [dbo].[tblReward] CHECK CONSTRAINT [FK_tblReward_tblRewardType]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_tblUniversity] FOREIGN KEY([universityID])
REFERENCES [dbo].[tblUniversity] ([universityID])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_tblUniversity]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tblTransaction_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [FK_tblTransaction_tblOrder]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tblTransaction_tblWallet] FOREIGN KEY([walletID])
REFERENCES [dbo].[tblWallet] ([walletID])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [FK_tblTransaction_tblWallet]
GO
ALTER TABLE [dbo].[tblWallet]  WITH CHECK ADD  CONSTRAINT [FK_tblWallet_tblReward] FOREIGN KEY([rewardID])
REFERENCES [dbo].[tblReward] ([rewardID])
GO
ALTER TABLE [dbo].[tblWallet] CHECK CONSTRAINT [FK_tblWallet_tblReward]
GO
ALTER TABLE [dbo].[tblWallet]  WITH CHECK ADD  CONSTRAINT [FK_tblWallet_tblStudent] FOREIGN KEY([userID])
REFERENCES [dbo].[tblStudent] ([userID])
GO
ALTER TABLE [dbo].[tblWallet] CHECK CONSTRAINT [FK_tblWallet_tblStudent]
GO
