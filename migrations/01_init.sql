CREATE TABLE IF NOT EXISTS raw_data (
    id INT PRIMARY KEY,
    customer_first_name VARCHAR(70),
    customer_last_name VARCHAR(70),
    customer_age INT,
    customer_email VARCHAR(70),
    customer_country VARCHAR(70),
    customer_postal_code VARCHAR(20),
    customer_pet_type VARCHAR(40),
    customer_pet_name VARCHAR(70),
    customer_pet_breed VARCHAR(70),

    seller_first_name VARCHAR(70),
    seller_last_name VARCHAR(70),
    seller_email VARCHAR(70),
    seller_country VARCHAR(70),
    seller_postal_code VARCHAR(20),

    product_name VARCHAR(70),
    product_category VARCHAR(70),
    product_price NUMERIC(10,2),
    product_quantity INT,
    sale_date DATE,
    sale_customer_id INT,
    sale_seller_id INT,
    sale_product_id INT,
    sale_quantity INT,
    sale_total_price NUMERIC(10,2),
    store_name VARCHAR(70),
    store_location VARCHAR(70),
    store_city VARCHAR(70),
    store_state VARCHAR(70),
    store_country VARCHAR(70),
    store_phone VARCHAR(20),
    store_email VARCHAR(70),
    pet_category VARCHAR(70),

    product_weight NUMERIC(10,2),
    product_color VARCHAR(50),
    product_size VARCHAR(50),
    product_brand VARCHAR(70),
    product_material VARCHAR(70),
    product_description TEXT,
    product_rating NUMERIC(3,2),
    product_reviews INT,
    product_release_date DATE,
    product_expiry_date DATE,
    
    supplier_name VARCHAR(70),
    supplier_contact VARCHAR(70),
    supplier_email VARCHAR(70),
    supplier_phone VARCHAR(20),
    supplier_address VARCHAR(70),
    supplier_city VARCHAR(70),
    supplier_country VARCHAR(70)
);

COPY raw_data FROM '/src/MOCK_DATA_0.csv' DELIMITER ',' CSV HEADER;
COPY raw_data FROM '/src/MOCK_DATA_1.csv' DELIMITER ',' CSV HEADER;
COPY raw_data FROM '/src/MOCK_DATA_2.csv' DELIMITER ',' CSV HEADER;
COPY raw_data FROM '/src/MOCK_DATA_3.csv' DELIMITER ',' CSV HEADER;
COPY raw_data FROM '/src/MOCK_DATA_4.csv' DELIMITER ',' CSV HEADER;
COPY raw_data FROM '/src/MOCK_DATA_5.csv' DELIMITER ',' CSV HEADER;
COPY raw_data FROM '/src/MOCK_DATA_6.csv' DELIMITER ',' CSV HEADER;
COPY raw_data FROM '/src/MOCK_DATA_7.csv' DELIMITER ',' CSV HEADER;
COPY raw_data FROM '/src/MOCK_DATA_8.csv' DELIMITER ',' CSV HEADER;
COPY raw_data FROM '/src/MOCK_DATA_9.csv' DELIMITER ',' CSV HEADER;
