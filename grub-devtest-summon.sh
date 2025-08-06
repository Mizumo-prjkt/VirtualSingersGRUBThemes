#!/bin/bash
# GRUB Development Test Summon Script v1

## This script is used to test the GRUB development environment.
## By using grub2-theme-preview, it allows for quick testing of GRUB themes.
## May require systems to have Intel or AMD VT-x enabled in BIOS.
# Use flag: --no-kvm to disable KVM support if not available.

# Just summon the grub2-theme-preview 
if [ -z "$1" ] || [ "$1" = "--help"  ] || [ "$1" = "-h" ]; then
    echo "Usage: $0 [--theme <theme_dir>] [--resolution <width>x<height>] [--no-kvm]"
    exit 1
fi

# Run the grub2-theme-preview with the provided arguments
# First, check what flags are being provided, find --theme, --resolution, and --no-kvm

THEME=""
RESOLUTION=""
NO_KVM=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --theme)
            THEME="$2"
            shift 2
            ;;
        --resolution)
            RESOLUTION="$2"
            shift 2
            ;;
        --no-kvm)
            NO_KVM="--no-kvm"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Construct the command to run grub2-theme-preview
CMD="grub2-theme-preview"

if [ -n "$THEME" ]; then
    CMD+="  $THEME"
fi

if [ -n "$RESOLUTION" ]; then
    CMD+=" --resolution $RESOLUTION"
fi


if [ -n "$NO_KVM" ]; then
    CMD+=" $NO_KVM"
fi

# Execute the command
echo "Running command: $CMD"
eval "$CMD"
