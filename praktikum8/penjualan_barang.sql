-- create database
create database penjualan_barang;

-- gunakan database
use penjualan_barang;

-- create table pelanggan
create table pelanggan
(
  id_pelanggan int not null auto_increment,
  nama varchar(100) not null, 
  alamat varchar(255) not null,
  pekerjaan varchar(100) not null,
  no_ktp varchar(100) not null,
  no_telp varchar(100) not null,
  primary key (id_pelanggan)
);

-- create table pelanggan
create table nota_penjualan
(
  id_nota int not null auto_increment,
  tgl_nota date not null,
  total int not null,
  id_pelanggan int not null,
  primary key (id_nota),
  constraint fk_nota_pelanggan 
    foreign key (id_pelanggan) references pelanggan (id_pelanggan)
);

-- create table barang
create table barang
(
  id_barang int not null auto_increment,
  nama_barang varchar(100) not null,
  harga int not null,
  stok int not null,
  primary key (id_barang)
);

-- create table detail_jual
create table detail_jual
(
  id_nota int not null,
  id_barang int not null,
  jumlah int not null,
  harga int not null,
  constraint fk_detail_nota 
    foreign key (id_nota) references nota_penjualan (id_nota),
  constraint fk_detail_barang
    foreign key (id_barang) references barang (id_barang)
);
