#!jinja|yaml
{%- set settings = salt['pillar.get']('hosting', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}

apt-get-update:
  cmd.wait:
    - name: apt-get update

# Base debian repositories
/etc/apt/sources.list:
  file.managed:
    - source: salt://repositories/files/sources.list
    - template: jinja
    - watch_in:
       - cmd: apt-get-update

{%- endif %}