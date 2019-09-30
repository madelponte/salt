openssh-server:
  pkg.installed:
    - pkg: openssh-server
  service.running:
    - name: sshd.service
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config
