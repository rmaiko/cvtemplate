\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}
\LoadClass[10pt,a4paper]{article}

\RequirePackage{helvet}
\RequirePackage[a4paper,%
ignoreheadfoot,%
top=2.54cm,%
bottom=2.54cm,%
left=1.6cm,%
right=1.6cm,%
headheight=0cm,%
headsep=0cm]{geometry}
\RequirePackage{graphicx}% images
\RequirePackage{array}%    extra row height
\RequirePackage{overcite}% superscript, sorted, compressed citation commands
\RequirePackage{lastpage}% to get reference for last page number
\RequirePackage{fancyhdr}% simple control of headers and footers
\RequirePackage{textcomp} %for copyright symbol
\RequirePackage{multicol}
\RequirePackage{parskip}
\RequirePackage{listings}
\RequirePackage{color}
\RequirePackage{etoolbox}
\RequirePackage[sfdefault,light]{roboto}
\RequirePackage{enumitem}

%\RequirePackage{cmbright}
%\renewcommand*\rmdefault{cmbright}
%\renewcommand*\sfdefault{lmssq}
\renewcommand{\familydefault}{\sfdefault} % Set font to sans-serif

% Force enumerations without indent
\setlist[itemize]{leftmargin=*}

%
% My data
%
\newcommand{\myname}{Ricardo Entz}
\newcommand{\myaddress}{My Address \\ City \\ Country}
\newcommand{\myphone}{myphone}
\newcommand{\myemail}{myemail@email.com}
\newcommand{\myphoto}{cphoto}
\newcommand{\mybirthdateplace}{00/00/0000}
\newcommand{\addressee}{Test, of Contoso Corporation}

%
% Formatting tweaking
%
\linespread{1.46}
\setlength{\parskip}{0.1cm}
\setlength{\parindent}{0pt}
\newlength{\photowidth}
\setlength{\photowidth}{3.55cm}
\newlength{\normalfontsize}
\setlength{\normalfontsize}{9.5pt}
\newlength{\namefontsize}
\setlength{\namefontsize}{14pt}
\newlength{\headerfontsize}
\setlength{\headerfontsize}{12pt}
\newlength{\topicfontsize}
\setlength{\topicfontsize}{11pt}
\newlength{\footerfontsize}
\setlength{\footerfontsize}{4pt}

\renewcommand{\headrulewidth}{0pt}    % turn off default headrule

\definecolor{invisiblegray}{rgb}{0.7,0.7,0.7}
\definecolor{black80p}{rgb}{0.2,0.2,0.2}
\definecolor{airbusblue}{rgb}{0.117647,0.19215,0.454901}

\color{black80p}

%
% Define header to be used for ALL pages
%
\fancyhf{}% clear defaults
\fancyheadoffset{0cm}
\lhead{}
\chead{}
\rhead{} 
\lfoot{}
\cfoot{\textcolor{invisiblegray}{%
            \textrm{\fontsize{\footerfontsize}{\footerfontsize}\selectfont %
                    Compiled \today~for \addressee}%
      }}
\rfoot{}

\pagestyle{fancy}

\def\imagetop#1{\vtop{\null\hbox{#1}}}

%
% Now let's create the header
%
\renewcommand*{\maketitle}{%

\hspace*{\dimexpr -\tabcolsep -\arrayrulewidth} \begin{tabular}{%
        >{\raggedright}p{\photowidth}%
        >{\raggedright}p{\dimexpr \columnwidth - \photowidth -\tabcolsep -\arrayrulewidth}%
    }
    \imagetop{\includegraphics[width=\photowidth]{\myphoto}} & %
    \imagetop{%
        \fontsize{\namefontsize}{\namefontsize}\selectfont%
        \textcolor{airbusblue}{\textbf{\myname}}
    }
    %~\\*[-21pt]
    %\hrulefill \\
    \fontsize{\normalfontsize}{\normalfontsize}\selectfont \myaddress \\
    ~\\
    \myphone \\
    \myemail \\
    \mybirthdateplace
    \tabularnewline
\end{tabular}\\*[-10pt]
\fontsize{\normalfontsize}{\normalfontsize}\selectfont
}

%
% Environments
%
\newenvironment{CVSection}{%
    ~\\[-15pt]
    \fontsize{\headerfontsize}{\headerfontsize}\selectfont
    \color{airbusblue}
    \bfseries \par
    }{%
    \\*[-5pt]
    \color{black80p} 
    \hrulefill 
    \\*[-10pt]
}

\newenvironment{CVTopic}{%
    \fontsize{\topicfontsize}{\topicfontsize}\selectfont
    \scshape \bfseries
    }{
    \normalfont
}

\newcommand{\maketopic}[3]{
    \hspace*{\dimexpr -\tabcolsep -\arrayrulewidth} \begin{tabular}{%
        >{\raggedright}p{\photowidth}%
        >{\raggedright}p{\dimexpr \columnwidth - \photowidth -\tabcolsep -\arrayrulewidth}%
    }
    \begin{CVTopic} #1 \end{CVTopic} & \begin{CVTopic} #2 \end{CVTopic} \tabularnewline
    \end{tabular} 
    \\*[-16pt]
    \begin{multicols}{2}
    #3
    \end{multicols}
}

\newcommand{\maketopicnocol}[3]{
    \hspace*{\dimexpr -\tabcolsep -\arrayrulewidth} \begin{tabular}{%
        >{\raggedright}p{\photowidth}%
        >{\raggedright}p{\dimexpr \columnwidth - \photowidth -\tabcolsep -\arrayrulewidth}%
    }
    \begin{CVTopic} #1 \end{CVTopic} & \begin{CVTopic} #2 \end{CVTopic} \tabularnewline
    \end{tabular} 
    \\*[5pt]
    #3
}


