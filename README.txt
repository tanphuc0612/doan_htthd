# doan_htthd

hướng dẫn run webclient, mở webclient folder bằng cmd:
bước 1: npm install
bước 2: npm start (build project)
bước 3: đăng nhập bằng username = user1 password = 123

script data sql
 --insert TaiKhoans
insert into TaiKhoans(Username,Password) values (N'user1','123')
insert into TaiKhoans(Username,Password) values (N'user2','123')
---insert table NguoiDangKyXe
insert into NguoiDangKyXes (Name,Address,RegistrationDate,Status,TaiKhoan_Id,IdentityCard) values (N'test1',N'TP Hồ Chí Minh','12/18/2020',1,1,231144676)
insert into NguoiDangKyXes (Name,Address,RegistrationDate,Status,TaiKhoan_Id,IdentityCard) values (N'test2',N'TP Hồ Chí Minh','12/18/2020',1,2,231144677)
---insert table Xe
insert into Xes (LoaiXe,BienSo,ChuSoHuuId,NguoiDangKyXe_Id) values(N'Honda-CRV','81-b1-438723',1,1)
insert into Xes (LoaiXe,BienSo,ChuSoHuuId,NguoiDangKyXe_Id) values(N'Tosson','81-b1-438723',1,1)
insert into Xes (LoaiXe,BienSo,ChuSoHuuId,NguoiDangKyXe_Id) values(N'Fortuner','81-b1-438723',1,1)
insert into Xes (LoaiXe,BienSo,ChuSoHuuId,NguoiDangKyXe_Id) values(N'BMW','81-b1-438723',2,2)
insert into Xes (LoaiXe,BienSo,ChuSoHuuId,NguoiDangKyXe_Id) values(N'Fiat','81-b1-438723',2,2)
---insert table ViPham
insert into ViPhams (NoiDung,TienPhat,NgayViPham,NguoiDangKyXe_Id) values(N'Vượt đèn đỏ',100000,'12/18/2020',1)
insert into ViPhams (NoiDung,TienPhat,NgayViPham,NguoiDangKyXe_Id) values(N'Quá tốc độ đa',100000,'12/18/2020',1)
insert into ViPhams (NoiDung,TienPhat,NgayViPham,NguoiDangKyXe_Id) values(N'Đi ngược chiều',100000,'12/18/2020',2)
insert into ViPhams (NoiDung,TienPhat,NgayViPham,NguoiDangKyXe_Id) values(N'Quá tốc độ tối thiểu',100000,'12/18/2020',2)
