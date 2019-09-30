#!jinja|yaml
{%- set settings = salt['pillar.get']('firewall', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}

nftables:
  pkg.installed:
    - pkg: nftables
  service.running:
    - name: nftables.service
    - enable: True
    - reload: True
    - watch:
      - file: /etc/nftables.conf

{%- endif %}
