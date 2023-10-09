-- create database universitas2
create database universitas2;

-- create tabel instruktur
create table instruktur(
  nip varchar(2) not null, 
  nama_ins varchar(100) not null, 
  jurusan varchar(100) not null, 
  asal_kota varchar(100) not null,
  primary key (nip)
);

-- insert data instruktur
insert into instruktur
  values
    ('1', 'Muhammad Akbar', 'Ilmu Sejarah', 'Malang'),
    ('2', 'Saichul Fitrian A.', 'Ilmu Komputer', 'Malang'),
    ('3', 'Annafia Oktafian', 'Ilmu Komputer', 'Klaten'),
    ('4', 'Budy Pratama', 'Ilmu Komputer', 'Magelang');

-- create tabel matakuliah
create table matakuliah(
  kd_mk varchar(6) not null, 
  nama_mk varchar(100) not null, 
  sks integer not null,
  primary key (kd_mk)
);

-- insert data matakuliah
insert into matakuliah
  values
    ('PTI101', 'Algoritma dan Pemrograman', 3),
    ('PTI102', 'Basis Data', 3),
    ('PTI103', 'Visual Basic', 3),
    ('IS101', 'Sejarah Indonesia', 3);

-- create tabel ambil_mk
create table ambil_mk(
  nip varchar(2) not null, 
  kd_mk varchar(6) not null, 
  ruangan varchar(5) not null, 
  jml_mhs integer not null
);

-- insert data ambil_mk
insert into ambil_mk
  values
    ('3', 'PTI101', 'H5211', 40),
    ('2', 'PTI102', 'H5212', 45),
    ('2', 'PTI103', 'H5206', 40),
    ('1', 'IS101', 'I7312', 30);

-- menampilkan kd_mk dan matakuliah yang jumlah mahasiswa = 40
select matakuliah.kd_mk, matakuliah.nama_mk
from matakuliah
  join ambil_mk on matakuliah.kd_mk = ambil_mk.kd_mk
  where ambil_mk.jml_mhs = 40;

-- menampilkan data instruktur yang mangajar basis data
select instruktur.*
from instruktur
  join ambil_mk on instruktur.nip = ambil_mk.nip
  join matakuliah on ambil_mk.kd_mk = matakuliah.kd_mk
  where matakuliah.nama_mk = 'Basis Data';

-- menampilkan data instruktur yang tidak mengajar
select instruktur.*
from instruktur
  left join ambil_mk on instruktur.nip = ambil_mk.nip
  where ambil_mk.nip is null;


-- create table customers
create table customers(
  id varchar(5) not null,
  name varchar(100) not null,
  address varchar(100) not null,
  primary key (id)
);

-- insert into customer
insert into customers
  values
    ('CS001', 'Aan', 'Pasuruan'),
    ('CS002', 'Hanif', 'Banyuwangi'),
    ('CS003', 'Mirza', 'Malang'),
    ('CS004', 'Tanti', 'Tegal'),
    ('CS005', 'Budie', 'Kediri');

-- create table orders
create table orders(
  id varchar(5) not null, 
  date date not null, 
  customer_id varchar(5) not null, 
  qty integer not null, 
  amount integer not null,
  primary key (id)
);

-- insert orders
insert into orders
  values
    ('CS001', '10-12-2016', 'CS001', 1, 40000),
    ('CS002', '11-01-2017', 'CS002', 2, 50000),
    ('CS003', '12-01-2017', 'CS005', 3, 35000);

-- JOIN
select *
from customers
join orders on customers.id = orders.customer_id;

-- UNION
select id
from customers
union
select id
from orders;

select id
from customers
union all
select id
from orders;