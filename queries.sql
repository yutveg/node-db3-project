-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT product.id, product.productName, category.CategoryName 
FROM product
JOIN category ON product.categoryId = category.id
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT [Order].id, [Order].OrderDate, [Order].ShipVia, Shipper.CompanyName
from [Order] 
join Shipper on [Order].ShipVia = Shipper.id
where OrderDate < '2012-08-09'
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select OrderDetail.Quantity, OrderDetail.ProductId, Product.ProductName
from OrderDetail
join Product on OrderDetail.ProductId = Product.Id
where OrderDetail.OrderId = 10251
order by ProductName
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select [Order].id as "Order ID", Customer.CompanyName as "Customer's Company", Employee.LastName as "Employee's Last Name"
from [Order]
join Customer on 
Customer.id = [Order].Customerid
join Employee on 
Employee.id = [Order].Employeeid
