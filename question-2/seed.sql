-- Create bookings table
CREATE TABLE bookings (
    booking_id TEXT PRIMARY KEY,
    guest_id TEXT NOT NULL,
    host_id TEXT NOT NULL,
    property_id TEXT NOT NULL,
    booking_date DATE NOT NULL,
    cleanliness_score INTEGER CHECK(cleanliness_score BETWEEN 1 AND 5),
    communication_score INTEGER CHECK(communication_score BETWEEN 1 AND 5),
    overall_satisfaction_score INTEGER CHECK(overall_satisfaction_score BETWEEN 1 AND 5),
    review_text TEXT,
    issue_reported INTEGER CHECK(issue_reported IN (0, 1)) DEFAULT 0
);

-- Seed bookings table with 30 sample records
INSERT INTO bookings (booking_id, guest_id, host_id, property_id, booking_date, cleanliness_score, communication_score, overall_satisfaction_score, review_text, issue_reported) VALUES
('B001', 'G001', 'H001', 'P001', '2024-01-15', 5, 5, 5, 'Amazing place! Everything was spotless and the host was incredibly responsive.', 0),
('B002', 'G002', 'H002', 'P002', '2024-01-16', 3, 4, 3, 'Good location but the apartment could have been cleaner. Host was helpful though.', 1),
('B003', 'G003', 'H001', 'P003', '2024-01-17', 4, 5, 4, 'Nice stay overall. Great communication from the host.', 0),
('B004', 'G004', 'H003', 'P004', '2024-01-18', 2, 2, 2, 'Disappointing experience. Place was dirty and host was unresponsive.', 1),
('B005', 'G005', 'H004', 'P005', '2024-01-19', 5, 4, 5, 'Perfect weekend getaway! Highly recommend this property.', 0),
('B006', 'G006', 'H002', 'P006', '2024-01-20', 4, 3, 4, 'Clean space but communication could be better. Would stay again.', 0),
('B007', 'G007', 'H005', 'P007', '2024-01-21', 5, 5, 5, 'Exceptional host and beautiful property. Everything exceeded expectations.', 0),
('B008', 'G008', 'H003', 'P008', '2024-01-22', 3, 3, 3, 'Average stay. Nothing special but met basic needs.', 0),
('B009', 'G009', 'H006', 'P009', '2024-01-23', 4, 5, 4, 'Host went above and beyond to make our stay comfortable.', 0),
('B010', 'G010', 'H007', 'P010', '2024-01-24', 1, 1, 1, 'Terrible experience. Property was nothing like the photos.', 1),
('B011', 'G011', 'H004', 'P011', '2024-01-25', 5, 4, 5, 'Loved this place! Will definitely book again.', 0),
('B012', 'G012', 'H008', 'P012', '2024-01-26', 4, 4, 4, 'Solid choice for a city break. Good value for money.', 0),
('B013', 'G013', 'H001', 'P013', '2024-01-27', 5, 5, 5, 'This host is amazing! Property was immaculate.', 0),
('B014', 'G014', 'H009', 'P014', '2024-01-28', 2, 3, 2, 'Issues with cleanliness. Bathroom was not properly cleaned.', 1),
('B015', 'G015', 'H005', 'P015', '2024-01-29', 4, 5, 4, 'Great communication and lovely space. Minor cleanliness issues.', 0),
('B016', 'G001', 'H010', 'P016', '2024-01-30', 5, 4, 5, 'Perfect location and very clean. Host was quick to respond.', 0),
('B017', 'G002', 'H006', 'P017', '2024-01-31', 3, 4, 3, 'Decent stay but some maintenance issues in the kitchen.', 1),
('B018', 'G003', 'H011', 'P018', '2024-02-01', 4, 4, 4, 'Nice property in a quiet neighborhood. Enjoyed our stay.', 0),
('B019', 'G004', 'H007', 'P019', '2024-02-02', 5, 5, 5, 'Outstanding host and property. Everything was perfect!', 0),
('B020', 'G005', 'H012', 'P020', '2024-02-03', 2, 2, 2, 'Not impressed. Place was messy and host was difficult to reach.', 1),
('B021', 'G006', 'H008', 'P021', '2024-02-04', 4, 5, 4, 'Host was very accommodating. Property met expectations.', 0),
('B022', 'G007', 'H013', 'P022', '2024-02-05', 5, 4, 5, 'Beautiful apartment with great amenities. Highly recommend!', 0),
('B023', 'G008', 'H009', 'P023', '2024-02-06', 3, 3, 3, 'Average experience. Nothing to complain about but nothing special.', 0),
('B024', 'G009', 'H014', 'P024', '2024-02-07', 4, 4, 4, 'Good stay overall. Property was as described.', 0),
('B025', 'G010', 'H010', 'P025', '2024-02-08', 1, 2, 1, 'Worst Airbnb experience ever. Multiple issues reported.', 1),
('B026', 'G011', 'H015', 'P026', '2024-02-09', 5, 5, 5, 'Absolutely loved this place! Perfect for a romantic getaway.', 0),
('B027', 'G012', 'H011', 'P027', '2024-02-10', 4, 3, 4, 'Clean and comfortable. Communication could be improved.', 0),
('B028', 'G013', 'H016', 'P028', '2024-02-11', 5, 5, 5, 'Fantastic host and gorgeous property. Will return for sure!', 0),
('B029', 'G014', 'H012', 'P029', '2024-02-12', 2, 3, 2, 'Several cleanliness issues. Expected better for the price.', 1),
('B030', 'G015', 'H013', 'P030', '2024-02-13', 4, 4, 4, 'Nice place in a great location. Good value overall.', 0);

