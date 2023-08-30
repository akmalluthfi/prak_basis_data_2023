-- membubuat user/role
create user akmalluthfi;

-- membuat database
create database akmalluthfil;

-- membuat tabel identitas
create table identitas 
(
  nik varchar(16),
  nama varchar(255),
  alamat text,
  tgl_lahir timestamp
)

-- menambahkan data ditabel identitas
insert into identitas(nik, nama, alamat, tgl_lahir)
values("1234567898765432", "Akmal Luthfi", "Surabaya", "19-12-2004")

-- membuat tabel saudara
create table saudara 
(
  nama varchar(255),
  umur varchar(2),
  status varchar(10), 
  pekerjaan varchar(50)
)

-- menambahkan data di tabel saudara
insert into saudara(nama, umur, status, pekerjaan)
values("Fahimatus", "26", "kakak", "ibu rumah tangga")

-- membuat tabel orang tua 
create table orang_tua 
(
  nama varchar(255),
  status varchar(10), 
  pekerjaan varchar(50)
)

-- menambahkan data di tabel orang tua
insert into orang_tua(nama, status, pekerjaan)
values
  ("Perempuan", "Ibu", "ibu rumah tangga"),
  ("Laki", "Bapak", "wirausaha");