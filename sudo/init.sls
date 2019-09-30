/etc/sudoers:
  file.managed:
    - source: salt://sudo/files/sudoers
    - template: jinja
    - user: root
    - group: root
    - mode: 440
