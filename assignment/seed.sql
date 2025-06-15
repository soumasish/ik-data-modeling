-- Create the raw user table for a rideshare company
-- This represents the operational source system data
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    date_of_birth DATE,
    city VARCHAR(100),
    state VARCHAR(50),
    subscription_tier VARCHAR(20), -- basic, premium, vip
    account_status VARCHAR(20), -- active, suspended, inactive
    payment_method VARCHAR(50), -- credit_card, paypal, apple_pay, etc.
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Insert sample data showing various scenarios for Type 2 SCD
-- This includes users who change cities, subscription tiers, payment methods, etc.

INSERT INTO users VALUES 
-- Initial records
(1001, 'alice.johnson@email.com', 'Alice', 'Johnson', '555-0101', '1990-03-15', 'San Francisco', 'CA', 'basic', 'active', 'credit_card', '2023-01-15 10:30:00', '2023-01-15 10:30:00'),
(1002, 'bob.smith@email.com', 'Bob', 'Smith', '555-0102', '1985-07-22', 'New York', 'NY', 'premium', 'active', 'paypal', '2023-01-20 14:15:00', '2023-01-20 14:15:00'),
(1003, 'carol.davis@email.com', 'Carol', 'Davis', '555-0103', '1992-11-08', 'Chicago', 'IL', 'basic', 'active', 'apple_pay', '2023-02-01 09:45:00', '2023-02-01 09:45:00'),
(1004, 'david.wilson@email.com', 'David', 'Wilson', '555-0104', '1988-05-30', 'Austin', 'TX', 'vip', 'active', 'credit_card', '2023-02-10 16:20:00', '2023-02-10 16:20:00'),
(1005, 'eva.brown@email.com', 'Eva', 'Brown', '555-0105', '1995-09-12', 'Seattle', 'WA', 'basic', 'active', 'credit_card', '2023-02-15 11:10:00', '2023-02-15 11:10:00'),

-- Records showing changes over time (simulating different extract dates)
-- Alice moves from SF to LA and upgrades to premium
(1001, 'alice.johnson@email.com', 'Alice', 'Johnson', '555-0101', '1990-03-15', 'Los Angeles', 'CA', 'premium', 'active', 'credit_card', '2023-01-15 10:30:00', '2023-04-10 13:25:00'),

-- Bob changes payment method and gets suspended
(1002, 'bob.smith@email.com', 'Bob', 'Smith', '555-0102', '1985-07-22', 'New York', 'NY', 'premium', 'suspended', 'credit_card', '2023-01-20 14:15:00', '2023-05-15 08:30:00'),

-- Carol moves to Denver and downgrades due to suspension
(1003, 'carol.davis@email.com', 'Carol', 'Davis', '555-0103', '1992-11-08', 'Denver', 'CO', 'basic', 'suspended', 'apple_pay', '2023-02-01 09:45:00', '2023-06-01 15:45:00'),

-- David changes phone number and payment method
(1004, 'david.wilson@email.com', 'David', 'Wilson', '555-9999', '1988-05-30', 'Austin', 'TX', 'vip', 'active', 'apple_pay', '2023-02-10 16:20:00', '2023-07-20 12:00:00'),

-- Eva moves to Portland and upgrades to premium
(1005, 'eva.brown@email.com', 'Eva', 'Brown', '555-0105', '1995-09-12', 'Portland', 'OR', 'premium', 'active', 'paypal', '2023-02-15 11:10:00', '2023-08-05 17:30:00'),

-- Additional users for more variety
(1006, 'frank.miller@email.com', 'Frank', 'Miller', '555-0106', '1983-12-03', 'Miami', 'FL', 'basic', 'inactive', 'credit_card', '2023-03-01 10:00:00', '2023-09-10 14:20:00'),
(1007, 'grace.lee@email.com', 'Grace', 'Lee', '555-0107', '1991-04-18', 'Boston', 'MA', 'premium', 'active', 'apple_pay', '2023-03-15 13:30:00', '2023-03-15 13:30:00'),

-- Grace later moves and changes subscription
(1007, 'grace.lee@email.com', 'Grace', 'Lee', '555-0107', '1991-04-18', 'Philadelphia', 'PA', 'vip', 'active', 'apple_pay', '2023-03-15 13:30:00', '2023-10-01 09:15:00');


