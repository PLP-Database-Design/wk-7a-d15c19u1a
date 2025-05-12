-- Question 1: Achieving 1NF (First Normal Form)
-- SQL query to transform 'ProductDetail' table into 1NF, ensuring that each row represents a single product for an order

-- Step 1: create a new table
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Step 2: Manually insert each product as a separate row
INSERT INTO ProductDetail VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Step 3: Select from the new table
SELECT * FROM ProductDetail;


-- Question 2: Achieving 2NF (Second Normal Form)
-- SQL query to transform table into 2NF by removing partial dependencies. Each non-key column fully depends on the entire primary key.
-- Step 1: Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Insert unique orders
INSERT INTO Orders VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 3: Create the OrderItems table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert the product details
INSERT INTO OrderItems VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- You can join and select from the two tables when needed:
SELECT 
    o.OrderID,
    o.CustomerName,
    i.Product,
    i.Quantity
FROM Orders o
JOIN OrderItems i
  ON o.OrderID = i.OrderID;
