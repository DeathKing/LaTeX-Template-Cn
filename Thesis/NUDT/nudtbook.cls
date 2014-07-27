\ProvidesClass{nudtbook}[2004/11/22 v041101, by Mao Ziyang]
%
% Class Options:
%   phd     - PhD thesis
%   master      - Master thesis (default)

\newif\ifPhD\PhDfalse

\DeclareOption{phd}{\PhDtrue}
\DeclareOption{master}{\PhDfalse}
\ProcessOptions

\let\CCTCJKfonts=1
\ifPhD
  \LoadClass[11pt,twoside]{cctbook}
\else
  \LoadClass[11pt,oneside]{cctbook}
\fi

  
\endlinechar -1

\newcommand\midmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}}
  
\renewcommand\contentsname{\ziju{2}目录}

%------------------------ Page layout ----------------------------------

\topmargin=-0.4mm
\oddsidemargin=-0.4mm
\evensidemargin=-5.4mm
\textwidth=165mm
\textheight=227mm


%-------------------------- Cover page ----------------------------
%\let\@author\strut      \def\author#1{\def\@author{#1}}
%\let\@supervisor\@empty     \def\supervisor#1{\def\@supervisor{#1}}
%\let\@submissiondate\@empty \def\submissiondate#1{\def\@submissiondate{#1}}
%\let\@defensedate\@empty    \def\defensedate#1{\def\@defensedate{#1}}
%\let\@chairman\@empty       \def\chairman#1{\def\@chairman{#1}}
%\let\@field\@empty      \def\field#1{\def\@field{#1}}
%\let\@classification\@empty \def\classification#1{\def\@classification{#1}}
%\let\@UDC\@empty        \def\UDC#1{\def\@UDC{#1}}
%\let\@confidentiality\@empty \def\confidentiality#1{\def\@confidentiality{#1}}
%\let\@serialno\@empty       \def\serialno#1{\def\@serialno{#1}}

\newtoks\displaytitle
\def\fenleihao#1{\def\@fenleihao{#1}}
%\newtoks\fenleihao   %中图分类号
\newtoks\xuehao      %学号
\newtoks\UDC         %《国际十进制分类法UDC》的类号
\newtoks\miji        %密级
\newtoks\lunwenleixing   %①    学硕士学位论文；
                         %②同等学力申请    学硕士学位论文；
                         %③工程硕士学位论文；
                         %④    学博士学位论文；
                         %⑤同等学力申请    学博士学位论文
%\newtoks\xueweileixing   %硕士；博士
\newtoks\zuozheleixing   %博士生，硕士生，申请人
\newtoks\zhuanye         %学科专业
\newtoks\fangxiang       %研究方向
\newtoks\jiaoshi         %指导教师姓名与职称

\def\maketitle{%
  \null
  \thispagestyle{empty}%
  \begin{center}\leavevmode
    {\fangsong \zihao{5}%
    \begin{tabular}{lp{4cm}p{2.5cm}lp{4cm}l}
      \raisebox{-0.5ex}[0pt]{分类号} & {}\hfill\raisebox{-0.5ex}[0pt]{\@fenleihao}\hfill{} &  & \raisebox{-0.5ex}[0pt]{学号} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\xuehao}\hfill{} & \\ \cline{2-2}\cline{5-5}
      \raisebox{-0.5ex}[0pt]{U\ D\ C} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\UDC}\hfill{}      &  & \raisebox{-0.5ex}[0pt]{密级} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\miji}\hfill{}   & \\ \cline{2-2}\cline{5-5}
    \end{tabular}
    }
    \par
    \vspace*{2.5cm} %插入空白
    {\heiti \zihao{3} \the\lunwenleixing}\\
%    \vspace{1.5cm}
    \vfill
    {\huge \@title \par}%
%    \vspace{4cm}
     \vfill\vfill\vfill
    {\heiti\zihao{4}
    \begin{tabular}{cp{8cm}c}
      \raisebox{-3ex}[0pt]{\the\zuozheleixing 姓名} & {\fangsong {}\hfill\raisebox{-3ex}[0pt]{\@author}\hfill{}} & \\[3ex] \cline{2-2}
      \raisebox{-3ex}[0pt]{学\ 科\ 专\ 业} & {\fangsong {}\hfill\raisebox{-3ex}[0pt]{\the\zhuanye}\hfill{}} & \\[3ex] \cline{2-2}
      \raisebox{-3ex}[0pt]{研\ 究\ 方\ 向} & {\fangsong {}\hfill\raisebox{-3ex}[0pt]{\the\fangxiang}\hfill{}} & \\[3ex] \cline{2-2}
      \raisebox{-3ex}[0pt]{指\ 导\ 教\ 师} & {\fangsong {}\hfill\raisebox{-3ex}[0pt]{\the\jiaoshi}\hfill{}} & \\[3ex] \cline{2-2}
    \end{tabular}
    }
    \par
    \vspace{10em}
    {\songti \zihao{3}\textbf{国防科学技术大学研究生院}\\[1.5em]
%    {\Large \bfseries \the\year~年~\the\month~月 \par}%
    {\Large \bfseries \@date \par}%
    }
  \end{center}%
  \null
  \cleardoublepage
  \input{declaration}
  }

