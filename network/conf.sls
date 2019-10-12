{%- set settings = salt['pillar.get']('network', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}

/etc/network/interfaces:
  file.managed:
    - source: salt://network/files/interfaces
    - template: jinja
    - user: root
    - group: root
    - mode: 644


{%- endif %}