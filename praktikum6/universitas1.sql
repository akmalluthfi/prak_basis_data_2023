-- create database
create database universitas1;

-- create tabel mahasiswa
create table mahasiswa(
  nim varchar(3) not null, 
  nama varchar(255) not null,
  jenis_kelamin varchar(1) not null,
  alamat varchar(100) not null,
  primary key (nim)
);

-- insert data mahasiswa
insert into mahasiswa
  values
    ('101', 'Arif', 'L', 'Jl.Kenangan'),
    ('102', 'Budi', 'L', 'Jl.Jombang'),
    ('103', 'Wati', 'P', 'Jl.Surabaya'),
    ('104', 'Ika', 'P', 'Jl.Jombang'),
    ('105', 'Tono', 'L', 'Jl.Jakarta'),
    ('106', 'Iwan', 'L', 'Jl.Bandung'),
    ('107', 'Sari', 'P', 'Jl.Malang');

-- show data mahasiswa
select * from mahasiswa;

-- create tabel matakuliah
create table matakuliah(
  kode_mk varchar(6) not null, 
  nama_mk varchar(100) not null,
  sks integer not null,
  semester integer not null,
  primary key (kode_mk)
);

-- insert data matakuliah
insert into matakuliah
  values
    ('PTI447', 'Praktikum Basis Data', 1, 3),
    ('TIK342', 'Praktikum Basis Data', 1, 3),
    ('PTI333', 'Basis Data Terdistribusi', 3, 5),
    ('TIK123', 'Jaringan Komputer', 2, 5),
    ('TIK333', 'Sistem Komputer', 3, 5),
    ('PTI123', 'Grafika Multimedia', 3, 5),
    ('PTI777', 'Sistem Informasi', 2, 3);

-- show data matakuliah
select * from matakuliah;

-- create tabel ambil matakuliah
create table ambil_mk(
  nim varchar(3) not null, 
  kode_mk varchar(6) not null
);

-- insert data ambil_mk
insert into ambil_mk
  values
    ('101', 'PTI447'),
    ('103', 'TIK333'),
    ('104', 'PTI333'),
    ('104', 'PTI777'),
    ('111', 'PTI123'),
    ('123', 'PTI999');

-- show data ambil_mk
select * from ambil_mk;

-- kode dibawah keamanan terlalu ketat
-- create table ambil_mk(
--   nim varchar(3) not null, 
--   kode_mk varchar(6) not null,
--   constraint fk_ambil_mk_mahasiswa foreign key (nim) references mahasiswa (nim),
--   constraint fk_ambil_mk_matakuliah foreign key (kode_mk) references matakuliah (kode_mk)
-- );

-- dapatkan banyak mahasiswa yang menambil matakuliah
-- eksplisit
select count(distinct mahasiswa.nim) as "mahasiswa yang mengambil matkul"
from mahasiswa
  join ambil_mk on mahasiswa.nim = ambil_mk.nim;
-- implisit
select count(distinct mahasiswa.nim) as "mahasiswa yang mengambil matkul"
from mahasiswa, ambil_mk
  where mahasiswa.nim = ambil_mk.nim;

-- kelompokkan data mahasiswa yang tidak mengambil matkul berdasarkan jenis kelamin
select mahasiswa.jenis_kelamin, count(mahasiswa.jenis_kelamin) as jumlah
from mahasiswa
  left join ambil_mk on mahasiswa.nim = ambil_mk.nim
  where ambil_mk.nim is null
  group by mahasiswa.jenis_kelamin;

-- dapatkan nim, nama mahasiswa yang mengambil mata kuliah beserta kode_mk dan nama_mk
-- eksplisit
select mahasiswa.nim, mahasiswa.nama, matakuliah.kode_mk, matakuliah.nama_mk
from mahasiswa
  join ambil_mk on mahasiswa.nim = ambil_mk.nim
  join matakuliah on ambil_mk.kode_mk = matakuliah.kode_mk;
-- implisit
select mahasiswa.nim, mahasiswa.nama, matakuliah.kode_mk, matakuliah.nama_mk
from mahasiswa, ambil_mk, matakuliah
  where 
    mahasiswa.nim = ambil_mk.nim and
    ambil_mk.kode_mk = matakuliah.kode_mk;

-- dapatkan nim, nama, dan total sks lebih dari 4 dan kurang dari 10
select mahasiswa.nim, mahasiswa.nama, sum(matakuliah.sks) as jumlah_sks
from mahasiswa
  join ambil_mk on mahasiswa.nim = ambil_mk.nim
  join matakuliah on ambil_mk.kode_mk = matakuliah.kode_mk
  group by mahasiswa.nim
  having sum(matakuliah.sks) between 4 and 10;

-- datfar matakuliah yang tidak diambil oleh mahasiswa
select matakuliah.*
from mahasiswa
  join ambil_mk on mahasiswa.nim = ambil_mk.nim
  right join matakuliah on ambil_mk.kode_mk = matakuliah.kode_mk
  where mahasiswa.nim is null;