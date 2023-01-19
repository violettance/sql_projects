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

