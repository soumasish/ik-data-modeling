-- create rides
CREATE TABLE rides (
    ride_id TEXT PRIMARY KEY,
    driver_id TEXT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    base_amount REAL NOT NULL,
    wait_amount REAL DEFAULT 0.0,
    distance_pay REAL NOT NULL,
    tip_amount REAL DEFAULT 0.0,
    platform_fee REAL NOT NULL,
    tax_deduction REAL DEFAULT 0.0,
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);
-- seed rides
INSERT INTO rides (ride_id, driver_id, start_time, end_time, base_amount, wait_amount, distance_pay, tip_amount, platform_fee, tax_deduction) VALUES
('R001', 'D001', '2024-01-15 08:30:00', '2024-01-15 08:45:00', 12.50, 0.00, 8.75, 2.50, 1.25, 0.15),
('R002', 'D002', '2024-01-15 09:15:00', '2024-01-15 09:32:00', 15.00, 2.50, 12.25, 3.00, 1.50, 0.18),
('R003', 'D003', '2024-01-15 10:00:00', '2024-01-15 10:25:00', 18.75, 0.00, 15.50, 5.00, 1.88, 0.22),
('R004', 'D004', '2024-01-15 11:45:00', '2024-01-15 12:10:00', 22.00, 3.00, 18.75, 4.50, 2.20, 0.26),
('R005', 'D005', '2024-01-15 13:20:00', '2024-01-15 13:40:00', 14.25, 1.50, 10.00, 2.00, 1.43, 0.17),
('R006', 'D001', '2024-01-15 14:15:00', '2024-01-15 14:35:00', 16.50, 0.00, 12.75, 3.25, 1.65, 0.20),
('R007', 'D006', '2024-01-15 15:30:00', '2024-01-15 15:55:00', 19.75, 2.00, 16.25, 4.00, 1.98, 0.24),
('R008', 'D007', '2024-01-15 16:45:00', '2024-01-15 17:15:00', 25.00, 4.50, 20.00, 6.00, 2.50, 0.30),
('R009', 'D002', '2024-01-15 18:00:00', '2024-01-15 18:20:00', 13.75, 1.00, 9.50, 2.75, 1.38, 0.16),
('R010', 'D008', '2024-01-15 19:30:00', '2024-01-15 19:50:00', 17.25, 0.00, 13.50, 3.50, 1.73, 0.21),
('R011', 'D009', '2024-01-16 07:45:00', '2024-01-16 08:05:00', 11.50, 0.50, 8.00, 1.50, 1.15, 0.14),
('R012', 'D003', '2024-01-16 08:30:00', '2024-01-16 08:55:00', 20.00, 3.25, 16.75, 4.25, 2.00, 0.24),
('R013', 'D010', '2024-01-16 09:15:00', '2024-01-16 09:40:00', 16.75, 1.75, 12.50, 3.00, 1.68, 0.20),
('R014', 'D004', '2024-01-16 10:30:00', '2024-01-16 11:00:00', 28.50, 5.00, 22.00, 7.00, 2.85, 0.34),
('R015', 'D011', '2024-01-16 12:00:00', '2024-01-16 12:18:00', 12.25, 0.00, 8.50, 2.25, 1.23, 0.15),
('R016', 'D005', '2024-01-16 13:45:00', '2024-01-16 14:10:00', 18.00, 2.25, 14.75, 3.75, 1.80, 0.22),
('R017', 'D012', '2024-01-16 15:20:00', '2024-01-16 15:45:00', 21.50, 3.50, 17.25, 5.25, 2.15, 0.26),
('R018', 'D006', '2024-01-16 16:30:00', '2024-01-16 16:55:00', 19.25, 1.25, 15.00, 4.50, 1.93, 0.23),
('R019', 'D013', '2024-01-16 17:45:00', '2024-01-16 18:15:00', 24.75, 4.75, 19.50, 6.25, 2.48, 0.30),
('R020', 'D007', '2024-01-16 19:00:00', '2024-01-16 19:25:00', 15.50, 0.75, 11.75, 3.25, 1.55, 0.19),
('R021', 'D014', '2024-01-17 08:15:00', '2024-01-17 08:40:00', 17.75, 2.50, 13.25, 3.50, 1.78, 0.21),
('R022', 'D008', '2024-01-17 09:30:00', '2024-01-17 09:55:00', 22.25, 3.75, 18.00, 5.75, 2.23, 0.27),
('R023', 'D015', '2024-01-17 10:45:00', '2024-01-17 11:15:00', 26.00, 4.25, 21.75, 6.50, 2.60, 0.31),
('R024', 'D009', '2024-01-17 12:30:00', '2024-01-17 12:50:00', 13.25, 1.25, 9.75, 2.50, 1.33, 0.16),
('R025', 'D016', '2024-01-17 14:00:00', '2024-01-17 14:30:00', 23.50, 4.00, 19.25, 5.00, 2.35, 0.28),
('R026', 'D010', '2024-01-17 15:15:00', '2024-01-17 15:35:00', 14.75, 0.25, 10.50, 2.75, 1.48, 0.18),
('R027', 'D017', '2024-01-17 16:45:00', '2024-01-17 17:10:00', 20.50, 3.00, 16.50, 4.75, 2.05, 0.25),
('R028', 'D011', '2024-01-17 18:20:00', '2024-01-17 18:45:00', 18.25, 1.50, 14.25, 4.00, 1.83, 0.22),
('R029', 'D018', '2024-01-17 19:30:00', '2024-01-17 19:55:00', 21.00, 2.75, 17.00, 5.50, 2.10, 0.25),
('R030', 'D012', '2024-01-18 07:30:00', '2024-01-18 07:50:00', 12.75, 0.50, 9.25, 2.00, 1.28, 0.15),
('R031', 'D019', '2024-01-18 08:45:00', '2024-01-18 09:15:00', 27.25, 5.25, 22.50, 7.25, 2.73, 0.33),
('R032', 'D013', '2024-01-18 10:00:00', '2024-01-18 10:25:00', 16.00, 1.00, 12.00, 3.25, 1.60, 0.19),
('R033', 'D020', '2024-01-18 11:30:00', '2024-01-18 11:55:00', 19.50, 2.25, 15.75, 4.25, 1.95, 0.23),
('R034', 'D014', '2024-01-18 13:15:00', '2024-01-18 13:40:00', 17.00, 1.75, 13.00, 3.75, 1.70, 0.20),
('R035', 'D021', '2024-01-18 14:45:00', '2024-01-18 15:15:00', 25.75, 4.50, 20.75, 6.75, 2.58, 0.31),
('R036', 'D015', '2024-01-18 16:00:00', '2024-01-18 16:20:00', 13.50, 0.75, 10.25, 2.25, 1.35, 0.16),
('R037', 'D022', '2024-01-18 17:30:00', '2024-01-18 17:55:00', 22.75, 3.25, 18.50, 5.25, 2.28, 0.27),
('R038', 'D016', '2024-01-18 18:45:00', '2024-01-18 19:10:00', 20.25, 2.50, 16.00, 4.50, 2.03, 0.24),
('R039', 'D023', '2024-01-18 20:00:00', '2024-01-18 20:25:00', 18.75, 1.25, 14.75, 4.25, 1.88, 0.23),
('R040', 'D017', '2024-01-19 08:00:00', '2024-01-19 08:30:00', 24.00, 4.00, 19.00, 6.00, 2.40, 0.29),
('R041', 'D024', '2024-01-19 09:15:00', '2024-01-19 09:40:00', 15.25, 0.50, 11.50, 3.00, 1.53, 0.18),
('R042', 'D018', '2024-01-19 10:45:00', '2024-01-19 11:10:00', 21.25, 3.50, 17.75, 5.50, 2.13, 0.26),
('R043', 'D025', '2024-01-19 12:30:00', '2024-01-19 12:55:00', 19.00, 2.00, 15.25, 4.00, 1.90, 0.23),
('R044', 'D019', '2024-01-19 14:15:00', '2024-01-19 14:45:00', 26.50, 5.00, 21.25, 7.00, 2.65, 0.32),
('R045', 'D026', '2024-01-19 15:30:00', '2024-01-19 15:50:00', 14.00, 1.00, 10.75, 2.50, 1.40, 0.17),
('R046', 'D020', '2024-01-19 16:45:00', '2024-01-19 17:15:00', 23.25, 3.75, 18.75, 5.75, 2.33, 0.28),
('R047', 'D027', '2024-01-19 18:00:00', '2024-01-19 18:25:00', 16.75, 1.50, 12.75, 3.50, 1.68, 0.20),
('R048', 'D021', '2024-01-19 19:30:00', '2024-01-19 19:55:00', 20.75, 2.75, 16.75, 4.75, 2.08, 0.25),
('R049', 'D028', '2024-01-19 20:45:00', '2024-01-19 21:10:00', 22.50, 4.25, 18.25, 6.25, 2.25, 0.27),
('R050', 'D022', '2024-01-20 07:45:00', '2024-01-20 08:15:00', 25.25, 4.75, 20.50, 6.50, 2.53, 0.30);

