-- prepare database perpustakaan

-- membuat database
create database perpustakaan;

-- membuat table
create table Buku 
(
  Kode_Buku varchar(8),
  Judul_Buku varchar(20),
  primary key (Kode_Buku)
);

-- menambahkan 5 data sekaligus
insert into Buku(Kode_Buku, Judul_Buku)
  values 
    ('12345678', 'Spongebob'), 
    ('23456781', 'Clean Code'),
    ('34567812', 'Design Patterns'),
    ('45678123', 'App Architecture'), 
    ('56781234', 'Software Design');

-- membuat tabel anggota
create table Anggota 
(
  No_Anggota varchar(7),
  Nama_Anggota varchar(20),
  Kelas varchar(8),
  primary key (No_Anggota)
);

-- menambahkan 5 data sekaligus
insert into Anggota(No_Anggota, Nama_Anggota, Kelas)
  values 
    ('1234567', 'Paul', 'SDT A'),
    ('2345671', 'Dominic', 'SDT A'),
    ('3456712', 'John', 'SDT A'),
    ('4567123', 'Cane', 'SDT A'),
    ('5671234', 'Wick', 'SDT A');

-- membuat tabel petugas
create table Petugas 
(
  Kode_Petugas varchar(3),
  Nama_Petugas varchar(20),
  Paraf_Petugas varchar(1),
  primary key (Kode_Petugas)
);

-- menambahkan 5 data sekaligus
insert into Petugas(Kode_Petugas, Nama_Petugas, Paraf_Petugas)
  values 
    ('123', 'Tony', 'Y'),
    ('231', 'Strange', 'Y'),
    ('321', 'Steve', 'T'),
    ('456', 'Nick', 'Y'),
    ('564', 'Wilson', 'T');

-- membuat tabel peminjaman
create table Peminjaman 
(
  Kode_Peminjaman varchar(4),
  Tgl_Pinjam date,
  Tgl_Kembali date,
  Ket varchar(15),
  No_Anggota varchar(7),
  Kode_Buku varchar(8),
  Kode_Petugas varchar(3),
  primary key (Kode_Peminjaman),
  constraint fk_peminjaman_anggota foreign key (No_Anggota) references Anggota (No_Anggota),
  constraint fk_peminjaman_buku foreign key (Kode_Buku) references Buku (Kode_Buku),
  constraint fk_peminjaman_petugas foreign key (Kode_Petugas) references Petugas (Kode_Petugas)
);

-- menambahkan 5 data sekaligus
insert into Peminjaman(Kode_Peminjaman, Tgl_Pinjam, Tgl_Kembali, Ket, No_Anggota, Kode_Buku, Kode_Petugas)
  values 
    ('1234', '01-01-2023', '02-02-2023', 'Sudah', '1234567', '12345678', '123'),
    ('2341', '03-03-2023', '04-04-2023', 'Sudah', '1234567', '23456781', '231'),
    ('3412', '05-05-2023', '06-06-2023', 'Sudah', '2345671', '12345678', '231'),
    ('4123', '07-07-2023', '08-08-2023', 'Sudah', '3456712', '45678123', '321'),
    ('5678', '09-09-2023', '10-10-2023', 'Sudah', '3456712', '45678123', '123');

-- menambah 2 data peminjaman
insert into Peminjaman(Kode_Peminjaman, Tgl_Pinjam, Tgl_Kembali, Ket, No_Anggota, Kode_Buku, Kode_Petugas)
  values 
    ('9988', '01-01-2023', '02-02-2023', 'Sudah', '1111111', '12345678', '123'),
    ('8899', '03-03-2023', '04-04-2023', 'Sudah', '2222222', '23456781', '231');

-- sql join table
select *
from Peminjaman
  join Buku on Buku.Kode_Buku = Peminjaman.Kode_Buku;

-- sql join table dengan select kolom1, kolom2
select Peminjaman.Kode_Peminjaman, Peminjaman.No_Anggota, Buku.Judul_Buku
from Peminjaman
  join Buku on Buku.Kode_Buku = Peminjaman.Kode_Buku;

-- sql join table menggunakan alias
select *
from Peminjaman as p
  join Buku as b on b.Kode_Buku = p.Kode_Buku;

-- sql join multiple table
select p.Kode_Peminjaman, a.Nama_Anggota, b.Judul_Buku
from Peminjaman as p
  join Buku as b on b.Kode_Buku = p.Kode_Buku
  join Anggota as a on a.No_Anggota = p.No_Anggota;

-- inner join
select *
from Anggota
  join Peminjaman on Anggota.No_Anggota = Peminjaman.No_Anggota;

-- left join
select *
from Anggota
  left join Peminjaman on Anggota.No_Anggota = Peminjaman.No_Anggota;

-- right join
select *
from Anggota
  right join Peminjaman on Anggota.No_Anggota = Peminjaman.No_Anggota;

-- full join
select *
from Anggota
  full join Peminjaman on Anggota.No_Anggota = Peminjaman.No_Anggota;
