#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
# Initialize ROM manifest
repo init -u https://github.com/alphadroid-project/manifest -b alpha-14 --git-lfs
# repo sync
/opt/crave/resync.sh
# cloning DT
# device tree
git clone https://github.com/AlphaDroidOS/android_device_xiaomi_mojito.git --depth 1 -b lineage-21.0 device/xiaomi/mojito
git clone https://github.com/AlphaDroidOS/android_device_xiaomi_sm6150-common.git --depth 1 -b lineage-21.0 device/xiaomi/sm6150-common
# kernel tree
git clone https://github.com/AlphaDroidOS/android_kernel_xiaomi_mojito.git --depth 1 -b 14 kernel/xiaomi/mojito
# vendor tree
git clone https://github.com/AlphaDroidOS/android_vendor_xiaomi_mojito.git --depth 1 -b 11 vendor/xiaomi/mojito
git clone https://github.com/AlphaDroidOS/android_vendor_xiaomi_sm6150-common.git --depth 1 -b 11 vendor/xiaomi/sm6150-common
git clone --depth=1 https://gitlab.com/pnplusplus/android_vendor_xiaomi_mojito-leicacamera vendor/xiaomi/mojito-leicacamera
# hardware tree
git clone https://github.com/AlphaDroidOS/android_hardware_xiaomi.git --depth 1 -b 13 mojito hardware/xiaomi
# set build environment
. build/envsetup.sh
# lunch
lunch lineage_mojito-gapps
# bacon
make bacon
