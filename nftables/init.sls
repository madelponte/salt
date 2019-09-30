#!jinja|yaml
{%- set settings = salt['pillar.get']('firewall', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}


include:
  - .pkg
  - .conf

{%- endif %}
