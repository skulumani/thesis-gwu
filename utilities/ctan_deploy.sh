#!/bin/bash

mkdir thesis-gwu
cp -rt ./thesis-gwu figures tex LICENSE.md README.md thesis-bib.bib thesis-gwu.cls thesis-sample.pdf thesis-sample.tex

zip -r9 thesis-gwu.zip  thesis-gwu 

# Can use ctan-o-mat to automatticaly deploy
# modify thesis-gwu.pkg version number and anything else
# then run ctan-o-mat -v --<validate or submit> --pkg ./utilities/thesis-gwu.pkg
read -p "Press enter to validate..."
ctan-o-mat -v --validate --pkg ./utilities/thesis-gwu.pkg

read -p "Press enter to submit..."

ctan-o-mat -v --submit --pkg ./utilities/thesis-gwu.pkg
