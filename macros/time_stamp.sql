{% docs get_current_timestamp %}
This macro returns the current timestamp using the `current_timestamp` function of the data warehouse.
Useful for audit columns like `created_at` or `updated_at`.
{% enddocs %}

{% macro get_current_timestamp() %}
    current_timestamp()
{% endmacro %}
