
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ms_thesis}[2017/02/26 v3.01,  
Shahjalal University of Science and Technology Thesis Class, by Shakir Ahmed, 
from Lei Ye]


%%%%%% University, Degree, Department, School, Current Degree %%%%%%%%%%%%%%%
%
%
%%   Default values are given %%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@uni}{Shahjalal University of Science and Technology}

\newcommand{\@degree}{Master of Science}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}

\newcommand{\@dept}{Department of Physics}
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}

\newcommand{\@school}{School of Physical Sciences}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}

\newcommand{\@subject}{Physics}
\newcommand{\subject}[1]{\renewcommand{\@dept}{#1}}

%% Degrees held
\newcommand{\@regNumber}{}
\newcommand{\regNumber}[1]{\renewcommand{\@regNumber}{#1}}

%% Supervisors
\newcommand{\@supervisor}{Supervisor}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}
\newcommand{\@supervisorDesig}{Professor}
\newcommand{\supervisorDesig}[1]{\renewcommand{\@supervisorDesig}{#1}}

\newcommand{\@submissionDay}{21}       
\newcommand{\@submissionMonth}{February}   %% Default date: 21 February, 1952
\newcommand{\@submissionYear}{1952}
\newcommand{\submissionDate}[3]{           %% International Mother Language Day
  \renewcommand{\@submissionDay}{#1}
  \renewcommand{\@submissionMonth}{#2}
  \renewcommand{\@submissionYear}{#3}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
%%   To produce output file with uni logo in DVI/PS, the logo in 
%%     eps format (***.eps) is to be provided along with png verison. 
\newcommand{\@unilogo}{resources/logo/SUSTlogo}  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Function to set logo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\setunilogo}[1]{\includegraphics[width=#1]{\@unilogo}}


%%%%%%%%%%%%%%%%%%%%%%%%%% Author Declaration text %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@declaretext}{\noindent I, \@author, declare that this thesis, submitted in \ifpartial partial \fi fulfilment of the requirements for the award of \ifphd Doctor of Philosophy\else the degree of \@degree \fi , in the \@dept, \@school, \@uni, is wholly my own work unless otherwise referenced or acknowledged. The document has not been submitted for qualifications at any other academic institution. \par}

\newcommand{\@certifytext}{\noindent This is to certify that the work embodied in the accompanying thesis entitled \textbf{\textit{\@title}}, submitted to the \@dept, \@uni,  in \ifpartial partial \fi fulfillment of the requirements for the award of \ifphd \textbf{Doctor of Philosophy} \else the degree of \textbf\@degree \fi \hphantom{M} in \@subject, has been carried out entirely by the candidate \textbf\@author, Reg. No: \textit\@regNumber, under my direct supervision and guidance. \\
     All help received by him/her from various sources have been duly acknowledged.
     \par}

%

%%  
\newcommand{\@leftside}{36mm}   % there is a offset at the lefthand
\newcommand{\@rightside}{20mm}
\newcommand{\@topside}{1.65in}
\newcommand{\@bottomside}{1.25in}
%

%
%% keywords
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
%
%% dedication
\newcommand{\@dedication}{}
\newcommand{\dedication}[1]{\renewcommand{\@dedication}{#1}}
%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%% DECLARATION OF OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Invalid options - normally used in report.cls and others, but not here:
%%
%% page title
\DeclareOption{titlepage}{\ClassWarning{Thesis Class}{Option 'titlepage': Title page always generated. Option ignored.}}
\DeclareOption{notitlepage}{\ClassWarning{Thesis Class}{Option 'notitlepage': Not available for thesis.}}
%% paper size
\DeclareOption{a4paper}{\ClassWarning{Thesis Class}{Option 'a4paper': Mandatory requirement. Option ignored.}}
\DeclareOption{legalpaper}{\ClassWarning{Thesis Class}{Option 'legalpaper': Not available for thesis.}}
\DeclareOption{a5paper}{\ClassWarning{Thesis Class}{Option 'a5paper': Not available for thesis.}}
\DeclareOption{executivepaper}{\ClassWarning{Thesis Class}{Option 'executivepaper': Not available for thesis.}}
\DeclareOption{b5paper}{\ClassWarning{Thesis Class}{Option 'b5paper': Not available for thesis.}}
\DeclareOption{letterpaper}{\ClassWarning{Thesis Class}{Option 'letterpaper': Not available for thesis.}}
\DeclareOption{landscape}{\ClassWarning{Thesis Class}{Option 'landscape': Not available for thesis.}}
%
%% Determine the degree program: PhD or Masters by Research or others
\newif\ifphd
\DeclareOption{phd}{\phdtrue}
\DeclareOption{master}{\phdfalse \partialtrue}
\DeclareOption{other}{\phdfalse \partialtrue}
\ExecuteOptions{phd}               %Default: phd
%
%% Set condition for "partial" fulfilment on title
%%   page and certification
%%   "full" does nothing but omits the word "partial"
\newif\ifpartial
\DeclareOption{partial}{\partialtrue}
\DeclareOption{full}{\partialfalse}
\ExecuteOptions{full}               %Default: full
%
%% Define a parameter for fontsize to set default to 12pt
%%   report default was 10pt
%%   using \PassOptionsToClass and \ExecuteOptions{12pt} did not work
\newcommand\@fontSize{}
\DeclareOption{10pt}{\renewcommand\@fontSize{10pt}}
\DeclareOption{11pt}{\renewcommand\@fontSize{11pt}}
\DeclareOption{12pt}{\renewcommand\@fontSize{12pt}}
\ExecuteOptions{12pt}
%
%% Set line spacing
\newif\ifdouble
\DeclareOption{doublespacing}{\doubletrue}
\DeclareOption{onehalfspacing}{\doublefalse}
\ExecuteOptions{doublespacing}     %Default: doublespacing
%
%% Determine whether hyperlinks would be created in PDF
\newif\ifhyper
\DeclareOption{hyper}{\hypertrue}
\DeclareOption{nohyper}{\hyperfalse}
\ExecuteOptions{hyper}             %Default: hyper
%
%% Determine whether the copyright page would be created
%%   copyright page is not required by the "Guidelines"
%%
\newif\ifcopyright
\DeclareOption{copyright}{\copyrighttrue}
%
%% Determine whether openright for twosided priting
%%   defualt: openright for twoside
%%            openany   for oneside
%%   defaults different from report class defaults
\newif\ifopentwosideright
%% Use openright when two side printed
\DeclareOption{twoside}{%
  \opentwosiderighttrue \PassOptionsToClass{twoside, openright}{report}%
}
\DeclareOption{openany}{%
	 \opentwosiderightfalse \PassOptionsToClass{openany}{report}%
}
%
%%
%%%%% Switches 
%%
%
%% Dedication page is not required by the "Guidelines"
%%
\newif\ifdedication
\dedicationfalse      %Default: no dedication page
%
%% List of Figures/Tables are required by the "Guidelines"
%%   turn them off if no figures/tables in the thesis
\newif\ifListOfFigures
\ListOfFigurestrue    %Default: create List of Figures
\newif\ifListOfTables
\ListOfTablestrue     %Default: create List of Tables
%
%% Generate List of Figures/Tablles by default
%%
\newcommand{\noListOfTables}{\ListOfTablesfalse}
\newcommand{\noListOfFigures}{\ListOfFiguresfalse}
%
%% Pass the rest of options (not captured by \DeclareOption{})
%%   to report class
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}
%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%% EXECUTION OF OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%
%% Golobal options from \docoumentclass[...] will be automatically 
%%   passed to all required packages
\ProcessOptions
%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%% PACKAGE LOADING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
%%%%% Loading standard document report class
%%
%%    a4paper - The paper size has been forced to ISO A4 
%%              to meet the requirement, p.7, Section 2.2, the Guidelines
%
%% The papersize option will be overwritten by the option passed down  
%%   from the current class, otheroptions (eg. fontsize) will not. 
%% Specifying a letterpaper in \documentclass turned out to be fine, 
%%   thanks to the way the layout is set in this class
\LoadClass[a4paper, \@fontSize]{report}[2004/02/16]
%
%%
%%%%% Loading required packages
%%
%
%% To set the page layout
%%
%%     in goemetry:
%%       paperwidth  = left + width  + right
%%       paperheight = top  + height + bottom
%%         top    includes \headheight + headsep
%%         bottom includes \footskip
%%
%% The headheight must not < 14.49998pt for fancyhdr
%% marginparwidth=-1pt Please do not use margin notes
%%
\RequirePackage[left=\@leftside, right=\@rightside, top=\@topside, bottom=\@bottomside, headheight=14.5pt, marginparwidth=-1pt]{geometry}[2002/07/08] 
%
\newcommand{\@setLongPage}{%
	%\geometry{top=.75in}   %doesnt work here
	\setlength\topmargin{-.3in}    % move the top of text to the top of the head roughly 
	                               %                      = remove the headheight
	\enlargethispage{1.8cm}%
}%
\newcommand{\@setNormalPage}{%
  \setlength\topmargin{0in}      % set it back to top=\@topside 
}
%
%% To produce fancy headers
%%   See \frontmatter
\RequirePackage{fancyhdr}
%
%% For setting line space
\RequirePackage{setspace}[2000/12/01]
%
% required for loading the University logo
\RequirePackage{graphicx}[1999/02/16]      
%
%% To create a blank verso page for recto-verso (twoside/openright) printing
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
  \renewcommand\cleardoublepage{\clearpage}      % if not twoside open right, clear one page only
\fi
%
%% To produce hypertext version of PDF;
%%
%%   loaded as the last package
%%   "plainpages" option false is used to avoid duplicate page identifiers
%%
%% "colorlinks" will be grayed when printed
%\ifhyper\RequirePackage[plainpages=false, colorlinks, bookmarks, bookmarksnumbered, breaklinks, linkcolor={blue}]{hyperref}\fi 
\ifhyper\RequirePackage[plainpages=false, pdfpagelabels, bookmarks, bookmarksnumbered, breaklinks]{hyperref}[2003/11/30]\fi
%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%% MAIN CODE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%
%%%%% Configuratons
%%
%
%% setting section numbering depth, 10 should be sufficient
\setcounter{secnumdepth}{10}
%%
%% Remove page number at the footer of \chapter pages, if you like
%\let\ps@plain=\ps@empty  
%
%%
%%
%%%%% Renew command: maketitle
%%
%%      Formated to meet the requirements
%%        Appendix I, Guidelines


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%
%%%%%%%%%%%%%%%%%%%%%           Title Pages              %%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%  1st Title Page  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\maketitleFirst}{
  \thispagestyle{empty}
  \@setLongPage
  \vspace{1.5cm}
  \begin{center}
     \Huge\textbf{\@title}
  \vfill
  
    \Large A \ifphd Dissertation \else Thesis \fi Submitted in \ifpartial Partial \fi Fulfilment of \\
    the Requirements for the Award of the Degree of \\
    
    \vfill
    
    \Large \ifphd Doctor of Philosophy \else \@degree \fi \\
    
    \vspace{2cm}
    \normalsize
    from\\
  \vfill
             \IfFileExists{\@unilogo .png}{\noindent\setunilogo{2.7cm}}
    \newline    \\
    \large \MakeUppercase{\@uni}
  \vfill
    by\\
    \vfill
    \large \@author \\[0.2cm]
    %v1.0a A space "\ " added to handle empty \@regNumber that caused "no line here to end" error
    %\normalsize {\itshape\@regNumber}\\
    \normalsize{\itshape Reg. No: \@regNumber}\ \\
    \vspace{1.3cm}
     Supervised by\\
        \vfill

    \large \@supervisor \\ [0.2cm]
        \normalsize {\itshape\@supervisorDesig}\ \\

    \vfill
    \@dept \\
    \@school \\[0.5cm]
    \@submissionYear  
  \end{center}   
  \rule\linewidth{1.5pt}
	\clearpage
	\@setNormalPage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%  2nd Title Page  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\newcommand{\maketitleSecond}{
  \thispagestyle{empty}
  \@setLongPage
  \vspace{1.5cm}
  \begin{center}
     \Huge\textbf{\@title}
  \vfill
  
    \Large A \ifphd Dissertation \else Thesis \fi Submitted in \ifpartial Partial \fi Fulfilment of \\
    the Requirements for the Award of the Degree of \\
    
    \vfill
    
    \Large \ifphd Doctor of Philosophy \else \@degree \fi \\
    
    \vspace{2cm}
    \normalsize
    from\\
  \vfill
             \IfFileExists{\@unilogo .png}{\noindent\setunilogo{2.7cm}}
    \newline    \\
    \large \MakeUppercase{\@uni}
  \vfill
    by\\
    \vfill
    \large Reg. No: \@regNumber \\[0.2cm]
    %v1.0a A space "\ " added to handle empty \@regNumber that caused "no line here to end" error
    %\normalsize {\itshape\@regNumber}\\
    
    \vspace{1.3cm}
     Supervised by\\
        \vfill

    \large \@supervisor \\ [0.2cm]
        \normalsize {\itshape\@supervisorDesig}\ \\

    \vfill
    \@dept \\
    \@school \\[0.5cm]
    \@submissionYear  
  \end{center}   
  \rule\linewidth{1.5pt}
	\clearpage
	\@setNormalPage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{
    \maketitleFirst
    \maketitleSecond
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@makedeclarationpage}{%
  \thispagestyle{empty}%
  \begin{center}%
    \null\vspace{3cm}%
    \Large \textbf{DECLARATION}%
    \vspace{1cm}%
  \end{center}%
        
	\@declaretext%
	
  \vspace{2.5cm}%
  \noindent\underline{~(Signature Required)~}\\[0.5cm]%
  \noindent\@author\\[0.2cm]
  \noindent Reg. No: \textit\@regNumber\\[0.2cm]
  \noindent\@submissionDay\ \@submissionMonth\ \@submissionYear %
  %\today%
  \cleardoublepage%
}


\newcommand{\@makecertiicationpage}{%
  \thispagestyle{empty}%
  \begin{center}%
    \null\vspace{3cm}%
    \Large \textbf{CERTIFICATION}%
    \vspace{1cm}%
  \end{center}%
        
	\@certifytext%
	
  \vspace{2.5cm}%
  \noindent\underline{~(Signature Required)~}\\[0.5cm]%
  \noindent\@supervisor\\[0.2cm]
    \noindent \textit \@supervisorDesig\\[0.2cm]
  \noindent\@submissionDay\ \@submissionMonth\ \@submissionYear %
  %\today%
  \cleardoublepage%
}
%
%%
%%%%% Renew abstract environment
%%
%%      Abstract is formated to meet the requriements
%%        
%%        p.18, Section 3.8, Guidelines
%%
\renewenvironment{abstract}{%
  \newpage%
  \@setLongPage%
  \pagestyle{empty}%
  \begin{center}%
      \section*{ABSTRACT}    % placeholder for hypertext bookmark to work
      \addtocontents{toc}{\vspace{10pt}}  % add space after the LOT/LOF
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

\newenvironment{acknowledgements}{%
  \pagestyle{plain}%
  \chapter*{Acknowledgements}  % To have the advantage of chapter headings
  \section*{}                  % placeholder for hypertext bookmark to work
	\addcontentsline{toc}{section}{Acknowledgements}%
  \vspace{-1cm}%
}{%
  \cleardoublepage%
}
%
%%
%%%%% New command: makecopyrightpage
%%
%%      The IP right does not depend on whether this page is present
%%      See University policy on IP
\newcommand\@makecopyrightpage{%
	\newpage%
	\begin{doublespace}   % use pagacke setspace
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
%
%%
%%%%% New command: makededicationpage
%%
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
%
%%

%% Set the new title for \tableofcontents
%%    default was Contents
\renewcommand{\contentsname}{Table of Contents}
%
%% Set the new title for \bibliography
%%    default was Bibliography
\renewcommand{\bibname}{References}
%
%% Add a reference into TOC
\let\@ldbibliography\bibliography
\renewcommand{\bibliography}[1]{\@ldbibliography{#1} \addcontentsline{toc}{chapter}{\bibname}}
%

\newcommand\frontmatter{%
	%
	%% Setup PDF description
	%% This can not be put after maketitle, or the \@author etc 
	%%   will be blank, affected by clear{double}page
	\ifhyper\hypersetup{%
  	pdfauthor={\@author},%
  	pdftitle={\@title},%
  	pdfkeywords={\@keywords}}%
	\fi%
	%
	\pagestyle{empty}%
	\singlespacing%
	%% Use different page numbering to avoid warnings 
	%%   for duplicated page idnetifier from hyperref package
	\pagenumbering{alph}%  
	%
	\maketitle                 % Requried: Title Page
	%
	\ifcopyright \@makecopyrightpage \fi%
	\cleardoublepage%
	%
	\@makedeclarationpage    
	\@makecertiicationpage
	%
	\ifdedication \@makededicationpage \fi%  			
	%
	\pagestyle{headings}%
	\pagenumbering{roman}%
  %% if no \noListOfTables
	\ifListOfTables{%
  	\listoftables            % Required: List of Tables
  	\addcontentsline{toc}{section}{List of Tables}%
	}\fi%
  %% if no \noListOfFugures
	\ifListOfFigures{%
  	\listoffigures           % Required: List of Figures, Illustrations
  	\addcontentsline{toc}{section}{List of Figures/Illustrations}%
	}\fi%
	\cleardoublepage%
	%
	% not implemented: List of Special Names or Abbreviations                       
	                           % Required: List of Special Names or Abbreviations
 	                           %           Not everybody has it
} % end of frontmatter
%
%%
%%%%% New command: mainmatter
%%
%%      to set up style etc for the body text
%% 
\newcommand\mainmatter{%
  %
  \ifdouble\doublespacing \else\onehalfspacing\fi%
  \pagenumbering{arabic}%
  %
	%% Set fancy header for body pages
	\pagestyle{fancy}%
	%% Configure the header fields

  %% I found the following working
	\let\@lmk\leftmark
	\renewcommand{\leftmark}{\textsl{\nouppercase\@lmk}}
	\let\@rmk\rightmark
	\renewcommand{\rightmark}{\textsl{\nouppercase\@rmk}}
  %% great!
	%
	\fancyfoot{}  % clear footer
	%
	\if@twoside{    % No panic! @twoside is a LaTeX switch, not TeX one as it appears to be
  	%%
  	%% \markboth{main-mark}{sub-mark}
  	%%   \leftmark <- main-mark
  	%%   \rightmark <- sub-mark
  	%% if main-mark <- \chapter or sub-mark <- \section
  	%% hence the following
  	%%
  	\fancyhead[RO,LE]{\thepage}%
  	\fancyhead[RE]{\leftmark}  % Chapter title
  	\fancyhead[LO]{\rightmark} % Section title  
	}\else{%
		\fancyhead[R]{\thepage}%
  	%\fancyhead[L]{\leftmark}  % Chapter title
  	\fancyhead[L]{\rightmark}  % Section title
	}\fi%
} % end of mainmatter
%
%%
\endinput  %Job done! Holiday time!!
%
%%%%% End of Class Code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


