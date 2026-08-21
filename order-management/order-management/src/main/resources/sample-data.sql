-- Sample data from the assignment. Run this manually after the app has
-- started once (so the customer_order table already exists).

INSERT INTO customer_order
(customer_name, product_name, category, quantity,
 price_per_unit, discount_percent, payment_mode, order_status)
VALUES
('Rahul', 'Laptop', 'Electronics', 1, 55000, 10, 'UPI', 'Delivered'),
('Priya', 'Mobile Phone', 'Electronics', 2, 25000, 5, 'Card', 'Placed'),
('Amit', 'Office Chair', 'Furniture', 3, 8000, 10, 'UPI', 'Delivered'),
('Sneha', 'Headphones', 'Electronics', 2, 3000, 0, 'Cash', 'Cancelled'),
('Raj', 'Study Table', 'Furniture', 1, 12000, 5, 'Card', 'Placed');
