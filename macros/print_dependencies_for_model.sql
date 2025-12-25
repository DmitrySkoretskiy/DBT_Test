--dbt run-operation print_dependencies_for_model --args '{model_name: my_model}'
{% macro print_dependencies_for_model(model_name) %}
  {% if execute %}

    {# найти ноду по имени модели #}
    {% set target = none %}
    {% for node in graph.nodes.values() %}
      {% if node.name == model_name %}
        {% set target = node %}
      {% endif %}
    {% endfor %}

    {% if target is none %}
      {{ log("Model not found: " ~ model_name, info=true) }}
      {% do return() %}
    {% endif %}

    {{ log("MODEL: " ~ target.unique_id, info=true) }}
    {{ log("TYPE: " ~ target.resource_type, info=true) }}
    {{ log("UPSTREAM (direct):", info=true) }}
    {{ log(target.depends_on.nodes, info=true) }}
    {{ log("MACROS:", info=true) }}
    {{ log(target.depends_on.macros, info=true) }}

  {% endif %}
{% endmacro %}
