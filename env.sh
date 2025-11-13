#!/bin/bash
# QMK Userspace build helpers for Kyria pgherveou keymap
# Source this file: source env.sh

# Build firmware
qmk_build() {
    qmk compile -kb splitkb/halcyon/kyria/rev4 -km pgherveou \
        -e HLC_TFT_DISPLAY=1 -e TARGET=kyria_rev4_pgherveou_display
}

# Flash firmware to keyboard
qmk_flash() {
    qmk flash -kb splitkb/halcyon/kyria/rev4 -km pgherveou \
        -e HLC_TFT_DISPLAY=1 -e TARGET=kyria_rev4_pgherveou_display
}

# Clean build artifacts
qmk_clean() {
    qmk clean
}

# One-time setup: configure QMK userspace overlay directory
qmk_setup() {
    local dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    qmk config user.overlay_dir="$dir"
    echo "✓ QMK userspace configured: $dir"
}
