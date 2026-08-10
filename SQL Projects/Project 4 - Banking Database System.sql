CREATE DATABASE my_data;
use my_data;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50),
phone VARCHAR (10),
city VARCHAR (50)
);

CREATE TABLE branches(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
manager_name VARCHAR(50)
);

CREATE TABLE accounts(
account_id INT PRIMARY KEY,
customer_id INT,
branch_id INT,
account_type VARCHAR(50),
balance DECIMAL(20,2),
open_date DATE,
status VARCHAR(20),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
FOREIGN KEY (branch_id) REFERENCES branches (branch_id)
);

CREATE TABLE transactions(
transaction_id INT PRIMARY KEY,
account_id INT,
transaction_date DATE,
transaction_type ENUM('Deposit','Withdrawal','Transfer'),
amount DECIMAL(10,2),
description VARCHAR(250),
FOREIGN KEY (account_id) REFERENCES accounts (account_id)
);

CREATE TABLE loans(
loan_id INT PRIMARY KEY,
customer_id INT,
loan_type ENUM ('Home','Car','Personal','business','Farming','Education'),
loan_amount DECIMAL(20,2),
interest_rate DECIMAL (5,2),
loan_status ENUM ('Pending','Approved','Rejected','Closed'),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

SELECT * FROM branches;
INSERT INTO branches 
(branch_id, branch_name, city, state, manager_name) 
VALUES
(1, 'Mumbai Main Branch', 'Mumbai', 'Maharashtra', 'Amit Sharma'),
(2, 'Pune Central Branch', 'Pune', 'Maharashtra', 'Priya Patel'),
(3, 'Delhi City Branch', 'Delhi', 'Delhi', 'Rahul Verma'),
(4, 'Bengaluru South Branch', 'Bengaluru', 'Karnataka', 'Sneha Reddy'),
(5, 'Hyderabad Main Branch', 'Hyderabad', 'Telangana', 'Arjun Reddy'),
(6, 'Chennai Central Branch', 'Chennai', 'Tamil Nadu', 'Meera Iyer'),
(7, 'Kolkata East Branch', 'Kolkata', 'West Bengal', 'Neha Das'),
(8, 'Nagpur Branch', 'Nagpur', 'Maharashtra', 'Rohan Singh'),
(9, 'Nashik Branch', 'Nashik', 'Maharashtra', 'Karan Joshi'),
(10, 'Jaipur Branch', 'Jaipur', 'Rajasthan', 'Isha Gupta'),
(11, 'Ahmedabad Branch', 'Ahmedabad', 'Gujarat', 'Vikram Shah'),
(12, 'Surat Branch', 'Surat', 'Gujarat', 'Pooja Mehta');

SELECT VERSION();
SHOW CREATE TABLE transactions;
SELECT * FROM transactions
LIMIT 1000 OFFSET 4000;
SELECT COUNT(*) FROM transactions;
SHOW VARIABLES LIKE 'max_allowed_packet';

-- Banking SQL Practice Questions
-- SELECT, WHERE, ORDER BY
-- 2.	Display all customers.
SELECT * FROM customers;

-- 3.	Display all active accounts.
SELECT * FROM accounts
WHERE status = 'active';

-- 4.	Find customers from Mumbai.
SELECT * FROM customers
WHERE city = 'Mumbai';

-- 5.	Display transactions greater than 50,000.
SELECT * FROM transactions 
WHERE amount > 50000;

-- 6.	Show all Home loans.
SELECT * FROM loans
WHERE loan_type = 'Home';

-- 7.	Display accounts ordered by balance (highest first).
SELECT * FROM accounts 
ORDER BY balance DESC;

-- 8.	Display customers ordered by first name.
SELECT * FROM customers 
ORDER BY first_name;

-- Aggregate Functions
-- 10.	Count total customers.
SELECT count(*) FROM customers;

-- 11.	Count total accounts.
SELECT count(*) FROM accounts;

-- 12.	Find the total balance of all accounts.
SELECT sum(balance) FROM accounts;

-- 13.	Find the average account balance.
SELECT ROUND(AVG(balance),2) FROM accounts;

-- 14.	Find the highest account balance.
SELECT max(balance) AS highest_balance FROM accounts;

-- 15.	Find the lowest loan amount.
SELECT min(loan_amount) AS lowest_loan FROM loans;

-- 16.	Find the total transaction amount.
SELECT sum(amount) AS total_transaction FROM transactions;

-- GROUP BY & HAVING
-- 18.	Count customers in each city.
SELECT city,count(*) AS cust_per_city FROM customers
GROUP BY city;

-- 19.	Count accounts by account type.
SELECT account_type,count(*) AS account_type_count
FROM accounts
GROUP BY account_type;

SELECT IFNULL(account_type,'Total') AS account_type,count(*) AS account_type_count
FROM accounts
GROUP BY account_type with ROLLUP;

-- 20.	Find the total balance for each branch.
SELECT b.branch_name,sum(balance) AS total_balance
FROM branches b ,accounts a
WHERE b.branch_id = a.branch_id
GROUP BY branch_name
ORDER BY total_balance DESC;

-- 21.	Count transactions by transaction type.
SELECT count(transaction_type) 
FROM transactions;

-- 22.	Find the average loan amount for each loan type.
SELECT loan_type,AVG(loan_amount)
FROM loans
GROUP BY loan_type;

SELECT loan_type,ROUND(AVG(loan_amount),2) AS total_loan_amount
FROM loans
GROUP BY loan_type;

SELECT IFNULL(loan_type,"Avg_total") AS loan_type,ROUND(AVG(loan_amount),2) AS total_loan_amount
FROM loans
GROUP BY loan_type with ROLLUP;

-- 23.	Display branches having more than 20 accounts.
SELECT b.branch_id,b.branch_name,count(a.account_id)
FROM branches b , accounts a
WHERE b.branch_id = a.branch_id
GROUP BY b.branch_id,b.branch_name
HAVING count(a.account_id) > 20;

-- 24.	Display customers having more than one account.
SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS full_name,count(account_id)
FROM customers c,accounts a
WHERE c.customer_id = a.customer_id
GROUP BY c.customer_id,full_name
HAVING count(account_id) > 1;


SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS full_name,
       COUNT(a.account_id) AS account_count
FROM customers AS c
JOIN accounts AS a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, full_name
HAVING COUNT(a.account_id) > 1;

-- JOIN
-- 26.	Display customer name and account type.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS full_name,a.account_type AS account_type
FROM customers AS c , accounts AS a
WHERE c.customer_id = a.customer_id
ORDER BY c.customer_id;

SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS full_name,a.account_type AS account_type
FROM customers AS c , accounts AS a
WHERE c.customer_id = a.customer_id;

-- 27.	Display customer name, branch name, and balance.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS full_name,
		b.branch_name AS branch_name,a.balance AS balance
FROM customers AS c , accounts AS a , branches AS b
WHERE c.customer_id = a.customer_id
AND a.branch_id = b.branch_id;

-- 28.	Display customer name with transaction details.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS full_name,
		t.transaction_id,t.account_id,t.transaction_date,t.transaction_type,t.amount,t.description
FROM customers AS c , accounts AS a , transactions AS t
WHERE c.customer_id = a.customer_id
AND a.account_id = t.account_id;

-- 29.	Display customer name with loan details.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS full_name,
		l.loan_id,l.loan_type,l.loan_amount,l.interest_rate,l.loan_status
FROM customers AS c , loans AS l
WHERE c.customer_id = l.customer_id
ORDER BY c.customer_id;

-- 30.	Display branch name and number of accounts.
SELECT IFNULL(b.branch_name,"Total") AS branch_name,count(a.account_id) AS 'number of accounts'
FROM branches AS b,accounts AS a
WHERE b.branch_id = a.branch_id
GROUP BY b.branch_name WITH ROLLUP;

-- 31.	Display customer name and total account balance.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS full_name,
		a.balance AS 'total account balance' 
FROM customers AS c,accounts AS a
WHERE c.customer_id = a.customer_id
ORDER BY c.customer_id;

SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		sum(a.balance) AS 'total account balance' 
FROM customers AS c,accounts AS a
WHERE c.customer_id = a.customer_id
GROUP BY c.customer_id,customer_name
ORDER BY c.customer_id;

-- 32.	Display customer name, account number, and transaction amount.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		a.account_id,t.amount
FROM customers AS c,accounts AS a,transactions AS t
WHERE c.customer_id = a.customer_id
AND a.account_id = t.account_id;

SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		a.account_id,sum(t.amount) AS total_transiction_amount
FROM customers AS c,accounts AS a,transactions AS t
WHERE c.customer_id = a.customer_id
AND a.account_id = t.account_id
GROUP BY c.customer_id,customer_name,a.account_id;

-- Subqueries
-- 34.	Find customers having the maximum account balance.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		a.balance
FROM customers AS c
JOIN accounts AS a
ON c.customer_id = a.customer_id
WHERE a.balance = (SELECT MAX(balance) FROM accounts);

-- 35.	Find accounts with balance above the average balance.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		a.balance
FROM customers AS c
JOIN accounts AS a
ON c.customer_id = a.customer_id
WHERE a.balance > (SELECT avg(balance) FROM accounts)
ORDER BY a.balance DESC;

-- 36.	Find customers who have never taken a loan.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM customers AS c
WHERE NOT EXISTS (
		SELECT 1 
        FROM loans AS l
        WHERE c.customer_id = l.customer_id
        );
        
-- 37.	Find branches having the highest total balance.
SELECT b.branch_name,sum(a.balance) AS total_balance
FROM accounts AS a
JOIN branches AS b
ON a.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_balance DESC
LIMIT 1;

-- with subquery
SELECT b.branch_name,sum(a.balance) AS total_balance
FROM branches AS b
JOIN accounts AS a
ON b.branch_id = a.branch_id
GROUP BY b.branch_name
HAVING sum(a.balance) = 
	(SELECT MAX(total_balance) 
    FROM (SELECT sum(balance) AS total_balance
			FROM accounts
            GROUP BY branch_id
            )
			AS t
    );
    
    
SELECT b.branch_name,
       SUM(a.balance) AS total_balance
FROM branches b
JOIN accounts a
ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name
HAVING SUM(a.balance) = (
    SELECT MAX(total_balance)
    FROM (
        SELECT SUM(balance) AS total_balance
        FROM accounts
        GROUP BY branch_id
    ) AS x
);

-- 38.	Find customers with the largest loan.
SELECT c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name,l.loan_amount 
FROM customers AS c
JOIN loans AS l
ON c.customer_id = l.customer_id
WHERE l.loan_amount = (
		SELECT MAX(loan_amount) 
        FROM loans
        );
        
-- 39.	Find accounts having more transactions than the average.
SELECT account_id,COUNT(*) AS transaction_count
FROM transactions
GROUP BY  account_id
HAVING COUNT(*) > 
(
	SELECT AVG (transaction_count)
    FROM
		(SELECT count(*) AS transaction_count
		FROM transactions
		GROUP BY  account_id
        ) AS t
);

-- 40.	Find customers whose balance is greater than the average balance.
SELECT customer_id,AVG(balance) AS AVG_balance
FROM accounts
GROUP BY customer_id
HAVING AVG(balance) > (SELECT AVG(balance)
FROM accounts)
;

SELECT c.customer_id,CONCAT(c.first_name," ",c.last_name)AS customer_name,a.balance AS balance
FROM accounts as a
JOIN customers AS c
ON a.customer_id = c.customer_id
HAVING a.balance > (SELECT AVG(balance)
FROM accounts)
ORDER BY balance DESC;


-- IF CUSTOMER HAVE MULTIPLE ACCOUNTS.
SELECT c.customer_id,CONCAT(c.first_name," ",c.last_name)AS customer_name,SUM(a.balance) AS total_balance
FROM accounts as a
JOIN customers AS c
ON a.customer_id = c.customer_id
GROUP BY customer_id,customer_name
HAVING sum(a.balance) > (SELECT AVG(balance)
FROM accounts)
ORDER BY total_balance DESC;

-- 42.	Rank customers by account balance.
SELECT customer_id,account_id,balance,
	DENSE_RANK () OVER (ORDER BY balance DESC) AS ranking
FROM accounts;

-- RANK BY total account balance.
SELECT customer_id,total_balance,
	DENSE_RANK () OVER (ORDER BY total_balance DESC) AS ranking
FROM(
	SELECT customer_id,
    SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
    ) AS t;

-- Give each customer a single rank based on their highest account balance. In that case
SELECT customer_id,max_balance,
	DENSE_RANK () OVER (ORDER BY max_balance DESC) AS ranking
FROM(
	SELECT customer_id,
	MAX(balance) AS max_balance
    FROM accounts
    GROUP BY customer_id
    ) AS t;
    
    
    -- 43.	Dense rank loan amounts.
SELECT customer_id,loan_amount,
	DENSE_RANK() OVER(ORDER BY loan_amount DESC) AS 'Rank as per amount'
FROM loans;
    
-- If each customer has multiple loans
SELECT customer_id,sum(loan_amount) AS total_loan,
	DENSE_RANK() OVER(ORDER BY sum(loan_amount) DESC) AS 'Rank as per amount'
FROM loans
GROUP BY customer_id;

-- 44.	Row number for every transaction.
SELECT *,
	ROW_NUMBER() OVER() AS 'transaction_num'
FROM transactions;

SELECT *,
	ROW_NUMBER() OVER(ORDER BY transaction_id) AS 'transaction_num'
FROM transactions;

SELECT transaction_id,account_id,transaction_date,transaction_type,amount,description,
	ROW_NUMBER() OVER(ORDER BY transaction_date) AS 'transaction_num'
FROM transactions;

-- 45.	Running total of transactions.
SELECT transaction_id,account_id,transaction_date,amount,
	sum(amount) OVER (ORDER BY transaction_id) AS 'running_total'
FROM transactions;

SELECT transaction_id,account_id,transaction_date,amount,
	sum(amount) OVER (ORDER BY transaction_date) AS 'running_total'
FROM transactions;

SELECT transaction_id,account_id,transaction_date,amount,
	sum(amount) OVER (ORDER BY account_id) AS 'running_total'
FROM transactions;

-- 46.	Previous transaction amount using LAG().
SELECT transaction_id,account_id,transaction_date,amount,
	LAG(amount) OVER (ORDER BY transaction_id) AS 'previous trans'
FROM transactions;

-- 47.	Next transaction amount using LEAD().
SELECT transaction_id,account_id,transaction_date,amount,
	LEAD(amount) OVER (ORDER BY transaction_id) AS 'next trans'
FROM transactions;

-- If the question means the next transaction for the same account
SELECT transaction_id,account_id,transaction_date,amount,
	LEAD(amount) OVER (PARTITION BY account_id ORDER BY transaction_date) AS 'next trans'
FROM transactions;

-- 48.	Find the top 3 balances in every branch.
SELECT branch_id,
       account_id,
       customer_id,
       balance
FROM (
    SELECT branch_id,
           account_id,
           customer_id,
           balance,
           DENSE_RANK() OVER (
               PARTITION BY branch_id
               ORDER BY balance DESC
           ) AS ranking
    FROM accounts
) AS t
WHERE ranking <= 3;

SELECT branch_id,
       account_id,
       customer_id,
       balance
FROM (
    SELECT branch_id,
           account_id,
           customer_id,
           balance,
           ROW_NUMBER() OVER (
               PARTITION BY branch_id
               ORDER BY balance DESC
           ) AS row_num
    FROM accounts
) AS t
WHERE row_num <= 3;


SELECT branch_name,
       account_id,
       customer_id,
       balance
FROM (
    SELECT a.branch_id,
           a.account_id,
           a.customer_id,
           a.balance,
           DENSE_RANK() OVER (
               PARTITION BY branch_id
               ORDER BY a.balance DESC
           ) AS ranking
    FROM accounts AS a
) AS t
JOIN branches AS b
ON t.branch_id = b.branch_id
WHERE ranking <= 3
ORDER BY b.branch_id;

-- Views
-- 50.	Create a view for active accounts.
CREATE VIEW active_accounts AS
SELECT * 
FROM accounts
WHERE status = 'active';

SELECT * FROM active_accounts;

-- 51.	Create a view showing customer account details.
CREATE VIEW customer_details AS
SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS 'Customer Name',
		a.account_id,a.account_type,a.balance,a.branch_id
FROM customers AS c
JOIN accounts AS a
ON c.customer_id = a.customer_id;

SELECT * FROM customer_details;

-- 52.	Create a view for approved loans.
CREATE VIEW approved_loans AS
SELECT * FROM loans
WHERE loan_status = 'approved';

SELECT * FROM approved_loans;

-- 53.	Create a view showing branch balances.
CREATE VIEW branch_balance AS
SELECT b.branch_id,b.branch_name,sum(a.balance) AS branch_balance
FROM branches AS b
JOIN accounts AS a
ON b.branch_id = a.branch_id
GROUP BY b.branch_name,b.branch_id;

SELECT * FROM branch_balance;

-- 54.	Create a transaction summary view.
CREATE VIEW transaction_summary AS
SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_name,t.transaction_id,a.account_id,
		t.transaction_date,t.transaction_type,t.amount,t.description
FROM transactions AS t
JOIN accounts AS a
ON t.account_id = a.account_id
JOIN customers AS c
ON a.customer_id = c.customer_id;

SELECT * FROM transaction_summary;

-- 55.	Create a customer loan view.
CREATE VIEW customer_loan_view AS
SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_name,c.customer_id,l.loan_id,l.loan_type,
		l.loan_amount,l.interest_rate,l.loan_status
FROM loans AS l
JOIN customers AS c
ON l.customer_id = c.customer_id;

SELECT * FROM customer_loan_view;

-- 56.	Create a branch customer view.
CREATE VIEW branchwise_customer AS
SELECT b.branch_id,b.branch_name,c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name
FROM branches AS b
JOIN accounts AS a
ON b.branch_id = a.branch_id
JOIN customers AS c
ON a.customer_id = c.customer_id;

SELECT * FROM branchwise_customer;

-- Stored Procedures
-- 58.	Display customer details by customer ID.
DELIMITER $$
CREATE PROCEDURE customer_details(IN p_customer_id INT)
BEGIN 
	SELECT *
    FROM customers
    WHERE customer_id = p_customer_id ;
END $$
DELIMITER ;

CALL customer_details(102);

-- 59.	Deposit money into an account.
DELIMITER $$ 
CREATE PROCEDURE deposit_money (IN p_account_id INT,IN p_deposit DECIMAL(10,2),OUT p_new_balance DECIMAL(20,2))
BEGIN 
	UPDATE accounts
	SET balance = balance + p_deposit
    WHERE account_id = p_account_id ;
    
    SELECT balance
    INTO p_new_balance
    FROM accounts
	WHERE account_id = p_account_id ;
END $$
DELIMITER ;

SELECT account_id,balance from accounts;

-- 60.	Withdraw money from an account.
DELIMITER $$ 
CREATE PROCEDURE withdraw_money
	(IN p_account_id INT,IN p_withdraw_money DECIMAL(10,2),OUT p_new_balance DECIMAL(10,2))
BEGIN 
	UPDATE accounts
    SET balance = balance - p_withdraw_money
    WHERE account_id = p_account_id ;

	SELECT balance
    INTO p_new_balance
    FROM accounts 
    WHERE account_id = p_account_id ;
END $$
DELIMITER ;

-- 61.	Transfer money between two accounts.
DELIMITER $$ 
CREATE PROCEDURE transfer_money
	(IN p_from_account INT,IN p_receive_account INT,IN p_amount DECIMAL(10,2),
		OUT p_from_balance DECIMAL(10,2),OUT p_receive_balance DECIMAL(10,2))
BEGIN 
	UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account ;
	
	UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_receive_account ;

	SELECT balance
    INTO p_from_balance
    FROM accounts 
    WHERE account_id = p_from_account ;
    
    SELECT balance
    INTO p_receive_balance
    FROM accounts 
    WHERE account_id = p_receive_account ;
    
END $$
DELIMITER ;

SELECT account_id,balance FROM accounts;

-- 62.	Display all accounts of a customer.
DELIMITER $$
CREATE PROCEDURE account_details(IN p_customer_id INT)
BEGIN 
	SELECT customer_id,account_id,branch_id,account_type,balance,status
    FROM accounts
    WHERE customer_id = p_customer_id ;
END $$
DELIMITER ;accounts

DELIMITER $$
CREATE PROCEDURE account_details(IN p_customer_id INT)
BEGIN 
	SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    a.account_id,a.branch_id,a.account_type,a.balance,a.status
    FROM customers AS c
    JOIN accounts AS a
    ON c.customer_id = a.customer_id
    WHERE c.customer_id = p_customer_id ;
END $$
DELIMITER ;

CALL account_details(6);

-- 63.	Calculate total customer balance.
DELIMITER $$
CREATE PROCEDURE total_balance(IN p_customer_id INT)
BEGIN
	SELECT customer_id,sum(balance) AS total_balance
    FROM accounts
    WHERE customer_id = p_customer_id
	GROUP BY customer_id;
END $$
DELIMITER ;

-- 64.	Display loans by loan type.
DELIMITER $$
CREATE PROCEDURE loan_details(IN p_loan_type VARCHAR(50))
BEGIN
	SELECT loan_type,sum(loan_amount) AS total_loan_amount
    FROM loans
    WHERE loan_type = p_loan_type
    GROUP BY loan_type ;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE loan_type_details(
    IN p_loan_type VARCHAR(50)
)
BEGIN
    SELECT *
    FROM loans
    WHERE loan_type = p_loan_type;
END $$
DELIMITER ;

-- Triggers
-- 66.	Prevent negative account balance.
DELIMITER $$
CREATE TRIGGER prevent_negative_balance 
BEFORE UPDATE ON accounts
FOR EACH ROW
BEGIN
	IF NEW.balance < 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Account balance cannot be negative';
	END IF ;
END $$
DELIMITER ;

SHOW TRIGGERS WHERE `Table`= 'accounts';
SHOW TRIGGERS;

-- 67.	Record every deposit in an audit table.
CREATE TABLE deposit_audit(
	audit_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    account_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE,
    audit_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    
DELIMITER $$
CREATE TRIGGER record_deposit
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
	IF new.transaction_id = 'Deposit' then
		INSERT INTO deposit_audit(
    transaction_id ,
    account_id ,
    amount ,
    transaction_date
    )
    VALUES(
    new.transaction_id,
    new.account_id,
    new.amount,
    new.transaction_date
    );
	END IF ;
END $$
DELIMITER ;

-- 68.	Record every withdrawal in an audit table.
CREATE TABLE withdraw_audit(
	audit_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    account_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE,
    audit_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    
DELIMITER $$
CREATE TRIGGER record_withdraw
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
	IF new.transaction_id = 'Withdraw' then
		INSERT INTO deposit_audit(
    transaction_id ,
    account_id ,
    amount ,
    transaction_date
    )
    VALUES(
    new.transaction_id,
    new.account_id,
    new.amount,
    new.transaction_date
    );
	END IF ;
END $$
DELIMITER ;

-- 69.	Update a customer’s last activity date after a transaction.
ALTER TABLE customers
ADD COLUMN last_activity_date DATETIME;

DELIMITER $$
CREATE TRIGGER update_last_activity
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    UPDATE customers
    SET last_activity_date = NOW()
    WHERE customer_id = (
        SELECT customer_id
        FROM accounts
        WHERE account_id = NEW.account_id
    );
END $$

DELIMITER ;

SELECT customer_id, first_name, last_activity_date
FROM customers;
DESC customers;

-- Transactions
-- 74.	Deposit money using START TRANSACTION, COMMIT, and ROLLBACK.
START TRANSACTION;
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 1001;
COMMIT;

START TRANSACTION;
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 1001;
-- If an error occurs, undo the transaction
ROLLBACK;

-- 75.	Withdraw money with rollback if the balance is insufficient.
START TRANSACTION;

-- Check if sufficient balance is available
SELECT balance
INTO @current_balance
FROM accounts
WHERE account_id = 1001;

-- Withdraw only if balance is sufficient
IF @current_balance >= 5000 THEN

    UPDATE accounts
    SET balance = balance - 5000
    WHERE account_id = 1001;

    COMMIT;

ELSE

    ROLLBACK;

END IF;

-- 76.	Transfer money between two accounts.
START TRANSACTION;
UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 1001;
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 1002;
COMMIT;

-- 77.	Use a SAVEPOINT while processing multiple updates.
START TRANSACTION;
-- Update Account 1001
UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 1001;
-- Create a savepoint
SAVEPOINT sp1;
-- Update Account 1002
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 1002;
-- Update Loan
UPDATE loans
SET loan_amount = loan_amount - 1000
WHERE loan_id = 201;
COMMIT;
SELECT * FROM accounts;

-- 79.	Update both an account and a loan status in one transaction.
START TRANSACTION;
UPDATE accounts
SET status = 'Inactive'
WHERE account_id = 1001;
UPDATE loans
SET loan_status = 'Closed'
WHERE loan_id = 201;
COMMIT;

-- 80.	Demonstrate a failed transaction and recover using ROLLBACK.
START TRANSACTION;
UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 1001;
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 99999;
ROLLBACK;
