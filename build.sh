#!/bin/bash

# This script compiles all the C++ scripts so you can build the Debian package.
# You need to have the build-essential package installed before continuing.

# Selfcheck

# Check if g++ is installed
if [ ! -f /usr/bin/g++ ];
	then echo "ERROR: Cannot find C++ compiler. Is build-essential installed?"
	exit 130
fi

# Check if rename is installed
if [ ! -f /usr/bin/rename ];
	then echo "ERROR: Cannot find rename. Is it installed?"
	exit 130
fi

# Warn user if sudo/root account is detected.
if [ $(id -u) -eq 0 ];
	then echo "WARNING: sudo/root user detected. This may cause unwanted behaviour."
fi

# Assign working directory
pwd=$(pwd)

# Compile C++ scripts
for segment in $pwd/usr/bin/*; do
	echo "Compiling $segment"
	g++ $segment -o $segment.exe
done

# Cleanup environment (Can be restored with git reset)
rm $pwd/usr/bin/*.cpp
find -type f -name '*.exe' | while read f; do mv "$f" "${f%.exe}"; done
find -type f -name '*.cpp' | while read f; do mv "$f" "${f%.cpp}"; done


# Build Debian package
echo "Building package..."
dpkg-deb --build $pwd
mv ../LinuxFanboy.deb $pwd
# Install package on the current system
echo "Installing package..."
sudo dpkg -i *.deb

# Announce Success
echo "LinuxFanboy is installed! :)"
