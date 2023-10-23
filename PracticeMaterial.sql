select case when p.patient_id in(select distinct patient_id from admissions) then null 
else p.patient_id end
as patients_no_admissions , first_name, last_name 
from patients as p
where patients_no_admissions is not null;

select patients.patient_id, first_name, last_name from patients
left join admissions on patients.patient_id = admissions.patient_id
where admissions.patient_id is null;

select patient_id, first_name, last_name
from patients
where patient_id not in(select distinct patient_id from admissions);

select count(*) as patient_count, weight/10*10 as weight_group from patients
group by weight_group
order by weight_group desc

select height from patients;

select patient_id, weight, height,
case when weight/(height/100.0 * height/100.0) >=30 then 1 else 0 end as isObese
from patients;

select p.patient_id, p.first_name, p.last_name, specialty from patients as p
join admissions as a on p.patient_id = a.patient_id
join doctors as d on a.attending_doctor_id = d.doctor_id
where a.diagnosis = 'Epilepsy' and d.first_name = 'Lisa';

select patients.patient_id, concat(patients.patient_id,len(last_name),year(birth_date)) from patients
left join admissions
on patients.patient_id = admissions.patient_id
where admissions.patient_id is not null
group by patients.patient_id;

select patients.patient_id, concat(patients.patient_id,len(last_name),year(birth_date)) from patients
join admissions
on patients.patient_id = admissions.patient_id
group by patients.patient_id;

select case when patient_id%2 = 0 then 'Yes'else 'No' end as hasInsurance,
count(*)*case when patient_id%2=0 then 10 else 50 end as total_amount from admissions
group by hasInsurance;

select province_name from province_names
join patients on province_names.province_id = patients.province_id
group by province_name
having sum(case when gender = 'M' then 1 end) > sum(case when gender = 'F' then 1 end);

select * from patients
where first_name like '__r%' 
  and gender = 'F' \
  and month(birth_date) in (2,5,12)
  and weight between 60 and 80 
  and patient_id%2 = 1 
  and city = 'Kingston';


select concat(cast(floor(cast(sum(case when gender = 'M' then 1 end) as float)/count(*)*10000) as float)/100,'%') from patients;

select round(100* avg(gender ='M'),2) from patients


select patient_id, lag(patient_id) over() - patient_id from admissions;


select admissions.admission_date, count(*) as admission_count, lag(lagging.admission_count) over() - admission_count from admissions
join (select admission_date, count(*) as admission_count from admissions group by admission_date) as lagging
group by admissions.admission_date;

select a.admission_date,count(*) as admission_count, admission_count - lag(l.admission_count) over() from admissions as a
join (select admission_date, count(*) as admission_count from admissions group by admission_date) as l
where a.admission_date = l.admission_date
group by a.admission_date;

select admission_date, count(*) as admission_count, 
count(*) - lag(count(*)) over(order by admission_date) as difference_with_previous_day
from admissions
group by admission_date;


with admisson_count_table as (
	select admission_date, count(*) as admission_count from admissions
  	group by admission_date
  	order by admission_date
)
select admission_date, admission_count, 
admission_count - lag(admission_count) over(order by admission_date)
as admission_count_change
from admisson_count_table;

select 'Ontario'
union all
select province_name from province_names
where province_name != 'Ontario';

select province_name from province_names
order by province_name != 'Ontario', province_name;


select category_name, description from categories
order by category_name;

select contact_name, address, city from customers
where country not in('Germany','Mexico','Spain');

select order_date, shipped_date, customer_id, freight from orders
where order_date = '2018-02-26';

select employee_id, order_id, customer_id, required_date, shipped_date from orders
where shipped_date > required_date;

select order_id from orders
where order_id%2 = 0;

select city,company_name, contact_name from customers 
where city like '%L%'
order by contact_name;

select company_name, contact_name, fax from customers
where fax is not null;

select first_name, last_name, hire_date from employees
order by hire_date desc limit 1;

select Round(avg(unit_price), 2) as average_unit_price, sum(units_in_stock) as total_units_in_stock,
sum(discontinued) as total_discontinued from products;

select product_name, company_name, category_name from products, suppliers, categories
where products.category_id = categories.category_id 
and suppliers.supplier_id = products.supplier_id;

select category_name, round(avg(unit_price),2) as average_unit_price from products
join categories on categories.category_id = products.category_id
group by category_name;

select city, company_name, contact_name, 'customers' as relationship from customers
union
select city, company_name, contact_name, 'suppliers'from suppliers

select first_name, last_name, count(order_id) as num_orders, 
case when shipped_date < required_date then 'On Time' else 'Late' end as Shipped
from employees as e join orders as o on e.employee_id = o.employee_id
group by e.employee_id, Shipped
order by last_name, first_name, num_orders desc;