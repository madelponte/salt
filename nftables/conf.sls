{%- set settings = salt['pillar.get']('firewall', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}

/etc/nftables.conf:
  file.managed:
    - source: salt://nftables/files/nftables.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 755


{%- endif %}
