apt-transport-https:
  pkg.installed

apt-get-update:
  cmd.wait:
    - name: apt-get update

# Base debian repositories
/etc/apt/sources.list:
  file.managed:
    - source: salt://repositories/files/sources.list
    - template: jinja
    - watch_in:
       - cmd: apt-get-update

saltrepo:
  pkgrepo.managed:
    - humanname: salt repository
    - name: deb https://repo.saltstack.com/apt/debian/9/amd64/latest stretch main 
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/apt/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub
    - refresh_db: False
    - watch_in:
      -cmd: apt-get-update
