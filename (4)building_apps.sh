#!/usr/bin/env bash
cd ~
cd chip-certification-tool/backend/third_party/connectedhomeip/repo/
source ./scripts/bootstrap.sh
gn gen out/debug --args='chip_mdns="platform" chip_inet_config_enable_ipv4=false'
ninja -C out/debug
scripts/examples/gn_build_example.sh      examples/all-clusters-app/linux/      examples/all-clusters-app/linux/out/all-clusters-app   chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/bridge-app/linux/      examples/bridge-app/linux/out/bridge-app chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/tv-app/linux/      examples/tv-app/linux/out/tv-app chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/tv-casting-app/linux/      examples/tv-casting-app/linux/out/tv-casting-app chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/lighting-app/linux/      examples/lighting-app/linux/out/lighting-app chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/thermostat/linux/      examples/thermostat/linux/out/thermostat chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh examples/ota-provider-app/linux examples/ota-provider-app/linux/out/host 'chip_config_network_layer_ble=false'
scripts/examples/gn_build_example.sh examples/ota-requestor-app/linux examples/ota-requestor-app/linux/out/host 'chip_config_network_layer_ble=false'
scripts/examples/gn_build_example.sh examples/door-lock-app/linux/ out/door-lock-app
cd ~
mkdir apps
cd apps
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/chip-tool chip-tool
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/chip-shell chip-shell
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/chip-cert chip-cert
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/all-clusters-app/linux/out/all-clusters-app/chip-all-clusters-app all-cluster-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/lighting-app/linux/out/lighting-app/chip-lighting-app lighting-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/tv-casting-app/linux/out/tv-casting-app/chip-tv-casting-app tv-casting-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/tv-app/linux/out/tv-app/chip-tv-app tv-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/bridge-app/linux/out/bridge-app/chip-bridge-app bridge-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/thermostat/linux/out/thermostat/thermostat-app thermostat-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/ota-requestor-app/linux/out/host/chip-ota-requestor-app ota-requestor-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/ota-provider-app/linux/out/host/chip-ota-provider-app ota-provider-app
cd ~
ln -s chip-certification-tool/backend/third_party/connectedhomeip/repo connectedhomeip
cp chip-certification-tool/backend/app/tool.config.example chip-certification-tool/backend/app/tool.config
ln -s chip-certification-tool/backend/app/tool.config test-harness.config
ln -s chip-certification-tool/cli cli
ln -s /etc/netplan/50-cloud-init.yaml network.config
echo "Add READme, start-test-harness.sh and rc.local"
