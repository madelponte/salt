include:
  - ssh
  - sudo
  - repositories
  - firewall
  - network

install common packages:
  pkg.installed:
    - pkgs:
      - vim
      - htop
      - rsync
      - net-tools
      - unzip
      - zip
      - dnsutils
      - ntp
      - curl
      - iotop
