SELECT id, account_id, total_amt_usd FROM orders 
ORDER BY account_id, total_amt_usd DESC;

SELECT id, account_id, total_amt_usd FROM orders 
ORDER BY total_amt_usd DESC, account_id;

SELECT * 
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT * 
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

SELECT id, (standard_amt_usd/total_amt_usd)*100 AS std_percent, total_amt_usd
FROM orders
LIMIT 10;

SELECT id, account_id, (standard_amt_usd/standard_qty) AS std_unit_qty
FROM orders
LIMIT 10;

SELECT id, account_id, (poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) * 100) AS poster_percentage
FROM orders
LIMIT 10;

SELECT id, name
FROM accounts
WHERE name LIKE 'C%';

SELECT id, name
FROM accounts
WHERE name LIKE '%one%';

SELECT id, name
FROM accounts
WHERE name LIKE '%s';

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

SELECT id, name
FROM accounts
WHERE name NOT LIKE 'C%';

SELECT id, name
FROM accounts
WHERE name NOT LIKE '%one%';

SELECT id, name
FROM accounts
WHERE name NOT LIKE '%s';

SELECT * 
FROM orders
WHERE standard_qty > 1000 AND poster_qty =0 AND gloss_qty=0;

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

SELECT *
FROM web_events
WHERE  channel IN ('organic', 'adwords') AND (occurred_at BETWEEN '2016-01-01' AND '2017-01-01')
ORDER BY occurred_at DESC;

SELECT id
FROM orders
WHERE gloss_qty >0 OR poster_qty >0; 

SELECT *
FROM orders
WHERE standard_qty=0 AND (gloss_qty >1000 OR poster_qty >1000); 

SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') AND primary_poc NOT LIKE '%eana%'); 

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT *
FROM accounts
JOIN orders
ON orders.account_id=accounts.id;

SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM orders
JOIN accounts
ON accounts.id=orders.account_id;

SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id;

SELECT web_events.channel, accounts.name, orders.total
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id;

SELECT w.channel, a.name, o.total
FROM web_events AS w
JOIN accounts AS a
ON w.account_id = a.id
JOIN orders AS o
ON a.id = o.account_id;

SELECT a.name, a.primary_poc, w.channel, w.occurred_at
FROM web_events AS w
JOIN accounts AS a
ON w.account_id=a.id
WHERE a.name='Walmart';

SELECT r.name AS region_name, s.name AS sales_rep_name, a.name AS account_name
FROM region AS r
JOIN sales_reps AS s
ON r.id=s.region_id
JOIN accounts AS a
ON s.id=a.sales_rep_id
ORDER BY a.name ASC;

SELECT r.name AS region_name, a.name AS account_name, o.total_amt_usd/(o.total+0.01) AS unit_price
FROM region AS r
JOIN sales_reps AS s
ON r.id=s.region_id
JOIN accounts AS a
ON s.id=a.sales_rep_id
JOIN orders AS o
ON a.id=o.account_id;

SELECT c.countryid, c.countryName, s.stateName
FROM Country c
JOIN State s
ON c.countryid = s.countryid;

SELECT c.countryid, c.countryName, s.stateName
FROM Country c
LEFT JOIN State s
ON c.countryid = s.countryid;

SELECT c.countryid, c.countryName, s.stateName
FROM State s
LEFT JOIN Country c
ON c.countryid = s.countryid;


SELECT r.name AS region_name, s.name AS sales_rep_name, a.name AS account_name
FROM region r
JOIN sales_reps AS s
ON r.id=s.region_id
JOIN accounts AS a
ON s.id=a.sales_rep_id
WHERE s.name = 'Midwest'
ORDER BY a.name;


SELECT r.name AS region_name, s.name AS sales_rep_name, a.name AS account_name
FROM region r
JOIN sales_reps AS s
ON r.id=s.region_id
JOIN accounts AS a
ON s.id=a.sales_rep_id
WHERE r.name = 'Midwest'
ORDER BY a.name; 

SELECT r.name AS region_name, s.name AS sales_rep_name, a.name AS account_name
FROM region r
JOIN sales_reps AS s
ON r.id=s.region_id
JOIN accounts AS a
ON s.id=a.sales_rep_id
WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
ORDER BY a.name;

SELECT r.name AS region_name, s.name AS sales_rep_name, a.name AS account_name
FROM region r
JOIN sales_reps AS s
ON r.id=s.region_id
JOIN accounts AS a
ON s.id=a.sales_rep_id
WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
ORDER BY a.name;

SELECT r.name AS region_name, a.name AS account_name, o.total_amt_usd/(o.total+0.01) AS unit_price
FROM region r
JOIN sales_reps AS s
ON r.id=s.region_id
JOIN accounts AS a
ON s.id=a.sales_rep_id
JOIN orders o
ON a.id=o.account_id
WHERE o.standard_qty>100

