INSERT INTO customers (customer_id, customer_name, customer_type, city, state) VALUES
(1, 'Walmart', 'Retail', 'Philadelphia', 'PA'),
(2, 'Target', 'Retail', 'King of Prussia', 'PA'),
(3, 'Amazon Facility', 'Warehouse', 'Norristown', 'PA'),
(4, 'Main Line Hospital', 'Healthcare', 'Bryn Mawr', 'PA'),
(5, 'Springfield School District', 'Education', 'Springfield', 'PA');

INSERT INTO locations (location_id, customer_id, location_name, city, state, region) VALUES
(1, 1, 'Walmart Supercenter #101', 'Philadelphia', 'PA', 'East'),
(2, 1, 'Walmart Supercenter #202', 'Camden', 'NJ', 'East'),
(3, 2, 'Target KOP', 'King of Prussia', 'PA', 'Central'),
(4, 3, 'Amazon Warehouse A1', 'Norristown', 'PA', 'Central'),
(5, 4, 'Main Line Hospital Building A', 'Bryn Mawr', 'PA', 'West'),
(6, 5, 'Springfield High School', 'Springfield', 'PA', 'West');

INSERT INTO technicians (technician_id, technician_name, team, hire_date, status) VALUES
(1, 'James Carter', 'HVAC', '2021-06-15', 'Active'),
(2, 'Maria Lopez', 'Electrical', '2020-03-22', 'Active'),
(3, 'David Kim', 'General Maintenance', '2022-01-10', 'Active'),
(4, 'Aisha Johnson', 'HVAC', '2019-11-05', 'Active'),
(5, 'Robert Smith', 'Electrical', '2023-02-01', 'Active'),
(6, 'Kevin Brown', 'General Maintenance', '2021-09-18', 'Inactive');

INSERT INTO service_requests (
request_id, customer_id, location_id, technician_id,
request_type, priority, status,
submitted_at, first_response_at, completed_at,
sla_hours, resolution_notes, repeat_issue_flag
) VALUES
(1, 1, 1, 1, 'HVAC Repair', 'High', 'Completed', '2026-03-01 08:00', '2026-03-01 09:00', '2026-03-01 14:00', 8, 'Repaired AC unit', 'No'),
(2, 2, 3, 2, 'Electrical Issue', 'Medium', 'Completed', '2026-03-02 10:00', '2026-03-02 11:30', '2026-03-02 16:00', 8, 'Fixed wiring issue', 'No'),
(3, 3, 4, 3, 'General Maintenance', 'Low', 'Open', '2026-03-03 09:00', NULL, NULL, 24, 'Pending inspection', 'No'),
(4, 4, 5, 4, 'HVAC Repair', 'High', 'Completed', '2026-03-04 07:30', '2026-03-04 08:00', '2026-03-04 12:00', 6, 'Replaced compressor', 'Yes'),
(5, 5, 6, 5, 'Electrical Issue', 'High', 'Delayed', '2026-03-05 12:00', '2026-03-05 15:00', NULL, 4, 'Parts on order', 'No'),
(6, 1, 2, 1, 'HVAC Repair', 'Medium', 'Completed', '2026-03-06 09:00', '2026-03-06 09:45', '2026-03-06 13:30', 8, 'Routine maintenance', 'No'),
(7, 2, 3, 2, 'Electrical Issue', 'High', 'Completed', '2026-03-07 11:00', '2026-03-07 11:15', '2026-03-07 15:00', 6, 'Breaker replacement', 'Yes'),
(8, 3, 4, 3, 'General Maintenance', 'Medium', 'Completed', '2026-03-08 08:30', '2026-03-08 09:30', '2026-03-08 12:00', 8, 'Door repair', 'No'),
(9, 4, 5, 4, 'HVAC Repair', 'Low', 'Completed', '2026-03-09 10:00', '2026-03-09 11:00', '2026-03-09 15:00', 12, 'Filter replacement', 'No'),
(10, 5, 6, 5, 'Electrical Issue', 'High', 'Open', '2026-03-10 14:00', NULL, NULL, 6, 'Awaiting technician', 'No');

-- =====================================================
-- DATA NOTES
-- =====================================================

-- Relationships:
-- customers → locations
-- customers / locations / technicians → service_requests

-- NULL values represent:
-- requests not yet responded to or completed

-- Status lifecycle:
-- Open, Completed, Delayed

-- repeat_issue_flag:
-- identifies recurring service issues

-- Data purpose:
-- Simulates service operations requests across multiple customers,
-- locations, and technicians to analyze workload, SLA performance,
-- and issue trends.