#!/bin/bash
# Don't forget to copy this to /usr/bin/crtsh

crtypy $1 | grep -iEho "(\w+\-\w+.\w+\.\w+\.\w+\.\w+|\w+\_\w+\.\w+\.\w+\.\w+\.\w+|\w+\.\w+\.\w+\.\w+\.\w+\.\w+)"
