## Helpful tips

As people begin to use this template, there are a near infinite number of  ways to accomplish any task.
I have not thought of every possibility but hopefully the tips here will help achieve whatever you desire.

* If you'd like to have citations with the author and year you can use the following

    ~~~
    \usepackage[numbers]{natbib}
    \citet{sample123}
    \bibliographystyle{plainnat}
    ~~~

* If you'd like to modify the `hyperref` settings, such as turning off the colored boxed around links, add the following to your preamble: 

    ~~~
    \hypersettup{
        colorlinks=true
    }
    ~~~

    This will override any settings within the class file

* If you'd like to have a new page at the start of each chaper
    
    ~~~
    \titleformat{\chapter}[display]
    {\bfseries\huge}{\huge\chaptertitlename\ \thechapter}{24pt}{\filright}
    \titlespacing*{\chapter}
    {0pt}{48pt}{0pt}
    ~~~

    Then you can use `\newpage` at the start of each chapter.