-- Create guests dimension table
CREATE TABLE dim_guest (
    dim_guest_id INTEGER PRIMARY KEY AUTOINCREMENT,
    guest_id TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    mobile TEXT NOT NULL,
    signup_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    is_current INTEGER CHECK(is_current IN (0, 1)) DEFAULT 1
);

-- Seed guests dimension table
INSERT INTO dim_guest (guest_id, first_name, last_name, email, mobile, signup_date, start_date, end_date, is_current) VALUES
('G001', 'Emily', 'Johnson', 'emily.johnson@email.com', '555-0201', '2023-12-01', '2023-12-01', NULL, 1),
('G002', 'Michael', 'Chen', 'michael.chen@email.com', '555-0202', '2023-12-05', '2023-12-05', NULL, 1),
('G003', 'Sarah', 'Williams', 'sarah.williams@email.com', '555-0203', '2023-12-10', '2023-12-10', NULL, 1),
('G004', 'David', 'Rodriguez', 'david.rodriguez@email.com', '555-0204', '2023-12-15', '2023-12-15', NULL, 1),
('G005', 'Jessica', 'Taylor', 'jessica.taylor@email.com', '555-0205', '2023-12-20', '2023-12-20', NULL, 1),
('G006', 'Robert', 'Anderson', 'robert.anderson@email.com', '555-0206', '2024-01-02', '2024-01-02', NULL, 1),
('G007', 'Amanda', 'Martinez', 'amanda.martinez@email.com', '555-0207', '2024-01-05', '2024-01-05', NULL, 1),
('G008', 'Christopher', 'Garcia', 'christopher.garcia@email.com', '555-0208', '2024-01-08', '2024-01-08', NULL, 1),
('G009', 'Jennifer', 'Brown', 'jennifer.brown@email.com', '555-0209', '2024-01-10', '2024-01-10', NULL, 1),
('G010', 'Daniel', 'Wilson', 'daniel.wilson@email.com', '555-0210', '2024-01-12', '2024-01-12', NULL, 1),
('G011', 'Ashley', 'Davis', 'ashley.davis@email.com', '555-0211', '2024-01-15', '2024-01-15', NULL, 1),
('G012', 'Matthew', 'Miller', 'matthew.miller@email.com', '555-0212', '2024-01-18', '2024-01-18', NULL, 1),
('G013', 'Lauren', 'Moore', 'lauren.moore@email.com', '555-0213', '2024-01-20', '2024-01-20', NULL, 1),
('G014', 'Kevin', 'Jackson', 'kevin.jackson@email.com', '555-0214', '2024-01-22', '2024-01-22', NULL, 1),
('G015', 'Nicole', 'White', 'nicole.white@email.com', '555-0215', '2024-01-25', '2024-01-25', NULL, 1),
('G002', 'Michael', 'Chen', 'michael.chen.new@email.com', '555-0202', '2023-12-05', '2023-12-05', '2024-02-01', 0),
('G002', 'Michael', 'Chen', 'michael.chen.new@email.com', '555-0299', '2023-12-05', '2024-02-01', NULL, 1);

-- Create hosts dimension table
CREATE TABLE dim_host (
    dim_host_id INTEGER PRIMARY KEY AUTOINCREMENT,
    host_id TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    mobile TEXT NOT NULL,
    signup_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    is_current INTEGER CHECK(is_current IN (0, 1)) DEFAULT 1
);

