%%
%% This is the file thesis-gwu.cls.
%% It provides a LaTeX class that is consistent with the guidelines
%% provided by the School of Engineering and Science as described at
%%   <http://library.gwu.edu/node/1128>
%%
%% GWU provides a sad excuse for a LaTeX template and this is an attempt to 
%% improve.
%%
%% This class is based on the LaTeX template provided at
%%   <http://www-personal.umich.edu/~dalle/codes/thesis-umich/>
%%
%% The correct usage of this template is to use it as a documentclass.
%% The first line of the .tex file should be
%%
%%     \documentclass{thesis-gwu}
%%
%% if this file is in the same directory as the .tex file.  If the
%% two files are not in the same directory, the relative path from
%% the .tex file to this .cls file should be provided.  For example,
%% if the document is called thesis-dalle.tex and this file,
%% thesis-umich.cls is in a subfolder called 'tex', the command
%% should be
%%
%%     \documentclass{./tex/thesis-gwu}
%%
%% An example is distributed with this file that demonstrates all
%% of the features of the template.  The example is in a file called
%% thesis-sample.tex.
%%

%% VERSIONS:
%%  1988.01.01 @Jin Ji            : Initial version; reportx.sty
%%  1988.05.19 @Jin Ji            : Unrecorded changes
%%  1988.12.13 @Jin Ji            : Corrected table of contents to show
%%                                  "CHAPTER" and also \@makecaption
%%  1989.01.08 @Jin Ji            : Corrections for section headers
%%  1989.11.29 @?                 : Removed a spurious command
%%  1992.07.24 @Roque D. Oliveira : Modified \startappendices to work
%%                                  with the New Font Selection Scheme.
%%  2008.09.01 @Jason Gilbert     : Obsolete code removed for
%%                                  compatibility with LaTeX2e; list of
%%                                  abbreviations added, made copyright
%%                                  page cleaner, fixed appendices, 
%%                                  bibliography, margins, title page,
%%                                  frontispiece, bottom-center page
%%                                  numbers, two-side printing, added
%%                                  in-dissertation abstract and
%%                                  abstract that prints at the end.
%%  2011.04.09 @Derek Dalle       : Convert rac.sty --> thesis.umich.cls
%%  2016.09.24 @Shankar Kulumani  : First attempt to modify for GWU
%%  2018.01.20 @Shankar Kulumani  : Setup titlesec for modifying headings

%% ---- HEADERS --------------------------------------------------------
% This prevents the compiler from running on old versions of LaTeX.
\NeedsTeXFormat{LaTeX2e}

% This command gives the name of the class.
\ProvidesClass{thesis-gwu}[2018/08/31 v1.6.1 GWU Thesis template]

%% ---- OPTIONS PROCESSING ---------------------------------------------
% Define three switches for the the thesis format types.
% The variables are \@gwu@thesis and \@gwu@report.
% The default values are false.
\newif\if@gwu@thesis
\newif\if@gwu@debug % option for debuggin

\newif\if@gwu@tableofcontents
\newif\if@gwu@listoffigures
\newif\if@gwu@listoftables
\newif\if@gwu@listofmaps
\newif\if@gwu@listofillustrations
\newif\if@gwu@listofprograms
\newif\if@gwu@listofabbrevs
\newif\if@gwu@listofsymbols
\newif\if@gwu@listofacronyms

\newif\if@gwu@listofglossariesabbrevs
\newif\if@gwu@listofglossariessymbols
\newif\if@gwu@listofglossariesacronyms
\newif\if@gwu@glossaryofterms

\newif\if@gwu@copyright
\newif\if@gwu@frontispiece
\newif\if@gwu@committeepage
\newif\if@gwu@dedication
\newif\if@gwu@acknowledgments
\newif\if@gwu@preface
\newif\if@gwu@prologue
\newif\if@gwu@foreword
\newif\if@gwu@nomenclature
\newif\if@gwu@abstract

\newif\if@gwu@msdegree

\newif\if@gwu@titlepage

% Set the default value of some of the options to true.
\@gwu@thesistrue
% \@gwu@listoffigurestrue
% \@gwu@listoftablestrue
% \@gwu@copyrighttrue
% \@gwu@committeepagefalse
\@gwu@msdegreetrue

% This declares a variable for using an index.
% An index is not allowed in dissertations.
\newif\if@gwu@index

% This makes an option for bibliography backrefs.
\newif\if@gwu@backref

% Declare options for the overall layout.
\DeclareOption{thesis}{\@gwu@thesistrue}

% if you call debug option then use the thesis option but not report
\DeclareOption{debug}{\@gwu@debugtrue\@gwu@thesistrue}

% Declare an option for the index.
\DeclareOption{index}{\@gwu@indextrue}

% Declare an option for bibliography backrefs.
\DeclareOption{backref}{\@gwu@backreftrue}

% This passes any other options on to the 'report' class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}%
 \typeout{Unknown option: passing ``\CurrentOption"
  option on to the standard LaTeX report class.}}
% This command tells LaTeX to simply process the class options.
\ProcessOptions

% This control structure calls the standard LaTeX report.cls class.
% The base font size should be 10pt unless using the submit option.

\LoadClass[letterpaper,12pt,oneside]{report}


% Make sure the index is off for 'thesis'.
\if@gwu@thesis
 \@gwu@indexfalse
\fi


%% ---- PACKAGE LOADING ------------------------------------------------

% This class uses the geometry.sty package to set the margins.
\if@gwu@debug
  % Show margins 
  \RequirePackage[top=1in,bottom=1in,left=1.25in, right=1.25in,
  showframe]{geometry}
\else
 % Use the standard margins for the thesis version.
 \RequirePackage[top=1in,bottom=1in,left=1.25in, right=1.25in]{geometry}
\fi

% Obsolete package check
\RequirePackage[l2tabu,orthodox]{nag}

% This loads the required math packages.
\RequirePackage[binary-units=true]{siunitx}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{amsthm}

% This loads the proper graphics package.
\RequirePackage{graphicx}

% Better spacing for text
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{bm}

\RequirePackage{mathptmx}

% Add package for managing section headings
\RequirePackage[]{titlesec}

% This is useful for complex figures.
\RequirePackage{subcaption}

% Compress multiple citations
% \RequirePackage{cite}

% This package allows the ability to create a 'code' environment.
\RequirePackage{verbatim}

% This hopefully tells verbatim to leave my damn quotes alone.
% \RequirePackage{upquote}

