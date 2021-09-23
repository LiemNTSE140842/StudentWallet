USE [master]
GO
/****** Object:  Database [StudentWallett]    Script Date: 09/19/2021 00:25:08 ******/
CREATE DATABASE [StudentWallett] ON  PRIMARY 
( NAME = N'StudentWallett', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\StudentWallett.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentWallett_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\StudentWallett_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentWallett] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentWallett].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentWallett] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [StudentWallett] SET ANSI_NULLS OFF
GO
ALTER DATABASE [StudentWallett] SET ANSI_PADDING OFF
GO
ALTER DATABASE [StudentWallett] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [StudentWallett] SET ARITHABORT OFF
GO
ALTER DATABASE [StudentWallett] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [StudentWallett] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [StudentWallett] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [StudentWallett] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [StudentWallett] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [StudentWallett] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [StudentWallett] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [StudentWallett] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [StudentWallett] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [StudentWallett] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [StudentWallett] SET  DISABLE_BROKER
GO
ALTER DATABASE [StudentWallett] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [StudentWallett] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [StudentWallett] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [StudentWallett] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [StudentWallett] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [StudentWallett] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [StudentWallett] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [StudentWallett] SET  READ_WRITE
GO
ALTER DATABASE [StudentWallett] SET RECOVERY SIMPLE
GO
ALTER DATABASE [StudentWallett] SET  MULTI_USER
GO
ALTER DATABASE [StudentWallett] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [StudentWallett] SET DB_CHAINING OFF
GO
USE [StudentWallett]
GO
/****** Object:  StoredProcedure [dbo].[SelectCustomerstabledata]    Script Date: 09/19/2021 00:25:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCustomerstabledata]
AS 
BEGIN
     SELECT * 
     FROM dbo.Models
     WHERE model_ID = 178
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEmployees]    Script Date: 09/19/2021 00:25:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_UpdateEmployees] (@ssn char(10),
								
								@phone char(13))
As
Begin
 Update Employees Set phone = @phone
 where  ssn = @ssn
print 'Update successfully'
end
Exec sp_UpdateEmployees N'SE10002','111'



--cập nhật tuổi nhân viên
drop Proc sp_UpdateDependents
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDependents]    Script Date: 09/19/2021 00:25:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_UpdateDependents] (@ssn char(10),
								
								@age integer)
As
Begin
 Update Dependents Set age = @age
 where  ssn = @ssn
print 'Update successfully'
end
Exec sp_UpdateDependents N'SE10002','43'
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 09/19/2021 00:25:09 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'ca1', N'dung cu hoc tap')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'ca2', N'do an vat')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'ca3', N'nuoc giai khac')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'ca4', N'vat dung can thiet kha')
/****** Object:  Table [dbo].[tblUniversity]    Script Date: 09/19/2021 00:25:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUniversity](
	[universityID] [varchar](50) NOT NULL,
	[universityName] [varchar](50) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[phoneNumber] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblUniversity] PRIMARY KEY CLUSTERED 
(
	[universityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblUniversity] ([universityID], [universityName], [address], [phoneNumber], [email]) VALUES (N'ni1', N'dai hoc FPT', N'khu cong nghe cao, quan 9,  TP. HCM', N'0873654567', N' fpteducation@fe.edu.vn')
INSERT [dbo].[tblUniversity] ([universityID], [universityName], [address], [phoneNumber], [email]) VALUES (N'ni2', N'dai hoc Vang Lang', N'quan Go Vap,  TP. HCM', N'0827654321', N'VangLang@edu.vn')
INSERT [dbo].[tblUniversity] ([universityID], [universityName], [address], [phoneNumber], [email]) VALUES (N'ni3', N'dai hoc RMIT', N'21, Pham Ngoc Thach, Quan 3, TP. HCM', N'0367761300', N'Rmit@edu.vn')
INSERT [dbo].[tblUniversity] ([universityID], [universityName], [address], [phoneNumber], [email]) VALUES (N'ni4', N'dai hoc kinh te', N'59C,  Nguyen Dinh Chieu, Quan 3, TP. HCM', N'0838295299', N'info@ueh.edu.vn')
INSERT [dbo].[tblUniversity] ([universityID], [universityName], [address], [phoneNumber], [email]) VALUES (N'ni5', N'dai hoc cong nghiep TP.HCM', N'12, Nguyen Van Bao, Phuong 4, Quan Go Vap, TP.HCM', N'0238940390', N'dhcn@iuh.edu.vn')
/****** Object:  Table [dbo].[tblStudent]    Script Date: 09/19/2021 00:25:09 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblStudent] ([userID], [universityID], [studentName], [age], [gender], [address], [email], [dateCreate], [roleID], [status]) VALUES (N'us1', N'ni1', N'Tran Minh Khoa', 20, 0, N'quan 3, HCM', N'khoatmse151617@fpt.com.vn', CAST(0x0000AAC400000000 AS DateTime), N'US', 1)
INSERT [dbo].[tblStudent] ([userID], [universityID], [studentName], [age], [gender], [address], [email], [dateCreate], [roleID], [status]) VALUES (N'us2', N'ni1', N'Nguyen Thi Thu Thao', 21, 1, N'An Lac A, Binh Tan, Ho Chi Minh', N'thaonttse141101@fpt.edu.vn', CAST(0x0000A95F00000000 AS DateTime), N'US', 1)
INSERT [dbo].[tblStudent] ([userID], [universityID], [studentName], [age], [gender], [address], [email], [dateCreate], [roleID], [status]) VALUES (N'us3', N'ni2', N'Truong Ngoc Han', 18, 1, N'Vo Thi Sau, Quan 3, TP. Ho Chi Minh', N'hantnak887253@edu.vn', CAST(0x0000AD9D00000000 AS DateTime), N'US', 1)
INSERT [dbo].[tblStudent] ([userID], [universityID], [studentName], [age], [gender], [address], [email], [dateCreate], [roleID], [status]) VALUES (N'us4', N'ni3', N'Nguyen Thi My Nhung', 19, 1, N'Man Thien, Quan 9, TP. Ho Chi Minh', N'nhungntmbb123456@rmit.edu.vn', CAST(0x0000AB8200000000 AS DateTime), N'US', 1)
INSERT [dbo].[tblStudent] ([userID], [universityID], [studentName], [age], [gender], [address], [email], [dateCreate], [roleID], [status]) VALUES (N'us5', N'ni4', N'Le Tran Anh Tuan', 19, 0, N'Mai Chi Tho, Quan 2 TP. Ho Chi Minh', N'tuanltaaa123456@ueh.edu.vn', CAST(0x0000AC2700000000 AS DateTime), N'US', 1)
INSERT [dbo].[tblStudent] ([userID], [universityID], [studentName], [age], [gender], [address], [email], [dateCreate], [roleID], [status]) VALUES (N'us6', N'ni5', N'Phan Dang Hai', 21, 0, N'30, Huyen Tran Cong Chua, Quan 1, TP. Ho Chi Minh', N'haipdcc123456@iuh.edu.vn', CAST(0x0000A8AB00000000 AS DateTime), N'US', 1)
INSERT [dbo].[tblStudent] ([userID], [universityID], [studentName], [age], [gender], [address], [email], [dateCreate], [roleID], [status]) VALUES (N'us7', N'ni5', N'Mai Thi Hoa', 19, 1, N'Sky 9, Quan 9, TP. Ho Chi Minh', N'hoamtdd123456@iuh.edu.vn', CAST(0x0000AB9500000000 AS DateTime), N'US', 1)
/****** Object:  Table [dbo].[tblProduct]    Script Date: 09/19/2021 00:25:09 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr1', N'ca1', N'quyen vo', N'200 trang, day', 9000, 22, 1, CAST(0x0000ACD500000000 AS DateTime), N'sdasd')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr10', N'ca4', N'ao mua', N'troi mua moi dung', 25000, 12, 1, CAST(0x0000ACC400000000 AS DateTime), N'iuytr')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr11', N'ca3', N'coffe', N'mua xong tu lam', 19000, 23, 1, CAST(0x0000ACB600000000 AS DateTime), N'iuytrew')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr12', N'ca3', N'tra sua', N'mua xong tu lam', 27000, 0, 0, CAST(0x0000AD1E00000000 AS DateTime), N'oiuytre')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr13', N'ca4', N'khan giay', N'goi 8 to', 3000, 27, 1, CAST(0x0000AD1E00000000 AS DateTime), N'drgtyuy')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr2', N'ca2', N'my ly hao hao', N're, nhung de noi mun', 10000, 20, 1, CAST(0x0000ACE200000000 AS DateTime), N'sadsd')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr3', N'ca3', N'nuoc khoang lavie', N'tot cho suc khoe', 5000, 39, 1, CAST(0x0000AD3800000000 AS DateTime), N'sdfgsadfg')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr4', N'ca4', N'khau trang ', N'an toan mua dich', 2000, 127, 1, CAST(0x0000AD2E00000000 AS DateTime), N'sdfg')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr5', N'ca2', N'ca nam ca ngu', N'ngon, tien loi', 25000, 50, 1, CAST(0x0000AD1D00000000 AS DateTime), N'dfgfds')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr6', N'ca2', N'xuc xich', N'ngon', 8000, 30, 1, CAST(0x0000AD1E00000000 AS DateTime), N'dasd')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr7', N'ca2', N'banh bao xa xiu', N'vua re vua ngon', 17000, 0, 0, CAST(0x0000AD1E00000000 AS DateTime), N'sdfdc')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr8', N'ca3', N'Sting', N'ngon lam', 9000, 22, 1, CAST(0x0000AD0C00000000 AS DateTime), N'edfg')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [description], [price], [quantity], [statusID], [createDate], [image]) VALUES (N'pr9', N'ca1', N'but bi thien long', N're, viet chu cung dep', 3000, 34, 1, CAST(0x0000ACBA00000000 AS DateTime), N'iuytre')
/****** Object:  StoredProcedure [dbo].[sp_Works_In]    Script Date: 09/19/2021 00:25:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_Works_In] (@ssn char(10),
								
								@dno integer)
As
Begin
 Update Works_In Set dno = @dno
 where  ssn = @ssn
print 'Update successfully'
end

Exec sp_UpdateDependents N'SE10003','104'
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 09/19/2021 00:25:09 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalMoney], [orderDate]) VALUES (N'dsasda', N'us1', 15000, CAST(0x0000ACD500000000 AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalMoney], [orderDate]) VALUES (N'O1', N'us2', 35000, CAST(0x0000AD3B00000000 AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalMoney], [orderDate]) VALUES (N'O2', N'us3', 45000, CAST(0x0000AD3B00000000 AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalMoney], [orderDate]) VALUES (N'O3', N'us4', 17000, CAST(0x0000AD3B00000000 AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [totalMoney], [orderDate]) VALUES (N'O4', N'us1', 3000, CAST(0x0000AD3B00000000 AS DateTime))
/****** Object:  Table [dbo].[tblWallet]    Script Date: 09/19/2021 00:25:09 ******/
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
 CONSTRAINT [PK_tblWallet] PRIMARY KEY CLUSTERED 
