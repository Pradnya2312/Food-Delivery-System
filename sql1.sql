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
    C.status AS payment_status,
    D.delivery_partner_name,
    D.delivery_partner_contact,
    D.delivery_rating,
    D.delivery_date,
    D.delivery_time,
    D.delivery_track_location
FROM
    orders AS A
    LEFT JOIN users AS B ON A.user_id = B.user_id
    LEFT JOIN payments AS C ON C.rs_food_map_id = A.rs_food_map_id
    LEFT JOIN order_delivery AS D ON A.order_id = D.order_id
WHERE 
    B.user_id = 3  
    AND C.status = 1
ORDER BY 
    A.order_id DESC;