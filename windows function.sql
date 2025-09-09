-- create database tushar;
use tushar;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from EmployeeSales;
select *, avg(SaleAmount) over() from EmployeeSales; -- '1891.666667'
-- over
select *,
 avg(SaleAmount) over(),
 max(SaleAmount) over(),
 min(SaleAmount) over() from EmployeeSales;
 
--  partition by
 select *,
 avg(SaleAmount) over(),
 avg(SaleAmount) over(partition by Department) from EmployeeSales;

 select *,
 avg(SaleAmount) over(),
 avg(SaleAmount) over(partition by EmployeeName) from EmployeeSales;
 
  select *,
 avg(SaleAmount) over(),
 avg(SaleAmount) over(partition by SaleDate) from EmployeeSales;
 
  select *, avg(SaleAmount) over(),
 avg(SaleAmount) over(partition by Department,EmployeeName) from EmployeeSales;
 
  select *, avg(SaleAmount) over(),
 avg(SaleAmount) over(partition by Department,SaleDate) from EmployeeSales;
 
 select *, avg(SaleAmount) over(partition by Department),
 avg(SaleAmount) over(partition by SaleDate) from EmployeeSales;
 
 
  select *, avg(SaleAmount) over(),
 avg(SaleAmount) over(partition by Department,EmployeeID) from EmployeeSales;
 
 -- order by (Runnig sum and running avg)
 select *,sum(SaleAmount) over(order by SaleAmount),
 avg(SaleAmount) over(partition by SaleAmount)from EmployeeSales;
 
 
select *,sum(SaleAmount) over(partition by Department order by SaleAmount)from EmployeeSales;

select *,sum(SaleAmount) over(partition by SaleDate order by SaleAmount)from EmployeeSales;

-- select *,max(SaleAmount) over(partition by SaleDate order by SaleAmount)from EmployeeSales;

use sakila;

select *,sum(amount) over(partition by payment_date order by amount)from payment;

select *,sum(amount) over(partition by payment_id order by amount)from payment;

select *,sum(amount) over(partition by customer_id order by amount)from payment;