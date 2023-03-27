create database hoa_don_vat_lieu;
create table phieu_xuat (
	so_phieu_xuat int primary key auto_increment,
    ngay_xuat date
);
insert into phieu_xuat (ngay_xuat) values ('2023-03-24'), (curdate());
select * from phieu_xuat;
create table vat_tu (
	ma_vat_tu int primary key auto_increment,
    ten_vat_tu varchar(45)
);
insert into vat_tu (ten_vat_tu) values ('xi măng'), ('thép');
select * from vat_tu;
create table phieu_nhap (
	so_phieu_nhap int primary key auto_increment,
    ngay_nhap date
);
insert into phieu_nhap (ngay_nhap) values (current_date());
select * from phieu_nhap;
create table don_dat_hang (
	so_don_hang int primary key auto_increment,
    ngay_don_hang date
);
alter table don_dat_hang add ma_nha_cung_cap int;
alter table don_dat_hang add foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap);
insert into don_dat_hang (ngay_don_hang) values (current_date());
select * from don_dat_hang;
create table nha_cung_cap (
	ma_nha_cung_cap int primary key auto_increment,
    ten_nha_cung_cap varchar(45),
    dia_chi varchar(50)
);

create table so_dien_thoai (
	ma_so_dien_thoai int primary key auto_increment,
	so_dien_thoai varchar(12),
    ma_nha_cung_cap int,
    foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
create table chi_tiet_phieu_xuat (
	so_phieu_xuat int,
    ma_vat_tu int,
	don_gia_xuat int,
    so_luong_xuat int,
    primary key (so_phieu_xuat, ma_vat_tu),
    foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
    foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_phieu_nhap (
	ma_vat_tu int,
    so_phieu_nhap int,
	don_gia_nhap int,
    so_luong_nhap int,
    primary key (ma_vat_tu, so_phieu_nhap),
    foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
    foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_dat_hang (
	ma_vat_tu int,
    so_don_hang int,
    primary key (ma_vat_tu, so_don_hang),
    foreign key(so_don_hang) references don_dat_hang(so_don_hang),
    foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);