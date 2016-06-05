# NAME

**links** - Wrapper command of **ln** to make links

# SYNOPSYS

Create Link:

    # Format
    links [OPTIONS] SOURCE_PATH [LINK_PATH]

    # Symbolic link (default)
    links /path/to/foo.txt
    links SOURCE LINK
    links -f|--force SOURCE LINK # Overwrite link

    # Hard link
    links -H|--hard SOURCE_PATH [LINK_PATH]

    # Verbose output
    links -V|--verbose SOURCE_PATH [LINK_PATH]
    LINKS_VERBOSE=1 links SOURCE_PATH [LINK_PATH]

Help:

    links -h|--help

Version:

    links -v|--version

# DESCRIPTION

This script **links** creates symbolic or hard link by `ln` command.
The default is symbolic link.

Unlike `ln` command, **links** does not overwrite existing file or directory even
if `--force` option is specified.

# AUTHORS

YASUTAKE Kiyoshi <yasutake.kiyoshi@gmail.com>

# LICENSE

The MIT License (MIT)

Copyright (c) 2016 YASUTAKE Kiyoshi
