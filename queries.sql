-- Joining Tables
SELECT o.id, o.first_name, o.last_name, v.id, v.make, v.model, v.year, v.price, v.owner_id
FROM owners o
LEFT JOIN vehicles v ON o.id = v.owner_id;

-- Counting Cars for Each Owner
SELECT o.first_name, o.last_name, COUNT(v.id) AS count
FROM owners o
LEFT JOIN vehicles v ON o.id = v.owner_id
GROUP BY o.id
ORDER BY o.first_name ASC;

-- Average Price and Count of Cars
SELECT o.first_name, o.last_name, ROUND(AVG(v.price)) AS average_price, COUNT(v.id) AS count
FROM owners o
JOIN vehicles v ON o.id = v.owner_id
GROUP BY o.id
HAVING COUNT(v.id) > 1 AND AVG(v.price) > 10000
ORDER BY o.first_name DESC;
