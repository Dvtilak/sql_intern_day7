use ecommercedb;

-- ordersummary 
create view ordersummary as 
select customers.fullname, sum(orders.totalamount) as totalamount, count(orders.orderid) as ordercount from customers
inner join orders
on customers.customerid = orders.customerid
group by customers.customerid;

select * from ordersummary;


-- stocks 
create view stock as
select  productname, price, stock, categoryid from products
where stock>0;

select * from stock;

-- stocks with category name 
create view stocks as
select  productname, price, stock, categoryid,Categories.Cate_name from products
inner join Categories on 
Categories.cate_id = products.categoryid
where stock>0;

select * from stocks;


-- products in high demand 
create view highdemand as 
select products.productname, sum(orderitems.quantity) as placed_orders from orderitems 
inner join products 
on products.productid = orderitems.productid
group by products.productid
having sum(orderitems.quantity) > 2;

select * from highdemand;

-- top customers 
create view top_buyers as
select fullname, sum(orders.totalamount) as amount from customers
inner join orders 
on customers.customerid = orders.customerid
group by customers.customerid 
having sum(orders.totalamount) > 10000;

select * from top_buyers;


-- montly sales 
create view total_sales as 
select  year(orderdate) as year, month(orderdate) as month, sum(totalamount) as amount from orders 
group by year(orderdate),month(orderdate);

select * from total_sales;




