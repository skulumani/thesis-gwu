#!/bin/bash

# deploy to github tagged releases
if [ -n "$TRAVIS_TAG" ]; then
    echo "Tag $TRAVIS_TAG exists"
else
    echo "No current tag. Lets make one"
    git config --local user.name 'travis'
    git config --local user.email 'travis'
    git tag "$(date +'%Y%m%d%H%M%S')-$(git log --format=%h -1)"
fi
