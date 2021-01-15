CREATE DATABASE QLHTGT
GO
USE QLHTGT
GO
CREATE table HoaDon(
	ID int primary KEY IDENTITY,
	ThanhTien decimal,
	NgayThanhToan DATETIME,
	HinhThucThanhToan_id INT,
)
go

create table YeuCauDangKyXe(
	ID int primary KEY IDENTITY,
	SoKhung varchar(10) NOT NULL UNIQUE,
	SoMay varchar(10) NOT NULL UNIQUE,
	GiaTien DECIMAL,
	NgayHen DATETIME,
	TrangThai nvarchar(25),
	HDTruocBa INT,
	HDCapBien INT,
	NguoiDung_id INT,
	LoaiXe_id INT,
	MPTruocBa_id INT,
	MPCapBien_id INT,
	CanBo_id INT,
)
go

create table NguoiDung(
	ID int primary KEY IDENTITY,
	Ten nvarchar(50),
	CMND varchar(10) NOT NULL UNIQUE, 
	GioiTinh nvarchar(5),
	NgaySinh DATETIME,
	DiaChi nvarchar(100),
	[username] varchar(20)NOT NULL UNIQUE,
	[password] varchar(20)
)
go

create table Xe(
	ID int primary KEY IDENTITY,
	SoKhung varchar(10) NOT NULL UNIQUE,
	SoMay varchar(10) NOT NULL UNIQUE,
	GiaTien DECIMAL,
	LoaiXe_id INT,
	NguoiDung_id INT,
	BienSo varchar(50) NOT NULL UNIQUE
)
go

create table LoaiXe(
	ID int primary KEY IDENTITY,
	IsXeOto bit,
	NhanHieu varchar(10),
	MauXe varchar(20),
	Mau varchar(20),
	NamSX int
)
go

create table HinhThucThanhToan(
	ID int primary KEY IDENTITY,
	HTTT nvarchar(20)
)
go

create table MucPhiCapBien(
	ID int primary KEY IDENTITY,
	LoaiXe bit, -- true or false ( bool)
	KhuVuc int,
	GiaToiThieu decimal,
	GiaToiDa decimal,
	MucPhi decimal
)
go
create table MucPhiTruocBa(
	ID int primary KEY IDENTITY,
	LoaiXe bit,
	KhuVuc int,
	MucPhi decimal
)
go
---

create table BienBanViPham(
	ID int primary KEY IDENTITY,
	TongTien decimal,
	TongDiemTru int,
	ThoiGianViPham DATETIME,
	HDNopPhat INT,
	BangLai_id INT
)
go

create table CanBo(
	ID int primary KEY IDENTITY,
	Ten nvarchar(50),
	Bac int,
	[username] varchar(20) NOT NULL UNIQUE,
	[password] varchar(20)
)
go

create table BangLai(
	ID int primary KEY IDENTITY,
	Hang varchar(10),
	NgayCap DATETIME,
	NoiCap nvarchar(100),
	SoBangLai varchar(20) NOT NULL UNIQUE,
	NguoiDung_id INT
)
go

create table LoiViPham(
	ID int primary KEY IDENTITY,
	LoiViPham nvarchar(MAX),
	MucPhat DECIMAL,
	DiemTru int
)
go

create table DanhSachViPham(
	LoiViPham_id INT,
	BienBanViPham_id INT,
	PRIMARY KEY (LoiViPham_id,BienBanViPham_id)
)
GO

