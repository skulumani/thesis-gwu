## GWU Thesis

This is a GWU SEAS thesis template. 
It complies with the requirements as laid out by the [ETD](http://library.gwu.edu/etd/formatting-content).

This is an extension/modification of a template created for the [University of Michigan](http://www-personal.umich.edu/~dalle/codes/thesis-umich/) by Derek Dalle.
I've made some modifications and updates to replace out of date packages, and comply with GWU guidelines.

## Contributing

Feel free to contribute any comments/suggestions you may have for this thesis. 
There are already a variety of [issues](https://github.com/skulumani/thesis-gwu/issues) that anyone can contribute to help solving. 

If you have any ideas to improve this class file or want to implement some new features feel free to submit a [pull request](https://help.github.com/articles/about-pull-requests/).

Eventually, this class file can serve as a legitimate format for all GWU graduate work.

## Usage

:construction: This is still in development so the documentation is a little lacking but it is fully functional.

For the user, you only have to modify the [frontmatter](https://github.com/skulumani/thesis-gwu/blob/master/tex/frontmatter.tex) with your information. 
The class file will automatically use this data to populate the title page, copyright, committee information, etc. 

There is already logic built in to allow for commands to be removed/added at will.
For example, there are a variety of frontmatter pages, i.e. prologue, preface, and acknowledgements, while in reality you'll typically only include one of these.
Simply, by removing the command or using the macros `\hidepreface` you can automatically remove them. 

Your text can be included in individual `/tex/*.tex` files and included in the main document using `\include{./tex/chapter1.tex}`. 
This gives you the added benefit of using `\includeonly{chapter1.tex}` to compile only specific sections of your much larger thesis. 

The class file already loads several common packages such as, `amsmath, graphicx, cleveref, hyperref` and others. 
You can add more packages but be aware that all package interactions **HAVE NOT** been tested. 

There is also some demonstration of typical commands, such as equations, figures, cross-referencing. 


## License 

This thesis class and template are released under the [GNU General Public License v3.0](http://www.gnu.org/licenses/gpl-3.0.html) 
