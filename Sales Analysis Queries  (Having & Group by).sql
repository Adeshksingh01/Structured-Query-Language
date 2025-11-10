create database company1;

use company1;

SELECT * FROM company1.sql_work_04;

alter table sql_work_04 rename sale;

select * from sale;

#1.Find total sales amount for each region.
select region, sum(price) as "Sales amount"
from sale
group by region;

#2.Find total quantity sold by each sales_person.
select sales_person, sum(quantity) as "Total quantity"
from sale
group by sales_person;

#3.Show categories where total quantity sold is more than 30.
select category, sum(quantity) as "Total quantity"
from sale
group by category
having sum(quantity) > 30;

#4.Find total revenue by each categories.
select category, sum(price * quantity) as "Total revenue"
from sale
group by category;

#5. Find sales_person who sold total quantity more than 20.
select sales_person, sum(quantity) as "Total quantity"
from sale
group by sales_person
having sum(quantity) > 20;

#6. Fund region-wise average sale price.
select region, avg(price) as "Average sale price"
from sale
group by region;

#7. Find total revenue for each sales_person and show only those having revenue above 300000. 
select sales_person, sum(price * quantity) as Revenue
from sale
group by sales_person
having sum(price * quantity) > 300000;

#8. Find how many products each category.
select category, count(product) as product
from sale
group by category;

#9.Find total sales per months.
#(i)..
select monthname(sale_date) as "Months",
sum(price) as "Total Sale"
from sale
group by monthname(sale_date);

#(ii)..
select extract(month from sale_date) as "Months",
sum(price) as "Total sale"
from sale
group by extract(month from sale_date);

#(iii)..
select month(sale_date) as "Months",
sum(price) as "Total Sale"
from sale
group by month(sale_date);

#10. Find each region's maximum sale price.
select region, max(price) as "Maximum Sale Price"
from sale
group by region;

#11. Find each category's average quantity sold, but show only where avg > 10.
select category, avg(quantity) as "Average Quantity Sold"
from sale
group by category
having avg(quantity) > 10;

#12. Find total revenue by each region and category.
select category, sum(price * quantity) as "Total Revenue", region
from sale 
group by category, region
order by category, region;

#13. Find how many sales each sales_person made in each region.
select sales_person, region, sum(price) as sales
from sale
group by sales_person, region
order by sales_person, region;

#14. Find the region where total quantity sold exceeds 20.
select region, sum(quantity) as "Total sold"
from sale
group by region
having sum(quantity) > 20;

#15. Find sales_person who sold in more one region.
select sales_person, count(region) as Region
from sale
group by sales_person
having count(region) > 1;

#16. Find category having total revenue between 200000 and 1000000.
select category, sum(price * quantity) as "Total Revenue"
from sale
group by category
having sum(price * quantity) between 200000 and 1000000;

#17. Find top 1 category with the highest total sales.
select category, sum(price) as "Highest Total Sale"
from sale 
group by category
order by "Highest Total Sale" DESC
limit 1;

#18. Find sales_person's average sale value per transaction.
select sales_person, avg(price) as "Average sale"
from sale
group by sales_person;

#19. Find category with minimum average price greater than 20000.
select category, avg(price) as "Minimum average"
from sale
group by category
having avg(price) > 20000
order by "Minimum average";

#20. Find region and sales_person combination where revenue > 200000.
select region, sales_person, sum(price * quantity) as Revenue
from sale
group by region, sales_person
having sum(price * quantity) > 200000;