-- Seed hosts dimension table
INSERT INTO dim_host (host_id, first_name, last_name, email, mobile, signup_date, start_date, end_date, is_current) VALUES
('H001', 'Thomas', 'Anderson', 'thomas.anderson@email.com', '555-1001', '2023-06-15', '2023-06-15', NULL, 1),
('H002', 'Maria', 'Garcia', 'maria.garcia@email.com', '555-1002', '2023-07-22', '2023-07-22', NULL, 1),
('H003', 'James', 'Thompson', 'james.thompson@email.com', '555-1003', '2023-08-10', '2023-08-10', NULL, 1),
('H004', 'Linda', 'Martinez', 'linda.martinez@email.com', '555-1004', '2023-09-05', '2023-09-05', NULL, 1),
('H005', 'Robert', 'Williams', 'robert.williams@email.com', '555-1005', '2023-09-18', '2023-09-18', NULL, 1),
('H006', 'Jennifer', 'Brown', 'jennifer.brown@email.com', '555-1006', '2023-10-12', '2023-10-12', NULL, 1),
('H007', 'Michael', 'Davis', 'michael.davis@email.com', '555-1007', '2023-10-25', '2023-10-25', NULL, 1),
('H008', 'Patricia', 'Miller', 'patricia.miller@email.com', '555-1008', '2023-11-08', '2023-11-08', NULL, 1),
('H009', 'Christopher', 'Wilson', 'christopher.wilson@email.com', '555-1009', '2023-11-20', '2023-11-20', NULL, 1),
('H010', 'Barbara', 'Moore', 'barbara.moore@email.com', '555-1010', '2023-12-03', '2023-12-03', NULL, 1),
('H011', 'David', 'Taylor', 'david.taylor@email.com', '555-1011', '2023-12-15', '2023-12-15', NULL, 1),
('H012', 'Susan', 'Jackson', 'susan.jackson@email.com', '555-1012', '2024-01-08', '2024-01-08', NULL, 1),
('H013', 'Joseph', 'White', 'joseph.white@email.com', '555-1013', '2024-01-20', '2024-01-20', NULL, 1),
('H014', 'Jessica', 'Harris', 'jessica.harris@email.com', '555-1014', '2024-02-02', '2024-02-02', NULL, 1),
('H015', 'Charles', 'Martin', 'charles.martin@email.com', '555-1015', '2024-02-10', '2024-02-10', NULL, 1),
('H016', 'Nancy', 'Lee', 'nancy.lee@email.com', '555-1016', '2024-02-15', '2024-02-15', NULL, 1),
('H003', 'James', 'Thompson', 'james.thompson@email.com', '555-1003', '2023-08-10', '2023-08-10', '2024-01-15', 0),
('H003', 'James', 'Thompson-Smith', 'james.thompson.smith@email.com', '555-1303', '2023-08-10', '2024-01-15', NULL, 1),
('H005', 'Robert', 'Williams', 'robert.williams@email.com', '555-1005', '2023-09-18', '2023-09-18', '2024-02-01', 0),
('H005', 'Robert', 'Williams', 'robert.williams.new@email.com', '555-1505', '2023-09-18', '2024-02-01', NULL, 1);

-- Create properties dimension table
CREATE TABLE dim_property (
    dim_property_id INTEGER PRIMARY KEY AUTOINCREMENT,
    property_id TEXT NOT NULL,
    address TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    country TEXT NOT NULL,
    market_id TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    is_current INTEGER CHECK(is_current IN (0, 1)) DEFAULT 1
);

