/etc/resolv.conf:
  file.managed:
    - source: salt://resolvconf/files/resolv.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
