USE amazon_project;

-- 1. Total number of products
SELECT COUNT(*) AS total_products
FROM amazon_clean;

-- 2. Preview cleaned data
SELECT
    discounted_price,
    discounted_price_num,
    actual_price,
    actual_price_num,
    discount_percentage,
    discount_percentage_num,
    rating,
    rating_num,
    rating_count,
    rating_count_num
FROM amazon_clean
LIMIT 10;

-- 3. Highest rated categories
SELECT
    category,
    ROUND(AVG(rating_num), 2) AS avg_rating,
    COUNT(*) AS total_products
FROM amazon_clean
WHERE rating_num IS NOT NULL
GROUP BY category
ORDER BY avg_rating DESC;

-- 4. Categories with highest average discounts
SELECT
    category,
    ROUND(AVG(discount_percentage_num), 2) AS avg_discount_percentage,
    COUNT(*) AS total_products
FROM amazon_clean
GROUP BY category
ORDER BY avg_discount_percentage DESC;

-- 5. Discount tier analysis
SELECT
    CASE
        WHEN discount_percentage_num < 30 THEN 'Low Discount'
        WHEN discount_percentage_num < 60 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_tier,
    COUNT(*) AS total_products,
    ROUND(AVG(rating_num), 2) AS avg_rating,
    ROUND(AVG(rating_count_num), 0) AS avg_review_count
FROM amazon_clean
WHERE rating_num IS NOT NULL
GROUP BY discount_tier
ORDER BY avg_review_count DESC;

-- 6. Top 10 most reviewed products
SELECT
    product_name,
    category,
    rating_num,
    rating_count_num,
    discount_percentage_num
FROM amazon_clean
WHERE rating_count_num IS NOT NULL
ORDER BY rating_count_num DESC
LIMIT 10;
