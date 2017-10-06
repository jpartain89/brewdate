#!/usr/bin/env python

import subprocess

def brewdate(command):
    """
    Calls the brew command using the literal file location.
    It tells you which command is running and returns the output, if there is any.
    """

    for default_commands in command:
        print("\nRunning brew", default_commands, "\n")
        subprocess.check_call(['/usr/local/bin/brew', default_commands])

def brewdate_cask(command):
    """
    Calls the brew cask command using the literal file location.
    It tells you which command is running and returns the output, if there is any.
    """
    for default_commands in command:
        print("\nRunning brew cask", default_commands, "\n")
        subprocess.check_call(['/usr/local/bin/brew', 'cask', default_commands])

THE_LIST = ['update', 'upgrade', 'cleanup', 'prune', 'doctor']
CASK_LIST = ['doctor', 'cleanup']

brewdate(THE_LIST)
brewdate_cask(CASK_LIST)
