
-- staff insertion
insert into staff_user (staff_name,staff_email,password,staff_type) 
values("sno-1","test@gamil.com","temp@123",1)
,("sno-2","temp@gamil.com","temp@1234",2);


-- user insertion

INSERT INTO users (user_name, user_email, password, user_address, user_phone_no, added_on, status, deleted) 
VALUES ('Jane Smith', 'jane.smith@example.com', 'password123', '123 Main St, City', 1234567890, CURRENT_TIMESTAMP, 1, 0);


-- restaurants insertion

INSERT INTO restaurants (rs_name, rs_address, rs_cuisine_type, rs_food_type, rs_open_time, rs_close_time, added_on, status, deleted) 
VALUES ('Foodie Heaven', '456 Food St, City', 'Italian', 'Vegetarian', '10:00:00', '22:00:00', CURRENT_TIMESTAMP, 1, 0);


INSERT INTO restaurants (rs_name, rs_address, rs_cuisine_type, rs_food_type, rs_open_time, rs_close_time, added_on, status, deleted) 
VALUES ('Foodie Heaven', '456 Food St, City', 'Italian', 'Vegetarian', '10:00:00', '22:00:00', CURRENT_TIMESTAMP, 1, 0);


INSERT INTO food (food_name, food_type, food_amount, added_on, status, deleted) 
VALUES ('Margherita Pizza', 'Vegetarian', 10.99, CURRENT_TIMESTAMP, 1, 0);

INSERT INTO map_restaurants_food (rs_id, food_id, mapped_on, status, deleted) 
VALUES (1, 1, 9.99, 1, 0);

INSERT INTO payments (payment_mode, user_id, rs_food_map_id, payment_date, payment_time, status, deleted) 
VALUES ('Credit Card', 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 0);

INSERT INTO orders (rs_food_map_id, user_id, payment_id, order_staus, 
order_date, order_time, order_est, added_on, status, deleted) 
VALUES (1, 3, 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '00:30:00', CURRENT_TIMESTAMP, 1, 0);


INSERT INTO order_delivery (delivery_partner_name, delivery_partner_contact, order_id, delivery_rating, delivery_date, delivery_time, delivery_track_location, added_on, status, deleted) 
VALUES ('John Delivery', 9876543210, 3, 5, '2025-02-20', '12:00:00', 'Location A, City', 
CURRENT_TIMESTAMP, 1, 0);

INSERT INTO review (review_text, rs_id, review_rating, added_on, status, deleted) 
VALUES ('Amazing pizza, highly recommended!', 1, 5, CURRENT_TIMESTAMP, 1, 0);