SELECT r.name AS region_name, a.name AS account_name, o.total_amt_usd/(o.total+0.01) AS unit_price
FROM region r
JOIN sales_reps AS s
ON r.id=s.region_id
JOIN accounts AS a
ON s.id=a.sales_rep_id
JOIN orders o
ON a.id=o.account_id
WHERE (o.standard_qty>100) AND (o.poster_qty>50)
ORDER BY unit_price;

SELECT r.name AS region_name, a.name AS account_name, o.total_amt_usd/(o.total+0.01) AS unit_price
FROM region r
JOIN sales_reps AS s
ON r.id=s.region_id
JOIN accounts AS a
ON s.id=a.sales_rep_id
JOIN orders o
ON a.id=o.account_id
WHERE (o.standard_qty>100) AND (o.poster_qty>50)
ORDER BY unit_price DESC;

SELECT DISTINCT a.name AS account_name, w.channel AS channels
FROM web_events w
JOIN accounts a
ON a.id=w.account_id
WHERE a.id=1001;

SELECT o.occurred_at AS occurred_at, a.name AS "account name", o.total AS "order total", o.total_amt_usd AS "order total_amt_usd"
FROM orders o
JOIN accounts a
ON a.id=o.account_id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016';

SELECT COUNT(*)
FROM accounts;

SELECT COUNT(accounts.id)
FROM accounts;

SELECT SUM(poster_qty) AS "Poster Quantity"
FROM orders;

SELECT SUM(standard_amt_usd/(standard_qty+0.01)) AS "Standard Amount Per Unit"
FROM orders;

SELECT SUM(standard_qty) AS "Standard Quantity"
FROM orders;

SELECT SUM(total_amt_usd) AS "Total USD Amount"
FROM orders;

SELECT SUM(standard_amt_usd) AS "Standard USD Amount", SUM(gloss_amt_usd) AS "Gloss USD Amount"
FROM orders;

SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;

SELECT MIN(occurred_at)
FROM orders;

SELECT occurred_at
FROM orders
ORDER BY occurred_at
LIMIT 1;

SELECT MAX(occurred_at)
FROM web_events;

SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

SELECT AVG(standard_qty) AS AVG_Std_Qty, AVG(gloss_qty) AS AVG_Gls_Qty, AVG(poster_qty) AS AVG_Pst_Qty, AVG(standard_amt_usd) AS AVG_Std_Amt_USD, AVG(gloss_amt_usd) AS AVG_Gls_Qty, AVG(poster_amt_usd) AS pst_amt_usd
FROM orders;

SELECT *
FROM (SELECT total_amt_usd
         FROM orders
         ORDER BY total_amt_usd
         LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

SELECT a.name, MIN(o.occurred_at) as date
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name
ORDER BY date
LIMIT 1;

SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 1;

SELECT a.name AS account_name, SUM(o.total_amt_usd) AS total_sales
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name;

SELECT a.name AS account_name, SUM(o.total_amt_usd) AS total_sales
FROM orders o
JOIN accounts a
ON a.id=o.account_id
WHERE a.name='Walmart'
GROUP BY a.name;

SELECT a.name AS account_name, w.channel AS channel, MAX(w.occurred_at) AS date
FROM web_events w
JOIN accounts a
ON a.id=w.account_id
GROUP BY a.name, w.channel
ORDER BY date DESC
LIMIT 1;

SELECT w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id 
ORDER BY w.occurred_at DESC
LIMIT 1;

SELECT channel , COUNT(channel) AS num_of_times 
FROM web_events
GROUP BY channel
ORDER BY channel DESC;

SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel

SELECT a.primary_poc
FROM accounts a
JOIN web_events w
ON a.id=w.account_id
GROUP BY a.primary_poc, w.occurred_at
ORDER BY w.occurred_at 
LIMIT 1;

SELECT a.primary_poc
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 1;

SELECT a.name AS account_name, MIN(o.total_amt_usd) AS smallest
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY account_name
ORDER BY smallest;

SELECT r.name AS region_name, COUNT(s.name) AS num_of_sales_reps
FROM region r
JOIN sales_reps s
ON r.id=s.region_id
GROUP BY region_name
ORDER BY num_of_sales_reps;

SELECT r.name, COUNT(*) num_reps
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY num_reps;

SELECT a.name, AVG(o.standard_qty) AS avg_std_qty, AVG(o.gloss_qty) AS avg_gloss_qty, AVG(o.poster_qty) AS avg_pst_qty
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name;

SELECT a.name, AVG(o.standard_amt_usd) AS avg_std_usd, AVG(o.gloss_amt_usd) AS avg_gloss_usd, AVG(o.poster_amt_usd) AS avg_pst_usd
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name;

SELECT s.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;

SELECT r.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;

SELECT a.id as "account id", r.id as "region id", 
a.name as "account name", r.name as "region name"
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;

SELECT DISTINCT id, name
FROM accounts;

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;

SELECT DISTINCT id, name
FROM sales_reps;

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;




