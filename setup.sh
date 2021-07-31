#!/bin/bash

# This file sets up the build environment
cd Tools
git clone https://github.com/cc65/cc65.git
wget -O ac.jar https://github.com/AppleCommander/AppleCommander/releases/download/v1-6-0/AppleCommander-ac-1.6.0.jar
cd cc65
make -j4
cd ../..