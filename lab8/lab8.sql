-- Lab8 Mark Nicholson

CREATE TABLE accounts (
    id        integer UNIQUE PRIMARY KEY,
    name       varchar(40) NOT NULL,
    credit         integer NOT NULL
);

INSERT INTO accounts(id, name, credit)
VALUES (1, 'Account 1', 1000);
INSERT INTO accounts(id, name, credit)
VALUES (2, 'Account 2', 1000);
INSERT INTO accounts(id, name, credit)
VALUES (3, 'Account 3', 1000);


BEGIN;
savepoint T1;
UPDATE accounts AS acc SET credit=500 WHERE id=1;
UPDATE accounts AS acc SET credit=1500 WHERE id=3;

savepoint T2;
UPDATE accounts AS acc SET credit=300 WHERE id=2;
UPDATE accounts AS acc SET credit=1200 WHERE id=1;


savepoint T3;
UPDATE accounts AS acc SET credit=500 WHERE id=2;
UPDATE accounts AS acc SET credit=1500 WHERE id=3;

-- ROLLBACK to T1;
-- ROLLBACK to T2;
-- ROLLBACK to T3;  -- You can uncomment it and rolls back to each savepoint

COMMIT;

-- 3.2
BEGIN;
savepoint T1;
UPDATE accounts AS acc SET credit=500 WHERE id=1;
UPDATE accounts AS acc SET credit=1500 WHERE id=3;

savepoint T2;
UPDATE accounts AS acc SET credit=270 WHERE id=2;
UPDATE accounts AS acc SET credit=1200 WHERE id=1;

savepoint T3;
UPDATE accounts AS acc SET credit=470 WHERE id=2;
UPDATE accounts AS acc SET credit=1500 WHERE id=3;

select * from accounts;
ROLLBACK to T2;
select * from accounts;

COMMIT;


-- Task 2.1
CREATE TABLE accounts (
    id        integer UNIQUE PRIMARY KEY,
    name       varchar(40) NOT NULL,
    credit         integer NOT NULL
);

CREATE TABLE ledger (
	id        integer UNIQUE PRIMARY KEY,
    from         integer NOT NULL,
	to         integer NOT NULL,
    fee         integer NOT NULL,
	amount      integer NOT NULL,
	TransactionDateTime       TIMESTAMP NOT NULL
);




INSERT INTO accounts(id, name, credit)
VALUES (1, 'Account 1', 1000)
INSERT INTO accounts(id, name, credit)
VALUES (2, 'Account 2', 1000);
INSERT INTO accounts(id, name, credit)
VALUES (3, 'Account 3', 1000);


BEGIN;
savepoint T1;
UPDATE accounts AS acc SET credit=500 WHERE id=1;
UPDATE accounts AS acc SET credit=1500 WHERE id=3;
INSERT INTO accounts(id, to, from, fee, amount, TransactionDateTime)
VALUES (1, 1, 3, 0, 500, NOW());

savepoint T2;
UPDATE accounts AS acc SET credit=300 WHERE id=2;
UPDATE accounts AS acc SET credit=1200 WHERE id=1;
INSERT INTO accounts(id, to, from, fee, amount, TransactionDateTime)
VALUES (1, 2, 1, 30, 700, NOW());

savepoint T3;
UPDATE accounts AS acc SET credit=500 WHERE id=2;
UPDATE accounts AS acc SET credit=1500 WHERE id=3;
INSERT INTO accounts(id, to, from, fee, amount, TransactionDateTime)
VALUES (3, 2, 3, 0, 100, NOW());

-- ROLLBACK to T1;
-- ROLLBACK to T2;
-- ROLLBACK to T3;  -- You can uncomment it and rolls back to each savepoint

select * from accounts;	

COMMIT;


-- Task 2.2

CREATE TABLE accounts (
    id        integer UNIQUE PRIMARY KEY,
    name       varchar(40) NOT NULL,
    credit         integer NOT NULL,
	Bankname       varchar(40) NOT NULL,
);

CREATE TABLE ledger (
	id        integer UNIQUE PRIMARY KEY,
    from         integer NOT NULL,
	to         integer NOT NULL,
    fee         integer NOT NULL,
	amount      integer NOT NULL,
	TransactionDateTime       TIMESTAMP NOT NULL
);




INSERT INTO accounts(id, name, credit, Bankname)
VALUES (1, 'Account 1', 1000, 'Spearbank';
INSERT INTO accounts(id, name, credit, Bankname)
VALUES (2, 'Account 2', 1000, 'Tinkoff');
INSERT INTO accounts(id, name, credit, Bankname)
VALUES (3, 'Account 3', 1000, 'Spearbank');
INSERT INTO accounts(id, name, credit, Bankname)
VALUES (4, 'Account 4', 0, '');


BEGIN;
savepoint T1;
UPDATE accounts AS acc SET credit=500 WHERE id=1;
UPDATE accounts AS acc SET credit=1500 WHERE id=3;
INSERT INTO accounts(id, to, from, fee, amount, TransactionDateTime)
VALUES (1, 1, 3, 0, 500, NOW());

savepoint T2;
UPDATE accounts AS acc SET credit=270 WHERE id=2;
UPDATE accounts AS acc SET credit=1200 WHERE id=1;
INSERT INTO accounts(id, to, from, fee, amount, TransactionDateTime)
VALUES (1, 2, 1, 30, 700, NOW());

savepoint T3;
UPDATE accounts AS acc SET credit=470 WHERE id=2;
UPDATE accounts AS acc SET credit=1500 WHERE id=3;
INSERT INTO accounts(id, to, from, fee, amount, TransactionDateTime)
VALUES (3, 2, 3, 0, 100, NOW());

-- ROLLBACK to T1;
-- ROLLBACK to T2;
-- ROLLBACK to T3;  -- You can uncomment it and rolls back to each savepoint

select * from accounts;	

COMMIT;
