-- Fetch Users order and payment details
SELECT 
    B.user_name,
    B.user_email,
    B.user_address,
    B.user_phone_no,
    A.order_id,
    CASE 
        WHEN A.status = 1 THEN 'done'
        ELSE 'pending'
    END AS order_status,
    C.payment_mode,
    C.payment_date,
    C.payment_time,
    C.status AS payment_status
FROM
    orders AS A
    LEFT JOIN users AS B ON A.user_id = B.user_id
    LEFT JOIN payments AS C ON C.rs_food_map_id = A.rs_food_map_id;
    