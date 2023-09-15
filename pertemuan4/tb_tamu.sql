-- membuat database
create database percobaan;

-- membuat tabel tb_tamu
create table tb_tamu
(
  no serial primary key,
  nama varchar(255),
  alamat varchar(255),
  email varchar(255),
  no_telp varchar(255),
  primary key(no)
);

-- insert data
insert into tb_tamu (nama, alamat, email, no_telp)
  values 
    ('irfan nurhudin', 'ujung berung', 'bo_i77e@yahoo.com', '085613548789'),
    ('Boi trimoyo', 'cibiru', 'bo_i77e@yahoo.com', '082246864846'),
    ('Muswanto', 'kopo', 'muswanto@yahoo.com', '0229166478'),
    ('aji fauziyaman', 'ujung berung', 'ajiyahoo.com', '085222278892');

-- menampilkan isi tabel
select * from tb_tamu;

-- menampilkan isi tabel dengan kondisi
select * from tb_tamu where alamat = 'ujung berung';

-- membuat tabel barang
create table t_barang
(
  kode_brg varchar(255),
  nama_barang varchar(255),
  satuan varchar(255),
  banyak integer,
  harga_brg integer, 
  primary key(kode_brg)
);

insert into t_barang (kode_brg, nama_barang, satuan, banyak, harga_brg)
  values 
    ('AP001', 'MICROSOFT WORD 2003', 'BUAH', 20, 35000),
    ('AP002', 'MICROSOFT EXCEL 2003', 'BUAH', 15, 37500),
    ('AP003', 'MICROSOFT POWER POINT 2003', 'BUAH', 5, 40000),
    ('DB001', 'MYSQL SERVER', 'BUAH', 5, 45000),
    ('DB002', 'MICRODOFT SQL SERVER', 'BUAH', 10, 55000),
    ('DB003', 'ORACLE 9i', 'BUAH', 10, 65000);

-- menampilkan kondisi nilai antara
select * from t_barang where harga_brg between 37500 and 45000;

-- menampilkan data dengan perintah LIKE
select  * from t_barang where nama_barang like '%MICROSOFT%';

-- menampilkan data dengan pengurutan sorting (order by)
select * from t_barang order by nama_barang asc;
select * from t_barang order by nama_barang desc;

-- menampilkan data dengan pengelompokkan data (group by)
select sum(harga_brg), satuan from t_barang group by satuan;
select count(*), banyak from t_barang group by banyak;

-- menampilkan sesuai aggregate function
select count(*) from t_barang;
select sum(harga_brg) from t_barang;
select * from t_barang where left(nama_barang, 9) = 'MICROSOFT';
select * from t_barang where right(nama_barang, 6) = 'SERVER';

-- menampilkan data dengan nilai tertinggi
select max(harga_brg) from t_barang;

-- menampilkan data dengan nilai terendah
select min(harga_brg) from t_barang;
