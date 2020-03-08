#!jinja|yaml
{%- set settings = salt['pillar.get']('iptables', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}

include:
  - .conf

{%- endif %}