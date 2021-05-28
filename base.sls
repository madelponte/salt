include:
  - ssh
  - sudo
  - repositories
  - nftables
  - network
  - iptables

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
      - qemu-guest-agent
