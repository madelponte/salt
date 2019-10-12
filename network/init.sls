#!jinja|yaml
{%- set settings = salt['pillar.get']('network', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}


include:
  - .conf

{%- endif %}