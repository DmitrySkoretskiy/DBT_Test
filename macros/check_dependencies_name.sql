{% macro check_dependencies_name(model_name) %}
{% if execute %}
{% set dep_obj = {} %}
{% set dep_models = [] %}
{% for node in graph.nodes.values() %}
{% if node.name == model_name %}
{% do dep_obj.update(node.depends_on) %}
{% endif %}
{% endfor %}
{% for dep_list in dep_obj.values() %}
{% for dep in dep_list %}
{% do dep_models.append(dep) %}
{% endfor %}
{% endfor %}
{% set obj_cnt = dep_models | length %}
{% set result %}
{% if obj_cnt > 0 %}
Модель {{ model_name }} зависит от {{ obj_cnt }} объектов:
{% for dep in dep_models %}
- {{ dep }}
{% endfor %}
{% else %}
Модель {{ model_name }} не имеет зависимостей
{% endif %}
{% endset %}
{% do log(result, True) %}
{% endif %}
{% endmacro %}
