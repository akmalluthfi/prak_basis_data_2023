-- data manipulation language (DML)
-- insert data to database order_entry

insert into customers 
    values 
        ('10002', 'Mouse House', '333 Fromage Lane', 'Columbus', 'OH', '43333', 'USA', 'Jerry Mouse',  null),  
        ('10003', 'Wascals', '1 Sunny Place', 'Nuncie', 'IN', '42222', 'USA', 'Jim Jones', 'rabbit@wascally.com'), 
        ('10004', 'Yosemite Place', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Y Sam', 'sam@yosemite.com'), 
        ('10005', 'E Fudd', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'E Fudd', null);

insert into products
    values 
        ('ANV01', '1001', '.5 ton anvil', 6, '.5 ton anvil,  black,  complete with handy hook'), 
        ('ANV02', '1001', '1 ton anvil', 10, '1 ton anvil,  black,  complete with handy hook and carrying case'), 
        ('ANV03', '1001', '2 ton anvil', 15, '2 ton anvil,  black,  complete with handy hook and carrying case'), 
        ('DTNTR', '1003', 'Deronator', 13, 'Detanator (plunger powered),  fuses not include'), 
        ('FB', '1003', 'Bird seed', 10, 'Large bag (suitable for road runners)'), 
        ('FC', '1003', 'Carrots', 3, 'Carrots (rabbit hunting season only)'),
        ('FU1', '1002', 'Fuses', 3, '1 dozen,  extra long'),
        ('JP1000', '1005', 'JetPack 1000', 35, 'JetPack 1000,  intended for single user'), 
        ('JP2000', '1005', 'JetPack 2000', 55, 'JetPack 2000,  multi-use'),
        ('OL1', '1002', 'Oil can', 9, 'Oil can,  red'), 
        ('SAFE', '1003', 'Safe', 50, 'Safe with combination lock'), 
        ('SLING', '1003', 'Sling', 4, 'Sling,  one size fits all'), 
        ('TNT1', '1003', 'TNT (1 stick)', 3, 'TNT,  red,  single stick'), 
        ('TNT2', '1003', 'TNT (5 sticks)', 10, 'TNT,  red,  pack of 10 sticks');

insert into vendors
    values
        ('1001', 'Anvils R Us', '123 Main Street', 'Southfield', 'MI', '48075', 'USA'), 
        ('1002', 'LT Supplies', '500 Park Street', 'Anytown', 'OH', '44333', 'USA'), 
        ('1003', 'ACME', '555 High Street', 'Los Angeles', 'CA', '90046', 'USA'), 
        ('1004', 'Furball Inc.', '1000 5th Avenue', 'New York', 'NY', '11111', 'USA'), 
        ('1005', 'Jet Set', '42 Galaxy Road', 'London', 'NULL', 'N16 6PS', 'England'), 
        ('1006', 'Jouets Et Ours', '1 Rue Amusement', 'Paris', 'NULL', '45678', 'france');

insert into order_items
    values
        ('20005', '1', 'ANV01', '10'), 
        ('20005', '2', 'ANV02', '3'), 
        ('20005', '3', 'TNT2', '5'), 
        ('20005', '4', 'FB', '1'), 
        ('20006', '1', 'JP2000', '1'), 
        ('20007', '1', 'TNT2', '100'), 
        ('20008', '1', 'FC', '50'), 
        ('20009', '1', 'FB', '1'), 
        ('20009', '2', 'OL1', '1'), 
        ('20009', '3', 'SLING', '1'), 
        ('20009', '4', 'ANV03', '1');

-- 1. mengubah data customer (update)
select * from customers;
update customers
  set 
    cust_name = 'John Doe', 
    cust_address = 'Kenjeran', 
    cust_city = 'Surabaya',
    cust_state = 'ID',
    cust_zip = '62663',
    cust_country = 'Indonesia',
    cust_contact = 'John Wick',
    cust_email = 'johndoe@gmail.com'
  where cust_id = '10002';
select * from customers;

-- 2. hapus salah satu data vendor (delete)
select * from vendors;
delete from vendors where vend_id = '1002';
select * from vendors;

-- 3. tampilkan nomor order dan jumlahnya (select col1, col2)
select order_num, quantity from order_items;

-- 4. tampilkan data customer yang berasal dari usa (select * from .. where )
select * from customers where cust_country = 'USA';
