#!jinja|yaml
{%- set settings = salt['pillar.get']('iptables', {}) %}
{%- if 'lookup' in settings %}
{%- set lookup = settings['lookup'] %}

/etc/iptables.up.rules:
  file.managed:
    - source: salt://iptables/files/iptables.up.rules
    - template: jinja
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: /sbin/iptables-restore < /etc/iptables.up.rules
    - onchanges:
      - file: /etc/iptables.up.rules

Install Config:
  file.managed:
    - name: /etc/network/if-up.d/iptables
    - source: salt://iptables/files/iptables
    - user: root
    - group: root
    - mode: 755

{%- endif %}