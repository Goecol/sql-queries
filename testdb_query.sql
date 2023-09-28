SELECT email, COUNT(words) AS outputs, min(words) AS min_words, max(words) AS max_words, ROUND(avg(words), 1) AS avg_words FROM
(SELECT a.id, a.email, r.words FROM `accounts` a, `results` r 
WHERE a.id = r.account_id ORDER BY email ASC) d
GROUP BY email
ORDER BY email ASC;


SELECT email, COUNT(words) AS outputs, min(words) AS min_words, max(words) AS max_words, ROUND(avg(words), 1) AS avg_words FROM
(SELECT a.id, a.email, r.words FROM `accounts` a
INNER JOIN `results` r 
ON a.id = r.account_id ORDER BY email ASC) d
GROUP BY email
ORDER BY email ASC