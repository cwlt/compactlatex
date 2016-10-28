\LoadClass[12pt]{article}
\usepackage[utf8]{inputenc}
\usepackage{amsmath}
\usepackage{setspace}

% margins
\usepackage[a4paper, total={6.5in, 9.5in}]{geometry}

% NSF GRFP compliant font (Times New Roman equivalent)
\renewcommand{\rmdefault}{ptm}

% provides superscript "autocite"
\usepackage[autocite = superscript,style = nature]{biblatex}

% automatically generated filler text
\usepackage[english]{babel}
\usepackage{lipsum}

% provides \thetitle
\usepackage{titling}

% makes lists compact
\usepackage{enumitem}
\setlist[itemize]{noitemsep, topsep=-5pt}
\setlist[enumerate]{noitemsep, topsep=-5pt}


% gives us the inline titles
\usepackage[section]{placeins}
\usepackage[compact]{titlesec}
\titleformat{\section}[runin]{\normalfont\bfseries}{}{0pt}{}[.\kern 1pc]
\titlespacing*{\section}{0pt}{0pt}{0pt}

% bibliography helper macro
\newcommand{\bibcitation}[1]{\cite{#1} \fullcite{#1}}

% main bibliography macro
\usepackage{etoolbox}% http://ctan.org/pkg/etoolbox
\makeatletter
\newcommand{\newdecl}[2]{\csgdef{decl@#1}{#2}}% Creates a declaration
\newcommand{\csvdel}{}% Delimiter used in CSV representation
\newcommand{\newusedecl}[2][,]{% Use a declaration
  \renewcommand{\csvdel}{\renewcommand{\csvdel}{\bibcitation{#1}\,}}% Delay \csvdel one cycle.
  \csname decl@#2\endcsname\checknextarg}
\newcommand{\checknextarg}{\@ifnextchar\bgroup{\gobblenext}{}}% Check if another "argument" exists
\newcommand{\gobblenext}[1]{\csvdel\bibcitation{#1}\@ifnextchar\bgroup{\gobblenext}{}}% Gobble next "argument"
\makeatother

\newdecl{printbib}{}

% print compact title
\newcommand{\printtitle}{\begin{center}{\textbf{\thetitle}}\end{center}\vspace{-2.2ex}}
