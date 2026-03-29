SQL
-- =====================================================
-- SERVICE OPERATIONS ANALYSIS QUERIES
-- Author: Juanita Rozzell
-- Description: SQL queries analyzing service request data
-- =====================================================

-- Q1: Total number of service requests
SELECT COUNT(*) AS total_requests
FROM service_requests;

-- Q2: Requests by status
SELECT status, COUNT(*) AS request_count
FROM service_requests
GROUP BY status;

-- Q3: Requests by type
SELECT request_type, COUNT(*) AS request_count
FROM service_requests
GROUP BY request_type;

-- Q4: Requests handled by technician
SELECT t.technician_name, COUNT(sr.request_id) AS requests_handled
FROM service_requests sr
JOIN technicians t
    ON sr.technician_id = t.technician_id
GROUP BY t.technician_name;

-- SLA performance by request
SELECT 
    request_id,
    request_type,
    sla_hours,
    (julianday(completed_at) - julianday(submitted_at)) * 24 AS actual_hours,
    CASE 
        WHEN completed_at IS NULL THEN 'In Progress'
        WHEN (julianday(completed_at) - julianday(submitted_at)) * 24 <= sla_hours THEN 'Met SLA'
        ELSE 'Missed SLA'
    END AS sla_status
FROM service_requests;

-- Request trends by type
SELECT
    request_type,
    COUNT(*) AS request_count
FROM service_requests
GROUP BY request_type;
-- Insight:
-- Electrical Issues and HVAC Repair are the most frequent request types, occurring equally in this dataset.




-- SLA performance summary
SELECT 
    CASE 
        WHEN completed_at IS NULL THEN 'In Progress'
        WHEN (julianday(completed_at) - julianday(submitted_at)) * 24 <= sla_hours THEN 'Met SLA'
        ELSE 'Missed SLA'
    END AS sla_status,
    COUNT(*) AS request_count
FROM service_requests
GROUP BY sla_status;

-- Technician performance
SELECT 
    t.technician_name,
    COUNT(sr.request_id) AS requests_handled
FROM service_requests sr
JOIN technicians t
    ON sr.technician_id = t.technician_id
GROUP BY t.technician_name;
-- Workload is evenly distributed among technicians

