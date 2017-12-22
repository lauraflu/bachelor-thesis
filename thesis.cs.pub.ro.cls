% Mircea Bardac, 2008-2009
% dev@mircea.bardac.net
% thesis.cs.pub.ro.cls - class for thesis

% Copyright notice: you must keep the original author(s)/copyright information in the files
% Released: 2009-06-23 - v 0.1 (preview and public testing phase)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis.cs.pub.ro}[2008/07/14]

\let\ExecuteOptions@ltx\ExecuteOptions
\def\ExecuteOptions#1{%
 \ExecuteOptions@ltx{a4paper,12pt,twoside,openright,onecolumn,final}%
}%
\LoadClassWithOptions{report}
\let\ExecuteOptions\ExecuteOptions@ltx

% uncomment the lines bellow for Romanian Language support
% Use UTF8 file encoding when writing .tex files in Romanian
% Romanian Language support
\usepackage{ucs}
\usepackage[utf8x]{inputenc}
\usepackage[english,romanian]{babel}
\usepackage[english]{babel}

\usepackage{makeidx}

% \usepackage[top=3.5cm, bottom=3.5cm, left=3.5cm, right=3cm]{geometry}
\setlength{\headheight}{1.20cm}
\setlength{\headsep}{0.50cm}

%==============================PAGE LAYOUT===================================
% We need 1" (~72pt) margins except on the binding edge, where it is 1 1/2".
% They are a bit larger to handle lines with overfull boxes.
% 
\oddsidemargin -5mm 
\evensidemargin -5mm  %%% was 40 and 25 -dks

\marginparwidth 40bp 
\marginparsep 10bp 
\topmargin -20mm 
\leftmargin 0mm 
\rightmargin 0mm 
\textwidth 170mm
\textheight 257mm

%\topmargin -47bp        % Default margin is  73 points-- make 1/2 that
                        % plus a bit more to get page 1/2 inch down.
\headheight 10mm        % Height of box containing running head.
\headsep 5mm           % Distance between foot of head and text.
                        % headsep + headheight + topmargin ~ 72 pt
%\textheight 648bp       % Height of text (including footnotes and  %%% was 620
                        % figures, excluding running head and foot).
%\textwidth 412bp        % Give 92pt right margin;72 + extra for overfull boxes.
% disappeared from LaTeX\footheight 11bp        %    Height of box containing running foot.
\footnotesep  
\baselineskip
\footskip 15mm          %    Distance from baseline of box containing foot 
                        %    to baseline of last line of text.
\parindent 3.5ex
\parskip 1bp plus 1bp 
\setcounter{tocdepth}{1} % Put subsubsections in toc (set to 2 in
                         % report.sty). [lsc] 
\skip\footins 15pt plus3pt minus3pt % Add space between text and
                                    % footnotes.
%==============================END PAGE LAYOUT================================%

% Package for caption and centering them
\usepackage[justification=centering]{caption}

\usepackage{parskip}

% package for variable line spacing (1, 1.5, 2)
% usage: write \onehalfspacing before the part which should be 
% with 1.5 line spacing
% for example, in "thesis.tex" before "\input{src/main}" will make
% all the chapters with 1.5 line spacing
\usepackage{setspace}

% hyper-references
% http://www.tug.org/applications/hyperref/manual.html
\usepackage{hyperref}
\hypersetup{%
	colorlinks=true,
	linkcolor=black,
	anchorcolor=black,
	citecolor=black,
	filecolor=black,
	menucolor=black,
	urlcolor=black,
	bookmarks=true,
	bookmarksnumbered=true
}
\urlstyle{sf}

% For subscripts
\usepackage{fixltx2e}

% Treat _ as a normal character
\usepackage{underscore}

% Support for including graphics
\usepackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}
\usepackage{float}

% Code listings support
\usepackage{listings}

\renewcommand{\lstlistingname}{Listarea}

\lstset{
	numbers=left, numberstyle=\footnotesize,
	frame=lines, captionpos=b,
	breaklines=true,
	basicstyle=\ttfamily
}

