CREATE database sales_anal;

USE sales_anal;

CREATE TABLE products (
	product_id int primary key,
    product_name varchar(100),
    category varchar(50),
    price decimal(10,2)
);

CREATE TABLE sales (
	sales_id int primary key,
    product_id int,
    sales_date date,
    quantity int,
    sales_amount decimal(10,2),
    foreign key (product_id) references products(product_id)
);

INSERT INTO products VALUES
(1,'laptop','electronic',50000),
(2,"mobile","electronic",30000),
(3,"tablet","electronic",1500);

INSERT INTO sales VALUES
(1,1,'2024-11-02',2,100000),
(2,3,'2024-11-03',4,6000),
(3,1,'2024-11-04',4,200000),
(4,2,'2024-11-05',5,150000);

#TOTAL SALES BY PRODUCT
ad
SELECT p.product_name,sum(s.sales_amount) AS total_sales
FROM sales s
JOIN
products p on s.product_id = p.product_id
GROUP BY product_name
ORDER BY total_sales DESC;

# MONTHLY SALES 

SELECT sales_date,sum(sales_amount) AS total_sales
FROM sales
GROUP BY sales_date
ORDER BY sales_date;

# TOP SELLING PRODUCT BY QUANTITY

SELECT p.product_name,sum(s.quantity) AS total_quantity_sales
FROM sales s
JOIN
products p on s.product_id = p.product_id
GROUP BY product_name
ORDER BY total_quantity_sales DESC;

# AVERAGE SALES AMOUNT PER PRODUCT CATEGORY

SELECT p.category,avg(s.sales_amount) AS avg_sales_amount
FROM sales s
JOIN
products p on s.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_sales_amount DESC;

# SALES REVENUE BY PRODUCT CATEGORY

SELECT p.category,sum(s.sales_amount) AS total_sales_amount
FROM sales s
JOIN
products p on s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales_amount DESC;

# OPTIMIZE WITH INDEXES

CREATE INDEX idx_sales_product_id ON sales(product_id);
CREATE INDEX idx_sales_sales_date ON sales(sales_date);








