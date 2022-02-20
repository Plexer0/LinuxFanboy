#!/bin/bash

# This script compiles all the C++ scripts so you can build the Debian package.
# The following tags are available to use depending on your needs:
#
# sh build.sh | Compile all the C++ modules, build the Debian package, and install it on this system. (Default)
# SKIP_BUILD=y sh build.sh | Compile all the C++ modules, but don't build and install the package.
# DEBUG_TESTS=y sh build.sh | Executes every single binary (excluding binaries that run in an infinite loop). (Make sure you compile them first!!!)


# 1. Environment Checks

# Check if the C++ compiler is installed
if [ ! -f /usr/bin/g++ ];
	then echo "ERROR: Cannot find C++ compiler. Is build-essential installed?"
	exit 130
fi

# Check for renaming commands
if [ ! -f /usr/bin/find ];
	then echo "ERROR: Cannot find /usr/bin/find. This is required to trim binary extensions."
	exit 130
fi

if [ ! -f /usr/bin/mv ];
	then echo "CRITICAL: Cannot find /usr/bin/mv. Your Linux installation may be broken!"
	exit 130
fi

# Warn user if sudo/root account is detected
if [ $(id -u) -eq 0 ];
	then echo "WARNING: sudo/root user detected. This may cause unwanted behaviour!"
fi

# Run debugging tests if requested
if [ "$DEBUG_TESTS" == "y" ];
	then pwd=$(pwd) && rm $pwd/usr/bin/*.cpp && rm $pwd/usr/bin/vimisthebest && for binary in $pwd/usr/bin/*; do
	echo "---------------------------"
	echo "DEBUG: Testing binary, $binary"
	echo "---------------------------"
	$binary
	done
	exit
fi


# Assign working directory
pwd=$(pwd)

# 2. Compile C++ scripts
for segment in $pwd/usr/bin/*; do
	echo "Compiling $segment"
	g++ $segment -o $segment.exe # Random .exe extension is to trim all unneeded extensions from the compiled binaries
done

# Cleanup environment (Can be restored later with restore.sh)
rm $pwd/usr/bin/*.cpp
find -type f -name '*.exe' | while read f; do mv "$f" "${f%.exe}"; done
find -type f -name '*.cpp' | while read f; do mv "$f" "${f%.cpp}"; done


# 3. Build Debian package
if [ "$SKIP_BUILD" == "y" ];
        then echo "Debian package construction skipped."
	exit
else
echo "Building Debian package..."
chmod 555 $pwd/DEBIAN/postinst # Build will fail if permissions aren't correct
dpkg-deb --build $pwd

# 4. Install package on the current system
echo "Installing Debian package on local system..."
sudo dpkg -i ../*.deb

# Announce Success
echo "LinuxFanboy is installed! :)"
fi