-- create drivers
CREATE TABLE drivers (
    driver_id TEXT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT NOT NULL,
    license_number TEXT UNIQUE NOT NULL,
    vehicle_make TEXT NOT NULL,
    vehicle_model TEXT NOT NULL,
    vehicle_year INTEGER NOT NULL,
    license_plate TEXT UNIQUE NOT NULL,
    rating REAL DEFAULT 0.0,
    total_rides INTEGER DEFAULT 0,
    join_date DATE NOT NULL,
    status TEXT CHECK(status IN ('active', 'inactive', 'suspended')) DEFAULT 'active',
    background_check_date DATE,
    insurance_expiry DATE NOT NULL
);

-- seed drivers
INSERT INTO drivers (driver_id, first_name, last_name, email, phone, license_number, vehicle_make, vehicle_model, vehicle_year, license_plate, rating, total_rides, join_date, status, background_check_date, insurance_expiry) VALUES
('D001', 'Michael', 'Johnson', 'michael.johnson@email.com', '555-0101', 'DL001234567', 'Toyota', 'Camry', 2020, 'ABC123', 4.8, 342, '2023-03-15', 'active', '2023-03-10', '2025-08-20'),
('D002', 'Sarah', 'Williams', 'sarah.williams@email.com', '555-0102', 'DL002345678', 'Honda', 'Civic', 2019, 'DEF456', 4.7, 298, '2023-05-22', 'active', '2023-05-18', '2025-11-15'),
('D003', 'David', 'Brown', 'david.brown@email.com', '555-0103', 'DL003456789', 'Nissan', 'Altima', 2021, 'GHI789', 4.9, 425, '2022-11-08', 'active', '2022-11-01', '2025-03-30'),
('D004', 'Lisa', 'Davis', 'lisa.davis@email.com', '555-0104', 'DL004567890', 'Hyundai', 'Elantra', 2022, 'JKL012', 4.6, 189, '2023-08-12', 'active', '2023-08-05', '2025-12-10'),
('D005', 'Robert', 'Wilson', 'robert.wilson@email.com', '555-0105', 'DL005678901', 'Mazda', 'CX-5', 2020, 'MNO345', 4.8, 367, '2023-01-30', 'active', '2023-01-25', '2025-07-18'),
('D006', 'Jennifer', 'Miller', 'jennifer.miller@email.com', '555-0106', 'DL006789012', 'Subaru', 'Impreza', 2019, 'PQR678', 4.5, 156, '2023-09-14', 'active', '2023-09-10', '2025-09-25'),
('D007', 'James', 'Garcia', 'james.garcia@email.com', '555-0107', 'DL007890123', 'Volkswagen', 'Jetta', 2021, 'STU901', 4.9, 478, '2022-07-03', 'active', '2022-06-28', '2025-05-12'),
('D008', 'Michelle', 'Rodriguez', 'michelle.rodriguez@email.com', '555-0108', 'DL008901234', 'Kia', 'Forte', 2020, 'VWX234', 4.7, 289, '2023-04-18', 'active', '2023-04-15', '2025-10-08'),
('D009', 'Christopher', 'Martinez', 'christopher.martinez@email.com', '555-0109', 'DL009012345', 'Ford', 'Focus', 2018, 'YZA567', 4.4, 134, '2023-10-25', 'active', '2023-10-20', '2025-06-30'),
('D010', 'Amanda', 'Anderson', 'amanda.anderson@email.com', '555-0110', 'DL010123456', 'Chevrolet', 'Cruze', 2022, 'BCD890', 4.8, 312, '2023-02-14', 'active', '2023-02-10', '2025-04-22');

