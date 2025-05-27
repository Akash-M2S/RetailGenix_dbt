select * from {{ ref("employee_data") }}
where FIRSTNAME like '%S%'
