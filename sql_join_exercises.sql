/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select products.name as 'Product', categories.name as 'Category' from products 
left join categories on products.categoryid=categories.categoryid 
where categories.categoryid=1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.name as 'Product Name',products.Price,reviews.Rating from 
 products inner join reviews on products.productid=reviews.productid where reviews.rating=5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName as 'First Name',employees.LastName as 'Last Name',SUM(sales.quantity) as 'Total Sold'
from employees inner join sales on employees.EmployeeID=sales.EmployeeID
group by employees.employeeID order by sum(sales.quantity) desc limit 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select categories.Name, departments.Name 
from categories inner join departments on categories.departmentid=departments.departmentid
where categories.name="Appliances" or categories.name="Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.name as 'Product Name', sum(sales.quantity) as 'Sales Qty', sum(sales.priceperunit*sales.quantity) as 'Total Sales in $'
from products inner join sales on products.ProductID=sales.productID where products.Name LIKE '%Hotel%';


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.name, reviews.Reviewer,reviews.rating,reviews.comment 
from products inner join reviews on products.ProductID=reviews.productid 
where name like '%visio%' order by reviews.rating limit 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select employees.EmployeeID as 'ID', employees.FirstName as 'First Name', employees.LastName as 'Last Name', products.Name as 'Product Sold', sales.Quantity as 'Quantity Sold'
from employees inner join sales on employees.EmployeeID=sales.EmployeeID inner join products on sales.ProductID=products.productID
order by employees.lastname, employees.firstname, sales.quantity desc;
