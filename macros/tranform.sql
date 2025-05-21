{% macro clean_sales_column(column_name, type="string") %}
    {%- if type == "string" -%}
        upper(trim({{ column_name }}))
    {%- elif type == "number" -%}
        coalesce({{ column_name }}, 0)
    {%- elif type == "phone" -%}
        regexp_replace({{ column_name }}, '[^0-9]', '')
    {%- elif type == "date" -%}
        to_date({{ column_name }})
    {%- else -%}
        {{ column_name }}
    {%- endif -%}
{% endmacro %}