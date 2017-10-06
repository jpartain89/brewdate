#!/usr/bin/env python3

import subprocess

def brewdate(command):
    "This is simply calling brew with the command as the variable"
    for default_commands in command:
        print("\nRunning brew", default_commands, "\n")
        subprocess.check_call(['/usr/local/bin/brew', default_commands])

def brewdate_cask(command):
    "This is simply calling brew cask with the command as the variable"
    for default_commands in command:
        print("\nRunning brew cask", default_commands, "\n")
        subprocess.check_call(['/usr/local/bin/brew', 'cask', default_commands])

thelist = ['update', 'upgrade', 'cleanup', 'prune', 'doctor']
casklist = ['doctor', 'cleanup']

brewdate(thelist)
brewdate_cask(casklist)
