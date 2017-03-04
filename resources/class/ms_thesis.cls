              

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ms_thesis}[2017/02/26 v1.0a,  
Shahjalal University of Science and Technology Thesis Class, by Shakir Ahmed, 
from Lei Ye]

\newcommand{\@degree}{Master of Physics - Research}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}

\newcommand{\@dept}{Department of Physics}
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}

\newcommand{\@school}{School of Physical Sciences}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}

\newcommand{\@degreeHeld}{}
\newcommand{\degreeHeld}[1]{\renewcommand{\@degreeHeld}{#1}}

\newcommand{\@uni}{Shahjalal University of Science and Technology}
\newcommand{\@unilogo}{resources/logo/SUSTlogo}  %(filename without ext)

\newcommand{\@certificatetext}{\noindent I, \@author, declare that this thesis, submitted in \ifpartial partial \fi fulfilment of the requirements for the award of \ifphd Doctor of Philosophy\else \@degree \fi , in the \@dept, \@school, \@uni, is wholly my own work unless otherwise referenced or acknowledged. The document has not been submitted for qualifications at any other academic institution. \par}

\newcommand{\@leftside}{36mm}   
\newcommand{\@rightside}{20mm}
\newcommand{\@topside}{1.65in}
\newcommand{\@bottomside}{1.25in}

\newcommand{\setunilogo}[1]{%
   \includegraphics[width=#1]{\@unilogo}%
}

\newcommand{\@submissionDay}{1}% 
\newcommand{\@submissionMonth}{April} % 
\newcommand{\@submissionYear}{1392}
\newcommand{\submissionDate}[3]{%    
  \renewcommand{\@submissionDay}{#1}%
  \renewcommand{\@submissionMonth}{#2}%
  \renewcommand{\@submissionYear}{#3}%
}

\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

\newcommand{\@dedication}{}
\newcommand{\dedication}[1]{\renewcommand{\@dedication}{#1}}

\DeclareOption{titlepage}{\ClassWarning{Thesis Class}{Option 'titlepage': Title page always generated. Option ignored.}}
\DeclareOption{notitlepage}{\ClassWarning{Thesis Class}{Option 'notitlepage': Not available for thesis.}}
\DeclareOption{a4paper}{\ClassWarning{Thesis Class}{Option 'a4paper': Mandatory requirement. Option ignored.}}
\DeclareOption{legalpaper}{\ClassWarning{Thesis Class}{Option 'legalpaper': Not available for thesis.}}
\DeclareOption{a5paper}{\ClassWarning{Thesis Class}{Option 'a5paper': Not available for thesis.}}
\DeclareOption{executivepaper}{\ClassWarning{Thesis Class}{Option 'executivepaper': Not available for thesis.}}
\DeclareOption{b5paper}{\ClassWarning{Thesis Class}{Option 'b5paper': Not available for thesis.}}
\DeclareOption{letterpaper}{\ClassWarning{Thesis Class}{Option 'letterpaper': Not available for thesis.}}
\DeclareOption{landscape}{\ClassWarning{Thesis Class}{Option 'landscape': Not available for thesis.}}

\newif\ifphd
\DeclareOption{phd}{\phdtrue}
\DeclareOption{master}{\phdfalse \partialtrue}
\DeclareOption{other}{\phdfalse \partialtrue}
\ExecuteOptions{phd}

\newif\ifpartial
\DeclareOption{partial}{\partialtrue}
\DeclareOption{full}{\partialfalse}
\ExecuteOptions{full}              

\newcommand\@fontSize{}
\DeclareOption{10pt}{\renewcommand\@fontSize{10pt}}
\DeclareOption{11pt}{\renewcommand\@fontSize{11pt}}
\DeclareOption{12pt}{\renewcommand\@fontSize{12pt}}
\ExecuteOptions{12pt}

\newif\ifdouble
\DeclareOption{doublespacing}{\doubletrue}
\DeclareOption{onehalfspacing}{\doublefalse}
\ExecuteOptions{doublespacing}     

\newif\ifhyper
\DeclareOption{hyper}{\hypertrue}
\DeclareOption{nohyper}{\hyperfalse}
\ExecuteOptions{hyper}         

\newif\ifcopyright
\DeclareOption{copyright}{\copyrighttrue}

\newif\ifopentwosideright

\DeclareOption{twoside}{%
  \opentwosiderighttrue \PassOptionsToClass{twoside, openright}{report}%
}
\DeclareOption{openany}{%
	 \opentwosiderightfalse \PassOptionsToClass{openany}{report}%
}

\newif\ifdedication
\dedicationfalse      

\newif\ifListOfFigures
\ListOfFigurestrue    
\newif\ifListOfTables
\ListOfTablestrue     

\newcommand{\noListOfTables}{\ListOfTablesfalse}
\newcommand{\noListOfFigures}{\ListOfFiguresfalse}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}

\ProcessOptions

\LoadClass[a4paper, \@fontSize]{report}[2004/02/16]

\RequirePackage[left=\@leftside, right=\@rightside, top=\@topside, bottom=\@bottomside, headheight=14.5pt, marginparwidth=-1pt]{geometry}[2002/07/08] 
%
\newcommand{\@setLongPage}{%

	\setlength\topmargin{-.3in}   
	                              
	\enlargethispage{1.8cm}%
}%
\newcommand{\@setNormalPage}{%
  \setlength\topmargin{0in}      
}

\RequirePackage{fancyhdr}

\RequirePackage{setspace}[2000/12/01]

\RequirePackage{graphicx}[1999/02/16]      

\ifopentwosideright%
  \RequirePackage{nextpage}[2000/02/20]%
  \renewcommand\cleardoublepage{\cleartooddpage[%
       \thispagestyle{empty}%
       \vfill%
       \begin{center}%
         (INTENTIONALLY BLANK)%
       \end{center}%
       \vfill]}%
\else%
  \renewcommand\cleardoublepage{\clearpage}      
\fi

\ifhyper\RequirePackage[plainpages=false, pdfpagelabels, bookmarks, bookmarksnumbered, breaklinks]{hyperref}[2003/11/30]\fi

\setcounter{secnumdepth}{10}

\renewcommand{\maketitle}{%
  \thispagestyle{empty}%
  \@setLongPage%

  \vspace{1.5cm}%
  \begin{center}%
     \Huge\textbf{\@title}%
  \end{center}%
  \vfill%
  \begin{center}%
    A \ifphd Dissertation \else Thesis \fi Submitted in \ifpartial Partial \fi Fulfilment of \\%
    the Requirements for the Award of the Degree of \\%
    \vfill%
    \Large \ifphd Doctor of Philosophy \else \@degree \fi \\%
    \vfill%
    \normalsize%
    from\\%
    \vfill%
             \IfFileExists{\@unilogo .png}{%
    \noindent\setunilogo{2.7cm}}%
    \newline    \\
    \large \MakeUppercase{\@uni}%
  \end{center}%
  \vfill%
  \begin{center}%
    by\\%
    \vfill%
    \large \@author \\[0.2cm]%

    \normalsize {\itshape\@degreeHeld}\ \\%
    \vfill%
    \@dept \\%
    \@school \\[0.5cm]%
    \@submissionYear%  
  \end{center}%     
  \rule\linewidth{1.5pt}% 
	\clearpage%
	\@setNormalPage%
}

\newcommand{\@makecertificationpage}{%
  \thispagestyle{empty}%
  \begin{center}%
    \null\vspace{3cm}%
    \Large \textbf{CERTIFICATION}%
    \vspace{1cm}%
  \end{center}%
        
	\@certificatetext%
	
  \vspace{2.5cm}%
  \noindent\underline{~(Signature~~Required)~}\\[0.2cm]%
  \noindent\@author\\%
  \noindent\@submissionDay\ \@submissionMonth\ \@submissionYear %
  \cleardoublepage%
}

\renewenvironment{abstract}{%
  \newpage%
  \@setLongPage%
  \pagestyle{empty}%
  \begin{center}%
      \large \textsc{\@title} \\%
      \vspace{0.3cm} %
      \normalsize \@author\\%
      \vspace{0.3cm}%
      A Thesis for \@degree \\%
      \vspace{0.2cm}%  
      \@dept \\%
      \@uni \\%
      \section*{ABSTRACT}    
      \addtocontents{toc}{\vspace{10pt}}  
 	    \addcontentsline{toc}{section}{ABSTRACT}% 
  \end{center}%
}{%
	\vfill%
	\begin{flushleft}%
    \textbf{KEYWORDS:}\ \ \@keywords%
  \end{flushleft}%
  \@setNormalPage%
  \cleardoublepage%
}

\newcommand\@makecopyrightpage{%
	\newpage%
	\begin{doublespace}   
	  \begin{center}%
	    \null\vfill%
	    \copyright\ Copyright\ \@submissionYear \\%
	    by\\%
	    \@author \\%
	    ALL RIGHTS RESERVED\\%
	    \vfill\null%
	  \end{center}%
	\end{doublespace}%
	\cleardoublepage%
}

\newcommand\@makededicationpage{%
  \thispagestyle{empty}%
  \null\vfill%
  \begin{flushright}%
    \Large \itshape \textbf{Dedicated to}\hspace{2cm} \null\\[1cm]%
    \large \@dedication%
  \end{flushright}%
  \vfill\null%
  \cleardoublepage%
}

\newenvironment{acknowledgements}{%
  \pagestyle{plain}%
  \chapter*{Acknowledgements}  
  \section*{}                  
	\addcontentsline{toc}{section}{Acknowledgements}%
  \vspace{-1cm}%
}{%
  \cleardoublepage%
}

\renewcommand{\contentsname}{Table of Contents}

\renewcommand{\bibname}{References}
%
\let\@ldbibliography\bibliography
\renewcommand{\bibliography}[1]{\@ldbibliography{#1} \addcontentsline{toc}{chapter}{\bibname}}

\newcommand\frontmatter{%

	\ifhyper\hypersetup{%
  	pdfauthor={\@author},%
  	pdftitle={\@title},%
  	pdfkeywords={\@keywords}}%
	\fi%
	%
	\pagestyle{empty}%
	\singlespacing%

	\pagenumbering{alph}%  
	%
	\maketitle                 
	%
	\ifcopyright \@makecopyrightpage \fi%
	\cleardoublepage%
	%
	\@makecertificationpage    
	%
	\ifdedication \@makededicationpage \fi%  			
	%
	\pagestyle{headings}%
	\pagenumbering{roman}%
	\tableofcontents           
	\ifListOfTables{%
  	\listoftables            
  	\addcontentsline{toc}{section}{List of Tables}%
	}\fi%
	\ifListOfFigures{%
  	\listoffigures           
  	\addcontentsline{toc}{section}{List of Figures/Illustrations}%
	}\fi%
	\cleardoublepage%

} 

\newcommand\mainmatter{%
  %
  \ifdouble\doublespacing \else\onehalfspacing\fi%
  \pagenumbering{arabic}%

	\pagestyle{fancy}%

	\let\@lmk\leftmark
	\renewcommand{\leftmark}{\textsl{\nouppercase\@lmk}}
	\let\@rmk\rightmark
	\renewcommand{\rightmark}{\textsl{\nouppercase\@rmk}}

	\fancyfoot{}  
	%
	\if@twoside{    
 
  	\fancyhead[RO,LE]{\thepage}%
  	\fancyhead[RE]{\leftmark}  % 
  	\fancyhead[LO]{\rightmark} %   
	}\else{%
		\fancyhead[R]{\thepage}%
  	\fancyhead[L]{\rightmark}  % 
	}\fi%
} 

\endinput  %


