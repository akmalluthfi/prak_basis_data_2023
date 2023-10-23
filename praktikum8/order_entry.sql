create database order_entry;

create table vendors
(
  vend_id char(4) not null,
  vend_name varchar(25) not null,
  vend_address varchar(30),
  vend_city varchar(20),
  vend_state varchar(5),
  vend_zip varchar(7),
  vend_country varchar(15),
  primary key(vend_id)
);

create table customers 
(
  cust_id char(5) not null,
  cust_name varchar(25) null,
  cust_address varchar(30) null,
  cust_city varchar(25) null,
  cust_state varchar(5) null,
  cust_zip varchar(5) null,
  cust_country varchar(20) null,
  cust_contact varchar(25) null,
  cust_email varchar(30) null,
  primary key(cust_id)
);

create table products
(
  prod_id varchar(10) not null,
  vend_id char(4) not null ,
  prod_name varchar(25) not null ,
  prod_price int not null ,
  prod_desc varchar(255) not null,
   primary key(prod_id)
);

create table orders
(
  order_num int not null,
  order_date date not null,
  cust_id char(5) not null,
  primary key(order_num)
);

create table product_notes
(
  note_id char(3) not null,
  prod_id varchar(10) not null,
  note_date date not null,
  note_text varchar(200) null,
  primary key(note_id),
  constraint fk_product_notes foreign key (prod_id) references products (prod_id)
);

create table order_items
(
  order_num int not null,
  order_item int not null,
  prod_id varchar(10) not null,
  quantity int not null,
  primary key(order_item),
  constraint fk_order_items foreign key (order_num) references orders (order_num)
);

create table order_items
(
  order_num int not null,
  order_item int not null,
  prod_id varchar(10) not null,
  quantity int not null,
  primary key(order_num, order_item)
);