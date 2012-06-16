--alter table accesses drop foreign key FK800FF91287E4C6BA;
--alter table accesses drop foreign key FK800FF912F1600E3A;
--alter table cart_x_products drop foreign key FK9497AFCAF24D489A;
--alter table cart_x_products drop foreign key FK9497AFCA9B95007A;
--alter table carts drop foreign key FK5A0E9532644B7DA;
--alter table employes drop foreign key FK4722E6BCF1600E3A;
--alter table orders drop foreign key FKC3DF62E5B105E6FA;
--alter table orders drop foreign key FKC3DF62E5F24D489A;
--alter table orders drop foreign key FKC3DF62E52644B7DA;
--alter table products drop foreign key FKC42BD164CA6E23DA;
--alter table products drop foreign key FKC42BD164A7B3DEFA;
--alter table products drop foreign key FKC42BD164EB72491A;
drop table if exists accesses;
drop table if exists cart_x_products;
drop table if exists carts;
drop table if exists categories;
drop table if exists currencies;
drop table if exists customers;
drop table if exists employes;
drop table if exists manufacturers;
drop table if exists mydomainobjects;
drop table if exists orders;
drop table if exists products;
drop table if exists profiles;
drop table if exists suppliers;
drop table if exists tabs;
create table accesses (id bigint not null auto_increment, add_ integer, delete_ integer, edit_ integer, view_ integer, profile_id bigint, tab_id bigint, primary key (id)) ENGINE=InnoDB;
create table cart_x_products (id bigint not null auto_increment, quantity integer not null, cart_id bigint, product_id bigint, primary key (id)) ENGINE=InnoDB;
create table carts (id bigint not null auto_increment, created_on datetime, updated_on datetime, customer_id bigint, primary key (id)) ENGINE=InnoDB;
create table categories (id bigint not null auto_increment, active bit not null, created_on datetime, description varchar(255), link_rewrite varchar(255), meta_description varchar(255), meta_keywords varchar(255), meta_title varchar(255), name varchar(255), updated_on datetime, primary key (id), unique (name)) ENGINE=InnoDB;
create table currencies (id bigint not null auto_increment, active bit not null, conversion_rate double precision, created_on datetime, iso_code varchar(255), name varchar(255), updated_on datetime, primary key (id), unique (name)) ENGINE=InnoDB;
create table customers (id bigint not null auto_increment, active bit not null, birthday datetime, created_on datetime, email varchar(255), first_name varchar(255), last_name varchar(255), newsletter bit not null, password varchar(255), updated_on datetime, primary key (id)) ENGINE=InnoDB;
create table employes (id bigint not null auto_increment, active bit not null, created_on datetime, email varchar(255), first_name varchar(255), last_name varchar(255), password varchar(255), updated_on datetime, profile_id bigint, primary key (id), unique (first_name)) ENGINE=InnoDB;
create table manufacturers (id bigint not null auto_increment, active bit not null, created_on datetime, link_rewrite varchar(255), meta_description varchar(255), meta_keywords varchar(255), meta_title varchar(255), name varchar(255), updated_on datetime, primary key (id), unique (name)) ENGINE=InnoDB;
create table mydomainobjects (id bigint not null auto_increment, checked bit not null, name varchar(255), primary key (id)) ENGINE=InnoDB;
create table orders (id bigint not null auto_increment, created_on datetime, delivery_date datetime, payment varchar(255), shipping_number varchar(255), total_discount double precision, total_paid double precision, total_producs integer, updated_on datetime, cart_id bigint, currency_id bigint, customer_id bigint, primary key (id)) ENGINE=InnoDB;
create table products (id bigint not null auto_increment, active bit not null, created_on datetime, description varchar(255), link_rewrite varchar(255), meta_description varchar(255), meta_keywords varchar(255), meta_title varchar(255), name varchar(255), price bigint, quantity integer not null, reduction_price bigint, updated_on datetime, category_id bigint, manufacturer_id bigint, supplier_id bigint, primary key (id), unique (name)) ENGINE=InnoDB;
create table profiles (id bigint not null auto_increment, active bit not null, created_on datetime, name varchar(255), updated_on datetime, primary key (id), unique (name)) ENGINE=InnoDB;
create table suppliers (id bigint not null auto_increment, active bit not null, created_on datetime, description varchar(255), link_rewrite varchar(255), meta_description varchar(255), meta_keywords varchar(255), meta_title varchar(255), name varchar(255), updated_on datetime, primary key (id), unique (name)) ENGINE=InnoDB;
create table tabs (id bigint not null auto_increment, active bit not null, created_on datetime, name varchar(255), position integer not null, updated_on datetime, primary key (id), unique (name)) ENGINE=InnoDB;
alter table accesses add index FK800FF91287E4C6BA (tab_id), add constraint FK800FF91287E4C6BA foreign key (tab_id) references tabs (id);
alter table accesses add index FK800FF912F1600E3A (profile_id), add constraint FK800FF912F1600E3A foreign key (profile_id) references profiles (id);
alter table cart_x_products add index FK9497AFCAF24D489A (cart_id), add constraint FK9497AFCAF24D489A foreign key (cart_id) references carts (id);
alter table cart_x_products add index FK9497AFCA9B95007A (product_id), add constraint FK9497AFCA9B95007A foreign key (product_id) references products (id);
alter table carts add index FK5A0E9532644B7DA (customer_id), add constraint FK5A0E9532644B7DA foreign key (customer_id) references customers (id);
alter table employes add index FK4722E6BCF1600E3A (profile_id), add constraint FK4722E6BCF1600E3A foreign key (profile_id) references profiles (id);
alter table orders add index FKC3DF62E5B105E6FA (currency_id), add constraint FKC3DF62E5B105E6FA foreign key (currency_id) references currencies (id);
alter table orders add index FKC3DF62E5F24D489A (cart_id), add constraint FKC3DF62E5F24D489A foreign key (cart_id) references carts (id);
alter table orders add index FKC3DF62E52644B7DA (customer_id), add constraint FKC3DF62E52644B7DA foreign key (customer_id) references customers (id);
alter table products add index FKC42BD164CA6E23DA (category_id), add constraint FKC42BD164CA6E23DA foreign key (category_id) references categories (id);
alter table products add index FKC42BD164A7B3DEFA (manufacturer_id), add constraint FKC42BD164A7B3DEFA foreign key (manufacturer_id) references manufacturers (id);
alter table products add index FKC42BD164EB72491A (supplier_id), add constraint FKC42BD164EB72491A foreign key (supplier_id) references suppliers (id);