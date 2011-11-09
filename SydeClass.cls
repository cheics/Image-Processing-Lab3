% Systems Design Engineering Report Style
%
% Created by Matthew Zulak <mzulak@engmail> with assistance from
% Prof. G. Heppler <heppler@uwaterloo.ca>.
%
% Updated by Darcy Parks <dparks@engmail>
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SydeClass}[2010/11/12 The Systems Design style class]

% \typeout{SydeClass as report} -- use \typeout to write text to build output
\DeclareOption{report}{\def\@docclass{report}}
\DeclareOption{article}{\def\@docclass{article}}

\DeclareOption{twoside}{
	\def\@istwoside{1}
	\PassOptionsToClass{twoside}{\@docclass}
}

\def\@linespacingoption{1}
\DeclareOption{1space}{\def\@linespacingoption{1}}
\DeclareOption{1.5space}{\def\@linespacingoption{1.5}}
\DeclareOption{2space}{\def\@linespacingoption{2}}

\DeclareOption{header}{\def\@headeron{1}}
\DeclareOption{footer}{\def\@footeron{1}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@docclass}}
\ProcessOptions\relax

\LoadClass{\@docclass}

% ------------------------------------------ Packages ---------------------------------------------
\usepackage{textcase}
\usepackage{scalefnt}
\usepackage{graphicx}
\usepackage{lscape}

% General
\usepackage{ifthen} % \ifthenelse{\equals{\mymacro}{mystring}}{dothis}{dothat}
\usepackage{calc} % for arithmetic with variables
%\usepackage{xstring} % string manipulation

% Formatting
\usepackage{sectsty} % for changing the size of section headings, etc.
\usepackage{setspace} % \doublespacing OR \begin{singlespace} \end{singlespace} OR \begin{spacing}{0.9} \tableofcontents \end{spacing}
\usepackage{fancyhdr} % for headers and footers

% Text
\usepackage{paralist} % for in-paragraph lists using \begin{inparaenum}[1)] \item item1 \item item2 \end{inparaenum}
\usepackage{rotating} % \begin{sideways}, \begin{sidewaystable}, \begin{sidewaysfigure}

% Code
\usepackage{verbatim} % for the comment environment, use alltt or allttS instead of the verbatim environment
\usepackage{alltt} % \begin{alltt}: verbatim, but allows normal commands

