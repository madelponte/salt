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
  service.running:
    - name: networking.service
    - enable: True
    - reload: True
    - watch:
      - file: /etc/network/interfaces

{%- endif %}