% This package enables the use of proper single quotes in text.
% \RequirePackage{textcomp}

% This package is used to set line spacing.
\RequirePackage{setspace}

% This package is used to make nomenclature tables that can span pages.
% \RequirePackage{longtable}

% This package allows conditional testing of varibles.
\RequirePackage{ifthen}

% This package is used for silly letter spacing
\RequirePackage{soul}

% This package is used to generate alternate environments.
\RequirePackage{float}

% This package is for the index, if it is to be used.
\if@gwu@index
 \RequirePackage{makeidx}
 \makeindex
\fi

% This is the package for special headers and footers.
\RequirePackage{fancyhdr}

% some extra packages to help with debugging
\if@gwu@debug
  \RequirePackage[final]{showlabels} % show labels for referencing
  \RequirePackage{refcheck} % check for unused references/labels
\fi

%% ---- HYPERREF ----------------------------------------------------------
% This loads a package that allows extra colors for links.
\RequirePackage[]{color}
% Custom color for references.
% \definecolor{DarkGreen}{rgb}{0,0.6,0}

% This will make labels and references hyperlinks.
\if@gwu@backref%
 % Use references in the bibliography.
 \RequirePackage[pagebackref=true]{hyperref}%
\else%
 % Do not use back references.
 \RequirePackage{hyperref}%
\fi

  \hypersetup{%
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitV},    % fits the width of the page to the window
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=false,       % false: boxed links; true: colored links
    bookmarksdepth=3,
    bookmarksopen=true,
  }%

% Cleveref referencing - must happen after hyperref
\AtEndOfClass{\RequirePackage[noabbrev,capitalize]{cleveref}}%

% Glossaries package - must come after hypperef
% This package is used for the list of abbreviations
\RequirePackage[printonlyused]{acronym}%
\RequirePackage[abbreviations,symbols,shortcuts=none,automake]{glossaries-extra}%
%% ---- FORMATTING -----------------------------------------------------
% Set the page style to fancy.
\pagestyle{fancy}
% This command runs at the beginning of each chapter.
% It puts the name of the chapter into the 'leftmark' parameter.
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
% This command runs at the beginning of each section.
% It puts the number and name of the section into the 'rightmark' param.
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}

% Clear the current header and footer.
\fancyhf{}

% Simply put the page number at the bottom center.
\fancyfoot[C]{\thepage}
% Get rid of the line at the top.
\renewcommand{\headrulewidth}{0pt}


% This sets the headers and footers for less-marked pages.
% Example: beginning of each chapter.
\fancypagestyle{plain}{%
% Get rid of the headers on plain pages.
 \fancyhead{} %
 % And also any line.
 \renewcommand{\headrulewidth}{0pt}
 \fancyfoot[C]{\thepage}
}


%% ---- PAGE STYLES ----------------------------------------------------
% This \ttlpg is the same as \titlepage in report.sty.
% It is used here to set the low-level style of front pages.
\newcommand*{\ttlpg}{ %
 % Set one-column switch temporarily to false.
 \@restonecolfalse %
 % Check the number of columns.
 \if@twocolumn %
  \@restonecoltrue\onecolumn %
 \else %
  \newpage %
 \fi
 % No headers or footers on titlepage
 \thispagestyle{empty}
 % This sets the page counter.
 \c@page \z@ %
}

% Same idea as \ttlpg above but with page numbers
\newcommand*{\frntpg}{ %
 % Set one-column switch temporarily to false.
 \@restonecolfalse %
 % Check the number of columns.
 \if@twocolumn %
  \@restonecoltrue\onecolumn %
 \else %
  \newpage %
 \fi
 % Regular headers and footers
 \thispagestyle{plain}
}

%%-------- GLOSSARIES STYLES------------------------------------
% define a new glossary style for acronymns and symbols
\renewcommand*{\glossarysection}[2][]{%
{\centering\bfseries{#2}\par}%
\phantomsection\addcontentsline{toc}{chapter}{#1}%
}%

\newglossarystyle{acronymsandsymbols}{%
    \setglossarystyle{list}% % based on the list style
    \renewcommand*{\glossarypreamble}{\vspace{4ex}}%
    \renewcommand*{\glossaryheader}{}%
}

\newglossarystyle{glossaryofterms}{%
    \setglossarystyle{list}%
    \renewcommand*{\glossarypreamble}{\vspace{4ex}}%
    \renewcommand*{\glossaryheader}{}%
}
%% ---- TITLE PAGE -----------------------------------------------------
% The fields to be used for the title page
\renewcommand{\@title}{Insert a Title!}
\renewcommand{\@author}{Insert an Author!}

\newcommand{\@bsdepartment}{Insert a BS department name!}
\newcommand{\@bsschool}{Insert BS school!}
\newcommand{\@bsgrad}{BS Grad date!}

\newcommand{\@msdepartment}{Insert a MS department name!}
\newcommand{\@msschool}{Insert MS school!}
\newcommand{\@msgrad}{MS Grad date!}

\newcommand{\@degree}{Doctor of Philosophy}
\newcommand{\@department}{Insert a Department Name!}
\newcommand{\@committee}{Insert a Committee!}
\newcommand{\@chair}{Insert a Chair!}
\newcommand{\@chairtitle}{Professor of INSERT Title!}
\newcommand{\@cochair}{}
\newcommand{\@phdgrad}{PhD Grad date!}
\newcommand{\@defensedate}{Insert defense date!}

% Commands to set the titlepage fields
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}\@gwu@titlepagetrue}
\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}