-- Seed properties dimension table
INSERT INTO dim_property (property_id, address, city, state, country, market_id, start_date, end_date, is_current) VALUES
('P001', '123 Main St', 'San Francisco', 'CA', 'USA', 'SF_DOWNTOWN', '2023-06-01', NULL, 1),
('P002', '456 Oak Ave', 'Los Angeles', 'CA', 'USA', 'LA_HOLLYWOOD', '2023-06-15', NULL, 1),
('P003', '789 Pine Rd', 'San Francisco', 'CA', 'USA', 'SF_MISSION', '2023-07-01', NULL, 1),
('P004', '321 Elm St', 'New York', 'NY', 'USA', 'NYC_MANHATTAN', '2023-07-10', NULL, 1),
('P005', '654 Maple Dr', 'Miami', 'FL', 'USA', 'MIA_BEACH', '2023-08-01', NULL, 1),
('P006', '987 Cedar Ln', 'Los Angeles', 'CA', 'USA', 'LA_BEVERLY', '2023-08-15', NULL, 1),
('P007', '147 Birch Way', 'San Francisco', 'CA', 'USA', 'SF_NOBB_HILL', '2023-09-01', NULL, 1),
('P008', '258 Willow St', 'Chicago', 'IL', 'USA', 'CHI_LOOP', '2023-09-10', NULL, 1),
('P009', '369 Spruce Ave', 'Seattle', 'WA', 'USA', 'SEA_DOWNTOWN', '2023-10-01', NULL, 1),
('P010', '741 Aspen Rd', 'Austin', 'TX', 'USA', 'AUS_DOWNTOWN', '2023-10-15', NULL, 1),
('P011', '852 Poplar Dr', 'Miami', 'FL', 'USA', 'MIA_WYNWOOD', '2023-11-01', NULL, 1),
('P012', '963 Hickory Ln', 'Denver', 'CO', 'USA', 'DEN_LODO', '2023-11-15', NULL, 1),
('P013', '159 Walnut St', 'San Francisco', 'CA', 'USA', 'SF_SOMA', '2023-12-01', NULL, 1),
('P014', '357 Chestnut Ave', 'Portland', 'OR', 'USA', 'PDX_PEARL', '2023-12-10', NULL, 1),
('P015', '468 Sycamore Way', 'Boston', 'MA', 'USA', 'BOS_BACK_BAY', '2024-01-01', NULL, 1),
('P016', '579 Magnolia Dr', 'Nashville', 'TN', 'USA', 'NSH_MUSIC_ROW', '2024-01-15', NULL, 1),
('P017', '680 Dogwood Rd', 'Seattle', 'WA', 'USA', 'SEA_CAPITOL', '2024-01-20', NULL, 1),
('P018', '791 Redwood Ln', 'San Diego', 'CA', 'USA', 'SD_GASLAMP', '2024-02-01', NULL, 1),
('P019', '802 Juniper St', 'Phoenix', 'AZ', 'USA', 'PHX_DOWNTOWN', '2024-02-05', NULL, 1),
('P020', '913 Cypress Ave', 'Las Vegas', 'NV', 'USA', 'LV_STRIP', '2024-02-10', NULL, 1),
('P021', '124 Palm Dr', 'Orlando', 'FL', 'USA', 'ORL_DOWNTOWN', '2024-02-15', NULL, 1),
('P022', '235 Bamboo Way', 'Los Angeles', 'CA', 'USA', 'LA_SANTA_MONICA', '2024-02-20', NULL, 1),
('P023', '346 Fern Rd', 'Chicago', 'IL', 'USA', 'CHI_RIVER_NORTH', '2024-02-25', NULL, 1),
('P024', '457 Moss Ln', 'New York', 'NY', 'USA', 'NYC_BROOKLYN', '2024-03-01', NULL, 1),
('P025', '568 Vine St', 'Atlanta', 'GA', 'USA', 'ATL_MIDTOWN', '2024-03-05', NULL, 1),
('P026', '679 Rose Ave', 'San Francisco', 'CA', 'USA', 'SF_PACIFIC_HTS', '2024-03-10', NULL, 1),
('P027', '780 Lily Dr', 'Washington', 'DC', 'USA', 'DC_DUPONT', '2024-03-15', NULL, 1),
('P028', '891 Daisy Rd', 'San Francisco', 'CA', 'USA', 'SF_CASTRO', '2024-03-20', NULL, 1),
('P029', '902 Tulip Ln', 'Los Angeles', 'CA', 'USA', 'LA_VENICE', '2024-03-25', NULL, 1),
('P030', '103 Orchid Way', 'Miami', 'FL', 'USA', 'MIA_SOUTH_BEACH', '2024-03-30', NULL, 1),
('P005', '654 Maple Dr', 'Miami', 'FL', 'USA', 'MIA_BEACH', '2023-08-01', '2024-01-20', 0),
('P005', '654 Maple Dr Apt 2B', 'Miami', 'FL', 'USA', 'MIA_BEACH', '2024-01-20', NULL, 1),
('P008', '258 Willow St', 'Chicago', 'IL', 'USA', 'CHI_LOOP', '2023-09-10', '2024-02-15', 0),
('P008', '258 Willow St', 'Chicago', 'IL', 'USA', 'CHI_WEST_LOOP', '2024-02-15', NULL, 1);