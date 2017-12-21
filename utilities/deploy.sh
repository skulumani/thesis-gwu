#!/bin/bash

# deploy to github tagged releases
if [ -n "$TRAVIS_TAG" ]; then
    echo "Tag $TRAVIS_TAG exists"
else
    echo "No current tag. Lets make one"
    git config --local user.name 'travis'
    git config --local user.email 'travis'
    git tag -a v${TRAVIS_BUILD_NUMBER} -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag"

    echo "Done making a tag"
fi

