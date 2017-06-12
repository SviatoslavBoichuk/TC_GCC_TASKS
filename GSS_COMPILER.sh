#!/bin/bash

gcc -Isrc/m2/include/ src/m2/m2.c -Isrc/m1/include/ src/m1/m1.c -Isrc/include/ -o src/output/a.out
