#!/bin/bash

# deploy to github tagged releases
if [ -n "$TRAVIS_TAG" ]; then
    echo "Tag $TRAVIS_TAG exists"
else
    echo "No current tag. Make a tag"
    git config --local user.name 'travis'
    git config --local user.email 'travis'
    DATE=$(date +"%Y%m%d")

    # git tag -a v$(date +"%Y%m%dT%H%M%S")-${TRAVIS_BUILD_NUMBER} -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag"

    echo "Done making a tag"
fi

# create a zip file for CTAN
# create a new directory and copy files to it and then zip it up
mkdir thesis-gwu
latexmk -C
rm tex/*.aux
cp -rt ./thesis-gwu figures tex LICENSE.md README.md thesis-bib.bib thesis-gwu.cls thesis-sample.pdf thesis-sample.tex

zip -r9 thesis-gwu.zip  thesis-gwu 

# Can use ctan-o-mat to automatticaly deploy
# modify thesis-gwu.pkg version number and anything else
# then run ctan-o-mat -v --<validate or submit> --pkg ./utilities/thesis-gwu.pkg
