# Linux Fanboy
This is just a silly little Debian package that adds Windows commands to your /usr/bin folder.
When you execute them, you will receive a message that a stereotypical hardcore Linux fan would respond.

# Why would I install this?
Don't ask me! ¯\_(ツ)_/¯

# Build Instructions
Make sure your Debian build tools are installed correctly.<br>
```sudo apt-get install build-essential```

Also make sure that rename is installed to add quality of life to the compiling process.<br>
```sudo apt-get install rename```

Clone this repository.<br>
```git clone https://www.gitlab.com/Plexer0/LinuxFanboy.git```

Compile the C++ scripts. (You can do so manually, or with the [build.sh](https://gitlab.com/Plexer0/LinuxFanboy/-/blob/master/build.sh) script.)

Build the Debian package with dpkg.<br>
```dpkg-deb --build LinuxFanboy```

Then, install the package on the appropiate system.<br>
```sudo dpkg -i *.deb```

# Contributions
**This area will be populated when someone adds other Windows commands + messages.** <br>

If you have an idea for a command + message to add, see CONTRIBUTING.md