% Figures
%\usepackage{epsfig} % for rotating figures (but not the caption); otherwise, see `rotating' package
\usepackage[bf]{caption} % for bold "Figure XX" in caption

% Tables
\usepackage{booktabs} % so tables look nice
\usepackage{multirow}
\usepackage{tabularx}

% Math
\usepackage{amsmath}
\usepackage{array} % for matrices
\usepackage{eqnarray} % for multi-line equations

% References
\usepackage{cite}
\usepackage{url}

%\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue,urlcolor=blue]{hyperref} % for having hot links in the pdf

% ------------------------------------------- Settings ---------------------------------------------
%--------- Commands
\newcommand{\linespacing}[1]{\renewcommand{\baselinestretch}{#1}}

\newcommand{\equalmarginlength}{(\paperwidth-\textwidth)/2 - 1in} % (\paperwidth-\textwidth)/2 - 1in
\newcommand{\equalmargins}{
	\setlength{\oddsidemargin}{\equalmarginlength}
	\setlength{\evensidemargin}{\equalmarginlength}
}
\newcommand{\offsetmargins}{
	\setlength{\oddsidemargin}{0.5in}
	\setlength{\evensidemargin}{0.0in}
}

\newcommand{\headerauthors}{
  \footnotesize
	\ifdefined \@authorheader \@authorheader \fi
	\ifdefined \@authorheadertwo , \@authorheadertwo \fi
	\ifdefined \@authorheaderthree , \@authorheaderthree \fi
	\ifdefined \@authorheaderfour , \@authorheaderfour \fi
}

%-------- Settings
\ifthenelse{\equal{\@docclass}{report}}{
	\renewcommand{\chaptername}{} % just display chapter number, instead of "Chapter #"
}{}

% margins and headers
\setlength{\textwidth}{6.1in}
\linespacing{\@linespacingoption}
\offsetmargins

\setlength{\textheight}{9in}

\ifdefined \@headeron
	\newlength{\myheadheight}
	\newlength{\myheadsep}
	\setlength{\myheadheight}{15pt}
	\setlength{\myheadsep}{10pt}
	
	\pagestyle{fancy}
	\setlength{\topmargin}{0pt-\myheadheight-\myheadsep}
	\setlength{\headheight}{\myheadheight}
	\setlength{\headsep}{\myheadsep}
	\renewcommand{\headrulewidth}{0.4pt}
	
	\fancyhead{}
	\ifdefined \@footeron
		\setlength{\footskip}{30pt}
		\renewcommand{\footrulewidth}{0.4pt}
		
		\fancyfoot{}
		\ifdefined \@istwoside
			\fancyhead[RE,LO]{\@title}
		  %\fancyhead[R]{\slshape \leftmark}
		  \fancyfoot[C]{\thepage}
	  \else
	  	\fancyhead[L]{\scshape\@title}
	  	\fancyhead[R]{\headerauthors}
	  	\fancyfoot[C]{\thepage}
	  \fi
	\else
		\ifdefined \@istwoside
			\fancyhead[RE,LO]{\@title}
		  %\fancyhead[R]{\slshape \leftmark}
	  \else
	  	\fancyhead[L]{\@title}
	  	\fancyhead[R]{\headerauthors}
	  \fi
	\fi
	
	%% ORIGINAL
%	\fancyhead[LE,RO]{\slshape \rightmark}
%	\fancyhead[LO,RE]{\slshape \leftmark}

%	\setlength{\footskip}{30pt}
%	\renewcommand{\footrulewidth}{0pt}
%	\fancyfoot{}
%	\fancyfoot[C]{\thepage}
		
\else
	\pagestyle{plain}
	\setlength{\topmargin}{0in}
	\setlength{\headheight}{0in}
	\setlength{\headsep}{0in}
\fi

% floats
\renewcommand{\textfraction}{0.01} 
\renewcommand{\topfraction}{0.99}
\renewcommand{\bottomfraction}{0.99}

% counters
\newcounter{figs}
\newcounter{eqns}
\newcounter{tabs}
%\setcounter{secnumdepth}{1}
%\setcounter{tocdepth}{1}

%\renewcommand\bibname{References}
\bibliographystyle{plain}

% ---------------------------------------- Custom Commands -----------------------------------------
% Text
\newcommand{\degree}{\ensuremath{^\circ}}

\newcommand{\super}[1]{\ensuremath{^{\textnormal{\scriptsize #1}}}}
\newcommand{\sub}[1]{\ensuremath{_{\textnormal{\scriptsize #1}}}}

% Tables
%\newcommand{\sidebox}[2]{\begin{sideways}\parbox{#1}{#2}\end{sideways}}
\newcommand{\sidebox}[1]{\rotatebox{90}{\makebox{#1\hspace{5pt}}}}
\newcommand{\sideboxh}[2]{\rotatebox{90}{\parbox[top][#1][c]{\widthof{#2}+5pt}{#2}}}
\newcommand{\wrapbox}[2]{\parbox{#1}{\vspace{4pt}#2\vspace{2pt}}}

\newcommand{\tabhead}[3]{\multicolumn{#1}{#2}{\textbf{#3}}}

% Figures
\newcommand{\row}[1]{\underline{Row~#1}}
\newcommand{\col}[1]{\underline{Column~#1}}

% Math
\newcommand{\unit}[1]{\ensuremath{\hspace{0.3em}\mathtt{#1}}}
\newcommand{\fn}[1]{\ensuremath{\mathrm{#1}}}
\newcommand{\vect}[1]{\ensuremath{\mathbf{#1}}}
\newcommand{\mat}[1]{\ensuremath{\mathrm{#1}}}
\newcommand{\diff}[2]{\ensuremath{\frac{\mathrm{d} #1}{\mathrm{d} #2}}}
\newcommand{\pdiff}[2]{\ensuremath{\frac{\partial #1}{\partial #2}}}

\renewcommand{\matrix}[2]{\ensuremath{\left[ \begin{array}{#1} #2 \end{array} \right]}}

% Code
\newenvironment{allttS}{\singlespacing\small\begin{alltt}}{\end{alltt}} % single spaced verbatim
\newcommand{\code}[1]{\texttt{#1}}

% References
\newcommand{\scn}[1]{Section~\ref{#1}}
\newcommand{\eq}[1]{Equation~\ref{#1}}
\newcommand{\fig}[1]{Figure~\ref{#1}}
\newcommand{\tab}[1]{Table~\ref{#1}}

% ------------------------------------------ Title Page --------------------------------------------
\newcommand{\titlestyle}[1]{\def\@titlestyle{#1}}
\titlestyle{design} % used in SydeTitle.tex. Can equal one of the following values: design, work

% Define title page variables
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}

\newcommand{\authortwo}[1]{\def\@authortwo{#1}}
\newcommand{\authorthree}[1]{\def\@authorthree{#1}}
\newcommand{\authorfour}[1]{\def\@authorfour{#1}}
\newcommand{\groupname}[1]{\def\@groupname{#1}}

\newcommand{\authorheader}[1]{\def\@authorheader{#1}}
\newcommand{\authorheadertwo}[1]{\def\@authorheadertwo{#1}}
\newcommand{\authorheaderthree}[1]{\def\@authorheaderthree{#1}}
\newcommand{\authorheaderfour}[1]{\def\@authorheaderfour{#1}}

\newcommand{\coursecode}[1]{\def\@coursecode{#1}}

\newcommand{\instructor}[1]{\def\@instructor{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\department}[1]{\def\@department{#1}}

\newcommand{\company}[1]{\def\@company{#1}}
\newcommand{\companyaddress}[1]{\def\@companyaddress{#1}}

%\begin{sidewaystable}
%	\centering
%	\caption{Evaluation Results using Basic Features}
%	\label{tab:evalBasic}
%	\vspace{6pt}
%	
%	\begin{tabular}{ |l p{4.5cm}| |r|r|r|r| |r|r|r|r| |r| |r|r|r|r| }
%		\hline
%		
%		\multicolumn{2}{|c||}{\textbf{Method}} & 
%		\multicolumn{4}{c||}{\textbf{Number}} &
%		\multicolumn{4}{c||}{\textbf{Accuracy [\%]}} & 
%		\textbf{SSD [\%]} &
%		\multicolumn{4}{c|}{\textbf{CPP [\%]}} \\ \cline{3-10} \cline{12-15}
%		
%		&& \sidebox{2cm}{Overall} & \sidebox{2cm}{Normal} & \sidebox{2cm}{Mild CTS} & \sidebox{2.3cm}{Severe CTS} 
%		& \sidebox{2cm}{Overall} & \sidebox{2cm}{Normal} & \sidebox{2cm}{Mild CTS} & \sidebox{2.3cm}{Severe CTS} 
%		&& \sidebox{2cm}{Overall} & \sidebox{2cm}{Normal} & \sidebox{2cm}{Mild CTS} & \sidebox{2.3cm}{Severe CTS} \\ \hline \hline
%				
%		\multicolumn{2}{|l||}{Synthetic muscles (exclusive)}   &&&& &&&& & &&&& \\
%		& Individual MUPTs	& 62195 & 25675 & 21824 & 14696	& 45.0 & 44 & 28 & 62		& 13.8	& 40.6 & 40 & 37 & 44 \\ 				
%	\end{tabular}
%\end{sidewaystable}