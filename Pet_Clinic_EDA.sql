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

