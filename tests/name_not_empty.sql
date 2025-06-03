SELECT *
FROM {{ ref('customer_dim') }}
WHERE name IS NULL
   OR TRIM(name) = ''