
\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{whucls}[2003/01/10 Derived from the `book' class]
\newif\ifPhD\PhDtrue


\DeclareOption{phd}{\PhDtrue}
\DeclareOption{master}{\PhDfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[openany,oneside]{book}[1996/10/31]
\RequirePackage{cctbase,ccmap,CCTfntef}[2003/01/10]
\RequirePackage{ifpdf}



\newcommand\midmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}}
%------------------------ Page layout ----------------------------------
\usepackage[top=2.7truecm,bottom=2.9truecm,
            left=2.8truecm,right=2.5truecm,
            %includehead,%includefoot,
            dvipdfm]{geometry}    % 页面设置%


%
%----------------------- Redefine names----------------------------------
\renewcommand\contentsname{\ziju{2}目录}
\renewcommand\listfigurename{插图目录}
\renewcommand\listtablename{表格目录}
\renewcommand\indexname{索引}
\renewcommand\figurename{\rm 图}
\renewcommand\tablename{\bf 表}
\renewcommand\partname{第\ccnospace{\CS\chnno{part}\CS}部分}
\renewcommand\chaptername{第\ccnospace{\CS\chnno{chapter}\CS}章}
\renewcommand\appendixname{附录\ccnospace{\CS\chnno{chapter}}}


\newtoks\displaytitle
\def\fenleihao#1{\def\@fenleihao{#1}}
%\newtoks\fenleihao      %中图分类号
\newtoks\bianhao         %学校编号
\newtoks\UDC             %《国际十进制分类法UDC》的类号
\newtoks\miji            %密级
\newtoks\lunwenleixing   %①______学硕士学位论文；
                         %②同等学力申请______学硕士学位论文；
                         %③工程硕士学位论文；
                         %④______学博士学位论文；
                         %⑤同等学力申请______学博士学位论文
%\newtoks\xueweileixing  %硕士；博士
\newtoks\zuozheleixing   %博士生，硕士生，申请人
\newtoks\zhuanye         %学科专业
\newtoks\fangxiang       %研究方向
\newtoks\jiaoshi         %指导教师姓名与职称




%===============================================页眉设置=====================================================%
\pagestyle{empty}
\def\ps@headings{%
%    \def\@evenhead{\pushziti{\zihao{5}\songti
%      \vbox{\hbox to\textwidth{\hfil {武\ 汉\  大\ 学\  硕\ 士\  学\ 位\ 论\ 文} \hfil}
%      \protect\vspace{2truemm}\relax
%      \hrule depth0pt height0.4truemm width\textwidth
%       \protect\vspace{0.4truemm}\relax
%      %\hrule depth0pt height0.4truemm width\textwidth
%    }}\popziti}
%    \def\@oddhead{\pushziti{\zihao{5}\songti
%      \vbox{\hbox to\textwidth{\hfil {武\ 汉\  大\ 学\  硕\ 士\  学\ 位\ 论\ 文} \hfil}
%      \protect\vspace{2truemm}\relax
%      \hrule depth0pt height0.4truemm width\textwidth
%      \protect\vspace{0.4truemm}\relax
%      %\hrule depth0pt height0.4truemm width\textwidth
%    }}\popziti}
     \def\@oddfoot{\pushziti{\zihao{5}\songti
      \vbox{\hbox to\textwidth{\hfil 第~\thepage~页\hfil}
        \protect\vspace{0.8em}\relax
        %\hrule depth0pt height0.4truemm width\textwidth
    }}\popziti}%
    \def\@evenfoot{\pushziti{\zihao{5}\songti
      \vbox{\hbox to\textwidth{\hfil 第~\thepage~页\hfil}
        \protect\vspace{0.8em}\relax
       % \hrule depth0pt height0.4truemm width\textwidth
    }}\popziti}%

    \let\@mkboth\@gobbletwo
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
%%========================================封面================================================================
\def\maketitle{%
  \null
  \thispagestyle{empty}%
  %\vspace*{-2cm}
  \begin{center}\leavevmode
    {\fangsong \zihao{4}%
    \begin{tabular}{lp{2cm}p{5cm}lp{2cm}l}
      \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{分\ 类\ 号}} & {}\hfill\raisebox{-0.5ex}[0pt]{\@fenleihao}\hfill{} &  & \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{密\ 级}} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\miji}\hfill{} & \\ \cline{2-2}\cline{5-5}
      \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{U\ D\ C} } & {}\hfill\raisebox{-0.5ex}[0pt]{\the\UDC}\hfill{}      &  & \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{编\ 号}} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\bianhao}\hfill{}   & \\ \cline{2-2}\cline{5-5}
    \end{tabular}
    }
    \par
    \vspace*{2.1cm} %插入空白
    {\songti \zihao{2} \makebox[6cm][s]{武汉大学}\\[3mm] \makebox[9.5cm][s]{\ifPhD 博士\else 硕士\fi 学位论文}}\\
    \vspace{2.6cm}
    {\kaishu \zihao{1} \@title \par}%
%    \vspace{4cm}
     \vfill\vfill\vfill
    {\songti\zihao{4}
    \begin{tabular}{cp{5.5cm}c}
      \raisebox{-3ex}[0pt]{\makebox[4.5cm][s]{研\hfill 究\hfill 生\hfill 姓\hfill 名：}} & {\songti {}\raisebox{-3ex}[0pt]{\@author}\hfill{}} & \\[3ex]  %\cline{2-2}
      \raisebox{-3ex}[0pt]{\makebox[4.5cm][s]{指\hfill 导\hfill 教\hfill 师\hfill 姓\hfill 名、\hfill 职\hfill 称：}} & {\songti {}\raisebox{-3ex}[0pt]{\the\jiaoshi}\hfill{}} & \\[3ex] % \cline{2-2}
      \raisebox{-3ex}[0pt]{\makebox[4.5cm][s]{学\hfill 科\hfill 专\hfill 业\hfill 名\hfill 称：}} & {\songti {}\raisebox{-3ex}[0pt]{\the\zhuanye}\hfill{}} & \\[3ex] %\cline{2-2}
      \raisebox{-3ex}[0pt]{\makebox[4.5cm][s]{研\hfill 究\hfill 方\hfill 向：}} & {\songti{}\raisebox{-3ex}[0pt]{\the\fangxiang}\hfill{}} & \\[3ex]  %\cline{2-2}
     \end{tabular}
    }
    \par
    \vspace{2.6cm}
    {
%    {\heiti \zihao{3} \the\year~年 ~\the\month~月 ~\the\day~日 \par}%
    {\heiti \zihao{3} \@date \par}%
    }
    %\vspace*{-0.7cm}
  \end{center}%
  \null
  \cleardoublepage
  %\input{declaration}
  }
%%%=======================================================================================================
\def\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\thispagestyle{headings}%
        \contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }


%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{摘要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{\pushziti {\heiti\zihao{-4}\cnkeywordsname：}#1\popziti}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{\pushziti {\bfseries\zihao{-4}\enkeywordsname：}#1\popziti}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{\pushziti
    \newpage
    \chapter[\cnabstractname]{\ziju{2}{\cnabstractname}}   %%%终于解决了书签乱码的问题 2005-04-12.huangzh
    \fangsong\zihao{-4}
    \@afterheading}
    {\par\popziti}

\newenvironment{enabstract}{\pushziti
    \newpage
    \chapter{\enabstractname}
    \songti\zihao{-4}
    \@afterheading}
    {\par\popziti}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define part
\def\@part[#1]#2{%
    \thispagestyle{empty}%                       !!!
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
%org  \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
      \addcontentsline{toc}{part}{\partname\hspace{1em}#1}%   !!!
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
%org   \huge\bfseries \partname~\thepart
       \Huge\bfseries \partname%         !!!
       \par
       \vskip 20\p@
     \fi
     \Huge\bfseries #2\par}%
    \@endpart}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
%                    \thispagestyle{plain}%
                    \thispagestyle{headings}%     %    mzy
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

% Define chapter
\def\@chapter[#1]#2{%
                    \ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp \space \thechapter.}%
                         \addcontentsline{toc}{chapter}%
%org                               {\protect\numberline{\thechapter}#1}%
                                   {\protect\numberline{\chaptername}#1}%  !!!
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@chapapp{Chapter}%                   !!!
\def\@makechapterhead#1{%
%org  \vspace*{50\p@}%
%org  {\parindent \z@ \raggedright \normalfont
%org    \ifnum \c@secnumdepth >\m@ne
%org      \if@mainmatter
%org        \huge\bfseries \@chapapp\space \thechapter
%org        \par\nobreak
%org        \vskip 20\p@
%org      \fi
%org    \fi
%org    \interlinepenalty\@M
%org    \Huge \bfseries #1\par\nobreak
%org    \vskip 40\p@
  \vspace*{-\headsep}\vspace*{-\headheight}\vspace*{15\p@}%      !!!
  { \normalfont \centering%                                      !!!
    \ifnum \c@secnumdepth >\m@ne%                                !!!
      \if@mainmatter%                                            !!!
        \Large\bfseries \chaptername \quad #1 \par\nobreak%      !!!
      \else%                                                     !!!
        \Large\bfseries #1 \par\nobreak%                         !!!
      \fi%                                                       !!!
    \fi%                                                         !!!
    \vskip 15\p@%                                                !!!
  }}
\def\@makeschapterhead#1{%
%org  \vspace*{50\p@}%
%org  {\parindent \z@ \raggedright
%org    \normalfont
%org    \interlinepenalty\@M
%org    \Huge \bfseries  #1\par\nobreak
%org    \vskip 40\p@
  \vspace*{-\headsep}\vspace*{-\headheight}\vspace*{15\p@}%   !!!
  {\normalfont \centering%                                    !!!
    \interlinepenalty\@M%                                     !!!
    \Large \bfseries  #1\par\nobreak%                         !!!
    \vskip 15\p@%                                             !!!
  }}

% Change definition of section
\renewcommand\section{\@startsection
            {section}{2}{\z@}%   {name}{depth}{}
                {3.5ex \@plus 1ex \@minus .2ex}% positive->leave parindent
                {2.3ex \@plus.2ex}%
                {\reset@font\fontsize{13.75pt}{\baselineskip}\selectfont\bfseries\sectionformat}}
\newcommand\sectionname{\S\,\thechapter.\arabic{section}}
\newcommand\sectionformat{\centering}

% Change definition of \subsection
\renewcommand\subsection{\@startsection
            {subsection}{3}{\z@}%   {name}{depth}{}
                {1.75ex \@plus 0.5ex \@minus .1ex}% positive->leave parindent
                {1.15ex \@plus.1ex}%
                {\reset@font\normalsize\bfseries\subsectionformat}}
\newcommand\subsectionname{\thechapter.\arabic{section}.\arabic{subsection}}
\newcommand\subsectionformat{}

% Change definition of \subsubsection
\renewcommand\subsubsection{\@startsection
            {subsubsection}{4}{\z@}%   {name}{depth}{}
                {1.75ex \@plus 0.5ex \@minus .1ex}% positive->leave parindent
                {1.15ex \@plus.1ex}%
                {\reset@font\normalsize\bfseries\subsubsectionformat}}
\newcommand\subsubsectionname{\S\thechapter.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
\newcommand\subsubsectionformat{}

% Set maxi. depth of numbered sections to 4 (\subsubsection).
\setcounter{secnumdepth}{4}

%
% Change definition of \appendix
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand\@chapapp{Appendix}
  \renewcommand\thechapter{\Alph{chapter}}%
  \renewcommand\chaptername{\appendixname}}%

%----------------------- Bibliography -------------------------------
\renewcommand\bibname{参考文献}
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
%%%%%-----------索引( multicols 形式)----------
  \usepackage{makeidx}
  \newcommand{\URL}[1]{\href{#1}{\texttt{\itshape #1\/}}}
  \usepackage{multicol}
  \makeatletter
  \renewenvironment{theindex}
               {\let\chapternamesave\chaptername
        \renewcommand{\chaptername}{\hskip-1em}%
        \def\chaptername{}\chapter[\indexname]{\ziju{2}\indexname} % 2005-06-15 huangzh
        %\addcontentsline{toc}{chapter}{\indexname}%   !!!
        \begin{multicols}{2}%[\chapter{\indexname}\vspace*{1cm}]
        \leftskip=2cm
                \markboth{\indexname}{\indexname}%
                \thispagestyle{plain}\parindent 0pt
                \parskip0pt plus .3pt\relax
                \let\item\@idxitem}
               {\end{multicols}\let\chaptername\chapternamesave}
  \makeatother      
%%------------------------常用宏包-----------------------------------
\RequirePackage{amsmath,amssymb}
\RequirePackage[amsmath,thmmarks]{ntheorem}% AMSLaTeX宏包.
\RequirePackage{color,xcolor}                  %支持彩色
\RequirePackage{mathrsfs}   % 不同于\mathcal or \mathfrak 之类的英文花体字体

%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
\theoremseparator{\hspace{1em}} \theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}
\newtheorem{remark}{\hspace{2em}注}

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\blacksquare$}
\newtheorem{proof}{\hspace{2em}证明}

%----------------------- Publications -------------------------------
\newenvironment{publications}[1]
  {\renewcommand\bibname{发表文章目录}\begin{thebibliography}{#1}}
  {\end{thebibliography}}

%----------------------- Acknowledgement ----------------------------
\newcommand\acknowledgement{\backmatter\chapter[致谢]{\ziju{2}致谢}}

\endlinechar `\^^M
\endinput
