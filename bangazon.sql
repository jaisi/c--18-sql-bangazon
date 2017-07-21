BEGIN TRANSACTION;
CREATE TABLE "training_program" (
	`program_id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`program_name`	TEXT,
	`start_date`	TEXT,
	`end_date`	TEXT
);
CREATE TABLE "products" (
	`product_id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`product_type_id`	INTEGER,
	`price`	NUMERIC,
	`title`	TEXT,
	`description`	TEXT,
	FOREIGN KEY(product_type_id) references product_type(product_type_id)
);
INSERT INTO `products` (product_id,product_type_id,price,title,description) VALUES (1,'electronics',200,'speakers','awesome speakers');
CREATE TABLE `product_type` (
	`product_type_id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`type`	TEXT
);
CREATE TABLE `payment_type` (
	`payment_type_id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`payment_type`	TEXT
);
CREATE TABLE "orders" (
	`order_id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`order_Date`	TEXT,
	`cust_id`	INTEGER,
	`payment_type_id`	TEXT,
	`complete`	INTEGER,
	FOREIGN KEY(payment_type_id) references payment_type(payment_type_id),
	FOREIGN KEY(cust_id) references customers(cust_id)

);
INSERT INTO `orders` (order_id,order_Date,cust_id,payment_type_id,complete) VALUES (1,'7/15/2017',1,1,'yes');
CREATE TABLE `order_product` (
	`order_id`	INTEGER,
	`product_id`	INTEGER
);
CREATE TABLE "employee" (
	`emp_id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`emp_fname`	TEXT,
	`emp_lname`	TEXT,
	`dept_id`	INTEGER,
	`is_supervisor`	INTEGER,
	FOREIGN KEY(dept_id) references department(dept_id)
);
INSERT INTO `employee` (emp_id,emp_fname,emp_lname,dept_id,is_supervisor) VALUES (1,'Edwin','Turner',2,'yes'),
 (2,'Maddy','Albright',2,'no'),
 (3,'Rick','Carter',1,'no');
CREATE TABLE "emp_training" (
	`emp_id`	INTEGER,
	`program_id`	INTEGER
);
INSERT INTO `emp_training` (emp_id,program_id) VALUES (1,1),
 (2,1);
CREATE TABLE `emp_computer` (
	`emp_id`	INTEGER,
	`computer_id`	INTEGER
);

CREATE TABLE "department" (
	`dept_id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`dept_name`	TEXT,
	`budget`	NUMERIC
);
INSERT INTO `department` (dept_id,dept_name,budget,emp_id) VALUES (1,'IT',30000),
 (2,'Accounts',40000);
CREATE TABLE "customers" (
	`customer_id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`cust_fname`	TEXT,
	`cust_lname`	TEXT,
	`creation_date`	TEXT,
	`active`	INTEGER
);
INSERT INTO `customers` (customer_id,cust_fname,cust_lname,creation_date,active) VALUES (1,'Rhea','Jaisinghani','7/6/99','yes'),
 (2,'Manish','Jaisinghani','5/14/2017','yes');
CREATE TABLE `computers` (
	`computer_id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`purchase_date`	TEXT,
	`decommission_date`	TEXT,
	`emp_id`	INTEGER
);
INSERT INTO `computers` (computer_id,purchase_date,decommission_date,emp_id) VALUES (1,'4/4/2017','7/7/2017',2),
 (2,'7/4/2016','7/7/2017',1),
 (3,'2/3/2016','7/7/2017',3);
COMMIT;