(
	[walletID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus]) VALUES (N'wa1', N'us2', N'name1', 500000, 2000, 1)
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus]) VALUES (N'wa2', N'us1', N'name1', 200000, 50, 1)
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus]) VALUES (N'wa3', N'us5', N'name2', 25000, 1800, 1)
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus]) VALUES (N'wa4', N'us6', N'name3', 70000, 0, 0)
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus]) VALUES (N'wa5', N'us3', N'name2', 30000, 2000, 1)
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus]) VALUES (N'wa6', N'us4', N'name1', 0, 1850, 1)
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus]) VALUES (N'wa7', N'us4', N'name2', 45000, 120, 1)
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus]) VALUES (N'wa8', N'us7', N'name2', 110000, 20, 1)
INSERT [dbo].[tblWallet] ([walletID], [userID], [walletName], [balance], [walletPoint], [walletStatus]) VALUES (N'wa9', N'us2', N'name2', 25000, 70, 1)
/****** Object:  Table [dbo].[tblTransaction]    Script Date: 09/19/2021 00:25:09 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblTransaction] ([transactionID], [walletID], [orderID], [totalMoney], [orderDate], [transactionPoint]) VALUES (N'tran1', N'wa2', N'dsasda', 15000, CAST(0x0000ACD500000000 AS DateTime), 15)
INSERT [dbo].[tblTransaction] ([transactionID], [walletID], [orderID], [totalMoney], [orderDate], [transactionPoint]) VALUES (N'tran2', N'wa1', N'O1', 35000, CAST(0x0000ACD500000000 AS DateTime), 35)
INSERT [dbo].[tblTransaction] ([transactionID], [walletID], [orderID], [totalMoney], [orderDate], [transactionPoint]) VALUES (N'tran3', N'wa5', N'O2', 45000, CAST(0x0000ACD500000000 AS DateTime), 45)
INSERT [dbo].[tblTransaction] ([transactionID], [walletID], [orderID], [totalMoney], [orderDate], [transactionPoint]) VALUES (N'tran4', N'wa7', N'O3', 17000, CAST(0x0000ACD500000000 AS DateTime), 17)
INSERT [dbo].[tblTransaction] ([transactionID], [walletID], [orderID], [totalMoney], [orderDate], [transactionPoint]) VALUES (N'tran5', N'wa2', N'O4', 3000, CAST(0x0000ACD500000000 AS DateTime), 3)
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 09/19/2021 00:25:09 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or1', N'dsasda', N'pr2', 1, 10000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or2', N'dsasda', N'pr3', 1, 5000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or3', N'O1', N'pr10', 1, 25000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or4', N'O1', N'pr2', 1, 10000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or5', N'O2', N'pr6', 1, 8000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or6', N'O2', N'pr8', 1, 7000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or7', N'O2', N'pr9', 10, 3000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or8', N'O3', N'pr7', 1, 17000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'or9', N'O4', N'pr13', 1, 3000)
/****** Object:  ForeignKey [FK_tblStudent_tblUniversity]    Script Date: 09/19/2021 00:25:09 ******/
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_tblUniversity] FOREIGN KEY([universityID])
REFERENCES [dbo].[tblUniversity] ([universityID])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_tblUniversity]
GO
/****** Object:  ForeignKey [FK_tblProduct_tblCategory1]    Script Date: 09/19/2021 00:25:09 ******/
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory1] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory1]
GO
/****** Object:  ForeignKey [FK_tblOrder_tblStudent]    Script Date: 09/19/2021 00:25:09 ******/
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblStudent] FOREIGN KEY([userID])
REFERENCES [dbo].[tblStudent] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblStudent]
GO
/****** Object:  ForeignKey [FK_tblWallet_tblStudent]    Script Date: 09/19/2021 00:25:09 ******/
ALTER TABLE [dbo].[tblWallet]  WITH CHECK ADD  CONSTRAINT [FK_tblWallet_tblStudent] FOREIGN KEY([userID])
REFERENCES [dbo].[tblStudent] ([userID])
GO
ALTER TABLE [dbo].[tblWallet] CHECK CONSTRAINT [FK_tblWallet_tblStudent]
GO
/****** Object:  ForeignKey [FK_tblTransaction_tblOrder]    Script Date: 09/19/2021 00:25:09 ******/
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tblTransaction_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [FK_tblTransaction_tblOrder]
GO
/****** Object:  ForeignKey [FK_tblTransaction_tblWallet]    Script Date: 09/19/2021 00:25:09 ******/
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tblTransaction_tblWallet] FOREIGN KEY([walletID])
REFERENCES [dbo].[tblWallet] ([walletID])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [FK_tblTransaction_tblWallet]
GO
/****** Object:  ForeignKey [FK_tblOrderDetail_tblOrder]    Script Date: 09/19/2021 00:25:09 ******/
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
/****** Object:  ForeignKey [FK_tblOrderDetail_tblProduct1]    Script Date: 09/19/2021 00:25:09 ******/
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct1] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct1]
GO
