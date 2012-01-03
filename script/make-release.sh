#!/bin/bash

# This script prepares a release candidate for the thesis-umich template.  It
# creates a ZIP archive because that is a format that is easily opened on a 
# wide variety of operating systems.  It will create an archive that is in the
# folder  
#
#  release/
# 
# and has a name that corresponds to the first argument of this function.
#
# The release contains all of the files in the folder
#
#  sample/
#
# in addition to the file
#
#  thesis-umich.cls
#
# which contains the actual source of this package.
#
# This script must be run from the aiaa-pretty folder that contains the .git
# folder because the script contains relative file references.

# Copy the source file to the current directory to make the ZIP look right.
cp sample/tex/thesis-umich.cls .

# This will create the archive with a name based on the first input.
zip release/${1%.zip}.zip thesis-umich.cls -r sample/

# Delete the file that was copied.
rm thesis-umich.cls