%----------------------- Running heads ---------------------------------
\def\ps@headings{%
    \def\@evenhead{\pushziti{\zihao{5}\songti
%      \vbox{\hbox to\textwidth{\hfil {国\ 防\ 科\ 学\ 技\ 术\ 大\ 学\ 研\ 究\ 生\ 院\ 学\ 位\ 论\ 文} \hfil}
      \vbox{\hbox to\textwidth{\hfil \ziju{0.5}{国防科学技术大学研究生院学位论文} \hfil}
      \protect\vspace{2truemm}\relax
      \hrule depth0pt height0.4truemm width\textwidth
      \protect\vspace{0.4truemm}\relax
      \hrule depth0pt height0.4truemm width\textwidth
    }}\popziti}
    \def\@oddhead{\pushziti{\zihao{5}\songti
%      \vbox{\hbox to\textwidth{\hfil {国\ 防\ 科\ 学\ 技\ 术\ 大\ 学\ 研\ 究\ 生\ 院\ 学\ 位\ 论\ 文} \hfil}
      \vbox{\hbox to\textwidth{\hfil \ziju{0.5}{国防科学技术大学研究生院学位论文} \hfil}
      \protect\vspace{2truemm}\relax
      \hrule depth0pt height0.4truemm width\textwidth
      \protect\vspace{0.4truemm}\relax
      \hrule depth0pt height0.4truemm width\textwidth
    }}\popziti}
    \def\@oddfoot{\pushziti{\zihao{5}\songti
      \vbox{\hbox to\textwidth{\hfil 第~\thepage~页\hfil}
        \protect\vspace{-1.5em}\relax
        \hrule depth0pt height0.4truemm width\textwidth
    }}\popziti}%
    \def\@evenfoot{\pushziti{\zihao{5}\songti
      \vbox{\hbox to\textwidth{\hfil 第~\thepage~页\hfil}
        \protect\vspace{-1.5em}\relax
        \hrule depth0pt height0.4truemm width\textwidth
    }}\popziti}%
    
%    \let\@mkboth\@gobbletwo
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {%                         !!!
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \chaptername \ \ %             !!!
          \fi
        \fi
        ##1}{}}
    }
\ps@headings

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{\ziju{2}摘要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{\pushziti {\heiti\zihao{-4}\cnkeywordsname：#1}\popziti}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{\pushziti {\bfseries\zihao{-4}\enkeywordsname：#1}\popziti}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{\pushziti%
    \chapter{\cnabstractname}
    \fangsong\zihao{-4}
    \@afterheading}
    {\par\popziti}

\newenvironment{enabstract}{\pushziti%
    \newpage
    \chapter{\enabstractname}
    \songti\zihao{-4}
    \@afterheading}
    {\par\popziti}

%------------------------ Chapters/sections -------------------------
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi   
                    \thispagestyle{headings}%     %    mzy
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
                    
\renewcommand\section{\@startsection
            {section}{2}{\z@}%   {name}{depth}{}
                {3.5ex \@plus 1ex \@minus .2ex}% positive->leave parindent
                {2.3ex \@plus.2ex}%
                {\reset@font\fontsize{13.75pt}{\baselineskip}\sectionformat}}
\renewcommand\sectionname{\S\,\thechapter.\arabic{section}}
\renewcommand\sectionformat{\selectfont\bfseries\centering}

%----------------------- Theorems -----------------------------------
\newtheorem{theorem}{{定理}}[chapter]
\newtheorem{proposition}[theorem]{{命题}}
\newtheorem{lemma}[theorem]{{引理}}
\newtheorem{corollary}[theorem]{{推论}}
\newtheorem{definition}{{定义}}[section]
\newtheorem{example}{{例}}[section]

%----------------------- Publications -------------------------------
\newenvironment{publications}[1]
  {\renewcommand\bibname{发表文章目录}\begin{thebibliography}{#1}}
  {\end{thebibliography}}
  
%----------------------- Bibliography -------------------------------
\renewcommand\bibname{参考文献表}
\renewenvironment{thebibliography}[1]
     {\def\chaptername{}\chapter[\bibname]{\ziju{0.5}\bibname}%                            !!!
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \small%                                               !!!
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%----------------------- Acknowledgement ----------------------------
\newcommand\acknowledgement{\backmatter\chapter[致谢]{\ziju{2}致谢}}

\endlinechar `\^^M
\endinput
