-- use database
use praktikum;

-- desc mahasiswa
desc mahasiswa;

-- insert data
insert into mahasiswa values ('05052652', 'Painem', 'Jalan Wates Km 11');

insert into mahasiswa(nim, nama, alamat) values ('07080905040', 'Paijo', 'Jln Jembatan Merah no 23');

-- query sederhana
select * from mahasiswa;

select nim, nama from mahasiswa;

select * from mahasiswa where nim='05052652';

-- change database
use order_entry;

-- update data
update customers 
  set 
    cust_address = 'Gejayan Yogya',
    cust_country='INA'
  where cust_id='10002';

select * from customers;

-- delete data
select * from customers;

delete from customers where cust_id = '10006';

select * from customers;

-- select using where
select * from customers where cust_id = '10003' or cust_name ='wascals';

select prod_name from products where prod_price >= 20;
