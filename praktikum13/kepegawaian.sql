-- create database
create database kepegawaian;

-- create table
create table pegawai (
  nip char(15) NOT NULL PRIMARY KEY,
  nama char(100) NOT NULL,
  golongan char NOT NULL,
  kota_id int NOT NULL
);

create table kota (
  id int NOT NULL PRIMARY KEY,
  nama char(50) NOT NULL
);

create table pensiun
select
  *
from
  pegawai;

-- insert data
insert into
  pegawai
values
  ('19881511', 'Ujang', 'B', 1),
  ('19601512', 'Paimin', 'A', 2),
  ('19771513', 'Teh Ajeng', 'A', 3),
  ('19691514', 'Syamsul', 'B', 2),
  ('19791515', 'Oemar Bakrie', 'B', 3),
  ('19801516', 'Boedi', 'C', 1),
  ('19611517', 'Samirudin', 'A', 2),
  ('19561518', 'Babang', 'C', 3),
  ('19591519', 'Teh Yuli', 'B', 2),
  ('19891510', 'Samsoel', 'A', 1);

insert into
  pensiun
values
  ('19511521', 'Doel', 'A', 2),
  ('19601522', 'Boedi', 'B', 3);

insert into
  kota
values
  (1, 'Padang'),
  (2, 'Solok'),
  (3, 'Jakarta');

-- Dalam melakukan kondisi maupun join terhadap union terdapat 2 cara yaitu
-- cara pertama
with combined as (
  select
    *
  from
    pegawai
  union
  select
    *
  from
    pensiun
)
select
  *
from
  combined;

-- cara kedua
select
  *
from
  (
    select
      *
    from
      pegawai
    union
    select
      *
    from
      pensiun
  ) as combined;

-- Tampilkan seluruh data pegawai ( baik yang masih aktif ataupun pensiun) yang berada pada golongan A.*
select
  *
from
  (
    select
      *
    from
      pegawai
    union
    select
      *
    from
      pensiun
  ) as kepegawaian
where
  golongan = 'A';

-- Tampilkan seluruh data pegawai ( baik yang masih aktif ataupun pensiun) yang tidak berasal dari Padang dan Solok.*
select
  *
from
  (
    select
      *
    from
      pegawai
    union
    select
      *
    from
      pensiun
  ) as kepegawaian
  join kota on kepegawaian.kota_id = kota.id
where
  kota.nama not in ('Padang', 'Solok');

-- Tampilkan field nama pegawai dan nama kota dari pegawai yang berasal dari kota Bandung.*
select
  pegawai.nama as 'Nama Pegawai',
  kota.nama as 'Nama Kota'
from
  pegawai
  join kota on pegawai.kota_id = kota.id
where
  kota.nama = 'Jakarta';

-- Tampilkan nama kota dan jumlah pegawai di tiap kota asal mereka.*
select
  kota.nama,
  count(*)
from
  pegawai
  join kota on pegawai.kota_id = kota.id
group by
  kota.nama;

-- Tampilkan seluruh data pegawai ( nip, nama, golongan, kota) urutkan dari usia pegawai tertua hingga termuda.*
select
  pegawai.nip,
  pegawai.nama,
  pegawai.golongan,
  kota.nama as 'Kota'
from
  pegawai
  join kota on pegawai.kota_id = kota.id
order by
  nip asc;