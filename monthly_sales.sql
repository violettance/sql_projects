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
-- 2,050
-- ------------------------------------------------------

SELECT
	DISTINCT COUNT(customerid)
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2013-12-01' AND '2013-12-31';

-- ------------------------------------------------------
-- Nov 2013 total customer
-- 2,103
-- ------------------------------------------------------

SELECT
	DISTINCT COUNT(customerid)
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2013-11-01' AND '2013-11-30';


-- ------------------------------------------------------
-- Dec 2012 total orders
-- 132
-- ------------------------------------------------------

SELECT
	DISTINCT COUNT(customerid)
FROM
	sales.salesorderheader
WHERE
	orderdate BETWEEN '2012-12-01' AND '2012-12-31';

