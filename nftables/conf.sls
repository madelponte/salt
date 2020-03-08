#!jinja|yaml
{%- set settings = salt['pillar.get']('nftables', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}

/etc/nftables.conf:
  file.managed:
    - source: salt://nftables/files/nftables.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644


{%- endif %}