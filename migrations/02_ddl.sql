CREATE TABLE IF NOT EXISTS dim_customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(70),
    last_name VARCHAR(70),
    age INT,
    email VARCHAR(70) UNIQUE,
    country VARCHAR(70),
    postal_code VARCHAR(20),
    pet_type VARCHAR(40),
    pet_name VARCHAR(70),
    pet_breed VARCHAR(70)
);

CREATE TABLE IF NOT EXISTS dim_seller (
    seller_id SERIAL PRIMARY KEY,
    first_name VARCHAR(70),
    last_name VARCHAR(70),
    email VARCHAR(70) UNIQUE,
    country VARCHAR(70),
    postal_code VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS dim_supplier (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(70),
    contact VARCHAR(70),
    email VARCHAR(70),
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(70),
    country VARCHAR(70)
);

CREATE TABLE IF NOT EXISTS dim_product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(70),
    category VARCHAR(70),
    brand VARCHAR(70),
    weight NUMERIC(10,2),
    color VARCHAR(50),
    size VARCHAR(50),
    material VARCHAR(70),
    description TEXT,
    rating NUMERIC(3,2),
    release_date DATE,
    expiry_date DATE,
    supplier_id INT REFERENCES dim_supplier(supplier_id)
);
-- Вертоградский Д.А. М8О-303Б-22
CREATE TABLE IF NOT EXISTS dim_store (
    store_id SERIAL PRIMARY KEY,
    name VARCHAR(70),
    location VARCHAR(70),
    city VARCHAR(70),
    state VARCHAR(70),
    country VARCHAR(70),
    phone VARCHAR(20),
    email VARCHAR(70)
);

CREATE TABLE IF NOT EXISTS dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    quarter INT,
    week INT,
    day_of_week INT
);

CREATE TABLE IF NOT EXISTS fact_sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES dim_customer(customer_id),
    product_id INT REFERENCES dim_product(product_id),
    seller_id INT REFERENCES dim_seller(seller_id),
    store_id INT REFERENCES dim_store(store_id),
    date_id DATE REFERENCES dim_date(date_id),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_price DECIMAL(10,2)
);

