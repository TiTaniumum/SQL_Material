-- ms SQL Aggregate functions
use myDB;

-- All aggregate functions:

--APPROX_COUNT_DISTINCT
--APPROX_PERCENTILE_CONT
--AVG
--CHECKSUM_AGG
--COUNT
--COUNT_BIG
--GROUPING
--GROUPING_ID
--MAX
--MIN 
--STDEV
--STDEVP
--STRING_AGG
--SUM
--VAR
--VARP

--APPROX_COUNT_DISTINCT( expression )
--returns the approximate number of unique non-null values in a group.
--This function is designed to provide aggregations
--across large data sets where responsiveness is more critical than absolute precision.
select APPROX_COUNT_DISTINCT(amount) from transactions;
go

--This function returns an approximate interpolated value from the set of values
--in a group based on percentile value and sort specification
--APPROX_PERCENTILE_CONT syntax: 
--APPROX_PERCENTILE_CONT (numeric_literal)
--WITHIN GROUP (ORDER BY order_by_expression [ASC|DESC]) 
--example:
--SELECT DeptId,
--APPROX_PERCENTILE_CONT(0.10) WITHIN GROUP(ORDER BY Salary) AS 'P10',
--APPROX_PERCENTILE_CONT(0.90) WITHIN GROUP(ORDER BY Salary) AS 'P90'
--FROM Employee
--GROUP BY DeptId;

--AVG - return average 
select avg(amount) as amount_avg from transactions;
go

--checksum_agg контрольная сумма
--there is a small chance that checksum will not change
select CHECKSUM_AGG(cast(amount as int)) as amount_checkshum from transactions;
go

-- COUNT return count
select count(distinct amount) as amount_count from transactions
go
-- COUNT_BIG returns the same as COUNT do but bigint type
select COUNT_BIG(amount) as amount_count from transactions;
go

-- Indicates whether a specified column expression in a GROUP BY list is aggregated or not.
select sum(amount) as amount_sum,  order_date, grouping(order_date) as 'grouping' from transactions
group by order_date;
go

-- grouping_id is something about rollups and it uses group by expressions. it returns id of multiple grouping.
-- too long examples so here is the url - https://learn.microsoft.com/en-us/sql/t-sql/functions/grouping-id-transact-sql?view=sql-server-ver16

-- max() returns max obviously 
select max(amount) as amount_max, order_date from transactions
group by order_date;
go

-- min() return min obviously
select min(amount) as amount_min, order_date from transactions
group by order_date;
go

-- stdev В экономике стандартное отклонение - это показатель того, насколько сильно какой либо показатель (например, цена) меняется со временем
select STDEV(amount) as stdev_amount, STDEV(distinct amount) as stdev_amount_distinct from transactions;
go

--Функция StDevP оценивает генеральную совокупность, а StDev — выборку из генеральной совокупности.
select StDevP(amount) as stdevp_amount, StDevP(distinct amount) as stdevp_amount_distinct from transactions;
go

select STDEV(amount) as stdev_amount,
	   StDevP(amount) as stdevp_amount, 
	   STDEV(distinct amount) as stdev_amount_distinct,
	   StDevP(distinct amount) as stdevp_amount_distinct  from transactions;
go

--sum obviously returns sum
select Sum(amount) as amount_sum from transactions;
go

-- String_AGG takes all expressions from rows and concatenates them into a single string
select string_agg(first_name,'; ') as names from customers;
go

-- 'Returns the statistical variance of all values in the specified expression.' - can you understand this? 
-- why the hell they write it like that?!
-- it returns square of stdev
select var(amount) as amount_var from transactions;
go
select varp(amount) as amount_varp from transactions;
go
