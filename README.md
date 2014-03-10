# .cmd

This is public repo for my collection of useful .cmd, .batch and .ps1 files for when Im in a windows enviroment.

# Commands

## webget

A wget clone leveraging powershell to do the heavy lifting.

### Useage

`webget http://example.com/install.msi`

## timecmd

Measure a commands execution time

### Useage

`timecmd <command>`

# Aliases

Aliases are injected into my console by running `doskey /macrofile="path/to/aliasesfile` to automatically run this command I use the Autorun registry key found at `HKEY_CURRENT_USER\Software\Microsoft\Command Processor`.


# Contribute

Send me a pull request with the scripts you use.