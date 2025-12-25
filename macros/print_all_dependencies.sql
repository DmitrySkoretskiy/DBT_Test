{% macro print_all_dependencies() %}
  {% if execute %}
    {% for node in graph.nodes.values() %}
      {{ log("NODE: " ~ node.unique_id, info=true) }}
      {{ log("  type: " ~ node.resource_type, info=true) }}
      {{ log("  depends_on.nodes: " ~ node.depends_on.nodes, info=true) }}
      {{ log("  depends_on.macros: " ~ node.depends_on.macros, info=true) }}
    {% endfor %}
  {% endif %}
{% endmacro %}
