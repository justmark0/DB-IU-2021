-- View1
CREATE VIEW View1 AS
SELECT * FROM Actor
WHERE first_name iN (SELECT first_name FROM Actor
WHERE last_name = 'Nicholson'); 

--View2
CREATE VIEW View2 AS
SELECT * FROM Actor LIMIT 20;

-- Trigger
create trigger
before INSERT
on customer
for each row
set customer.first_name = customer.first_name || "1"; -- || mean concatenation
