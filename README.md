# Linux Fanboy
[![pipeline status](https://gitlab.com/Plexer0/LinuxFanboy/badges/master/pipeline.svg)](https://gitlab.com/Plexer0/LinuxFanboy/-/commits/master)  
This is just a silly little Debian package that adds Windows commands to your /usr/bin folder.
When you execute them, you will receive a message that a stereotypical hardcore Linux fan would respond. 

**Please note that none of these responses are purposely aimed at anyone, nor towards Microsoft or the Linux community. This silly application exists just for fun and entertainment.**

## Why would I install this?
Don't ask me! ¯\_(ツ)_/¯

## Build Instructions
Make sure your Debian build tools are installed correctly.<br>
```sudo apt-get install build-essential```

Clone this repository.<br>
```git clone https://www.gitlab.com/Plexer0/LinuxFanboy.git```

Compile the C++ scripts. (You can do so with the [build.sh](build.sh) script in the repository folder.)

Build the Debian package with dpkg.<br>
```dpkg-deb --build /path/to/LinuxFanboy```

Then, install the package on the appropiate system.<br>
```sudo dpkg -i *.deb```

## Contributions
**This area will be populated when someone adds other Windows commands + messages.** <br>

If you have an idea for a command + message to add, see [CONTRIBUTING.md.](CONTRIBUTING.md)