ALTER TABLE dbo.DanhSachViPham ADD CONSTRAINT fk_loi_bienban FOREIGN KEY (LoiViPham_id) REFERENCES dbo.LoiViPham (ID)
ALTER TABLE dbo.DanhSachViPham ADD CONSTRAINT fk_bienban_loi FOREIGN KEY (BienBanViPham_id) REFERENCES dbo.BienBanViPham(ID)
ALTER TABLE dbo.BangLai ADD CONSTRAINT fk_banglai_nguoidung FOREIGN KEY (NguoiDung_id) REFERENCES dbo.NguoiDung(ID)
ALTER TABLE dbo.BienBanViPham ADD CONSTRAINT fk_bienban_hd FOREIGN KEY (HDNopPhat) REFERENCES dbo.HoaDon (ID)
ALTER TABLE dbo.Xe ADD CONSTRAINT fk_xe_loai FOREIGN KEY (LoaiXe_id) REFERENCES dbo.LoaiXe (ID)
ALTER TABLE dbo.Xe ADD CONSTRAINT fk_nguoidung_xe FOREIGN KEY (NguoiDung_id) REFERENCES dbo.NguoiDung (ID)
ALTER TABLE dbo.YeuCauDangKyXe ADD CONSTRAINT fk_hdtb FOREIGN KEY (HDTruocBa) REFERENCES dbo.HoaDon (ID)
ALTER TABLE dbo.YeuCauDangKyXe ADD CONSTRAINT fk_hdcb FOREIGN KEY (HDCapBien) REFERENCES dbo.HoaDon (ID)
ALTER TABLE dbo.YeuCauDangKyXe ADD CONSTRAINT fk_nguoidung_yc FOREIGN KEY (NguoiDung_id) REFERENCES dbo.NguoiDung (ID)
ALTER TABLE dbo.YeuCauDangKyXe ADD CONSTRAINT fk_loaixe_yc FOREIGN KEY (LoaiXe_id) REFERENCES dbo.LoaiXe (ID)
ALTER TABLE dbo.YeuCauDangKyXe ADD CONSTRAINT fk_mptb FOREIGN KEY (MPTruocBa_id) REFERENCES dbo.MucPhiTruocBa (ID)
ALTER TABLE dbo.YeuCauDangKyXe ADD CONSTRAINT fk_mpcb FOREIGN KEY (MPCapBien_id) REFERENCES dbo.MucPhiCapBien (ID)
ALTER TABLE dbo.YeuCauDangKyXe ADD CONSTRAINT fk_canbo FOREIGN KEY (CanBo_id) REFERENCES dbo.CanBo (ID)
ALTER TABLE dbo.HoaDon ADD CONSTRAINT fk_hoadon_ht FOREIGN KEY (HinhThucThanhToan_id) REFERENCES dbo.HinhThucThanhToan (ID)
ALTER TABLE dbo.BienBanViPham ADD CONSTRAINT fk_Bl_bb FOREIGN KEY (BangLai_id) REFERENCES dbo.BangLai (ID)

-----------------Data
INSERT INTO [dbo].[NguoiDung] ([Ten], [CMND], [GioiTinh], [NgaySinh], [DiaChi], [username], [password]) VALUES (N'test1', N'231144149', N'Nữ', N'2021-01-08 08:58:31', N'Tp.HCM', N'test1', N'123')
INSERT INTO [dbo].[NguoiDung] ([Ten], [CMND], [GioiTinh], [NgaySinh], [DiaChi], [username], [password]) VALUES (N'test2', N'231144159', N'Nam', N'2021-01-08 08:58:31', N'Tp.HCM', N'test2', N'123')
INSERT INTO [dbo].[BangLai] ([Hang], [NgayCap], [NoiCap], [SoBangLai], [NguoiDung_id]) VALUES (N'A3', N'2020-01-08 08:58:31', N'TP.hCM', N'21312377', 2)
INSERT INTO [dbo].[BangLai] ([Hang], [NgayCap], [NoiCap], [SoBangLai], [NguoiDung_id]) VALUES (N'B2', N'2020-03-08 08:58:31', N'TP.hCM', N'21312326', 2)
INSERT INTO dbo.CanBo
        ( Ten, Bac, username, password )
VALUES  ( N'CanBo1', -- Ten - nvarchar(50)
          1, -- Bac - int
          'canbo1', -- username - varchar(20)
          '123'  -- password - varchar(20)
          )INSERT INTO dbo.CanBo
        ( Ten, Bac, username, password )
VALUES  ( N'CanBo2', -- Ten - nvarchar(50)
          2, -- Bac - int
          'canbo2', -- username - varchar(20)
          '123'  -- password - varchar(20)
          )
INSERT INTO dbo.LoaiXe
VALUES  (	0, -- khong phai xe oto - bit
		  'HONDA', -- NhanHieu - varchar(10)
		  'FUTURE', -- MauXe - varchar(20)
		  'WHITE', --Mau - varchar(20)
          2000  -- NamSX - int
          )
