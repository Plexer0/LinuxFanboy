#!/bin/bash

# This scripts restores the repository back to the state when it was cloned.
# It will wipe out all custom changes you have made, so be careful!!!

# Warn the user
echo "WARNING: All local changes in this repo will be erased! Please be certain!"
echo -n "==> "
echo -n $(pwd)
echo -n " <=="
echo "" # Linebreak
read -p "Press any key to continue..."

# Remove everything and restore files with git
rm -rf *
git restore *
