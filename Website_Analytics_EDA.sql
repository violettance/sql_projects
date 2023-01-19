-- New script in websites1673686793216vhvostdyfjvmizum.
-- Date: Jan 16, 2023
-- Time: 2:18:55 PM
-- Author: İrem Kurt

-- ------------------------------------------------------
-- Changelog
-- Change Date-20230116-, İrem Kurt 

-- ------------------------------------------------------
-- Websites table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.websites;

-- ------------------------------------------------------
-- Websites table rating count
-- ------------------------------------------------------

SELECT
	count(*)
FROM
	public.websites
GROUP BY
	rating;
	
-- ------------------------------------------------------
-- The number of website users created per year
-- ------------------------------------------------------

SELECT 
	EXTRACT(YEAR FROM TO_DATE(created_at, 'YYYY-MM-DD')) as year, 
	COUNT(*) 
FROM
	public.websites 
WHERE 
	EXTRACT(YEAR FROM TO_DATE(created_at, 'YYYY-MM-DD')) IN (2021, 2020) 
GROUP BY 
	year;


-- ----------------------------------------------------------------------------
-- Extracts the name extension from the domain column and count the extentions
-- ----------------------------------------------------------------------------

/*
SELECT 
  extension, 
  COUNT(*) as count 
FROM 
  (
    SELECT 
      substring(
        domain 
        from 
          position('.' in domain) + 1
      ) as extension 
    FROM 
      public.websites
  ) subquery 
GROUP BY 
  extension 
ORDER BY 
  count DESC;
*/

-- ----------------------------------------------------------------------------
-- Extracts the name extension from the domain column without using subquery
-- ----------------------------------------------------------------------------
 
 SELECT 
  substring(domain from position('.' in domain) + 1) as extension,
  COUNT(*) as count 
FROM 
  public.websites
GROUP BY 
  extension 
ORDER BY
  count DESC;
 
-- ------------------------------------------------------------------------------
-- Extracts the name extension from the owner_email column without using subquery
-- ------------------------------------------------------------------------------
 
 SELECT 
  substring(owner_email from position('@' in owner_email) + 1) as extension,
  COUNT(*) as count 
FROM 
  public.websites
GROUP BY 
  extension 
ORDER BY 
  count DESC;

-- ------------------------------------------------------
-- Visits table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.visits;

-- ------------------------------------------------------
-- Owners table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.owners;

-- --------------------------------------------------------------------
-- Owners table job title count, job titles are unique for each member
-- --------------------------------------------------------------------

SELECT
	job_title,
	count(*)
FROM
	public.owners
GROUP BY
	public.owners.job_title;

-- --------------------------------------------------------------------
-- Owners table job type count, job titles are unique for each member
-- --------------------------------------------------------------------

SELECT
	job_type,
	count(*)
FROM
	public.owners
GROUP BY
	public.owners.job_type;

-- ------------------------------------------------------------------------------------
-- Returns the country and the count of entries for each country in the table "owners"
-- ------------------------------------------------------------------------------------

SELECT
	country,
	count(*)
FROM
	public.owners
GROUP BY
	public.owners.country;