INSERT INTO dbo.LoaiXe
VALUES  (	0, -- khong phai xe oto - bit
		  'YAMAHA', -- NhanHieu - varchar(10)
          'EXCITER', -- MauXe - varchar(20)
		  'BLACK', --Mau - varchar(20)
          2020  -- NamSX - int
          )
INSERT INTO dbo.LoaiXe
VALUES  (	1, -- la xe oto - bit
		  'TOYOTA', -- NhanHieu - varchar(10)
          'WIGO', -- MauXe - varchar(20)
		  'GRAY', --Mau - varchar(20)
          2020  -- NamSX - int
          )
INSERT INTO dbo.Xe
        ( SoKhung ,
          SoMay ,
          GiaTien ,
          LoaiXe_id ,
          NguoiDung_id,
		  BienSo
        )
VALUES  ( '123123' , -- SoKhung - varchar(10)
          '221ADW' , -- SoMay - varchar(10)
          40000000 , -- GiaTien - decimal
           1, -- LoaiXe_id - int
			1, -- NguoiDung_id - int
		  '81B1-32135'
        )
INSERT INTO dbo.Xe
        ( SoKhung ,
          SoMay ,
          GiaTien ,
          LoaiXe_id ,
          NguoiDung_id,
		  BienSo
        )
VALUES  ( '222123' , -- SoKhung - varchar(10)
          '321ADW' , -- SoMay - varchar(10)
          50000000 , -- GiaTien - decimal
           2, -- LoaiXe_id - int
			2, -- NguoiDung_id - int
		  '59B1-48123'
        )
INSERT INTO dbo.Xe
        ( SoKhung ,
          SoMay ,
          GiaTien ,
          LoaiXe_id ,
          NguoiDung_id,
		  BienSo
        )
VALUES  ( '314125' , -- SoKhung - varchar(10)
          '951SDW' , -- SoMay - varchar(10)
          2000000000 , -- GiaTien - decimal
           3, -- LoaiXe_id - int
			1, -- NguoiDung_id - int
		  '30E-921.15'
        )

--INSERT INTO dbo.LoiViPham
--        ( LoiViPham, MucPhat, DiemTru )
--VALUES  ( N'Vượt đèn đỏ', -- LoiViPham - nvarchar(max)
--          1000000, -- MucPhat - decimal
--          20  -- DiemTru - int
--          )
--INSERT INTO dbo.LoiViPham
--        ( LoiViPham, MucPhat, DiemTru )
--VALUES  ( N'Không đội mũ bảo hiểm', -- LoiViPham - nvarchar(max)
--          1000000, -- MucPhat - decimal
--          20  -- DiemTru - int
--          )
--INSERT INTO dbo.LoiViPham
--        ( LoiViPham, MucPhat, DiemTru )
--VALUES  ( N'Không có gương chiếu hậu', -- LoiViPham - nvarchar(max)
--          1000000, -- MucPhat - decimal
--          20  -- DiemTru - int
--          )
--INSERT INTO dbo.HinhThucThanhToan
--        ( HTTT )
--VALUES  ( N'Thẻ tính dụng'  -- HTTT - nvarchar(20)
--          )
--INSERT INTO dbo.HoaDon
--        ( ThanhTien ,
--          NgayThanhToan ,
--          HinhThucThanhToan_id
--        )
--VALUES  ( 10000000 , -- ThanhTien - decimal
--          GETDATE() , -- NgayThanhToan - datetime
--          1  -- HinhThucThanhToan_id - int
--        )
--INSERT INTO dbo.BienBanViPham
--        ( TongTien ,
--          TongDiemTru ,
--          ThoiGianViPham ,
--          HDNopPhat ,
--          BangLai_id
--        )
--VALUES  ( 10000000 , -- TongTien - decimal
--          50 , -- TongDiemTru - int
--          GETDATE() , -- ThoiGianViPham - datetime
--          1 , -- HDNopPhat - int
--          2  -- BangLai_id - int
--        )
--INSERT dbo.DanhSachViPham
--        ( LoiViPham_id, BienBanViPham_id )
--VALUES  ( 1, -- LoiViPham_id - int
--          1  -- BienBanViPham_id - int
--          )
--INSERT dbo.DanhSachViPham
--        ( LoiViPham_id, BienBanViPham_id )
--VALUES  ( 2, -- LoiViPham_id - int
--          1  -- BienBanViPham_id - int
--          )
--INSERT dbo.DanhSachViPham
--        ( LoiViPham_id, BienBanViPham_id )
--VALUES  ( 3, -- LoiViPham_id - int
--          1  -- BienBanViPham_id - int
--          )
--INSERT INTO dbo.HoaDon
--        ( ThanhTien ,
--          NgayThanhToan ,
--          HinhThucThanhToan_id
--        )
--VALUES  ( 10000000 , -- ThanhTien - decimal
--          GETDATE() , -- NgayThanhToan - datetime
--          1  -- HinhThucThanhToan_id - int
--        )

