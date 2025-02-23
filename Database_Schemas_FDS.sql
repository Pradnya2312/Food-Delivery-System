create database app_food_instant; 

use app_food_instant;

-- staff table 
CREATE TABLE staff_user (
    staff_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(255),
    staff_email VARCHAR(255) UNIQUE,
    password VARCHAR(255) UNIQUE,
    staff_type INT(11) UNIQUE,
    added_on TIMESTAMP NOT NULL default current_timestamp,
    status TINYINT DEFAULT 1,
    deleted TINYINT DEFAULT 0
);

-- alter table  staff_user modify column added_on TIMESTAMP NOT NULL default current_timestamp;

desc staff_user;
-- users table 
CREATE TABLE users (
    user_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(255) not null,
    user_email VARCHAR(255) not null UNIQUE,
    password VARCHAR(255) not null UNIQUE,
    user_address varchar(55) not null,
    user_phone_no int(20) not null,
    added_on TIMESTAMP NOT NULL,
    status TINYINT DEFAULT 1,
    deleted TINYINT DEFAULT 0
);

-- alter table  users modify column user_address varchar(255) not null;

-- Restaurants  table 
CREATE TABLE restaurants (
    rs_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    rs_name VARCHAR(255) not null,
    rs_address VARCHAR(255) not null,
    rs_cuisine_type VARCHAR(255),
    rs_food_type varchar(255) not null ,
    rs_open_time time  default null,
    rs_close_time time default null,
    added_on TIMESTAMP default  current_timestamp,
    status TINYINT DEFAULT 1,
    deleted TINYINT DEFAULT 0
);


-- food  table 
CREATE TABLE food (
    food_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255) not null,
    food_type VARCHAR(255) not null,
    food_amount float(4,2) not null,
    added_on TIMESTAMP default  current_timestamp,
    status TINYINT DEFAULT 1,
    deleted TINYINT DEFAULT 0
);




-- Restaurants  table 
CREATE TABLE map_restaurants_food  (
    map_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    rs_id int(11) not null,
    food_id int(11) not null,
    mapped_on float(4,2) not null,
    status TINYINT DEFAULT 1,
    deleted TINYINT DEFAULT 0,
    FOREIGN KEY (rs_id) REFERENCES restaurants(rs_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);


-- Payment_table
CREATE TABLE payments (
    payment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    payment_mode varchar(255) not null,
    user_id int(11) not null,
    rs_food_map_id int(11) not null,
     payment_date TIMESTAMP default  current_timestamp,
     payment_time TIMESTAMP default  current_timestamp,
    status TINYINT DEFAULT 1,
    deleted TINYINT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (rs_food_map_id) REFERENCES map_restaurants_food(map_id)
);


-- orders table 
CREATE TABLE orders (
    order_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    rs_food_map_id int(11) not null,
    user_id int(11) not null,
    payment_id int(11) not null,
     order_staus int(11) not null,
     order_date TIMESTAMP default  current_timestamp,
     order_time TIMESTAMP not null default current_timestamp,
     order_est time,
    added_on TIMESTAMP default  current_timestamp,
    status TINYINT DEFAULT 1,
    deleted TINYINT DEFAULT 0,
     FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (rs_food_map_id) REFERENCES map_restaurants_food(map_id),
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
);


-- order_delivery table 
CREATE TABLE order_delivery (
    delivery_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    delivery_partner_name varchar(255) not null,
    delivery_partner_contact int(20) not null,
    order_id int(11) not null,
     delivery_rating int(10) not null,
     delivery_date date,
     delivery_time time,
     delivery_track_location varchar(255),
    added_on TIMESTAMP default  current_timestamp,
    status TINYINT DEFAULT 1,
    deleted TINYINT DEFAULT 0,
     FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- order_delivery table 
CREATE TABLE review (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    review_text varchar(255) not null,
    rs_id int(20) not null,
    review_rating int(11) not null,
    added_on TIMESTAMP default  current_timestamp,
    status TINYINT DEFAULT 1,
    deleted TINYINT DEFAULT 0,
     FOREIGN KEY (rs_id) REFERENCES restaurants(rs_id)
);