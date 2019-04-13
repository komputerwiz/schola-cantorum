% class worship extends report (if tex were object-oriented)
% based on the template provided at:
% https://en.wikibooks.org/wiki/LaTeX/Creating_Packages#Creating_your_own_class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worship}[2017/09/28]

% options
%\DeclareOption{optname}{ \relax }
%\DeclareOption{optname}{ \PassOptionsToPackage{\CurrentOption}{pkgname} }
%\DeclareOption{optname}{ \PassOptionsToClass{\CurrentOption}{clsname} }
\DeclareOption{booklet}{%
  \PassOptionsToPackage{paperwidth=5.5in,paperheight=8.5in,margin=0.5in,footskip=0.25in,headsep=6pt}{geometry}%
}

% fallback option: pass along to base report class
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}

% execute default options
%\ExecuteOptions{default,options}

% process given options
\ProcessOptions\relax

% base class
\LoadClass{report}

% package dependencies
\RequirePackage{color}
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{libertine}
\RequirePackage{luatex85}
\RequirePackage[autocompile]{gregoriotex}
\RequirePackage[savepos]{zref}

% formatting configuration
\setlength{\parindent}{0em}
\setlength{\parskip}{0.5em}

% "do the red"
\newenvironment{rubric}{%
  \color{red}%
  \small%
}{%
  \normalsize%
  \par%
}

% "say the (bold) black"
\newenvironment{response}{%
  %\setlength{\leftskip}{2em}%
  %\setlength{\rightskip}{2em}%
  \begin{bf}%
  \gresetinitiallines{0}
  \grechangestaffsize{15}
}{%
  \end{bf}%
  \par%
}

% someone else says the normal black
\newenvironment{versicle}{%
  %\setlength{\leftskip}{2em}%
  %\setlength{\rightskip}{2em}%
  \gresetinitiallines{0}
  \grechangestaffsize{12}
}{%
  \par%
}

% titles are kinda like rubric
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries\color{red}\MakeUppercase}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\color{red}\MakeUppercase}}

% interlinear translation styles
\newcommand{\tr}[1]{\color{gray}\it #1}

% macros for multi-verse (litany) style gregorio
% see http://gregorio-project.github.io/tips/litany.html

\makeatletter

\countdef\@maxtab=30

% redefine \grealign produced and used by gabc's alignment compilation (`[em1]`
% if `def-m1: \grealign;` is set in the metadata) so we can hook them to tab
% alignments (`\>`) in tex files.
\newcounter{score}
\newcounter{tabstop}[score]
\newcommand{\grealign}{%
	\@bsphack%
	\ifgre@boxing\else%
		\kern\gre@dimen@begindifference%
		\stepcounter{tabstop}%
		\expandafter\zsavepos{stop-\thescore-\thetabstop}%
		\kern-\gre@dimen@begindifference%
	\fi%
	\@esphack%
}

% Helper command for nstabbing environment definition below.
% see https://tex.stackexchange.com/questions/296180/tabbing-environment-with-automatic-tab-stops
\newcommand{\setstops}{%
  \gdef\nstabbing@stops{%
    \hspace*{-\oddsidemargin}\hspace{-1in}%
    \hspace*{\zposx{stop-\thescore-1} sp}\=%
  }%
  \count@=\@ne
  \loop\ifnum\count@<\value{tabstop}%
    \begingroup\edef\x{\endgroup
      \noexpand\g@addto@macro\noexpand\nstabbing@stops{%
        \noexpand\hspace{-\noexpand\zposx{stop-\thescore-\the\count@} sp}%
        \noexpand\hspace{\noexpand\zposx{stop-\thescore-\the\numexpr\count@+1} sp}\noexpand\=%
      }%
    }\x
    \advance\count@\@ne
  \repeat
  \nstabbing@stops\kill
}
\makeatother

% Environment for aligning multiple lines beneath a single chant score. Each
% `[em1]` in a score corresponds with a `\>\tr{..}` text alignment in a layout.
% For example:
%
%     scorefile.gabc
%     --------------
%     (c4) 1. Di([em1]f)en(e') i([em1]f)ræ,(d') di([em1]e)es(c') il([em1]e)la,(e.) (:)
%
%     layoutfile.tex
%     --------------
%     \gregorioscore{scorefile}
%     \begin{nstabbing}
%       \>day \>of-wrath \>day \>that
%     \end{nstabbing}
\newenvironment{nstabbing}
  {\setlength{\topsep}{0pt}%
   \setlength{\partopsep}{0pt}%
   \tabbing%
   \setstops}
  {\endtabbing\stepcounter{score}}

\endinput
