-- Preamble 
-- Purpose: Prepares the analysis dataset.
-- Author: Jing Liang,
-- Date: 13 November 2024
-- Contact: jess.liang@mail.utoronto.ca
-- License: MIT
-- Pre-requisites:  Ensure the raw dataset (.sqlite) is downloaded from https://jacobfilipp.com/hammer/


-- Join the product and raw tables to analyze price trends and product attributes
CREATE TABLE full_data AS
SELECT
    p.id AS product_id,
    p.vendor,
    p.product_name,
    p.units,
    p.brand,
    r.nowtime,
    r.current_price,
    r.old_price,
    r.price_per_unit
FROM
    product p
JOIN
    raw r
ON
    p.id = r.product_id;

-- View for average price trends by vendor
CREATE TABLE analysis_data AS
SELECT 
    vendor,
    AVG(CAST(current_price AS REAL)) AS avg_current_price,
    AVG(CAST(old_price AS REAL)) AS avg_old_price
FROM 
    full_data
GROUP BY 
    vendor;
