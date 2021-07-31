# Applesauce

Apple ][ C compiler helper built on top of [cc65](https://github.com/cc65/cc65)

## Getting Started

I wrote a script `setup.sh` to pull the required files and get your build environment ready.

Just be sure to have the following packages already instaled on your system:

`build-essential make git openjdk-11-jdk`

## Building 

The Directory tree should look like this (replace Project with your project's name):

```
Project
 ⌞ Project.c
```

Then from the main project directory (where the `Makefile` is located) run:

```bash
make PROJECT=Project
```
