-- New script in websites1673686793216vhvostdyfjvmizum.
-- Date: Jan 15, 2023
-- Time: 7:26:53 PM
-- Author: İrem Kurt

-- ------------------------------------------------------
-- Changelog
-- Change Date-20230119-, Irem Kurt 

-- ------------------------------------------------------
-- Customers table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.customers;
	
-- ---------------------------------------------------------------------------------------------
-- Groups and counts the city column in customer table and orders by count in descending order
-- ---------------------------------------------------------------------------------------------

SELECT
	city,
	COUNT(*)
FROM
	public.customers
GROUP BY
	city
ORDER BY
	COUNT(*) DESC;


-- ---------------------------------------------------------------------------------------------
-- Groups and counts the state column in customer table and orders by count in descending order
-- Note that filtering out any rows that have null values in the state column
-- ---------------------------------------------------------------------------------------------

SELECT 
    state, 
    COUNT(*) 
FROM 
    public.customers 
WHERE 
    state IS NOT NULL 
GROUP BY 
    state 
ORDER BY 
    COUNT(*) DESC;
   
-- ---------------------------------------------------------------------------------------------
-- Groups and counts the country column in customer table and orders by count in descending order
-- Note that filtering out any rows that have null values in the state column
-- ---------------------------------------------------------------------------------------------

SELECT 
    country, 
    COUNT(*) 
FROM 
    public.customers 
WHERE 
    country IS NOT NULL 
GROUP BY 
    country 
ORDER BY 
    COUNT(*) DESC;
   
-- -----------------------------------------------------------------------------------------------------
-- Groups and counts the state column in customer table and orders by count in descending order for USA  
-- Note that filtering out any rows that have null values in the state column
-- -----------------------------------------------------------------------------------------------------

SELECT 
    state, 
    COUNT(*) 
FROM 
    public.customers 
WHERE 
    state IS NOT NULL AND country = 'USA'
GROUP BY 
    state 
ORDER BY 
    COUNT(*) DESC;

-- ------------------------------------------------------
-- Min, max, sum and avarage of credit_limit
-- ------------------------------------------------------
   
SELECT
	MIN(credit_limit) AS min_credit_limit,
	MAX(credit_limit) AS max_credit_limit,
	SUM(credit_limit) AS total_credit_limit,
	AVG(credit_limit) AS avg_credit_limit
FROM
	public.customers;

-- ------------------------------------------------------
-- All customers name who have 0 credit limit
-- ------------------------------------------------------

SELECT
	customer_number,
	customer_name,
	city,
	sales_rep_employee_number
FROM
	public.customers
WHERE
	credit_limit = 0;

-- ------------------------------------------------------
-- ******************************************************
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Employees table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.employees;

-- ----------------------------------------------------------------------
-- Employee numbers who have customers with 0 credit limit (1286 & 1702)
-- We can reach their manager (1143 & 1102)
-- ----------------------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.employees
WHERE
	employee_number = 1102;

-- ------------------------------------------------------
-- ******************************************************
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Offices table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.offices;

-- ------------------------------------------------------
-- ******************************************************
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Orders table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.orders;

-- ------------------------------------------------------
-- Orders table group by status
-- ------------------------------------------------------

SELECT
	status,
	count(*)
FROM
	public.orders
GROUP BY
	status;

-- ------------------------------------------------------
-- Orders table group by order_month 
-- ------------------------------------------------------
SELECT
	EXTRACT(
		MONTH
	FROM
		order_date
	) AS MONTH,
	count(*)
FROM
	public.orders
GROUP BY
	MONTH
ORDER BY
	MONTH;


-- ------------------------------------------------------
-- Joining tables
-- ------------------------------------------------------
--
SELECT
	public.customers.country,
	AVG(public.payments.amount)
FROM
	public.customers
INNER JOIN public.payments ON
	public.customers.customer_number = public.payments.customer_number
GROUP BY
	customers.country;

-- ------------------------------------------------------
-- Customers table where location is Switzerland
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.customers
WHERE
	country = 'Switzerland';
	

-- ------------------------------------------------------
-- ******************************************************
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Payment table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.payments;

-- ------------------------------------------------------
-- ******************************************************
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Payment table review
-- ------------------------------------------------------

SELECT
	count(*)
FROM
	public.products;

-- ------------------------------------------------------
-- Payment table review
-- ------------------------------------------------------

SELECT
	product_line,
	AVG(buy_price)
FROM
	public.products
GROUP BY
product_line;

-- ------------------------------------------------------
-- Most expensive Classic Car is 1962 LanciaA Delta 16V
-- ------------------------------------------------------

SELECT
	product_name, buy_price 
FROM
	public.products
WHERE	
	product_line = 'Classic Cars'
ORDER BY buy_price DESC;
