%% plai.cls
%% Copyright 2023 Johannes Kinder <johannes.kinder@lmu.de>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `author-maintained'.
% 
% This work consists of the files plai.cls and the example
% files seminar.tex and bibliography.bib.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{plai}[2023/12/01 PLAI Document Class]

\RequirePackage[utf8]{inputenc}

\def\Snospace~{\S{}}

% Define the class options
\DeclareOption{seminar}{%
  \AtBeginDocument{%
    \renewcommand*{\sectionautorefname}{\Snospace}
    \renewcommand*{\subsectionautorefname}{\Snospace}
    \renewcommand*{\subsubsectionautorefname}{\Snospace}
    \renewcommand*{\paragraphautorefname}{\Snospace}
  }
  \let\@seminar\relax
  \def\seminar#1{\def\@seminar{#1}}
}
\DeclareOption{thesis}{%
  \AtBeginDocument{%
    \renewcommand*{\chapterautorefname}{Chapter}
    \renewcommand*{\sectionautorefname}{Section}
    \renewcommand*{\subsectionautorefname}{Section}
    \renewcommand*{\subsubsectionautorefname}{Section}
    \renewcommand*{\paragraphautorefname}{Paragraph}
  }
}

\let\@matrikelnummer\relax
\def\matrikelnummer#1{\def\@matrikelnummer{#1}}
\let\@email\relax
\def\email#1{\def\@email{#1}}
\let\@semester\relax
\def\semester#1{\def\@semester{#1}}

\newcommand{\nouse}[1]{}
\newcommand{\ouse}[1]{#1}
% Set the default class option
%\ExecuteOptions{seminar}

% Process the class options
\ProcessOptions\relax

% Define the document class based on the selected option

\LoadClass[a4paper,11pt, twoside, openright]{report} % Use 'report' for thesis

% Set the page margins
\RequirePackage[left=30mm,right=30mm,top=30mm,bottom=40mm,binding offset=5mm, \nouse{showframe}]{geometry}

\RequirePackage{libertine}
\RequirePackage{inconsolata}
%\RequirePackage{lmodern}

\RequirePackage{xcolor}
\definecolor{lmugreen}{HTML}{00883A}
\definecolor{lmublue}{HTML}{0F1987}
\definecolor{lmucyan}{HTML}{009FE3}
\definecolor{lmupurple}{HTML}{8C4091}
\definecolor{lmured}{HTML}{D71919}
\definecolor{lmuorange}{HTML}{F18700}
\definecolor{lmublack}{HTML}{202a30}
\definecolor{lmugray}{HTML}{626468}
\definecolor{lmuhalfgray}{HTML}{C0C1C3}
\definecolor{lmulightgray}{HTML}{E6E6E7}

% Pretty hyperref defaults
\RequirePackage[
    colorlinks=true,
    linkcolor={lmugreen},
    citecolor={lmugray},
    urlcolor={lmublue}
 ]{hyperref}
\RequirePackage[all]{hypcap} % Make hyperrefs not link to figure caption but head


\RequirePackage{amsmath}
\RequirePackage[numbers]{natbib}

\RequirePackage{listings}


% General listings style
\lstset{
    basicstyle=\footnotesize\ttfamily,
    lineskip=0pt,
    basewidth=.5em,
    breaklines=false,
    showstringspaces=false,
    tabsize=2,
    keywordstyle=\bfseries\color{lmublue},
    emphstyle=\color{lmublack},
    stringstyle=\color{lmured},
    commentstyle=\color{lmugreen},
    numbers=left,
    numberstyle=\scriptsize\color{lmuhalfgray}\ttfamily,
    numbersep=10pt,
    frame=l,
    framesep=5pt, % space between frame and text
    framextopmargin=0,
    framexbottommargin=0,
    framerule=0.5pt,
    rulecolor=\color{lmuhalfgray},
    xleftmargin=20pt, % indent of frame
    captionpos=b,
    escapeinside={(@}{@)},
    aboveskip=0pt,
    belowskip=0pt,
}

% Custom title in bold
\RequirePackage{titling}
\pretitle{\begin{center}\@seminar, \@semester\par\par\vskip0.2em\bfseries\LARGE}
\posttitle{\end{center}\vskip 0.5em}
\preauthor{\begin{center}\large}
\postauthor{\vskip 0.3em\normalsize\normalfont\par Matr.Nr.: \@matrikelnummer\par E-Mail: \@email\par Ludwig-Maximilians-Universität München\par Institut für Informatik\par\end{center}}
\date{\relax}
\predate{}
\postdate{}

\lstdefinelanguage{JavaScript}{
  morekeywords=[1]{break, continue, delete, else, for, function, if, in,
    new, return, this, typeof, var, void, while, with, let, const},
  % Literals, primitive types, and reference types.
  morekeywords=[2]{false, null, true, boolean, number, undefined,
    Array, Boolean, Date, Math, Number, String, Object},
  % Built-ins.
  morekeywords=[3]{eval, parseInt, parseFloat, escape, unescape},
  sensitive,
  morecomment=[s]{/*}{*/},
  morecomment=[l]//,
  morecomment=[s]{/**}{*/}, % JavaDoc style comments
  morestring=[b]',
  morestring=[b]"
}[keywords, comments, strings]



\RequirePackage{etoolbox}
\AtBeginEnvironment{thebibliography}{
    \setlength{\bibsep}{3pt plus 2pt}
    \Urlmuskip=-.8mu plus 1mu
    % make URLs smaller in bibliography, otherwise they stand out a lot
    \renewcommand{\UrlFont}{\ttfamily\footnotesize}
}

\RequirePackage{booktabs}
\RequirePackage[labelfont=bf,margin=10pt,justification=centering]{caption} 


\endinput
