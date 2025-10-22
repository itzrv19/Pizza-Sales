CREATE DATABASE pizzahut;

CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);


CREATE TABLE orders_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_details_id)
);


-- Retrieve the Total Numbers of Orders placed. 

SELECT COUNT(order_id) AS total_orders
FROM orders;


-- Calculate the total Revenue of Pizza sales.

SELECT ROUND(SUM(orders_details.quantity * pizzas.price),2) AS total_revenue
FROM orders_details
JOIN pizzas
ON pizzas.pizza_id = orders_details.pizza_id ;


-- Highest Priced Pizza 

SELECT  pizza_types.name , pizzas.price
FROM pizza_types 
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC LIMIT 1 ;


-- Most common ordered pizza size 

SELECT pizzas.size , 
COUNT(orders_details.order_details_id) AS order_count 
FROM pizzas
JOIN orders_details
ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size 
ORDER BY order_count DESC ;


-- Most ordered pizza types along with their quantities.

SELECT pizza_types.name  AS pizza_name, 
SUM(orders_details.quantity ) AS quantitys
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details
ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name 
ORDER BY quantitys DESC ; 


-- Total quantity of each pizza category ordered.

SELECT pizza_types.category  ,
SUM(orders_details.quantity ) AS quantity
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details
ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC ; 


-- Distribution of orders by hour of the day.

SELECT HOUR(order_time) AS hour,
COUNT(order_id) AS order_count
FROM orders
GROUP BY HOUR(order_time)
ORDER BY order_count DESC ; 


-- Category-wise distribution of pizzas.

SELECT category , 
COUNT(name) 
FROM pizza_types
GROUP BY category ;


-- Orders by date and Average number of pizzas ordered per day.

SELECT orders.order_date , 
SUM(orders_details.quantity) AS orders_in_day
FROM orders 
JOIN orders_details
ON orders.order_id = orders_details.order_id
GROUP BY orders.order_date ; 

SELECT ROUND(AVG(orders_in_day), 0) AS avg_orders_inday 
FROM 
(SELECT orders.order_date , 
SUM(orders_details.quantity) AS orders_in_day
FROM orders 
JOIN orders_details
ON orders.order_id = orders_details.order_id
GROUP BY orders.order_date ) AS orders_quantity ; 

-- Most ordered pizza types based on revenue.

SELECT pizza_types.name AS pizza_name , 
SUM(orders_details.quantity * pizzas.price ) AS revenue 
FROM pizza_types
JOIN pizzas 
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN orders_details
ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name 
ORDER BY revenue DESC ; 


-- Percentage contribution of each pizza type to total revenue.

SELECT pizza_types.category , 
ROUND(SUM(orders_details.quantity * pizzas.price ) , 2 ) AS revenue 
FROM pizza_types
JOIN pizzas 
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN orders_details
ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category  
ORDER BY revenue DESC ; 

SELECT pizza_types.category , 
ROUND(SUM(orders_details.quantity * pizzas.price ) / ( SELECT 
			ROUND(SUM(orders_details.quantity * pizzas.price),2) AS total_sales
			FROM orders_details
			JOIN pizzas
            ON pizzas.pizza_id = orders_details.pizza_id )*100 ,2 ) as revenue_age
FROM pizza_types
JOIN pizzas 
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN orders_details
ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category  
ORDER BY revenue_age DESC ; 


-- Cumulative revenue generated over time.

SELECT  order_date , revenue , 
ROUND(SUM(revenue) OVER(ORDER BY  order_date) , 2) AS cum_revenue 
FROM
(SELECT orders.order_date, 
ROUND(SUM(orders_details.quantity * pizzas.price ) , 2) AS revenue 
FROM orders_details
JOIN pizzas 
ON orders_details.pizza_id = pizzas.pizza_id 
JOIN  orders 
ON orders.order_id = orders_details.order_id 
GROUP BY  orders.order_date) AS sales ;


-- Most ordered pizza types based on revenue for each pizza category.

SELECT name , category , revenue , rn 
FROM (SELECT category , name , revenue , 
      RANK() OVER(PARTITION BY  category ORDER BY  revenue DESC ) AS rn
      FROM 
      (SELECT  pizza_types.category , pizza_types.name , 
      SUM(orders_details.quantity * pizzas.price) AS revenue
      FROM pizza_types 
      JOIN pizzas 
      ON pizza_types.pizza_type_id = pizzas.pizza_type_id
      JOIN orders_details
      ON orders_details.pizza_id = pizzas.pizza_id
      GROUP BY  pizza_types.category , pizza_types.name) AS a) AS b
;