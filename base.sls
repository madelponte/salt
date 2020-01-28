include:
  - ssh
  - sudo
  - repositories
  - nftables
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
