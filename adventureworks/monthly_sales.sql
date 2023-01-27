-- ------------------------------------------------------
-- New script in Adventureworks.
-- Date: Jan 24, 2023
-- Time: 12:18:18 AM
-- Author: İrem Kurt
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Changelog
-- Change Date-YYYYMMDD-, Person 
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Sales table review
-- ------------------------------------------------------

SELECT
	*
FROM
	sales.salesorderheader;
	
-- ------------------------------------------------------
-- Max order date
-- 2014-06-30
-- ------------------------------------------------------

SELECT
	MAX(orderdate)
FROM
	sales.salesorderheader;
	
-- ------------------------------------------------------
-- *********************TOTAL SALES**********************
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Dec 2013 monthly sales $
-- 4,560,577.0958$
-- ------------------------------------------------------

SELECT
	SUM(totaldue) AS monthly_sales
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2013-12-01' AND '2013-12-31';

-- ------------------------------------------------------
-- Nov 2013 monthly sales $
-- 3,694,667.9998$
-- ------------------------------------------------------

SELECT
	SUM(totaldue) AS monthly_sales
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2013-11-01' AND '2013-11-30';

-- ------------------------------------------------------------------------
-- Δ(201311-201312) = 23%
--
-- (4,560,577.0958 - 3,694,667.9998) / 3,694,667.9998 * 100 = 23% increase
-- ------------------------------------------------------------------------

-- ------------------------------------------------------
-- Dec 2012 monthly sales $
-- 3,176,848.1687$
-- ------------------------------------------------------

SELECT
	SUM(totaldue) AS monthly_sales
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2012-12-01' AND '2012-12-31';

-- ---------------------------------------------------------------------
-- Δ(201212-201312) = 43%
--
-- 456057.0958 - 3,176,848.1687) / 3,176,848.1687 * 100 =  43% increase
-- ---------------------------------------------------------------------

-- ------------------------------------------------------
-- *********************TOTAL ORDER**********************
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Dec 2013 total orders
-- 175
-- ------------------------------------------------------

SELECT
	COUNT(purchaseordernumber)
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2013-12-01' AND '2013-12-31';

-- ------------------------------------------------------
-- Nov 2013 total orders
-- 96
-- ------------------------------------------------------

SELECT
	COUNT(purchaseordernumber)
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2013-11-01' AND '2013-11-30';


-- ------------------------------------------------------
-- Dec 2012 total orders
-- 132
-- ------------------------------------------------------

SELECT
	COUNT(purchaseordernumber)
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2012-12-01' AND '2012-12-31';


-- -------------------------------------------------------
-- *********************TOTAL CUSTOMER********************
-- -------------------------------------------------------

-- ------------------------------------------------------
-- Dec 2013 total customer
-- 1,970
-- ------------------------------------------------------

SELECT
	COUNT(DISTINCT(customerid))
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2013-12-01' AND '2013-12-31';

-- ------------------------------------------------------
-- Nov 2013 total customer
-- 2,041
-- ------------------------------------------------------

SELECT
	COUNT(DISTINCT(customerid))
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2013-11-01' AND '2013-11-30';


-- ------------------------------------------------------
-- Dec 2012 total orders
-- 378
-- ------------------------------------------------------

SELECT
	COUNT(DISTINCT(customerid))
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2012-12-01' AND '2012-12-31';

-- ------------------------------------------------------
-- Monthly summary
-- ------------------------------------------------------

SELECT
	EXTRACT(YEAR FROM soh.orderdate) AS order_year,
	EXTRACT(MONTH FROM soh.orderdate) AS order_month,
	SUM(soh.subtotal) AS subtotal,
	-- COUNT(CASE WHEN soh.status = 2 THEN soh.purchaseordernumber ELSE NULL END) order_count,
	-- COUNT(CASE WHEN soh.status = 6 THEN 1 ELSE NULL END) cancel_count,
	COUNT(soh.salesorderid) AS total_order_count,
	COUNT(DISTINCT soh.customerid) AS distinct_cust,
	SUM(sod.orderqty) AS unit_quantity,
	COUNT(soh.salesorderid) / COUNT(DISTINCT soh.customerid) AS avg_order_per_person,
	SUM(soh.subtotal) / COUNT(soh.salesorderid) AS avg_order_amount,
	SUM(soh.subtotal) / COUNT(DISTINCT soh.customerid) AS avg_order_amt_p_person
FROM
	sales.salesorderheader soh
JOIN
	sales.salesorderdetail sod
	ON soh.salesorderid = sod.salesorderid
WHERE
	soh.orderdate BETWEEN '2012-01-01' AND '2013-01-25'
	AND soh.status = 5 --IN (2, 6) -- 2 = Approved, 6 = Cancelled, 5 = Shipped
GROUP BY
	EXTRACT(YEAR FROM soh.orderdate),
	EXTRACT(MONTH FROM soh.orderdate);

-- Table check
SELECT *
FROM
	sales.salesorderheader soh
WHERE
	soh.orderdate = '2012-07-31' --BETWEEN '2013-07-01' AND '2013-07-25'
--LIMIT 100
;

SELECT * FROM sales.salesorderdetail sod LIMIT 100;


-- ------------------------------------------------------
-- 2012 summary
-- ------------------------------------------------------

SELECT
	EXTRACT(YEAR FROM soh.orderdate) AS order_year,
	EXTRACT(MONTH FROM soh.orderdate) AS order_month,
	SUM(soh.subtotal) AS subtotal,
	-- COUNT(CASE WHEN soh.status = 2 THEN soh.purchaseordernumber ELSE NULL END) order_count,
	-- COUNT(CASE WHEN soh.status = 6 THEN 1 ELSE NULL END) cancel_count,
	COUNT(soh.salesorderid) AS total_order_count,
	COUNT(DISTINCT soh.customerid) AS distinct_cust,
	SUM(sod.orderqty) AS unit_quantity,
	COUNT(soh.salesorderid) / COUNT(DISTINCT soh.customerid) AS avg_order_per_person,
	SUM(soh.subtotal) / COUNT(soh.salesorderid) AS avg_order_amount,
	SUM(soh.subtotal) / COUNT(DISTINCT soh.customerid) AS avg_order_amt_p_person
FROM
	sales.salesorderheader soh
JOIN
	sales.salesorderdetail sod
	ON soh.salesorderid = sod.salesorderid
WHERE
	soh.orderdate BETWEEN '2012-01-01' AND '2012-12-31'
	AND soh.status = 5 --IN (2, 6) -- 2 = Approved, 6 = Cancelled, 5 = Shipped
GROUP BY
	EXTRACT(YEAR FROM soh.orderdate),
	EXTRACT(MONTH FROM soh.orderdate);




















