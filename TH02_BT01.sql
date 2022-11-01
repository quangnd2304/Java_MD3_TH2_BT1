Create database QuanLyBanHang;
use QuanLyBanHang;
Create table khachhang(
	makh nvarchar(4) primary key,
    tenkh nvarchar(30) not null,
    diachi nvarchar(50),
    ngaysinh datetime,
    sodt nvarchar(15)
);
Create table nhanvien(
	manv nvarchar(4) primary key,
    hoten nvarchar(30) not null,
    gioitinh bit not null,
    diachi nvarchar(50) not null,
    ngaysinh datetime not null,
    dienthoai nvarchar(15),
    email text,
    noisinh nvarchar(20) not null,
    ngayvaolam datetime,
    manql nvarchar(4)
);
Create table nhacungcap(
	mancc nvarchar(5) primary key,
    tenncc nvarchar(50) not null,
    diachi nvarchar(50) not null,
    dienthoai nvarchar(15) not null,
    email nvarchar(30) not null,
    website nvarchar(30)    
);
Create table loaisp(
	maloaisp nvarchar(4) primary key,
    tenloaisp nvarchar(30) not null,
    ghichu nvarchar(100) not null
);
create table sanpham(
	masp nvarchar(4) primary key,
    maloaisp nvarchar(4) not null,
    tensp nvarchar(50) not null,
    donvitinh nvarchar(10) not null,
    ghichu nvarchar(100),
    foreign key (maloaisp) references loaisp(maloaisp)
);
create table phieunhap(
	sopn nvarchar(5) primary key,
    manv nvarchar(4) not null,
    mancc nvarchar(5) not null,
    ngaynhap datetime not null default(now()),
    ghichu nvarchar(100),
    foreign key (manv) references nhanvien(manv),
    foreign key (mancc) references nhacungcap(mancc)
);
create table ctphieunhap(
	masp nvarchar(4),
    sopn nvarchar(5),
    soluong smallint not null default(0),
    gianhap real not null check(gianhap>=0),
    foreign key (masp) references sanpham(masp),
    foreign key (sopn) references phieunhap(sopn),
    primary key(masp,sopn)
);
create table phieuxuat(
	sopx nvarchar(5) primary key,
    manv nvarchar(4) not null,
    makh nvarchar(4) not null,
    ngayban datetime not null,
    ghichu text,
    foreign key (manv) references nhanvien(manv),
    foreign key (makh) references khachhang(makh)
);
create table ctphieuxuat(
	sopx nvarchar(5),
    masp nvarchar(4),
    soluong smallint check(soluong>0),
    giaban real check(giaban>0),
    foreign key (sopx) references phieuxuat(sopx),
    foreign key (masp) references sanpham(masp),
    primary key(sopx,masp)
);