insert into LoiViPham values(N'Vượt đèn đỏ, đèn vàng',600000,-2);
insert into LoiViPham values(N'Người đang điều khiển xe máy sử dụng điện thoại di động, thiết bị âm thanh',1000000,-2);
insert into LoiViPham values(N'Chuyển làn không có tín hiệu báo trước',400000,-1);
insert into LoiViPham values(N'Dùng tay sử dụng điện thoại di động khi đang điều khiển xe ô tô chạy trên đường',1000000,-2);
insert into LoiViPham values(N'Đi không đúng phần đường hoặc làn đường quy định',4000000,-3);
insert into LoiViPham values(N'Đi không đúng theo chỉ dẫn của vạch kẻ đường',200000,-1);
insert into LoiViPham values(N'Đi ngược chiều của đường một chiều, đi ngược chiều trên đường có biển “Cấm đi ngược chiều”',5000000,-3);
insert into LoiViPham values(N'Đi vào đường có biển báo cấm phương tiện đang điều khiển',500000,-1);
insert into LoiViPham values(N'Điều khiển xe ô tô không có gương chiếu hậu',300000,-1);
insert into LoiViPham values(N'Không đội mũ bảo hiểm hoặc đội nhưng không cài quai đúng quy cách',200000,-1);
insert into LoiViPham values(N'Không có  giấy phép lái xe',800000,-2);

INSERT INTO dbo.HinhThucThanhToan
        ( HTTT )
VALUES  ( N'Thẻ tính dụng'  -- HTTT - nvarchar(20)
          );
INSERT INTO dbo.HoaDon
        ( ThanhTien ,
          NgayThanhToan ,
          HinhThucThanhToan_id
        )
VALUES  ( 800000 , -- ThanhTien - decimal
          GETDATE() , -- NgayThanhToan - datetime
          1  -- HinhThucThanhToan_id - int
        )

insert into BienBanViPham values(800000,-2,'2020-01-01 00:00:00.000',1,1);
insert into BienBanViPham values(1000000,-2,'2020-02-01 00:00:00.000',null,1);
insert into BienBanViPham values(1000000,-3,'2020-01-03 00:00:00.000',null,2);

insert into DanhSachViPham values(8,1);
insert into DanhSachViPham values(9,1);
insert into DanhSachViPham values(2,2);
insert into DanhSachViPham values(10,3);
insert into DanhSachViPham values(11,3);

insert into MucPhiTruocBa values (0,1,5);
insert into MucPhiTruocBa values (0,2,5);
insert into MucPhiTruocBa values (0,3,2);
insert into MucPhiTruocBa values (1,1,12);
insert into MucPhiTruocBa values (1,2,12);
insert into MucPhiTruocBa values (1,3,10);

insert into MucPhiCapBien values (0,1,0,15000000,500000);
insert into MucPhiCapBien values (0,2,0,15000000,200000);
insert into MucPhiCapBien values (0,3,0,15000000,50000);
insert into MucPhiCapBien values (0,1,15000000,40000000,1000000);
insert into MucPhiCapBien values (0,2,15000000,40000000,400000);
insert into MucPhiCapBien values (0,3,15000000,40000000,50000);
insert into MucPhiCapBien values (0,1,40000000,999999999999999999,2000000);
insert into MucPhiCapBien values (0,2,40000000,999999999999999999,800000);
insert into MucPhiCapBien values (0,3,40000000,999999999999999999,50000);
insert into MucPhiCapBien values (1,1,0,999999999999999999,20000000);
insert into MucPhiCapBien values (1,2,0,999999999999999999,1000000);
insert into MucPhiCapBien values (1,3,0,999999999999999999,100000);