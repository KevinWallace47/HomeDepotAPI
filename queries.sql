SELECT * FROM products

-- What is the count of each brands products
SELECT brand, COUNT(*)
FROM products 
GROUP BY brand

-- Which brand has the highest average selling price
SELECT brand, ROUND(AVG(price)::numeric, 2) AS average
FROM products
GROUP BY brand
ORDER BY average DESC

-- How do ratings compare accross brands (Highest/lowest rated brand)
SELECT brand, ROUND(AVG(rating)::numeric, 2) AS average_rating
FROM products 
GROUP BY brand
ORDER BY average_rating DESC

-- Which brand is best value for money (Highest rating with lowest price)
SELECT brand, ROUND(AVG(rating)::numeric, 2) AS average_rating, ROUND(AVG(price)::numeric, 2) AS average_price
FROM products
GROUP BY brand
ORDER BY average_rating DESC, average_price ASC
 
-- How do promotions such as special buy affect average rating
SELECT
    COALESCE(a.brand, b.brand) AS brand,
    a.average_rating_with_badge,
    b.average_rating_without_badge
FROM
    (
       SELECT 
           brand,
           ROUND(AVG(rating)::numeric, 2) AS average_rating_with_badge
       FROM products
       WHERE price_badge IS NOT NULL
       GROUP BY brand
    ) a
FULL OUTER JOIN
    (
       SELECT 
           brand,
           ROUND(AVG(rating)::numeric, 2) AS average_rating_without_badge
       FROM products
       WHERE price_badge IS NULL
       GROUP BY brand
    ) b
ON a.brand = b.brand
ORDER BY brand;

-- Direct comparision of Milwaukee and Dewalt 
SELECT brand, 
ROUND(AVG(price)::numeric, 2) AS avg_price, 
ROUND(AVG(price_saving)::numeric, 2) AS avg_price_saving, 
ROUND(AVG(percentage_off)::numeric, 2) AS avg_percentage_off,
ROUND(AVG(rating)::numeric, 2) AS avg_rating,
COUNT(*) AS total_items
FROM products
WHERE brand = 'Dewalt' OR brand = 'Milwaukee'
GROUP BY brand
ORDER BY brand
-- Compare gaps between base price and discounted price between brands
SELECT brand, 
ROUND(AVG(price)::numeric, 2) AS avg_price, 
ROUND(AVG(price_saving)::numeric, 2) AS avg_price_saving, 
ROUND(AVG(percentage_off)::numeric, 2) AS avg_percentage_off,
ROUND(AVG(rating)::numeric, 2) AS avg_rating,
COUNT(*) AS total_items
FROM products
GROUP BY brand
ORDER BY avg_price DESC
-- Compare ratings between discounted items and non discounted ones
SELECT
  brand,
  ROUND(AVG(CASE WHEN price_was IS NOT NULL THEN price_was END)::numeric, 2) AS discount_false,
  ROUND(AVG(CASE WHEN price_was IS NOT NULL THEN price END)::numeric, 2) AS discount_true,
  ROUND(AVG(rating)::numeric, 2) AS avg_rating
FROM products
GROUP BY brand
ORDER BY brand;









