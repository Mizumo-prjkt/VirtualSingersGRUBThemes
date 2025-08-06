#!/bin/bash

# Package the theme files into a tarball for public distribution.

# First, list down the themes directory
# First, lets check the crypton directory, then synthv, then fanloid
# List down the folders in an array

CRYPTON_DIR="themes/crypton"
SYNTHV_DIR="themes/synthv"
FANLOID_DIR="themes/fanloid"

# THEN LIST DOWN THE THEMES
CRYPTON_THEMES=($(ls -d $CRYPTON_DIR/*/))
SYNTHV_THEMES=($(ls -d $SYNTHV_DIR/*/))
FANLOID_THEMES=($(ls -d $FANLOID_DIR/*/))

# Now, create a loop to package each theme
for THEME in "${CRYPTON_THEMES[@]}" "${SYNTHV_THEMES[@]}" "${FANLOID_THEMES[@]}"; do
    # Get the theme name from the path
    THEME_NAME=$(basename "$THEME")
    # Create a tarball for the theme
    TAR_NAME="${THEME_NAME}.tar.gz"
    echo "Packaging $THEME_NAME into $TAR_NAME"
    tar -czf "$TAR_NAME" -C "$THEME" .
    echo "Created $TAR_NAME successfully."
done