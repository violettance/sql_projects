-- New script in vet1673958916400rdkfkuwryumrvegx.
-- Date: Jan 20, 2023
-- Time: 2:17:08 PM
-- Author: İrem Kurt

-- ------------------------------------------------------
-- Changelog
-- Change Date-YYYYMMDD-, Person

-- ------------------------------------------------------
-- Animals table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.animals;

-- ------------------------------------------------------
-- Animal ages
-- ------------------------------------------------------

SELECT
	age
FROM
	public.animals
WHERE
	TYPE = 'rabbit'
ORDER BY age;


-- ------------------------------------------------------
-- Group by type of the animals
-- ------------------------------------------------------

SELECT
	TYPE,
	count(*)
FROM
	public.animals
GROUP BY
	TYPE
ORDER BY
	count(*) DESC;
	

-- ------------------------------------------------------
-- Average age by type of animals
-- ------------------------------------------------------

SELECT
	TYPE,
	AVG(age)
FROM
	public.animals
GROUP BY
	TYPE
ORDER BY
	AVG(age) DESC;


-- ------------------------------------------------------
-- ******************************************************
-- ------------------------------------------------------
-- ------------------------------------------------------
-- Appointments table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.appointments;

-- ------------------------------------------------------
-- Appointment days on November
-- ------------------------------------------------------

SELECT
	date_part('day', to_timestamp(appointment_date, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')),
	COUNT(*)
FROM
	public.appointments
GROUP BY
	date_part;


-- ------------------------------------------------------
-- 20 Nov: Confirmed count by appointments time
-- ------------------------------------------------------

SELECT
	date_part('hour', to_timestamp(appointment_date, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')) AS HOUR,
	COUNT(CASE WHEN confirmed = 1 THEN 1 ELSE NULL END) AS confirmed_count
FROM
	public.appointments
WHERE
	date_part('day', to_timestamp(appointment_date, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')) = 20
GROUP BY
	HOUR;

-- ------------------------------------------------------
-- 20 Nov: Unconfirmed count by appointments time
-- ------------------------------------------------------

SELECT
	date_part('hour', to_timestamp(appointment_date, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')) AS HOUR,
	COUNT(CASE WHEN confirmed = 0 THEN 1 ELSE NULL END) AS unconfirmed_count
FROM
	public.appointments
WHERE
	date_part('day', to_timestamp(appointment_date, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')) = 20
GROUP BY
	HOUR;

-- ------------------------------------------------------
-- 19 Nov: Confirmed count by appointments time
-- ------------------------------------------------------

SELECT
	date_part('hour', to_timestamp(appointment_date, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')) AS HOUR,
	COUNT(CASE WHEN confirmed = 1 THEN 1 ELSE NULL END) AS confirmed_count
FROM
	public.appointments
WHERE
	date_part('day', to_timestamp(appointment_date, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')) = 19
GROUP BY
	HOUR;

-- ------------------------------------------------------
-- 19 Nov: Unconfirmed count by appointments time
-- ------------------------------------------------------

SELECT
	date_part('hour', to_timestamp(appointment_date, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')) AS HOUR,
	COUNT(CASE WHEN confirmed = 0 THEN 1 ELSE NULL END) AS unconfirmed_count
FROM
	public.appointments
WHERE
	date_part('day', to_timestamp(appointment_date, 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')) = 19
GROUP BY
	HOUR;


-- ------------------------------------------------------
-- ******************************************************
-- ------------------------------------------------------
-- ------------------------------------------------------
-- Owners table review
-- ------------------------------------------------------

SELECT
	--count(*)
	*
FROM
	public.owners;

-- ------------------------------------------------------
-- Count of owners job role from job title by desc order
-- ------------------------------------------------------

SELECT
	job_role,
	COUNT(*)
FROM
	(
		SELECT
			split_part(job_title, ' ', 3) AS job_role
		FROM
			public.owners
	) AS split_job_role
GROUP BY
	job_role
ORDER BY count(*) DESC;


-- ------------------------------------------------------
-- Count of owners job role from job title by country
-- ------------------------------------------------------

SELECT
	country,
	split_part(job_title, ' ', 3) AS job_role,
	COUNT(*)
FROM
	public.owners
GROUP BY
	country,
	job_role
ORDER BY
	country;

-- ------------------------------------------------------------------------
-- Count of owners job role from job title by country with where statement
-- ------------------------------------------------------------------------

SELECT
    country,
    split_part(job_title, ' ', 3) AS job_role,
    COUNT(*)
FROM
    public.owners
WHERE country = 'Avon'
GROUP BY
    country,
    job_role
ORDER BY
    country;

-- ------------------------------------------------------------------------------
-- Count of owners job role from job title by country, city with where statement
-- ------------------------------------------------------------------------------

SELECT
	city,
    country,
    split_part(job_title, ' ', 3) AS job_role,
    COUNT(*)
FROM
    public.owners
WHERE
	split_part(job_title, ' ', 3) = 'Strategist'
	AND country = 'Borders'
GROUP BY
    country,
    job_role,
    city
ORDER BY
    country;





