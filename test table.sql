create database test;
use test;
-- – SQL query to create table
-- Create Orders Table
CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
amount DECIMAL(10,2)
);
-- Insert 25 Records
INSERT INTO Orders (order_id, customer_id, order_date, amount) VALUES

(1, 101, '2024-01-05', 250.00),
(2, 102, '2024-01-15', 400.00),
(3, 101, '2024-02-10', 180.00),
(4, 103, '2024-02-12', 500.00),
(5, 102, '2024-03-01', 700.00),
(6, 101, '2024-03-05', 300.00),
(7, 104, '2024-03-20', 150.00),
(8, 103, '2024-04-01', 450.00),
(9, 105, '2024-04-15', 320.00),
(10, 101, '2024-04-20', 280.00),
(11, 106, '2024-05-02', 600.00),
(12, 102, '2024-05-10', 750.00),
(13, 104, '2024-05-15', 200.00),
(14, 103, '2024-06-01', 550.00),
(15, 105, '2024-06-10', 400.00),
(16, 106, '2024-06-20', 620.00),
(17, 101, '2024-07-05', 310.00),
(18, 102, '2024-07-10', 720.00),
(19, 104, '2024-07-20', 180.00),
(20, 103, '2024-08-01', 470.00),
(21, 105, '2024-08-15', 390.00),
(22, 106, '2024-08-25', 640.00),
(23, 101, '2024-09-05', 350.00),
(24, 102, '2024-09-10', 710.00),
(25, 104, '2024-09-20', 210.00);
select * from Orders;

-- (5)Find orders that are placed on weekends (Saturday/Sunday).
-- order info weekend
select dayofweek(now());
select * from Orders where  dayofweek(order_date) in (1,7);

-- (4)Find orders placed on the latest order date in the table
select* from Orders where order_date=(SELECT MAX(order_date) FROM Orders);

-- (2)Find orders that are greater than the average amount in March 2024
-- order of march
-- avg(amount) of march
SELECT AVG(amount) FROM Orders WHERE order_date >= '2024-03-01' AND order_date < '2024-04-01';

select * from Orders where order_date between '2024-03-01' AND order_date < '2024-03-31'
and amount>(select avg(amount)from Orders where order_date between'2024-03-01' AND order_date < '2024-03-31' ) ;


-- (3) Get customers who spent more than the overall average spend across all months
select customer_id, SUM(amount) as total_spend from Orders
group by customer_id
having total_spend>(select avg(amount) from Orders);
-- or
select * from (select customer_id, SUM(amount) as total_spend from Orders
group by customer_id )as temp
where total_spend>(select avg(amount) from Orders);

-- Get customers who placed their first order in February 2024

select customer_id, min(order_date)
from Orders
where month(order_date)=2 and year(order_date)=2024
group by customer_id;

-- or
select customer_id ,order_date from Orders as o
where order_date =(select min(order_date) from Orders as ot
where o.customer_id=ot.customer_id and month(order_date)=2);

-- Find the order(s) with the highest amount in each month.
select * from Orders as ord1
where orde1.Amount = (select MAX(orde.Amount) from Orders as orde
    where month(orde.order_date) = month(ord1.order_date) and year(orde.order_date) = year(ord1.order_date));


-- join,subquery,group by