\newcommand{\bsdepartment}[1]{\renewcommand{\@bsdepartment}{#1}}
\newcommand{\bsschool}[1]{\renewcommand{\@bsschool}{#1}}
\newcommand{\bsgrad}[1]{\renewcommand{\@bsgrad}{#1}}

\newcommand{\showmsdegree}{\@gwu@msdegreetrue}
\newcommand{\hidemsdegree}{\@gwu@msdegreefalse}

\newcommand{\msdepartment}[1]{\renewcommand{\@msdepartment}{#1}}
\newcommand{\msschool}[1]{\renewcommand{\@msschool}{#1}}
\newcommand{\msgrad}[1]{\renewcommand{\@msgrad}{#1}}

\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\committee}[1]{\renewcommand{\@committee}{#1}\@gwu@committeepagetrue}
\newcommand{\chair}[1]{\renewcommand{\@chair}{#1}}
\newcommand{\chairtitle}[1]{\renewcommand{\@chairtitle}{#1}}
\newcommand{\cochair}[1]{\renewcommand{\@cochair}{#1}}
\newcommand{\phdgrad}[1]{\renewcommand{\@phdgrad}{#1}}
\newcommand{\defensedate}[1]{\renewcommand{\@defensedate}{#1}}
% Commands for the user to be able to use the defined fields.
\newcommand{\inserttitle}{\@title}
\newcommand{\insertauthor}{\@author}

\newcommand{\insertbsdepartment}{\@bsdepartment}
\newcommand{\insertbsschool}{\@bsschool}
\newcommand{\insertbsgrad}{\@bsgrad}

\newcommand{\insertmsdepartment}{\@msdepartment}
\newcommand{\insertmsschool}{\@msschool}
\newcommand{\insertmsgrad}{\@msgrad}

\newcommand{\insertdegree}{\@degree}
\newcommand{\insertdepartment}{\@department}
\newcommand{\insertcommittee}{\@committee}
\newcommand{\insertchair}{\@chair}
\newcommand{\insertchairtitle}{\@chairtitle}
\newcommand{\insertcochair}{\@cochair}
\newcommand{\insertyear}{\number\year}
\newcommand{\insertphdgrad}{\@phdgrad}

\newcommand{\insertdefensedate}{\@defensedate}
% This redefines the title page to automatically have all of the
% features and properties that it should according to the guidelines.
\renewcommand*{\titlepage}{
 % Insert the titlepage formatting.
 \ttlpg %
 % Use single-spaced lines for the title page.
 \begin{singlespace} %
  % Move down the page slightly.
  \hbox{\vspace{0.3in}} %
  % Center the title page as well.
  \begin{center} %
   % Put the title itself in 1.5-spaced format.
   \begin{singlespacing}
    % Insert the title.
    {\normalsize\bfseries\inserttitle} %
    \end{singlespacing} \\[3\baselineskip]
   % Vertical rubber space
%   \vfill %
   % Print the word 'by'.
   by \insertauthor \\[3\baselineskip] %
   % More rubber space
   %\vfill %
   % previous degrees
   \if@gwu@msdegree
    B.S. in \insertbsdepartment, \insertbsgrad, \insertbsschool \\
    M.S. in \insertmsdepartment, \insertmsgrad, \insertmsschool \\[2\baselineskip]
   \else
    B.S. in \insertbsdepartment, \insertbsgrad, \insertbsschool \\[2\baselineskip]
   \fi
   % Text from guidelines
   A Dissertation submitted to \\[3\baselineskip] %
   The Faculty of \\
   The School of Engineering and Applied Science \\
   of The George Washington University \\
   in partial satisfaction of the requirements \\
   for the degree of \insertdegree \\[3\baselineskip]
   \insertphdgrad \\[4\baselineskip]
   % insert doctoral advisor
   Dissertation directed by \\[1\baselineskip]
   \insertchair \\
   \insertchairtitle
  \end{center} %
 \end{singlespace} %
}


%% ---- FRONTISPIECE ---------------------------------------------------
% Command for the frontispiece
\newcommand{\@frontispiece}{\@empty}

% Command to set the frontispiece
\newcommand{\frontispiece}[1]{
 % Turn the frontispiece on.
 \@gwu@frontispiecetrue %
 % Set the frontispiece.
 \renewcommand{\@frontispiece}{#1}}

% Command to insert the frontispiece
\newcommand{\insertfrontispiece}{\@frontispiece}

% Command for the frontispiece page
\newcommand*{\frontispiecepage}{ %
 % Insert the titlepage formatting.
 \ttlpg %
 % Center the page.
 \begin{center} %
  % Vertical rubber space
  \ \vfill %
  % Insert the frontispiece.
  \insertfrontispiece %
  % Vertical rubber space
  \vfill %
 \end{center} %
}

%% ---- DISSERTATION COMMITTEE PAGE ---------------------------------------

% command for the committee page 
\newcommand*{\committeepage}{
  % Use titlepage formatting
  \frntpg
    \begin{doublespace}
    \noindent
    The School of Engineering and Applied Science of The George Washington
    University certifies that \insertauthor~has passed the Final Examination for the
    degree of \insertdegree~as of \insertdefensedate. This is the
    final and approved form of the dissertation.
    \end{doublespace}

  \begin{center}
    \begin{singlespace}
      {\normalsize\bfseries\inserttitle} \\[1\baselineskip]
      \insertauthor \\[3\baselineskip]
    \end{singlespace}
\end{center}
  % Non-justified content
  \begin{flushleft}
   % Heading for the committee
   Dissertation Research Committee: \\[2ex] %
   % Horizontal spacing
   \hspace{5em} %
   % Insert the committee (in a box).
   \parbox{0.85\textwidth}{\insertcommittee}
  \end{flushleft} %
  % flexible vertical space
  \vfill
}

%% ---- COPYRIGHT PAGE -------------------------------------------------
% Command that holds the name of the copyright holder
\newcommand{\@copyright}{\@author}

% Command to change it from the default
\newcommand{\copyrightholder}[1]{\renewcommand{\@copyright}{#1}}

% Command to insert it
\newcommand{\insertcopyrightholder}{\@copyright}

% Command for copyright page
\newcommand*{\copyrightpage}{ %
 % Insert the titlepage formatting.
 \frntpg %
 % Center the page.
 \begin{center} %
  % Vertical rubber space
  \ \vfill %
  % Insert the frontispiece.
  \copyright~Copyright~\number\year~by~\insertcopyrightholder \\ %
  All rights reserved
  % Horizontal line
  %\rule[0.5ex]{5in}{1pt} \\[1ex] %
  % Vertical rubber space
  \vfill %
 \end{center} %
}


%% ---- STYLING FOR REMAINING FRONT PAGES ------------------------------
% Command to set the spacing for all-caps headings
\sodef\an{}{.6em}{1em plus1em}{2em plus.1em minus.1em}

% Default frontmatter style
\newcommand{\@frontpagestyle}{2}
% Command to change it
\newcommand{\frontpagestyle}[1]{\renewcommand{\@frontpagestyle}{#1}}

% Command to insert front page matter with styles
\newcommand{\insertfront}[4]{ %
 % Check the value of the style.
 \ifthenelse{\equal{#2}{1}}{ %
  % Style 1: plain text
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Make a minipage.
   \begin{minipage}{#4\textwidth} %
    % Required to use 1.5-spacing for dissertation.
    \if@gwu@thesis %
     \onehalfspacing %
    \fi %
    % Insert the text.
    \sloppy #1 %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 \ifthenelse{\equal{#2}{2}}{ %
  % Style 2: Bold heading at top of page. Doublespacing for text
  % Center on the page.
   % Heading
   \begin{center}\textbf{\normalsize{#3}}\end{center}
   \begin{doublespace}
    \par #1
   \end{doublespace}
  % Vertical rubber space
  \vspace*{\stretch{1}} %
 }{ %
 \ifthenelse{\equal{#2}{3}}{ %
  % Style 3: Spread caps heading
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Make a minipage.
   \begin{minipage}{#4\textwidth} %
    % Required to use 1.5-spacing for dissertation.
    \if@gwu@thesis %
     \onehalfspacing %
    \fi %
    % Heading
    \begin{center} \textbf{\uppercase{\an{#3}}} \end{center} %
    % Insert the text.
    \sloppy #1 %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 \ifthenelse{\equal{#2}{4}}{ %
  % Style 4: lined
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Make a minipage.
   \begin{minipage}{#4\textwidth}
    % Line above
    \rule[1.4ex]{\textwidth}{1pt} %
    % Required to use 1.5-spacing for dissertation.
    \if@gwu@thesis %
     \onehalfspacing %
    \fi %
    % Insert the text.
    \sloppy #1 \\ %
    % Line below
    \rule{\textwidth}{1pt} %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 \ifthenelse{\equal{#2}{5}}{ %
  % Style 5: bold italic heading with lines
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
    % Make a minipage.
   \begin{minipage}{#4\textwidth}
    % Heading
    \begin{center} \textbf{\textit{#3}} \end{center} %
    % Move up a bit.
    \ \\[-4ex] %
    % Line above
    \rule[1.4ex]{\textwidth}{1pt} %
    % Required to use 1.5-spacing for dissertation.
    \if@gwu@thesis %
     \onehalfspacing %
    \fi %
    % Insert the text.
    \sloppy #1 \\ %
    % Line below
    \rule{\textwidth}{1pt} %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 \ifthenelse{\equal{#2}{6}}{ %
  % Style 6: lined with spread caps header
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
    % Make a minipage.
   \begin{minipage}{#4\textwidth}
    % Heading
    \begin{center} \textbf{\uppercase{\an{#3}}} \end{center} %
    % Move up a bit.
    \ \\[-4ex] %
    % Line above
    \rule[1.4ex]{\textwidth}{1pt} %
    % Required to use 1.5-spacing for dissertation.
    \if@gwu@thesis %
     \onehalfspacing %
    \fi %
    % Insert the text.
    \sloppy #1 \\ %
    % Line below
    \rule{\textwidth}{1pt} %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
  % Default style: centered
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Make a minipage.
   \begin{minipage}{0.7\textwidth} %
    % Insert the text.
    \begin{center} \sloppy #1 \end{center} %
   \end{minipage} %
 \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{1}} %
 }}}}}} %
}

%% ---- COMMANDS TO HIDE/SHOW FRONT PAGES ------------------------------
% Commands to show front pages
\newcommand{\showtitlepage}{\@gwu@titlepagetrue}

\newcommand{\showcopyright}{\@gwu@copyrighttrue}
\newcommand{\showdedication}{\@gwu@dedicationtrue}
\newcommand{\showacknowledgments}{\@gwu@acknowledgmentstrue}
\newcommand{\showpreface}{\@gwu@prefacetrue}
\newcommand{\showforeword}{\@gwu@forewordtrue}
\newcommand{\showprologue}{\@gwu@prologuetrue}
\newcommand{\shownomenclature}{\@gwu@nomenclaturetrue}
\newcommand{\showabstract}{\@gwu@abstracttrue}
\newcommand{\showcommitteepage}{\@gwu@committeepagetrue}

% Commands to hide front pages
\newcommand{\hidetitlepage}{\@gwu@titlepagefalse}

\newcommand{\hidecopyright}{\@gwu@copyrightfalse}
\newcommand{\hidededication}{\@gwu@dedicationfalse}
\newcommand{\hideacknowledgments}{\@gwu@acknowledgmentsfalse}
\newcommand{\hidepreface}{\@gwu@prefacefalse}
\newcommand{\hideforeword}{\@gwu@forewordfalse}
\newcommand{\hideprologue}{\@gwu@prologuefalse}
\newcommand{\hidenomenclature}{\@gwu@nomenclaturefalse}
\newcommand{\hideabstract}{\@gwu@abstractfalse}
\newcommand{\hidecommitteepage}{\@gwu@committeepagefalse}

%% ---- DEDICATION PAGE ------------------------------------------------
% Command that holds the value text of the dedication
\newcommand{\@dedication}{}
% Command that sets the dedication style
\newcommand{\@dedicationstyle}{\@frontpagestyle}
% Command that sets the width of the dedication text area
\newcommand{\@dedication@width}{1}

% Command to change it from the default
\newcommand{\dedication}[2][]{ %
 % Show the dedication.
 \showdedication %
 % Set the dedication text.
 \renewcommand{\@dedication}{#2} %
 % Set the dedication style.
 \ifthenelse{\equal{#1}{}}{}{\renewcommand{\@dedicationstyle}{#1}}}
% Command to change just the dedication style
\newcommand{\dedicationstyle}[1]{\renewcommand{\@dedicationstyle}{#1}}
% Command to adjust the dedication text area width
\newcommand{\dedicationwidth}[1]{\renewcommand{\@dedication@width}{#1}}

% Command to insert it
\newcommand{\insertdedication}{\@dedication}

% Command for page with the dedication
\newcommand*{\dedicationpage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Dedication}
 % Insert the text and formatting.
 \insertfront{\@dedication %
  }{\@dedicationstyle}{Dedication}{\@dedication@width}
}


%% ---- ACKNOWLEDGMENTS PAGE -------------------------------------------
% Command that holds the value text of the acknowledgments
\newcommand{\@acknowledgments}{}
% Command that sets the acknowledgments style
\newcommand{\@acknowledgmentsstyle}{\@frontpagestyle}
% Command that sets the width of the acknowledgments text area
\newcommand{\@acknowledgments@width}{1}

% Command to change it from the default
\newcommand{\acknowledgments}[2][]{ %
 % Show the acknowledgments page.
 \showacknowledgments %
 % Set the acknowledgments text.
 \renewcommand{\@acknowledgments}{#2} %
 % Set the acknowledgments style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@acknowledgmentsstyle}{#1}}}
% Command to adjust the acknowledgments text area width
\newcommand{\acknowledgmentswidth}[1]{ %
 \renewcommand{\@acknowledgments@width}{#1}}
% Command to change just the dedication style
\newcommand{\acknowledgmentsstyle}[1]{ %
 \renewcommand{\@acknowledgmentsstyle}{#1}}

% Command to insert it
\newcommand{\insertacknowledgments}{\@acknowledgments}

% Command for page with the acknowledgments
\newcommand*{\acknowledgmentspage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Acknowledgments}
 % Insert the text and formatting.
 \insertfront{\@acknowledgments %
  }{\@acknowledgmentsstyle}{Acknowledgments}{\@acknowledgments@width}
}


%% ---- PREFACE PAGE ---------------------------------------------------
% Command that holds the value text of the preface
\newcommand{\@preface}{}
% Command that sets the preface style
\newcommand{\@prefacestyle}{\@frontpagestyle}
% Command that sets the width of the preface text area
\newcommand{\@preface@width}{1}

% Command to change it from the default
\newcommand{\preface}[2][]{ %
 % Show the preface.
 \showpreface %
 % Set the preface text.
 \renewcommand{\@preface}{#2} %
 % Set the preface style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@prefacestyle}{#1}}}
% Command to adjust the preface text area width
\newcommand{\prefacewidth}[1]{ %
 \renewcommand{\@preface@width}{#1}}
% Command to change just the preface style
\newcommand{\prefacestyle}[1]{ %
 \renewcommand{\@prefacestyle}{#1}}

% Command to insert it
\newcommand{\insertpreface}{\@preface}

% Command for page with the preface
\newcommand*{\prefacepage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Preface}
 % Insert the text and formatting.
 \insertfront{\@preface %
  }{\@prefacestyle}{Preface}{\@preface@width}
}


%% ---- FOREWORD PAGE --------------------------------------------------
% Command that holds the value text of the foreword
\newcommand{\@foreword}{}
% Command that sets the foreword style
\newcommand{\@forewordstyle}{\@frontpagestyle}
% Command that sets the width of the foreword text area
\newcommand{\@foreword@width}{1}

% Command to change it from the default
\newcommand{\foreword}[2][]{ %
 % Show the foreword.
 \showforeword %
 % Set the foreword text.
 \renewcommand{\@foreword}{#2} %
 % Set the foreword style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@forewordstyle}{#1}}}
% Command to adjust the foreword text area width
\newcommand{\forewordwidth}[1]{ %
 \renewcommand{\@foreword@width}{#1}}
% Command to change just the foreword style
\newcommand{\forewordstyle}[1]{ %
 \renewcommand{\@forewordstyle}{#1}}

% Command to insert it
\newcommand{\insertforeword}{\@foreword}

% Command for page with the foreword
\newcommand*{\forewordpage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Foreword}
 % Insert the text and formatting.
 \insertfront{\@foreword %
  }{\@forewordstyle}{Foreword}{\@foreword@width}
}


%% ---- PROLOGUE PAGE --------------------------------------------------
% Command that holds the value text of the prologue
\newcommand{\@prologue}{}
% Command that sets the prologue style
\newcommand{\@prologuestyle}{\@frontpagestyle}
% Command that sets the width of the prologue text area
\newcommand{\@prologue@width}{1}

% Command to change it from the default
\newcommand{\prologue}[2][]{ %
 % Show the prologue.
 \showprologue %
 % Set the prologue text.
 \renewcommand{\@prologue}{#2} %
 % Set the prologue style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@prologuestyle}{#1}}}
% Command to adjust the prologue text area width
\newcommand{\prologuewidth}[1]{ %
 \renewcommand{\@prologue@width}{#1}}
% Command to change just the prologue style
\newcommand{\prologuestyle}[1]{ %
 \renewcommand{\@prologuestyle}{#1}}

% Command to insert it
\newcommand{\insertprologue}{\@prologue}

% Command for page with the prologue
\newcommand*{\prologuepage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Prologue}
 % Insert the text and formatting.
 \insertfront{\@prologue %
  }{\@prologuestyle}{Prologue}{\@prologue@width}
}


%% ---- COMMANDS FOR LIST OF FIGURES, ETC. -----------------------------
% Commands to show each of the lists
\newcommand{\showtableofcontents}{\@gwu@tableofcontentstrue}

\newcommand{\showlistoffigures}{\@gwu@listoffigurestrue\@gwu@tableofcontentstrue}
\newcommand{\showlistoftables}{\@gwu@listoftablestrue\@gwu@tableofcontentstrue}
\newcommand{\showlistofmaps}{\@gwu@listofmapstrue\@gwu@tableofcontentstrue}
\newcommand{\showlistofillustrations}{\@gwu@listillustrationstrue\@gwu@tableofcontentstrue}
\newcommand{\showlistofprograms}{\@gwu@listofprogramstrue\@gwu@tableofcontentstrue}
\newcommand{\showlistofabbreviations}{\@gwu@listofabbrevstrue\@gwu@tableofcontentstrue}

\newcommand{\showlistofacronyms}{\@gwu@listofacronymstrue\@gwu@listofglossariesabbrevsfalse\@gwu@tableofcontentstrue}
\newcommand{\showlistofsymbols}{\@gwu@listofsymbolstrue\@gwu@listofglossariessymbolsfalse\@gwu@tableofcontentstrue}

\newcommand{\showglossarieslistofabbreviations}{\@gwu@listofglossariesabbrevstrue\@gwu@listofacronymsfalse\@gwu@tableofcontentstrue}
\newcommand{\showglossarieslistofsymbols}{\@gwu@listofglossariessymbolstrue\@gwu@listofsymbolsfalse\@gwu@tableofcontentstrue}
\newcommand{\showglossarieslistofacronyms}{\@gwu@listofglossariesacronymstrue\@gwu@listofacronymsfalse\@gwu@tableofcontentstrue}
\newcommand{\showglossariesglossaryofterms}{\@gwu@glossaryoftermstrue\@gwu@tableofcontentstrue}

% Commands to hide each of the lists
\newcommand{\hidetableofcontents}{\@gwu@tableofcontentsfalse}

\newcommand{\hidelistoffigures}{\@gwu@listoffiguresfalse\@gwu@tableofcontentsfalse}
\newcommand{\hidelistoftables}{\@gwu@listoftablesfalse\@gwu@tableofcontentsfalse}
\newcommand{\hidelistofmaps}{\@gwu@listofmapsfalse\@gwu@tableofcontentsfalse}
\newcommand{\hidelistofillustrations}{\@gwu@listillustrationsfalse\@gwu@tableofcontentsfalse}
\newcommand{\hidelistofprograms}{\@gwu@listofprogramsfalse\@gwu@tableofcontentsfalse}
\newcommand{\hidelistofabbreviations}{\@gwu@listofabbrevsfalse\@gwu@tableofcontentsfalse}
\newcommand{\hidelistofacronyms}{\@gwu@listofacronymsfalse\@gwu@tableofcontentsfalse}
\newcommand{\hidelistofsymbols}{\@gwu@listofsymbolsfalse\@gwu@tableofcontentsfalse}

\newcommand{\hideglossarieslistofabbreviations}{\@gwu@listofglossariesabbrevsfalse\@gwu@tableofcontentsfalse}
\newcommand{\hideglossarieslistofacronyms}{\@gwu@listofglossariesacronymsfalse\@gwu@tableofcontentsfalse}
\newcommand{\hideglossarieslistofsymbols}{\@gwu@listofglossariessymbolsfalse\@gwu@tableofcontentsfalse}
\newcommand{\hideglossariesglossaryofterms}{\@gwu@glossaryoftermsfalse\@gwu@tableofcontentsfalse}

%% ---- TABLE OF CONTENTS ----------------------------------------------
% This sets the formatting for chapter entries in the table of contents.
\renewcommand*\l@chapter[2]{ %
 % First add some vertical space.
 \vskip 1ex plus 1pt minus 1pt
 % Format the spacing and use dots between title and number.
 \@dottedtocline{1}{0em}{1.2em} %
 % This sets the formatting for the chapter name and page number.
 {\textbf{#1}}{\textbf{#2}} %
 % Add some space below, too.
 \vskip 1ex}

% These lines set the spacing for other table of contents entries.
\renewcommand*{\l@section}{\@dottedtocline{2}{2.5em}{2em}}
\renewcommand*{\l@subsection}{\@dottedtocline{3}{5.0em}{2.8em}}
\renewcommand*{\l@subsubsection}{\@dottedtocline{4}{7.5em}{3.5em}}

% Number of section layers to show in table of contents
\setcounter{tocdepth}{3}
% Number of subsection layers to allow in document
\setcounter{secnumdepth}{3}

% This sets the formatting of the table of contents.
\renewcommand*{\tableofcontents}{%
 % Move to new page.
 \newpage %
 % Add a pdf anchor.
 \phantomsection %
 % Add a bookmark manually for the table of contents.
 \pdfbookmark[0]{Table of Contents}{\thepage} %
 % Use front page styling.
 \frntpg %
 % Add the title
 \begin{center}{\normalsize\textbf{Table of Contents}}\end{center} %
 % Add some space after the title.
 \vspace{2ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{toc}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
}

% adjust spacing for page numbers
\renewcommand{\@pnumwidth}{2.0em}% default is 1.55em

%% ---- LIST OF FIGURES ------------------------------------------------
% This sets the formatting for the various entry types.
\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of figures page.
\renewcommand*{\listoffigures}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{List of Figures} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@gwu@thesis %
  %\begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \begin{center}{\normalsize\textbf{List of Figures}}\\[2\baselineskip] \end{center}%
 % Add some space after the title.
 % \vspace{1ex} %
 % Start the automatic table of contents features.
 % \begin{singlespace} %
  \@starttoc{lof}\if@restonecol\twocolumn\fi %
 % \end{singlespace} %

}


%% ---- LIST OF TABLES -------------------------------------------------
% This sets the format for the table entries.
\renewcommand*{\l@table}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of tables page.
\renewcommand*{\listoftables}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{List of Tables} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@gwu@thesis %
  %\begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \begin{center}{\normalsize\textbf{List of Tables}}\\[2\baselineskip] \end{center}%
 % Add some space after the title.
 % Start the automatic table of contents features.
 % \begin{singlespace} %
  \@starttoc{lot}\if@restonecol\twocolumn\fi %
 % \end{singlespace} %
}


%% ---- LIST OF MAPS ---------------------------------------------------
% Command to generate the 'map' environment.
\newfloat{map}{tbp}{lom}[chapter]
% Use a capitalized version for the captions.
\floatname{map}{Map}

% This sets the formatting for map entries in the list of maps.
\newcommand*{\l@map}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of maps page.
\newcommand*{\listofmaps}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{List of Maps} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@gwu@thesis %
  %\begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \begin{center}{\normalsize\textbf{List of Maps}}\\[2\baselineskip] \end{center}%
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic table of contents features.
 % \begin{singlespace} %
  \@starttoc{lom}\if@restonecol\twocolumn\fi %
 % \end{singlespace} %
}


%% ---- LIST OF ILLUSTRATIONS ------------------------------------------
% Command to generate the 'illustration' environment.
\newfloat{illustration}{tbp}{loi}[chapter]
% Use a capitalized version for the captions.
\floatname{illustration}{Illustration}

% This sets the formatting for map entries in the list of maps.
\newcommand*{\l@illustration}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of maps page.
\newcommand*{\listofillustrations}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{List of Illustrations} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@gwu@thesis %
  %\begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \begin{center}{\normalsize\textbf{List of Illustrations}}\\[2\baselineskip] \end{center}%
 % Add some space after the title.
 % \vspace{1ex} %
 % Start the automatic table of contents features.
 % \begin{singlespace} %
  \@starttoc{loi}\if@restonecol\twocolumn\fi %
 % \end{singlespace} %
}


%% ---- LIST OF PROGRAMS -----------------------------------------------
% Command to generate the 'map' environment.
\newfloat{program}{tbp}{lop}[chapter]
% Use a capitalized version for the captions.
\floatname{program}{Program}

% This sets the formatting for map entries in the list of maps.
\newcommand*{\l@program}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of maps page.
\newcommand*{\listofprograms}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{List of Programs} %
 % Anchor for pdf
 \phantomsection %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@gwu@thesis %
  %\begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \begin{center}{\normalsize\textbf{List of Programs}}\\[2\baselineskip] \end{center}%
 % Add some space after the title.
 % \vspace{1ex} %
 % Start the automatic table of contents features.
 % \begin{singlespace} %
  \@starttoc{lop}\if@restonecol\twocolumn\fi %
 % \end{singlespace} %
}

%% ---- LIST OF ABBREVIATIONS ------------------------------------------
% Variable holding the contents of the abbreviations.
\newcommand{\@abbrevs}{}

% Command to set the abbreviations.
\newcommand{\abbreviations}[1]{ %
 % Show the list of abbreviations.
 \@gwu@listofabbrevstrue %
 % Redefine the list.
 \renewcommand{\@abbrevs}{#1}}

% This sets the formatting for the abbreviations.
\newcommand*{\l@abbreviation}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of tables page.
\newcommand*{\listofabbreviations}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{List of Abbreviations} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@gwu@thesis %
  %\begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \begin{center}{\normalsize\textbf{List of Abbreviations}}\\[2\baselineskip] \end{center}%
 % Add some space after the title.
 % \vspace{1ex} %
 % Start the automatic abbreviations feature.
 % \begin{singlespace} %
  \begin{acronym} %
   \@abbrevs %
  \end{acronym} %
 % \end{singlespace} %
}


%% ---- LIST OF ACRONYMS -----------------------------------------------
% Variable holding the contents of the abbreviations.
\newcommand{\@acronyms}{}

% Command to set the abbreviations.
\newcommand{\acronyms}[1]{ %
 % Show the list of abbreviations.
 \@gwu@listofacronymstrue %
 % Redefine the list.
 \renewcommand{\@acronyms}{#1}}

% This sets the formatting for the abbreviations.
\newcommand*{\l@acronym}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of acronyms page.
\newcommand*{\listofacronyms}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{List of Acronyms} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@gwu@thesis %
  %\begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \begin{center}{\normalsize\textbf{List of Acronyms}}\\[2\baselineskip] \end{center}%
 % Add some space after the title.
 % \vspace{1ex} %
 % Start the automatic abbreviations feature.
 % \begin{singlespace} %
  \begin{acronym} %
   \@acronyms %
  \end{acronym} %
 % \end{singlespace} %
}


%% ---- LIST OF SYMBOLS ------------------------------------------------
% Variable holding the contents of the symbols.
\newcommand{\@symbols}{}

% Command to set the symbols.
\newcommand{\symbols}[1]{ %
 % Show the list of symbols.
 \@gwu@listofsymbolstrue%
 % Redefine the list.
 \renewcommand{\@symbols}{#1}}

% This sets the formatting for the abbreviations.
\newcommand*{\l@symbol}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of tables page.
\newcommand*{\listofsymbols}{%
 % Move to new page.
 \newpage%
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{List of Symbols}%
 % Use front page styling.
 \frntpg%
 % Larger upper margin for first page of table (thesis only)
 \if@gwu@thesis%
  %\begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi%
 % Add the title
 \begin{center}{\normalsize\textbf{List of Symbols}}\\[2\baselineskip] \end{center}%
 % Add some space after the title.
 % \vspace{1ex} %
 % Start the automatic symbols feature.
 % \begin{singlespace} %
  \begin{acronym}%
   \@symbols%
  \end{acronym}%
 % \end{singlespace} %
}

%% ---- NOMENCLATURE ---------------------------------------------------
% New command for nomenclature environment
\newenvironment{symboltable}[1][]
{ %
 % Insert the title if present.
 \ifthenelse{\equal{#1}{}}{ %
  % Start the tabular environment.
  \noindent\longtable[l]{@{} p{3.6em} @{\hspace{2pt}=\hspace{1em}} l} %
 }{ %
 % Insert the title.
 \noindent\textit{#1}\\[-4ex] %
 % Start the tabular environment.
 \noindent\longtable[l]{@{} p{3.6em} @{\hspace{2pt}=\hspace{1em}} l} %
 }
}{ %
 % End the tabular environment
 \endlongtable %
}

% Variable holding the contents of the symbols.
\newcommand{\@nomenclature}{}

% Command to set the symbols.
\newcommand{\nomenclature}[1]{ %
 % Show the list of symbols.
 \@gwu@nomenclaturetrue %
 % Redefine the list.
 \renewcommand{\@nomenclature}{#1}}

% Command to insert nomenclature
\newcommand{\insertnomenclature}{ %
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Nomenclature} %
% Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@gwu@thesis %
  %\begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \begin{center}{\normalsize\textbf{Nomenclature}}\\[2\baselineskip] \end{center}%
 % Add some space after the title.
 % \vskip4ex %
% Set the line skip
\begin{onehalfspace}
% Insert the nomenclature conents
\@nomenclature %
\end{onehalfspace}
}

%% ---- LIST OF GLOSSARIES ABBREVIATIONS ------------------------------------------

% This sets the formatting of the list of tables page.
\newcommand*{\listofglossaryabbreviations}{%
    % \newpage%
 % Use front page styling.
 \frntpg %
 % Start the automatic abbreviations feature.
 \printglossary[type=\glsxtrabbrvtype,style=acronymsandsymbols,title={\normalsize List of Abbreviations}]
}


% This sets the formatting of the list of tables page.
\newcommand*{\listofglossarysymbols}{%
    % \newpage%
 % Use front page styling.
 \frntpg %
 % Start the automatic abbreviations feature.
 \printglossary[type=symbols,style=acronymsandsymbols,title={\normalsize List of Symbols}]
}

\newcommand*{\listofglossaryofterms}{%
\frntpg%
\printglossary[style=glossaryofterms,type=main,title={\normalsize Glossary of Terms}]
}
%% ---- ABSTRACT -------------------------------------------------------
% Command to hold the text of the abstract.
\newcommand{\@abstract}{}

% Command to set it.
\renewcommand{\abstract}[1]{
 % Show the abstract page.
 \showabstract %
 % Set the abstract text.
 \renewcommand{\@abstract}{#1}}

% Command to insert it.
\newcommand{\insertabstract}{\@abstract}

% Whether or not abstract page has a page number
\newif\if@abstract@pageno
% Default value
\if@gwu@thesis
 \@abstract@pagenotrue
\fi

% Command to hide abstract page number
\newcommand{\hideabstractpagenumber}{ %
 \@abstract@pagenofalse}
% Command to show abstract page number
\newcommand{\showbstractpagenumber}{ %
 \@abstract@pagenotrue}

% Format the abstract page.
\newcommand{\abstractpage}{ %
 % Set the page formatting.
 \frntpg %
 % Whether or not to hide the page number
 \if@abstract@pageno %
 \else %
  \thispagestyle{empty} %
 \fi %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Abstract} 
 \begin{center} %
  % Formatting add the heading
  {\normalsize \textbf{Abstract}} \\[5ex] %
  % Add the title of the dissertation.
  {\normalsize \bfseries \inserttitle} \\[2ex] %
 \end{center} %
 \begin{doublespace} %
  % Don't go past the margin.
  \sloppy %
  % Insert the text.
  \par \insertabstract %
 \end{doublespace} %
 % Vertical rubber space
 \vspace*{\stretch{1}} %
}


%% ---- BIBLIOGRAPHY ---------------------------------------------------
% Save the original bibliography command.
\let\@tex@bibliography\bibliography

% Change the bibliography header.
\renewcommand*{\bibname}{\centerline{\normalsize Bibliography}}

% Create a new command for the bibliography.
\renewcommand*{\bibliography}[1]{ %
  % Update the page format.
  % Switch to single spacing
  \singlespacing %

  % Move to new page.
  \clearpage %
  % Create a pdf anchor.
  \phantomsection %
  % Add to table of contents.
  \addcontentsline{toc}{chapter}{Bibliography} %
  % Load the bibliography.
  \@tex@bibliography{#1} %
}

%% ---- CHAPTER/SECTION HEADINGS -----------------------------------------------
% Change the chapter headings to uppercase.
% \renewcommand{\@chapapp}{CHAPTER}

% % Change the formatting of the first page of each chapter.
% \renewcommand{\@makechapterhead}[1]{%
%  % Insert an extra top margin.
%  % \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
%  % Insert the text
%  { %
%   % Ensure proper alignment.
%   \parindent 0pt \raggedright %
%   % Check for chapter overflow.
%   \ifnum \c@secnumdepth >\m@ne %
%    % CHAPTER and number
%    \begin{center}{\Large\textbf{ \@chapapp{} \thechapter }} \end{center} \par%
%    % Vertical space
%    \vskip 0.3in \fi %
%    % Insert the title of the chapter.
%    \begin{center} \LARGE \textbf{ #1} \end{center} %
%    % Vertical space after the title
%    \nobreak \vskip 0.3in %
%  } %
% }
\titleformat{\chapter}[hang]
{\normalfont\normalsize\bfseries\centering}{\chaptertitlename\ \thechapter:}{20pt}{\normalsize}
\titleformat{\section}
{\normalfont\normalsize\bfseries}{\thesection}{1em}{\normalsize}
\titleformat{\subsection}
{\normalfont\normalsize\bfseries}{\thesubsection}{1em}{\normalsize}
\titleformat{\subsubsection}
{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}[runin]
{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titleformat{\subparagraph}[runin]
{\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{}

\titlespacing*{\chapter} {0pt}{*0}{*4}
\titlespacing*{\section} {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection} {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\paragraph} {0pt}{3.25ex plus 1ex minus .2ex}{1em}
\titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}

%% -------- APPENDIX ------------------------

%% ---- SPACING --------------------------------------------------------
% This fixes the spacing below captions, which by default can be small.
\setlength\belowcaptionskip{7pt plus 4pt minus 1pt}%

%% ---- INITIALIZATION -------------------------------------------------
% Commands to be placed after \begin{document}
\AtBeginDocument{%
    \providecommand\tikzifexternalizing[2]{#2}%
 % Insert a title page.
\tikzifexternalizing{}{\if@gwu@titlepage\titlepage\fi%
 % Change the PDF title.
 \hypersetup{%
 pdftitle=\inserttitle,
 pdfauthor=\insertauthor,
 pdfcreator=\insertauthor,
 pdfproducer=\insertauthor} %
  % Insert dissertation committeee page 
  \if@gwu@committeepage\committeepage\fi%
 % Initialize page numbers.
 \setcounter{page}{2} %
 % Page numbers at the bottom
 \pagestyle{plain} %
 % Use lower-case roman numerals.
 \renewcommand{\thepage}{\roman{page}} %
 % Insert the copyright page if there is one.
 \if@gwu@copyright\copyrightpage\fi%
 % Insert a dedication if there is one.
 \if@gwu@dedication\dedicationpage\fi %
 % Insert the acknowledgments if there are any.
 \if@gwu@acknowledgments\acknowledgmentspage\fi %
 % Insert the frontispiece if there is one.
 \if@gwu@frontispiece\frontispiecepage\fi %
% \ifthenelse{\equal{\@frontispiece}{}}{}{\frontispiecepage} %
 % Insert the abstract.
 \if@gwu@abstract\abstractpage\fi %
 % Insert the table of contents.
 \if@gwu@tableofcontents\tableofcontents\fi %
 % Insert the list of figures.
 \if@gwu@listoffigures\listoffigures\fi %
 % Insert the list of tables.
 \if@gwu@listoftables\listoftables\fi %
 % Insert the list of maps.
 \if@gwu@listofmaps\listofmaps\fi%
 % Insert the list of illustrations.
 \if@gwu@listofillustrations\listofillustrations\fi%
 % Insert the list of programs.
 \if@gwu@listofprograms\listofprograms\fi%
 % Insert the list of abbreviations.
 \if@gwu@listofabbrevs\listofabbreviations\fi%
 \if@gwu@listofglossariesabbrevs\listofglossaryabbreviations\fi%
 % Insert the list of acronyms.
 \if@gwu@listofacronyms\listofacronyms\fi%
 % Insert the list of symbols.
 \if@gwu@listofsymbols\listofsymbols\fi%
 \if@gwu@listofglossariessymbols\listofglossarysymbols\fi%
 % Insert the nomenclature.
 \if@gwu@nomenclature\insertnomenclature\fi %
 \if@gwu@glossaryofterms\listofglossaryofterms\fi%
 % Insert the preface if there is one.
 \if@gwu@preface\prefacepage\fi %
 % Insert the foreword if there is one.
 \if@gwu@foreword\forewordpage\fi %
 % Insert the prologue if there is one.
 \if@gwu@prologue\prologuepage\fi %
 % Move to next page.
 \newpage %
 % Restart page numbers for the chapters.
 \setcounter{page}{1} %
 % Page numbers at the bottom
 \pagestyle{plain} %
 % Use Arabic numerals.
 \renewcommand{\thepage}{\arabic{page}} %
 % Add the word 'Chapter' to the table of contents.
 %\addtocontents{toc}{\vspace{1.3ex}\noindent %
 %{\bfseries Chapter}\vspace{1.3ex}} %
 % Use the correct formatting.
 \if@gwu@thesis %
  % Use 1.5 spacing
  \doublespacing %
 \else %
  % Use two-column format
  \twocolumn %
 \fi %
 }
}

