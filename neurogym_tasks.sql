-- Task file

-- 1) What is the Minimum Start Date
SELECT
	min(start_date)
FROM 
	student.vc_neurogym vn;
-- 2022-01-01

-- 2) What is the Maximum Start Date
SELECT
	max(start_date)
FROM 
	student.vc_neurogym vn;
-- 2022-12-31

-- 3) Which Start Date has the most customers?
-- 4) How many customers does the start_date with the most customers have? 
SELECT
	start_date,
	count(id) AS no_cust
FROM
	student.vc_neurogym vn 
GROUP BY
	start_date
ORDER BY 
	count(id) desc;
-- 2022-01-23
-- 535

-- 5) Which start date has the least customers? 
-- 6) How many customers does the start_Date with the least customers have? 
SELECT
	start_date,
	count(id) AS no_cust
FROM
	student.vc_neurogym vn 
GROUP BY
	start_date
ORDER BY 
	count(id);
-- 2022-12-06
-- 20

-- 7) - 18) How many customers started in MONTH?
SELECT
	EXTRACT(MONTH FROM start_date) AS MONTH,
	COUNT(id) AS no_cust
FROM 
	student.vc_neurogym vn 
GROUP BY
	EXTRACT(MONTH FROM start_date)
ORDER BY
	MONTH;
--14948
--4028
--3050
--2522
--3952
--5129
--5945
--3479
--2502
--1960
--1493
--992

-- 19) How many customers left in Jan? 
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-01-01' AND '2022-01-31';
-- 419

-- 20) How many customers left in Feb?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-02-01' AND '2022-02-28';
-- 438

-- 21) How many customers left in Mar?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-03-01' AND '2022-03-31';
-- 621

-- 22) How many customers left in Apr?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-04-01' AND '2022-04-30';
-- 689

-- 23) How many customers left in May?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-05-01' AND '2022-05-31';
-- 847

-- 24) How many customers left in Jun?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-06-01' AND '2022-06-30';
-- 999

-- 25) How many customers left in Jul?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-07-01' AND '2022-07-31';
-- 1255

-- 26) How many customers left in Aug?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-08-01' AND '2022-08-31';
-- 1859

-- 27) How many customers left in Sep?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-09-01' AND '2022-09-30';
-- 2263

-- 28) How many customers left in Oct?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-10-01' AND '2022-10-31';
-- 2779

-- 29) How many customers left in Nov?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-11-01' AND '2022-11-30';
-- 3028

-- 30) How many customers left in Dec?
SELECT 
	count(id)
FROM 
	student.vc_neurogym vn  
WHERE 
	leaving_date BETWEEN '2022-12-01' AND '2022-12-31';
-- 2954


-- 31) What is the smallest Tenure (Complete months between Start and End date)
SELECT
	(leaving_date - start_date)/30 AS tenure
FROM
	student.vc_neurogym vn 
ORDER BY
	leaving_date - start_date;
-- 0 months

-- 32) What is the largest Tenure (Complete months between Start and End date)
SELECT
	(leaving_date - start_date)*12/365 AS tenure
FROM
	student.vc_neurogym vn 
ORDER BY
	leaving_date - start_date DESC;
-- 15 months

-- 33) - 44) What is the average tenure of a customer who joined in MONTH?
SELECT
	EXTRACT(MONTH FROM start_date) AS MONTH,
	round(avg(leaving_date - start_date)*12/365, 2) AS avg_tenure
FROM 
	student.vc_neurogym vn 
GROUP BY
	EXTRACT(MONTH FROM start_date)
ORDER BY
	MONTH;
--10.62
--7.73
--7.64
--7.59
--7.64
--10.50
--10.47
--7.75
--7.76
--7.71
--7.55
--7.79


-- 45) For the Cohort who joined in Jan-2022. How many were left by the end of Jan as a %? 
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-01-31';
-- 97

-- 46) For the Cohort who joined in Jan-2022. How many were left by the end of Feb as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-02-28';
-- 95

-- 47) For the Cohort who joined in Jan-2022. How many were left by the end of Mar as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-03-31';
-- 93

-- 48) For the Cohort who joined in Jan-2022. How many were left by the end of Apr as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-04-30';
-- 90

-- 49) For the Cohort who joined in Jan-2022. How many were left by the end of May as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-05-31';
-- 87

-- 50) For the Cohort who joined in Jan-2022. How many were left by the end of Jun as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-06-30';
-- 84

-- 51) For the Cohort who joined in Jan-2022. How many were left by the end of Jul as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-07-31';
-- 82

-- 52) For the Cohort who joined in Jan-2022. How many were left by the end of Aug as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-08-31';
-- 79

-- 53) For the Cohort who joined in Jan-2022. How many were left by the end of Sep as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-09-30';
-- 77

-- 54) For the Cohort who joined in Jan-2022. How many were left by the end of Oct as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-10-31';
-- 74

-- 55) For the Cohort who joined in Jan-2022. How many were left by the end of Nov as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-11-30';
-- 72

-- 56) For the Cohort who joined in Jan-2022. How many were left by the end of Dec as a %?
SELECT 
    count(id) AS num_cust_left,
    100 - (count(id)::float/14948) * 100  AS percentage_left
FROM 
    student.vc_neurogym vn 
WHERE 
	start_date BETWEEN '2022-01-01' AND '2022-01-31'
	AND
	leaving_date BETWEEN '2022-01-01' AND '2022-12-31';
-- 67

-- 57) Subscribers all pay £9.99 a month. Of all the customers who joined in Jan-2021, what is their average simple lifetime value? 

SELECT
	round(avg((leaving_date-start_date)*9.99/31),2) AS avg_simp_lt_val
FROM
	student.vc_neurogym vn
WHERE
	start_date BETWEEN '2022-01-01' AND '2022-01-31';
-- 104.1