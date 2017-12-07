#!/usr/bin/env python

import neovim
import sys
import os

import click

@click.command()
@click.argument("cmd", nargs=-1)
@click.option("-a/-na", help="absolute path or not", default=True)
def main(cmd, a):
    ncmd = list(cmd)
    nvim = neovim.attach('socket', path='/tmp/vim-server')
    if a:
        ncmd[1] = os.path.abspath(cmd[1])
    nvim.command(" ".join(ncmd))

if __name__ == "__main__":
    main()
