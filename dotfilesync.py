#!/usr/bin/env python
# This is my first script.
import subprocess
import csv
import sys

f = open('dotfilemappings.csv', 'rb')
reader = csv.reader(f)

for r in reader:
    print r

f.close()




subprocess.call("ls -l", shell=True)
