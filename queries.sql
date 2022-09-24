-- write your queries here
-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id. 
SELECT * FROM owners
FULL OUTER JOIN vehicles
ON owners.id = vehicles.owner_id;

-- Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order. 
SELECT o.first_name, o.last_name, count(*) FROM owners o
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY o.first_name, o.last_name
ORDER BY o.first_name;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000.
SELECT first_name, last_name, ROUND(CAST(AVG(price) AS numeric),0) AS average_price, count(*) FROM owners o
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY first_name, last_name
HAVING ROUND(CAST(AVG(price) AS numeric),0) > 10000 AND count(*) > 1
ORDER BY first_name DESC;