-- create dim_date
CREATE TABLE dim_date (
    date_key INTEGER PRIMARY KEY,
    full_date DATE UNIQUE NOT NULL,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL,
    day_of_week INTEGER NOT NULL,
    day_name TEXT NOT NULL,
    is_weekend INTEGER NOT NULL CHECK(is_weekend IN (0, 1))
);

-- seed dim_date
WITH RECURSIVE date_series AS (
    SELECT 
        20250501 as date_key,
        '2025-05-01' as full_date,
        2025 as year,
        5 as month,
        1 as day,
        5 as day_of_week,  -- Thursday
        'Thursday' as day_name,
        0 as is_weekend
    
    UNION ALL
    
    SELECT 
        CAST(strftime('%Y%m%d', date(full_date, '+1 day')) AS INTEGER) as date_key,
        date(full_date, '+1 day') as full_date,
        CAST(strftime('%Y', date(full_date, '+1 day')) AS INTEGER) as year,
        CAST(strftime('%m', date(full_date, '+1 day')) AS INTEGER) as month,
        CAST(strftime('%d', date(full_date, '+1 day')) AS INTEGER) as day,
        CAST(strftime('%w', date(full_date, '+1 day')) AS INTEGER) as day_of_week,
        CASE CAST(strftime('%w', date(full_date, '+1 day')) AS INTEGER)
            WHEN 0 THEN 'Sunday'
            WHEN 1 THEN 'Monday'
            WHEN 2 THEN 'Tuesday'
            WHEN 3 THEN 'Wednesday'
            WHEN 4 THEN 'Thursday'
            WHEN 5 THEN 'Friday'
            WHEN 6 THEN 'Saturday'
        END as day_name,
        CASE 
            WHEN CAST(strftime('%w', date(full_date, '+1 day')) AS INTEGER) IN (0, 6) THEN 1 
            ELSE 0 
        END as is_weekend
    FROM date_series
    WHERE full_date < '2025-06-15'
)
INSERT INTO dim_date (date_key, full_date, year, month, day, day_of_week, day_name, is_weekend)
SELECT date_key, full_date, year, month, day, day_of_week, day_name, is_weekend
FROM date_series;

