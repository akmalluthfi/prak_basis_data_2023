-- membuat database
create database perpustakaan;

-- membuat table
create table buku 
(
  kode varchar(8),
  judul varchar(20)
);

-- menambahkan satu data
insert into buku(kode, judul) 
values('12345678', 'Clean Code');

-- menampilkan seluruh data
select * from buku;

-- menambahkan lebih dari satu data
insert into buku(kode, judul)
values('23456781', 'Spongebob'), ('34567812', 'Basic Python');

-- menambahkan data tanpa kolom selektor
insert into buku 
values('45678123', 'Malin Kundang');

-- menambahkan data dengan kolom selektor yang dibalik balik
insert into buku (judul, kode)
values('Titanic', '56781234');
