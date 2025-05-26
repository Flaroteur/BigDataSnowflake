INSERT INTO dim_customer (
    first_name, last_name, age, email, country, 
    postal_code, pet_type, pet_name, pet_breed
)
SELECT DISTINCT ON (customer_email)
    customer_first_name, 
    customer_last_name, 
    customer_age, 
    customer_email, 
    customer_country,
    customer_postal_code,
    customer_pet_type,
    customer_pet_name,
    customer_pet_breed
FROM raw_data
ON CONFLICT DO NOTHING;

INSERT INTO dim_seller (
    first_name, last_name, email, country, postal_code
)
SELECT DISTINCT ON (seller_email)
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_country,
    seller_postal_code
FROM raw_data
ON CONFLICT DO NOTHING;

INSERT INTO dim_supplier (
    name, contact, email, phone, address, city, country
)
SELECT DISTINCT ON (supplier_email)
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country
FROM raw_data
ON CONFLICT DO NOTHING;

INSERT INTO dim_product (
    name, category, brand, weight, color, size, material,
    description, rating, release_date, expiry_date, supplier_id
)
SELECT DISTINCT ON (product_name)
    product_name,
    product_category,
    product_brand,
    product_weight,
    product_color,
    product_size,
    product_material,
    product_description,
    product_rating,
    product_release_date,
    product_expiry_date,
    s.supplier_id
FROM raw_data r
JOIN dim_supplier s ON r.supplier_email = s.email
ON CONFLICT DO NOTHING;

INSERT INTO dim_store (
    name, location, city, state, country, phone, email
)
SELECT DISTINCT ON (store_email)
    store_name,
    store_location,
    store_city,
    store_state,
    store_country,
    store_phone,
    store_email
FROM raw_data
ON CONFLICT DO NOTHING;

INSERT INTO dim_date (date_id, year, month, day, quarter, week, day_of_week)
SELECT DISTINCT
    sale_date,
    EXTRACT(YEAR FROM sale_date),
    EXTRACT(MONTH FROM sale_date),
    EXTRACT(DAY FROM sale_date),
    EXTRACT(QUARTER FROM sale_date),
    EXTRACT(WEEK FROM sale_date),
    EXTRACT(DOW FROM sale_date)
FROM raw_data
ON CONFLICT DO NOTHING;

INSERT INTO fact_sales (
    customer_id, product_id, seller_id, store_id, date_id,
    quantity, price_per_unit, total_price
)
SELECT
    c.customer_id,
    p.product_id,
    s.seller_id,
    st.store_id,
    d.date_id,
    r.sale_quantity,
    r.product_price,
    r.sale_total_price
FROM raw_data r
JOIN dim_customer c ON r.customer_email = c.email
JOIN dim_product p ON r.product_name = p.name
JOIN dim_seller s ON r.seller_email = s.email
JOIN dim_store st ON r.store_email = st.email
JOIN dim_date d ON r.sale_date = d.date_id;