CREATE DATABASE IF NOT EXISTS amazon_project;

USE amazon_project;

DROP TABLE IF EXISTS amazon_products;

CREATE TABLE amazon_products (
    product_id VARCHAR(50),
    product_name TEXT,
    category VARCHAR(255),
    discounted_price VARCHAR(50),
    actual_price VARCHAR(50),
    discount_percentage VARCHAR(20),
    rating VARCHAR(20),
    rating_count VARCHAR(50),
    about_product TEXT,
    user_id TEXT,
    user_name TEXT,
    review_id TEXT,
    review_title TEXT,
    review_content LONGTEXT,
    img_link TEXT,
    product_link TEXT
); 
Created to directly import data to DBEAVER MYSQL
