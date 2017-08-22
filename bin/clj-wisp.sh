#!/bin/bash
#guile $(cd `dirname $0`; pwd)/../clj-wisp.scm "$1" > "$2"
guile $(dirname $(readlink -f $0))/../clj-wisp.scm "$1" > "$2"
