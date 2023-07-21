create table Customers
(
Customerid int primary key,
CustomerName varchar(30),
DOB date,--40.	Add a column of type DATE called Birthday in Persons table
City varchar(30),
Country varchar(30),
Postcode int
)
sp_help Customers

insert into Customers values(1,'Anjali','1996-5-6','Pune','India',123456)
insert into Customers values(2,'Vidya','1998-8-6','Paris','France',789456)
insert into Customers values(3,'Akshata','1999-9-13','Londaon','England',568924)
insert into Customers values(4,'Pankaj','1996-5-16','Oslo','Norway',359782)
insert into Customers values(5,'Sagar','2000-5-2','Barlin','Germany',931620)

select * from Customers

--1.Write a statement that will select the City column from the Customers table
select city from Customers
--2.Select all the different values from the Country column in the Customers table.
select country from Customers
--3.Select all records where the City column has the value "London
select * from Customers where city='Londaon'
--4.4.	Use the NOT keyword to select all records where City is NOT "Berlin".
select * from Customers where not city='Barlin'
--5.Select all records where the CustomerID column has the value 23.
select*from Customers where Customerid=3
--6.Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from Customers where City='Barlin'and Postcode=931620
--7.Select all records where the City column has the value 'Berlin' or 'London'.
select * from Customers where city='Barlin' or city ='Londaon'
--8.Select all records from the Customers table, sort the result alphabetically by the column City.
select * from Customers order by City
--9.Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select * from Customers order by City desc
--10.Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from Customers order by Country,City
--11.Select all records from the Customers where the PostalCode column is empty.
select * from Customers where Postcode is null
--12.Select all records from the Customers where the PostalCode column is NOT empty.
select * from Customers where Postcode is not null
--13.Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update Customers set City='Oslo'where Country='Norway'
--14.Delete all the records from the Customers table where the Country value is 'Norway'.
delete from Customers where Country='Norway'
--20.Select all records where the value of the City column starts with the letter "a".
select * from Customers where City like 'a%'
--21.Select all records where the value of the City column ends with the letter "a".
select * from Customers where City like '%a'
--22.Select all records where the value of the City column contains the letter "a".
select * from Customers where City like 'a%a'
--23.Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from Customers where City like 'a%b'
--24.Select all records where the value of the City column does NOT start with the letter "a".
select * from Customers where City not like 'a%'
--25.Select all records where the second letter of the City is an "a".
select * from Customers where City like'_a%'
--26.Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from Customers where City like'[acs]%'
--27.Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from Customers where City like'[a-f]%'
--28.Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select* from Customers where City not like'[acf]%'
--29.Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from Customers where Country in('Norway','France')
--30.Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from Customers where Country not in('Norway','France')
--select 10+5 as result
--34.When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select 'Postcode' as 'Pno'
--35.When displaying the Customers table, refer to the table as Consumers instead of Customers.
select 'Customers'as 'Consumers'
--36List the number of customers in each country.
--37.List the number of customers in each country, ordered by the country with the most customers first.
--41.	Delete the column Birthday from the Persons table
alter table Customers drop column DOB

create table Product
(
Productid int,
ProductName varchar(30),
ProductPrice int,
)
sp_help Product

insert into Product values(101,'Geitost' ,500)
insert into Product values(102,'Pavlova' ,1000)
insert into Product values(103,'Enega' ,1200)
insert into Product values(104,'Tata' ,800)
insert into Product values(105,'Pound' ,1000)
insert into Product values(106,'Joy' ,20)

select * from Product
--15.Use the MIN function to select the record with the smallest value of the Price column.
select MIN(ProductPrice) as'Min Price' from Product
--16.Use an SQL function to select the record with the highest value of the Price column.
select MAX(ProductPrice) as'Max Price' from Product
--17.Use the correct function to return the number of records that have the Price value set to 20
select* from Product where ProductPrice=20
--18.Use an SQL function to calculate the average price of all products.
select AVG(ProductPrice) as 'Avg'from Product
--19.Use an SQL function to calculate the sum of all the Price column values in the Products table
select SUM(ProductPrice) as'Total Price' from Product



