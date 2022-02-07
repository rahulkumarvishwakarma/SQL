
## 1. Write a query to display the Customer_Name and Customer Segment using alias 
# name “Customer Name", "Customer Segment" from table Cust_dimen. 

select customer_name,customer_segment from rk.cust_dimen;

## 2. Write a query to find all the details of the customer from the table cust_dimen 
## order by desc.


select * from rk.cust_dimen order by customer_name desc; 

## 3. Write a query to get the Order ID, Order date from table orders_dimen where 
## ‘Order Priority’ is high.



select order_id,order_date,Order_Priority 
from rk.orders_dimen
where Order_Priority like 'high';


## 4. Find the total and the average sales (display total_sales and avg_sales)

select sum(sales) as total_sales, avg(sales) as avg_sales
from rk.market_fact;


## 5. Write a query to get the maximum and minimum sales from maket_fact table


select max(sales), min(sales) from rk.market_fact;

##6. Display the number of customers in each region in decreasing order of 
## no_of_customers. The result should contain columns Region, no_of_customers


select * from rk.cust_dimen;

select Region,Cust_id from rk.cust_dimen order by Cust_id asc;


## 7. Find the region having maximum customers (display the region name and 
## max(no_of_customers)

select Region,count(*) from rk.cust_dimen group by Region;



## 8. Find all the customers from Atlantic region who have ever purchased ‘TABLES’ 
## and the number of tables purchased (display the customer name, no_of_tables 
# purchased)


select region,Customer_Segment,count(*)
from rk.cust_dimen where region like '%atlantic'and Customer_Segment
 like '%consumer' group by Customer_Segment;

## 9. Find all the customers from Ontario province who own Small Business. (display 
# the customer name, no of small business owners)

select region,Customer_Segment,Customer_Name
from rk.cust_dimen where region like '%ontario' and Customer_Segment 
like '%small business'  ;

## 10. Find the number and id of products sold in decreasing order of products sold 
## (display product id, no_of_products sold) 

select prod_id, count(*) as no_of_product_sold from rk.market_fact
 group  by prod_id order by no_of_product_sold desc ;


## 11. Display product Id and product sub category whose produt category belongs to 
##  Furniture and Technlogy. The result should contain columns product id, product 
## sub category.



select * from rk.prod_dimen;
  
select prod_id,product_sub_category,Product_Category
 from rk.prod_dimen order by Product_Category ;
 
 ## 12. Display the product categories in descending order of profits (display the product 
#####   category wise profits i.e. product_category, profits)?
 
  
  select product_category,profit from rk.prod_dimen profit,rk.market_fact 
  order by profit,Product_Category desc ;
  
  
  ### 13. Display the product category, product sub-category and the profit within each 
 ##       subcategory in three columns. 
  
  
    select product_category,Product_Sub_Category,Profit from rk.prod_dimen profit,rk.market_fact ;
  
  ## 14. Display the order date, order quantity and the sales for the order.
  
  
  select a.Order_Quantity,a.Sales,b.order_date from rk.market_fact as a
  inner join rk.orders_dimen as b on a.Ord_id=b.Ord_ID ;
  
# 15. Display the names of the customers whose name contains the 
 # i) Second letter as ‘R’
 # ii) Fourth letter as ‘D’
  
 select Customer_Name from rk.cust_dimen 
 where Customer_Name like '_r%'
 and Customer_Name like '___d%';
 
   
 ##  16. Write a SQL query to to make a list with Cust_Id, Sales, Customer Name and 
### their region where sales are between 1000 and 5000.

 select * from rk.cust_dimen;
 
 select * from rk.market_fact;
 
  
  select b.Cust_id, a.customer_name,a.region,b.sales from rk.cust_dimen as a
  inner join rk.market_fact as b 
  on a.Cust_id = b.Cust_id where sales between 1000 and 5000 ;
  
  
  ## 17. Write a SQL query to find the 3rd highest sales.
  
  
   select sales  from (select sales
  from rk.market_fact order by sales desc limit 3 )
  as comp order by sales limit 1;
  
  
 ## 18. Where is the least profitable product subcategory shipped the most? For the least 
## profitable product sub-category, display the region-wise no_of_shipments and 
## the profit made in each region in decreasing order of profits (i.e. region, 
## no_of_shipments, profit_in_each_region)
  
  select * from rk.market_fact;
  
 select * from rk.shipping_dimen; 
  
  
  select a.region,b.profit,c.product_sub_category from rk.cust_dimen as a,rk.market_fact as b,
  rk.prod_dimen as c where a.cust_id=b.Cust_id and b.Prod_id=c.Prod_id order by Profit desc;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  