select * from {{ ref("employee_data") }}
where DEPARTMENT = 'Finance'
