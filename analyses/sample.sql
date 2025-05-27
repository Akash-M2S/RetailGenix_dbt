select * from {{ ref("employee_data") }}
where SALARY like '%80%'