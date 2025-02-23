import mysql.connector

# Database connection settings
DB_CONFIG = {
    "host": "localhost",  # Change if using a remote database
    "user": "root",  # Change to your MySQL username
    "password": "Pradnya@2312",  # Change to your MySQL password
}

# SQL Queries to create the database and tables
SQL_QUERIES = [
    "CREATE DATABASE IF NOT EXISTS app_food_instant;",
    "USE app_food_instant;",
    """
    CREATE TABLE IF NOT EXISTS staff_user (
        staff_id INT(11) PRIMARY KEY AUTO_INCREMENT,
        staff_name VARCHAR(255),
        staff_email VARCHAR(255) UNIQUE,
        password VARCHAR(255) UNIQUE,
        staff_type INT(11) UNIQUE,
        added_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        status TINYINT DEFAULT 1,
        deleted TINYINT DEFAULT 0
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS users (
        user_id INT(11) PRIMARY KEY AUTO_INCREMENT,
        user_name VARCHAR(255) NOT NULL,
        user_email VARCHAR(255) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL UNIQUE,
        user_address VARCHAR(255) NOT NULL,
        user_phone_no BIGINT NOT NULL,
        added_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        status TINYINT DEFAULT 1,
        deleted TINYINT DEFAULT 0
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS restaurants (
        rs_id INT(11) PRIMARY KEY AUTO_INCREMENT,
        rs_name VARCHAR(255) NOT NULL,
        rs_address VARCHAR(255) NOT NULL,
        rs_cuisine_type VARCHAR(255),
        rs_food_type VARCHAR(255) NOT NULL,
        rs_open_time TIME DEFAULT NULL,
        rs_close_time TIME DEFAULT NULL,
        added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        status TINYINT DEFAULT 1,
        deleted TINYINT DEFAULT 0
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS food (
        food_id INT(11) PRIMARY KEY AUTO_INCREMENT,
        food_name VARCHAR(255) NOT NULL,
        food_type VARCHAR(255) NOT NULL,
        food_amount FLOAT(4,2) NOT NULL,
        added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        status TINYINT DEFAULT 1,
        deleted TINYINT DEFAULT 0
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS map_restaurants_food (
        map_id INT(11) PRIMARY KEY AUTO_INCREMENT,
        rs_id INT(11) NOT NULL,
        food_id INT(11) NOT NULL,
        mapped_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        status TINYINT DEFAULT 1,
        deleted TINYINT DEFAULT 0,
        FOREIGN KEY (rs_id) REFERENCES restaurants(rs_id),
        FOREIGN KEY (food_id) REFERENCES food(food_id)
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS payments (
        payment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
        payment_mode VARCHAR(255) NOT NULL,
        user_id INT(11) NOT NULL,
        rs_food_map_id INT(11) NOT NULL,
        payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        payment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        status TINYINT DEFAULT 1,
        deleted TINYINT DEFAULT 0,
        FOREIGN KEY (user_id) REFERENCES users(user_id),
        FOREIGN KEY (rs_food_map_id) REFERENCES map_restaurants_food(map_id)
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS orders (
        order_id INT(11) PRIMARY KEY AUTO_INCREMENT,
        rs_food_map_id INT(11) NOT NULL,
        user_id INT(11) NOT NULL,
        payment_id INT(11) NOT NULL,
        order_staus INT(11) NOT NULL,
        order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        order_est TIME,
        added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        status TINYINT DEFAULT 1,
        deleted TINYINT DEFAULT 0,
        FOREIGN KEY (user_id) REFERENCES users(user_id),
        FOREIGN KEY (rs_food_map_id) REFERENCES map_restaurants_food(map_id),
        FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS order_delivery (
        delivery_id INT(11) PRIMARY KEY AUTO_INCREMENT,
        delivery_partner_name VARCHAR(255) NOT NULL,
        delivery_partner_contact BIGINT NOT NULL,
        order_id INT(11) NOT NULL,
        delivery_rating INT(10) NOT NULL,
        delivery_date DATE,
        delivery_time TIME,
        delivery_track_location VARCHAR(255),
        added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        status TINYINT DEFAULT 1,
        deleted TINYINT DEFAULT 0,
        FOREIGN KEY (order_id) REFERENCES orders(order_id)
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS review (
        id INT(11) PRIMARY KEY AUTO_INCREMENT,
        review_text VARCHAR(255) NOT NULL,
        rs_id INT(20) NOT NULL,
        review_rating INT(11) NOT NULL,
        added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        status TINYINT DEFAULT 1,
        deleted TINYINT DEFAULT 0,
        FOREIGN KEY (rs_id) REFERENCES restaurants(rs_id)
    );
    """
]

# Connect to MySQL and execute queries
def create_database():
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        for query in SQL_QUERIES:
            cursor.execute(query)
        print("Database and tables created successfully!")
        conn.commit()
        cursor.close()
        conn.close()
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Run the script
if __name__ == "__main__":
    create_database()
