# .cmd

This is public repo for my collection of useful .cmd, .batch and .ps1 files for when Im in a windows enviroment.

# Commands

## webget

A wget clone leveraging powershell to do the heavy lifting.

### Usage

`webget http://example.com/install.msi`

## timecmd

Measure a commands execution time

### Usage

`timecmd <command>`


##forfile

A shorthand for windows `for` command when you need to run a command on every file in a directory. Expects the commands to accept the file as the last parameter of the command.

### Usage

`forfile <path> <comand>`

### example

Run all the sql scripts in a directory

`forfile c:\scripts\*.sql sqlcmd -S myServer\instanceName -i`


##Zip

Create a zip folder and add a number of files

### Usage

`zip <zipname> <file1> <file2> <file3>...`


# Aliases

Aliases are injected into my console by running `doskey /macrofile="path/to/aliasesfile` to automatically run this command I use the Autorun registry key found at `HKEY_CURRENT_USER\Software\Microsoft\Command Processor`. See [this blog post](http://www.declancook.com/aliases-in-windows-command-prompt/) for more details.


# Contribute

Send me a pull request with the scripts you use.
