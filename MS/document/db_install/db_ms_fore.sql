

/* ms fore install sql for mongodb */
/* Drop Tables */

DROP TABLE IF EXISTS customer_datum_details;
DROP TABLE IF EXISTS customer_media;
DROP TABLE IF EXISTS customer_register;
DROP TABLE IF EXISTS goods_category;
DROP TABLE IF EXISTS goods_commentary_media;
DROP TABLE IF EXISTS goods_sale;
DROP TABLE IF EXISTS goods_sale_commentary;
DROP TABLE IF EXISTS goods_sale_media;
DROP TABLE IF EXISTS goods_sale_promotion;
DROP TABLE IF EXISTS goods_sale_push;
DROP TABLE IF EXISTS goods_sale_service;
DROP TABLE IF EXISTS order_sale;
DROP TABLE IF EXISTS order_sale_details;
DROP TABLE IF EXISTS order_status;




/* Create Tables */

CREATE TABLE customer_datum_details
(
	ID char(32) NOT NULL,
	fk_customer_manager char(32) NOT NULL,
	name varchar(20),
	nick_name varchar(20),
	age char(6),
	gender char(6),
	birthday date,
	hometown varchar(100),
	residence bytea,
	phone_number char(12),
	others bytea,
	hobbies bytea,
	introduction bytea,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE customer_media
(
	ID char(32) NOT NULL,
	linked_id char(32),
	file_path varchar(200),
	file_size char(20),
	enable char(2),
	recording_time timestamp,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE customer_register
(
	ID char(32) NOT NULL,
	login_name varchar(20),
	phone_number char(12),
	email varchar(50),
	password varchar(20),
	enable char(2),
	create_time timestamp,
	remarks varchar(50),
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE goods_category
(
	ID char(32) NOT NULL,
	parent char(32),
	category_id char(20),
	name varchar(20),
	remarks varchar(50),
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE goods_commentary_media
(
	ID char(32) NOT NULL,
	linked_id char(32),
	file_path varchar(200),
	file_size char(20),
	enable char(2),
	recording_time timestamp,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE goods_sale
(
	ID char(32) NOT NULL,
	goods_id char(20),
	name varchar(20),
	synapsis varchar(200),
	original_price double precision,
	promotion double precision,
	inventory int,
	success_amount int,
	remarks varchar(50),
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE goods_sale_commentary
(
	ID char(32) NOT NULL,
	categoray char(32),
	fk_goods_sale char(32),
	score int,
	tags varchar(100),
	appreciate varchar(50),
	recording_time timestamp,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE goods_sale_media
(
	ID char(32) NOT NULL,
	linked_id char(32),
	file_path varchar(200),
	file_size char(20),
	enable char(2),
	recording_time timestamp,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE goods_sale_promotion
(
	ID char(32) NOT NULL,
	linked_id char(32),
	title varchar(50),
	content varchar(100),
	remarks varchar(50),
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE goods_sale_push
(
	ID char(32) NOT NULL,
	keywords varchar(100),
	categories varchar(100),
	price double precision,
	fk_goods_sale char(32),
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE goods_sale_service
(
	ID char(32) NOT NULL,
	fk_goods_sale char(32),
	title varchar(50),
	content varchar(100),
	remarks varchar(50),
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE order_sale
(
	ID char(32) NOT NULL,
	order_id char(20),
	fk_goods_sale char(32),
	quantity int,
	amount int,
	dicount double precision,
	total double precision,
	status char(32),
	recording_time timestamp,
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE order_sale_details
(
	ID char(32) NOT NULL,
	fk_order_sale char(32),
	fk_customer_register char(32),
	fk_order_status char(32),
	recording_time timestamp,
	remarks varchar(50),
	PRIMARY KEY (ID)
) WITHOUT OIDS;


CREATE TABLE order_status
(
	ID char(32) NOT NULL,
	status char(32) NOT NULL,
	content varchar(100),
	recording_time timestamp,
	PRIMARY KEY (ID)
) WITHOUT OIDS;



