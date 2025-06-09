SELECT
    c.company_code,
    c.founder,
    COALESCE(l.lm_count, 0) AS total_lead_managers,
    COALESCE(s.sm_count, 0) AS total_senior_managers,
    COALESCE(m.m_count, 0) AS total_managers,
    COALESCE(e.e_count, 0) AS total_employees
FROM Company c
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT lead_manager_code) AS lm_count
    FROM Lead_Manager
    GROUP BY company_code
) l ON c.company_code = l.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT senior_manager_code) AS sm_count
    FROM Senior_Manager
    GROUP BY company_code
) s ON c.company_code = s.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT manager_code) AS m_count
    FROM Manager
    GROUP BY company_code
) m ON c.company_code = m.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT employee_code) AS e_count
    FROM Employee
    GROUP BY company_code
) e ON c.company_code = e.company_code
ORDER BY c.company_code;