-- create fee structure
CREATE TABLE fee_structure (
    fee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    fee_type TEXT NOT NULL,
    description TEXT NOT NULL,
    calculation_method TEXT NOT NULL CHECK(calculation_method IN ('percentage', 'flat_rate', 'per_mile')),
    rate REAL NOT NULL,
    min_amount REAL DEFAULT 0.0,
    max_amount REAL DEFAULT NULL,
    effective_date DATE NOT NULL,
    is_active INTEGER NOT NULL DEFAULT 1 CHECK(is_active IN (0, 1))
);

-- seed fee structure
INSERT INTO fee_structure (fee_type, description, calculation_method, rate, min_amount, max_amount, effective_date, is_active) VALUES
('platform_fee', 'Platform service fee charged to driver', 'percentage', 0.10, 0.50, 5.00, '2024-01-01', 1),
('booking_fee', 'Booking fee charged to rider', 'flat_rate', 2.50, 2.50, 2.50, '2024-01-01', 1),
('distance_rate', 'Per mile rate for distance calculation', 'per_mile', 1.25, 0.00, NULL, '2024-01-01', 1),
('wait_time_fee', 'Fee for wait time per minute', 'flat_rate', 0.50, 0.00, 15.00, '2024-01-01', 1),
('tax_deduction', 'Tax deduction from driver earnings', 'percentage', 0.08, 0.10, NULL, '2024-01-01', 1);