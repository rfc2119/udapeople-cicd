#!/bin/bash -x

# installs and configures prometheus
sudo useradd --no-create-home prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

wget https://github.com/prometheus/prometheus/releases/download/v2.28.0/prometheus-2.28.0.linux-amd64.tar.gz
tar xvfz prometheus-2.28.0.linux-amd64.tar.gz

sudo cp prometheus-2.28.0.linux-amd64/prometheus /usr/local/bin
sudo cp prometheus-2.28.0.linux-amd64/promtool /usr/local/bin/
sudo cp -r prometheus-2.28.0.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-2.28.0.linux-amd64/console_libraries /etc/prometheus

sudo cp prometheus-2.28.0.linux-amd64/promtool /usr/local/bin/
rm -rf prometheus-2.28.0.linux-amd64.tar.gz prometheus-2.28.0.linux-amd64

# configure prom to monitor itself (as an initial setup_
cat << EOF | sudo tee /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s
  external_labels:
    monitor: 'prometheus'

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

EOF

sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus
