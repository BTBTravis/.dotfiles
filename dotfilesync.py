#!/usr/bin/env python
# inspired by http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
import subprocess
import csv
import sys

# global vars
selfpath = '~/dotfiles' # dotfiles directory
backup = '~/dotfiles_old' # old dotfiles backup directory


# get files names
f = open('dotfilemappings.csv', 'rb')
reader = csv.reader(f)
# ex: .test,~/.test

# make backup folder
print 'Creating ' + backup + ' for backup of any existing dotfiles'
subprocess.call('mkdir -p ' + backup, shell=True)
print "...done"

# move files into backup and create syslinks in there place
for fileinfo in reader:
    print 'Moving any existing dotfiles into ' + backup
    subprocess.call('mv ' + fileinfo[1] + ' ' + backup, shell=True)
    print "Creating symlink to $file in home directory."
    subprocess.call('ln -s ' + selfpath + '/' + fileinfo[0] + ' ' + fileinfo[1], shell=True)
print 'done'

f.close()
