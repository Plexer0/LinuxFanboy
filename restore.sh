#!/bin/bash

# This scripts restores the repository back to the state when it was cloned.
# It will wipe out all custom changes you have made, so be careful!!!

# 1. Warn the user
echo "WARNING: All local changes in this repository will be erased! Please be certain!"
echo -n "==> "
echo -n $(pwd)
echo -n " <=="
echo "" # Linebreak

# 2. Ask for an interactive response
while true; do
	read -r -p "Do you wish to continue? (Y/N): " answer
	case $answer in
		[Yy]* ) rm -rf *; git restore *; echo "Repository restored."; break;; # User responds Y
		[Nn]* ) echo "Aborted. No changes were made"; exit;; # User responds N
		* ) echo "Unknown response. Try again.";;
	esac
done
