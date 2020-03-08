#!jinja|yaml
{%- set settings = salt['pillar.get']('nftables', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}

/etc/nftables.conf:
  file.managed:
    - source: salt://firewall/files/nftables.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644


{%- else %}
{%- set settings = salt['pillar.get']('iptables', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}

/etc/iptables.up.rules:
  file.managed:
    - source: salt://firewall/files/iptables.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: /sbin/iptables-restore < /etc/iptables.up.rules
    - onchanges:
      - file: /etc/iptables.up.rules

/etc/network/if-up.d/iptables:
  file.managed:
    - source: salt://firewall/files/iptables
      - user: root
      - group: root
      - mode: 755

{%- endif %}
{%- endif %}