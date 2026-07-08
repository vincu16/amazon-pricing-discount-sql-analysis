USE amazon_project;

DROP TABLE IF EXISTS amazon_clean;

CREATE TABLE amazon_clean AS
SELECT *
FROM amazon_products;

ALTER TABLE amazon_clean
ADD COLUMN discounted_price_num DECIMAL(10,2),
ADD COLUMN actual_price_num DECIMAL(10,2),
ADD COLUMN discount_percentage_num DECIMAL(5,2),
ADD COLUMN rating_num DECIMAL(3,2),
ADD COLUMN rating_count_num INT;

UPDATE amazon_clean
SET discounted_price_num =
    REPLACE(REPLACE(REPLACE(discounted_price, '₹', ''), 'â‚¹', ''), ',', '') + 0;

UPDATE amazon_clean
SET actual_price_num =
    REPLACE(REPLACE(REPLACE(actual_price, '₹', ''), 'â‚¹', ''), ',', '') + 0;

UPDATE amazon_clean
SET discount_percentage_num =
    REPLACE(discount_percentage, '%', '') + 0;

UPDATE amazon_clean
SET rating_num =
    CASE
        WHEN rating REGEXP '^[0-9]+(\\.[0-9]+)?$'
        THEN rating + 0
        ELSE NULL
    END;

UPDATE amazon_clean
SET rating_count_num =
    REPLACE(rating_count, ',', '') + 0;
