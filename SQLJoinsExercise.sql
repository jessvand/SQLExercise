/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT p.Name, c.Name 
FROM products AS p
INNER JOIN categories AS c
ON c.CategoryID = p.CategoryID
WHERE c.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating
 FROM products
 INNER JOIN reviews
 ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.LastName, sum(sales.Quantity) FROM sales
INNER JOIN employees
ON sales.EmployeeID = employees.EmployeeID
GROUP BY employees.LastName
ORDER BY sum(sales.Quantity) DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT departments.Name
FROM categories
INNER JOIN departments
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name 
IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

SELECT products.Name, sum(sales.Quantity),
sum(sales.Quantity * sales.PricePerUnit)
FROM sales
INNER JOIN products ON products.ProductID = sales.ProductID
WHERE products.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.comment FROM reviews 
INNER JOIN products
ON reviews.ProductID = products.productID
WHERE products.Name = "Visio TV" 
AND reviews.rating = 1;





-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */


SELECT employees.EmployeeID, employees.LastName, employees.FirstName, products.Name, SUM(sales.Quantity) FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON sales.ProductID = products.ProductID
GROUP BY employees.EmployeeID, employees.LastName, employees.FirstName, products.Name