% notations and abbreviations
% http://www-h.eng.cam.ac.uk/help/tpl/textprocessing/nomencl.pdf
% Sample usage (anywhere in the doc): \abbrev{ABC}{Alpha Beta Gama}
\usepackage[notintoc]{nomencl}

\let\abbrev\nomenclature
\renewcommand{\nomname}{Lista acronimelor}

\renewcommand{\nomlabel}[1]{#1 --}
\setlength{\nomitemsep}{-\parsep}

% to be used in the main .tex file
% \newcommand{\printabbrev}{
% 	\printnomenclature
% 	\newpage
% }

\makenomenclature


% restart numbering footnotes on every page
\usepackage{perpage}
\MakePerPage{footnote}

% custom variables for altering front page content

% for some reason I can't use \VAR@author as described in
% http://www.gocad.org/meeting/Nancy2008/papers/gocad.sty
\newcommand{\VARauthor} {}
\newcommand{\VARdate} {}
\newcommand{\VARadviser} {}
\newcommand{\VARtitleen} {}
\newcommand{\VARtitlero} {}
\newcommand{\VARtitlefooteren} {}
\newcommand{\VARtitlefooterro} {}
\newcommand{\VARtitludom} {}
\newcommand{\VARdomeniu} {}
\newcommand{\VARprogram} {}
\newcommand{\VARtiplucrare} {}


\renewcommand{\author}[1]{ \renewcommand{\VARauthor}{#1} }
\renewcommand{\date}[1]{ \renewcommand{\VARdate}{#1} }
\newcommand{\adviser}[1]{ \renewcommand{\VARadviser}{#1} }
\newcommand{\titleen}[1]{ \renewcommand{\VARtitleen}{#1} }
\newcommand{\titlero}[1]{ \renewcommand{\VARtitlero}{#1} }
\newcommand{\titlefooteren}[1]{ \renewcommand{\VARtitlefooteren}{#1} }
\newcommand{\titlefooterro}[1]{ \renewcommand{\VARtitlefooterro}{#1} }
\newcommand{\titludom}[1]{ \renewcommand{\VARtitludom}{#1} }
\newcommand{\domeniu}[1]{ \renewcommand{\VARdomeniu}{#1} }
\newcommand{\program}[1]{ \renewcommand{\VARprogram}{#1} }
\newcommand{\tiplucrare}[1]{ \renewcommand{\VARtiplucrare}{#1} }


% fancyhdr package
% headers with chapter title and page number
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{} % delete default settings
\fancyhead[LE,RO]{\bfseries \thepage} % page number
%\fancyhead[L]{\bfseries\leftmark}    % section name

% line in header
\renewcommand{\headrulewidth}{0.5pt}
% more space for the line in header
\addtolength{\headheight}{0.5pt}

% no line in footer
\renewcommand{\footrulewidth}{0pt}

% longtable package
\usepackage{longtable}

% Fix verbatim environment: smaller text size
\let\oldverbatim=\verbatim
\renewenvironment{verbatim}{
  \begin{small}
  \begin{oldverbatim}
  \vspace*{1em}
}%
{%
  \vspace*{1em}
  \end{oldverbatim}
  \end{small}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iiscthes.sty - IISC Thesis Style
% http://etd.ncsi.iisc.ernet.in/instructions/templates.htm

% Page formatting and numbering

%\newenvironment{frontmatter}{\pagenumbering{roman}}{\newpage \pagenumbering{arabic}}
\newenvironment{frontmatter}{\newpage \pagenumbering{arabic}}

\renewenvironment{abstract}{\null\vfil\prefacesection{Abstract}}{\par\vfill\null}

\def\prefacesection#1{%
	\chapter*{#1}
	\addcontentsline{toc}{chapter}{#1}}

% Added by Y.N. Srikant
\def\keywords{\prefacesection{Keywords}}
\def\notations{\prefacesection{Notation and Abbreviations}}
\def\vita{\prefacesection{Vita}}
\def\publications{\prefacesection{Publications based on this Thesis}}

%% end iiscthes.sty
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\notitlesection#1{%
    \addcontentsline{toc}{chapter}{#1}}

\newenvironment{acknowledgements} {
    \notitlesection{Acknowledgements}
    \thispagestyle{empty} }
{\pagestyle{fancy}}

\newcommand{\includechapter}[1]{\input{src/chapter-#1/index}}
\newcommand{\includesection}[2]{\input{src/chapter-#1/#2}}

% No indent
\setlength{\parindent}{0pt}

\usepackage[T1]{fontenc}

% Default fonts
% (more info: http://www.tug.dk/FontCatalogue/)

% TT font: Courier
\usepackage{courier}

% SF font: Helvetica (default document font)
%\usepackage[scaled]{helvet}
%\renewcommand*\familydefault{\sfdefault}

% command for specifying TODOs
\newcommand{\todo}[1]{
	\colorbox{yellow}{
		\begin{minipage}{15cm}
			\textbf{TODO:}\\
			#1
		\end{minipage}
	}
}

% command for formatting inline functions
% Usage (default language = C)
%   \func{function_name}
%   \func[language]{function_name}
%      'language' must be supported by package 'listings'
\newcommand{\func}[2][C]{\lstset{language=#1}\lstinline|#2|\lstset{language=C}}

% command for formatting file names
\newcommand{\file}[1]{\textbf{\texttt{#1}}}

% command for formatting inline commands
\newcommand{\cmd}[1]{\textbf{\texttt{#1}}}

% commands for creating labeled hyper-linked references
\newcommand{\labelindexref}[2]{\hyperref[#2]{#1~\ref*{#2}}}
\newcommand{\labelref}[2]{\hyperref[#2]{#1}}

% command for inserting labeled figures
% Usage: \fig{file}{label}{caption}
%   TODO: references should point to the top of the image
\newcommand{\fig}[4][]{
\begin{figure}[htb]
	\begin{center}
		\includegraphics[#1]{#2}
		\caption{#4 \label{#3}}
    \end{center}
\end{figure}
}

% chage caption name from Figure -> Figura
\addto\captionsenglish{\renewcommand{\figurename}{Figura}}

% suport for multiple columns
\usepackage{multicol}

% suport for subfloats
\usepackage{subfig}

% booktabs (professional tables)
\usepackage{booktabs}

% multirow (useful for creating multirow cells)
\usepackage{multirow}

% mathematical formulas
\usepackage{amsmath}
\usepackage{amsfonts}

% -----------------------------------------------------------------
% Pretty formatting for 2nd, 3rd etc.
\usepackage{nth}

% -----------------------------------------------------------------
% Bold in math mode
\usepackage{bm}

% -----------------------------------------------------------------
% Settings for pretty code
\usepackage[dvipsnames]{xcolor}
\usepackage{color}
\definecolor{codegray}{gray}{0.9}
\definecolor{mygray}{rgb}{0.4,0.4,0.4}
\definecolor{mygreen}{rgb}{0,0.8,0.6}
\definecolor{myorange}{rgb}{1.0,0.4,0}

% -----------------------------------------------------------------
% Settings for tables
\usepackage{array}
\usepackage{tabu}
\usepackage{makecell}

% -----------------------------------------------------------------
% For angular brackets 
\usepackage[T1]{fontenc} 

% -----------------------------------------------------------------
% Code settings
\newcommand{\code}[1]{\colorbox{codegray}{\texttt{#1}}}

\lstset{ %
    basicstyle=\fontsize{10}{10}\selectfont\ttfamily\color{black},
    commentstyle=\color{mygray},
    captionpos=b, 	% position of the caption to bottom
    breaklines=true,	% sets automatic line breaking
    frame=single, 	% adds a frame around the text
    numbers=left,	% where to put line numbers
    numbersep=5pt,
    numberstyle=\tiny\color{mygray},
    keywordstyle=\color{mygreen},
    showspaces=false,
    showstringspaces=false,
    stringstyle=\color{myorange},
    tabsize=2
}

% avoid hypenation for these words
\hyphenation{ConnexArray}

% For measurement units
\usepackage{siunitx}

% remove headers on empty pages
\usepackage{emptypage}

% For enumerating with letters
\usepackage{enumitem}

% For subfigures
\usepackage{mwe}
\usepackage{subfig}

% For graphs
\usepackage{tikz}
\usepackage{filecontents,pgfplots}

\usepackage{pdfpages}
