-- membuat database
create database perpustakaan;

-- ############

-- membuat table
create table Buku 
(
  Kode_Buku varchar(8),
  Judul_Buku varchar(20)
);

-- menambahkan 5 data sekaligus
insert into Buku(Kode_Buku, Judul_Buku)
  values 
    ('12345678', 'Spongebob'), 
    ('23456781', 'Clean Code'),
    ('34567812', 'Design Patterns'),
    ('45678123', 'App Architecture'), 
    ('56781234', 'Software Design');

-- Menghapus 1 data
delete from Buku where Kode_Buku='34567812';

-- Menghapus banyak data sekaligus
delete from Buku where Kode_Buku in ('23456781', '34567812');

-- Menampilkan data
select * from Buku;

-- ############

-- membuat tabel anggota
create table Anggota 
(
  No_Anggota varchar(7),
  Nama_Anggota varchar(20),
  Kelas varchar(8)
);

-- menambahkan 5 data sekaligus
insert into Anggota(No_Anggota, Nama_Anggota, Kelas)
  values 
    ('1234567', 'Paul', 'SDT A'),
    ('1234567', 'Dominic', 'SDT A'),
    ('1234567', 'John', 'SDT A'),
    ('1234567', 'Cane', 'SDT A'),
    ('1234567', 'Wick', 'SDT A');

-- Menampilkan data
select * from Anggota;

-- ############

-- membuat tabel petugas
create table Petugas 
(
  Kode_Petugas varchar(3),
  Nama_Petugas varchar(20),
  Paraf_Petugas varchar(1)
);

-- menambahkan 5 data sekaligus
insert into Petugas(Kode_Petugas, Nama_Petugas, Paraf_Petugas)
  values 
    ('123', 'Tony', 'Y'),
    ('231', 'Strange', 'Y'),
    ('321', 'Steve', 'T'),
    ('456', 'Nick', 'Y'),
    ('564', 'Wilson', 'T');

-- Menampilkan data
select * from Petugas;

-- ############

-- membuat tabel peminjaman
create table Peminjaman 
(
  Kode_Peminjaman varchar(4),
  Tgl_Pinjam date,
  Tgl_Kembali date,
  Ket varchar(15),
  No_Anggota varchar(7),
  Kode_Buku varchar(8),
  Kode_Petugas varchar(3)
);

-- menambahkan 5 data sekaligus
insert into Peminjaman(Kode_Peminjaman, Tgl_Pinjam, Tgl_Kembali, Ket, No_Anggota, Kode_Buku, Kode_Petugas)
  values 
    ('1234', '01-01-2023', '02-02-2023', 'Sudah', '1234567', '12345678', '123'),
    ('1234', '03-03-2023', '04-04-2023', 'Sudah', '1234567', '23456781', '231'),
    ('1234', '05-05-2023', '06-06-2023', 'Sudah', '2345671', '12345678', '231'),
    ('1234', '07-07-2023', '08-08-2023', 'Sudah', '3456712', '45678123', '321'),
    ('1234', '09-09-2023', '10-10-2023', 'Sudah', '3456712', '45678123', '123');

-- Menampilkan data
select * from Peminjaman;