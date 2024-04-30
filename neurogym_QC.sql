-- Table creation & QC checks file

-- Contents:
-- Create table statement
-- QC check examples


-- Create table statement

CREATE TABLE student.vc_neurogym
(
id varchar(20) NULL,
start_date date NULL,
leaving_date date NULL
);


-- QC check examples

-- 1) row count
SELECT 
	count(*) AS no_of_rows
FROM
	student.vc_neurogym vn ;
-- 50000
-- agreed with result in source


-- 2) column count
SELECT 
	count(*) AS no_of_columns
FROM
	information_schema.columns
WHERE 
	table_name = 'vc_neurogym';
-- 3
-- agreed with result in source


-- 3) null value checks
-- id
SELECT
	id
FROM
	student.vc_neurogym vn 
WHERE
	TRIM(id) IS NULL;

-- start_date
SELECT
	start_date 
FROM
	student.vc_neurogym vn 
WHERE
	start_date IS NULL;

-- leaving_date
SELECT
	leaving_date 
FROM
	student.vc_neurogym vn 
WHERE
	leaving_date IS NULL;

-- 0 null values detected


-- 4) check start date after leaving date
SELECT
	count(id) AS num_days
FROM
	student.vc_neurogym vn 
WHERE
	leaving_date < start_date;
-- 0 start days after leaving days


-- 5) random checks
-- id = AQyHlLAb
SELECT
	*
FROM
	student.vc_neurogym
WHERE 
	id = 'AQyHlLAb';
-- agreed with result in source

-- id = ZXYHcpLG
SELECT
	*
FROM
	student.vc_neurogym
WHERE 
	id = 'ZXYHcpLG';
-- agreed with result in source

-- id = nE6B94cM
SELECT
	*
FROM
	student.vc_neurogym
WHERE 
	id = 'nE6B94cM';
-- agreed with result in source

-- id = YhoqZFW2
SELECT
	*
FROM
	student.vc_neurogym
WHERE 
	id = 'YhoqZFW2';
-- agreed with result in source

-- id = EvuXt3ZU
SELECT
	*
FROM
	student.vc_neurogym
WHERE 
	id = 'EvuXt3ZU';
-- agreed with result in source

-- all QC checks passed!!