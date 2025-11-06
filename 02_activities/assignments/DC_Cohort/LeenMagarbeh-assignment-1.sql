/* Leen Magarbeh
--DC cohort
--SQL Assignment 1 */

/* SECTION 2 */
/* SELECT */
/* Write a query that returns everything in the customer table*/
SELECT *
FROM customer;


/* Write a query that displays all of the columns and
10 rows from the customer table, sorted by customer_last_name, then customer_first_ name.*/


SELECT *
FROM customer 
ORDER BY customer_last_name, customer_first_name
LIMIT 10;


/*WHERE*/
/*Write a query that returns all customer purchases of product IDs 4 and 9.*/
SELECT *
FROM customer_purchases
WHERE  product_id IN (4,9);

/*Write a query that returns all customer purchases and a new calculated column 'price' (
quantity * cost_to_customer_per_qty), filtered by customer IDs between 8 and 10 (inclusive) using either:
two conditions using AND
one condition using BETWEEN*/

SELECT 
  customer_id,
  quantity,
  cost_to_customer_per_qty,
  (quantity * cost_to_customer_per_qty) AS price
FROM customer_purchases
WHERE customer_id BETWEEN 8 AND 10;

/*CASE*/
/*Products can be sold by the individual unit 
or by bulk measures like lbs. or oz. 
Using the product table, write a query that outputs the product_id and product_name columns 
and add a column called prod_qty_type_condensed 
that displays the word “unit” if the product_qty_type is “unit,” and otherwise displays the word “bulk.”*/

Select 
product_id
,product_name
,CASE WHEN product_qty_type= 'unit' THEN 'unit'
	ELSE 'bulk'
END as prod_qty_type_condensed

FROM product;

/*We want to flag all of the different types of pepper products that are sold at the market. 
Add a column to the previous query called pepper_flag that outputs a 1 
if the product_name contains the word “pepper” (regardless of capitalization), and otherwise outputs 0.*/

Select 
product_id
,product_name
,CASE WHEN product_qty_type= 'unit' THEN 'unit'
	ELSE 'bulk'
END as prod_qty_type_condensed

,CASE WHEN product_name LIKE '%pepper%' THEN 1
	ELSE 0
END as pepper_flag

FROM product; 

/*JOIN*/
/*Write a query that INNER JOINs the vendor table to the vendor_booth_assignments table on the vendor_id 
field they both have in common, and sorts the result by vendor_name, then market_date.*/

SELECT   
v.vendor_id,
vendor_name, 
market_date


FROM vendor as v
INNER JOIN vendor_booth_assignments as vba
	ON v.vendor_id= vba.vendor_id
	
ORDER BY vendor_name, market_date;

/* SECTION 3 */

/* AGGREGATE*/
/* Write a query that determines how many times each vendor has rented a booth 
at the farmer’s market by counting the vendor booth assignments per vendor_id.*/

SELECT 
vendor_name,
vba.vendor_id,
COUNT(booth_number) AS booth_rentals_by_vender
	
FROM vendor_booth_assignments AS vba
INNER JOIN vendor AS v
    ON v.vendor_id = vba.vendor_id
GROUP BY vba.vendor_id, v.vendor_name;

/*The Farmer’s Market Customer Appreciation Committee wants to give a bumper sticker to
 everyone who has ever spent more than $2000 at the market. 
 Write a query that generates a list of customers for them to give stickers to, 
 sorted by last name, then first name.
HINT: This query requires you to join two tables, use an aggregate function, 
and use the HAVING keyword.*/

SELECT 
 cp.customer_id
 ,customer_first_name
 ,customer_last_name
 ,SUM(quantity*cost_to_customer_per_qty) as total_spend
 
 FROM customer_purchases as cp
INNER JOIN customer AS c
    ON c.customer_id = cp.customer_id
GROUP BY cp.customer_id
HAVING total_spend > 2000
ORDER BY customer_last_name, customer_first_name; 

/*Temp Table*/
/*Insert the original vendor table into a temp.new_vendor 
and then add a 10th vendor: Thomass Superfood Store, a Fresh Focused store, 
owned by Thomas Rosenthal */

DROP TABLE IF EXISTS temp.new_vendor;

--make the table
CREATE TABLE temp.new_vendor AS

-- definition of the table
SELECT *
FROM vendor;


--To insert the new row use VALUES, specifying the value you want for each column:

INSERT INTO temp.new_vendor
(vendor_id, vendor_name, vendor_type, vendor_owner_first_name, vendor_owner_last_name)
VALUES
(10, 'Thomass Superfood Store', 'Fresh Focused', 'Thomas', 'Rosenthal');

/*Date*/
/*Get the customer_id, month, and year (in separate columns) 
of every purchase in the customer_purchases table.
/*HINT: you might need to search for strfrtime modifers sqlite 
on the web to know what the modifers for month and year are!*/

SELECT 
customer_id,
STRFTIME('%m', market_date) AS month,
STRFTIME('%Y', market_date) AS year

FROM customer_purchases;



/*Using the previous query as a base, determine how much money each customer spent in April 2022.
 Remember that money spent is quantity*cost_to_customer_per_qty.*/
/*HINTS: you will need to AGGREGATE, GROUP BY, and filter..
.but remember, STRFTIME returns a STRING for your WHERE statement!!*/

SELECT 
customer_id,
STRFTIME('%m', market_date) AS month,
STRFTIME('%Y', market_date) AS year,
SUM(quantity*cost_to_customer_per_qty) as total_spend
 
FROM customer_purchases

GROUP BY customer_id, month, year

HAVING month = '04' AND year = '2022';







