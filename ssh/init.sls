include:
  - .pkg

Install Config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/files/sshd_config

{%- for user in salt['pillar.get']('users') %}
ssh_dir_{{ user }}:
  file.directory:
    - name: /home/{{ user }}/.ssh
    - user: {{ user }}
    - group: {{ user }}
    - mode: '0700'

ssh_keys_{{ user }}:
  file.managed:
    - name: /home/{{ user }}/.ssh/authorized_keys
    - source: salt://ssh/files/keys/{{ user }}
    - user: {{ user }}
    - group: {{ user }}
    - mode: '0640'

{%- endfor %}
