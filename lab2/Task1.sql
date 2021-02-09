-- subTASK 1
-- Relational algebra: tau_{country_id}(country)
-- TABLE:
 CREATE TABLE "contry" (
  "id" SERIAL PRIMARY KEY,
  contry VARCHAR(50)
);
-- Query:
Select country.id from contry
    order by country.id asc AND (country.id==12 OR country.id==17);

    
-- subTASK 2
-- Relational algebra: sigma_{ LIKE A%}(city)
--(reference for relational algebra: https://stackoverflow.com/questions/9875319/relational-algebra-check-for-error)
-- Table: city will have one to many correspondance to table address. Required fields you can see from the query
--Query
SELECT address FROM city WHERE address LIKE 'A%';


--subTASK 3
--Relational algebra: sigma_{first_name, last_name, city}(customers)
-- Table
 CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  city VARCHAR(50)
  last_name VARCHAR(50)
  first_name VARCHAR(50)
);
-- Query 
Select first_name, last_name, city from customers;


-- subTASK 4
-- Relational algebra: sigma_{idc:idc in sigma_{amount, idp: idp=idc and amount>11}(payments)}(customers)
-- Table: customer will have one to many correspondance to table payments. Required fields you can see from the query
-- Query
Select * from customer AS cust WHERE (Select amount from payments WHERE customer_id = cust.id AND amount>11);

-- subTASK 5
-- Relational algebra:  sigma_{id1,n1: sigma_{id2, n2: id2!=id1 and n1=n2}}
-- Query:
Select * from cust WHERE (Select first_name, id from customers WHERE first_name=cust.first_anme AND id!=cust.id)

