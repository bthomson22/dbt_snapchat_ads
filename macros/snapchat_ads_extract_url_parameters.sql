{% macro snapchat_ads_extract_url_parameter(field, url_parameter) -%}

{{ adapter.dispatch('snapchat_ads_extract_url_parameter', 'snapchat_ads') (field, url_parameter) }}

{% endmacro %}


{% macro default__snapchat_ads_extract_url_parameter(field, url_parameter) -%}

{{ dbt_utils.get_url_parameter(field, url_parameter) }}

{%- endmacro %}


{% macro spark__snapchat_ads_extract_url_parameter(field, url_parameter) -%}

{%- set formatted_url_parameter = "'" + url_parameter + "=([^&]+)'" -%}
nullif(regexp_extract({{ field }}, {{ formatted_url_parameter }}, 1), '')

{%- endmacro %}