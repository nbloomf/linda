#!/bin/bash

cat | \
  # All text lowercase
  tr 'A-Z' 'a-z' | #

  # Comments
  sed 's/%.*$//' | #

  # LaTeX commands
  sed 's/^\\documentclass{[^}]*}$//g' |               #
  sed 's/\\setlength{[^}]*}{[^}]*}//g' |              #
  sed 's/\\vspace{[a-z0-9.]*}//g' |                   #
  sed 's/\\addtolength{[^}]*}{[^}]*}//g' |            #
  sed 's/\\includegraphics{[^}]*}//g' |               #
  sed 's/\\includegraphics\[[^]]*\]{[^}]*}//g' |      #
  sed 's/\\addcontentsline{[^}]*}{[^}]*}{[^}]*}//g' | #
  sed 's/\\setcounter{.*//' |                         #
  sed 's/\\newpage//' |                               #
  sed 's/\\quad//g' |                                 #
  sed 's/\\qedhere//g' |                              #
  sed 's/\\medskip//g' |                              #
  sed 's/\\noindent//g' |                             #
  sed 's/\\maketitle//g' |                            #
  sed 's/\\small//g' |                                #
  sed 's/\\large//g' |                                #
  sed 's/\\mbox{}//' |                                #
  sed 's/\\frontmatter//' |                           #
  sed 's/\\mainmatter//' |                            #
  sed 's/\\backmatter//' |                            #
  sed 's/\\printindex//' |                            #
  sed 's/\\appendix//' |                              #
  sed 's/^\\item\[[^]]*\]/\\item /' |                 #
  sed 's/\\item//' |                                  #
  sed 's/\\phantomsection//' |                        #
  sed 's/\\tableofcontents//' |                       #
  sed 's/\\makeindex//' |                             #
  sed 's/^\\begin{center}$//' |                       #
  sed 's/^\\end{center}$//' |                         #
  sed 's/^\\begin{titlingpage}$//' |                  #
  sed 's/^\\end{titlingpage}$//' |                    #
  sed 's/^\\begin{enumerate}$//' |                    #
  sed 's/^\\end{enumerate}$//' |                      #
  sed 's/^\\begin{itemize}$//' |                      #
  sed 's/^\\end{itemize}$//' |                        #
  sed 's/^\\begin{proof}$//' |                        #
  sed 's/^\\end{proof}$//' |                          #
  sed 's/^\\begin{document}$//' |                     #
  sed 's/^\\end{document}$//' |                       #
  sed 's/^\\begin{minipage}{[^}]*}$//' |              #
  sed 's/^\\end{minipage}$//' |                       #
  sed 's/\\input{[a-z0-9:\./\-]*}//g' |               #

  # Remove non-textual environments
  sed '/^\\begin{eqnarray\*}$/,/^\\end{eqnarray\*}$/{//!d}' | # eqnarray
  sed '/^\\begin{eqnarray\*}$/d' |                            #
  sed '/^\\end{eqnarray\*}$/d' |                              #
  sed 's/^\\begin{tabular}{[^}]*}$/\\begin{tabular}/' | # tabular
  sed '/^\\begin{tabular}$/,/^\\end{tabular}$/{//!d}' | #
  sed '/^\\begin{tabular}$/d' |                         #
  sed '/^\\end{tabular}$/d' |                           #
  sed 's/^\\begin{figure}\[[^]]*\]$/\\begin{figure}/' | # figure
  sed '/^\\begin{figure}$/d' |                          #
  sed '/^\\end{figure}$/d' |                            #
  sed 's/^\\begin{tikzpicture}\[[^]]*\]$/\\begin{tikzpicture}/' | # tikzpicture
  sed '/^\\begin{tikzpicture}$/,/^\\end{tikzpicture}$/{//!d}' |   #
  sed '/^\\begin{tikzpicture}$/d' |                               #
  sed '/^\\end{tikzpicture}$/d' |                                 #
  sed '/^\\begin{tikzcd}$/,/^\\end{tikzcd}$/{//!d}' | # tikzcd
  sed '/^\\begin{tikzcd}$/d' |                        #
  sed '/^\\end{tikzcd}$/d' |                          #

  # Remove cites, labels, & refs
  sed 's/\\cite{[a-z0-9:\-]*}//g' |               #
  sed 's/\\label{[a-z0-9:\-]*}//g' |              #
  sed 's/\\ref{[a-z0-9:\-]*}//g' |                #
  sed 's/\\eref{[a-z0-9:\-]*}//g' |               #
  sed 's/\\propref{[a-z0-9:\-]*}//g' |            #
  sed 's/\\paref{[a-z0-9:\-]*}//g' |              #
  sed 's/\\autoref{[a-z0-9:\-]*}//g' |            #
  sed "s/\\\\sref{[a-z0-9:-]*}{[a-z0-9:-]*}//g" | #

  # Remove math
  sed -e 's/\\(\([^\\]\|\\[^)]\)*\\)//g' |   #
  sed -e 's/\\\[\([^\\]\|\\[^]]\)*\\\]//g' | #

  # Deformat text
  sed 's/\\chapter{\([^}]*\)}/ \1 /g' |      #
  sed 's/\\section{\([^}]*\)}/ \1 /g' |      #
  sed 's/\\subsection{\([^}]*\)}/ \1 /g' |   #
  sed 's/\\chapter\*{\([^}]*\)}/ \1 /g' |    #
  sed 's/\\section\*{\([^}]*\)}/ \1 /g' |    #
  sed 's/\\subsection\*{\([^}]*\)}/ \1 /g' | #
  sed 's/\\textbf{\([^}]*\)}/ \1 /g' |       #
  sed 's/\\text{\([^}]*\)}/ \1 /g' |         #
  sed 's/\\emph{\([^}]*\)}/ \1 /g' |         #
  sed 's/\\title{\([^}]*\)}/ \1 /g' |        #
  sed 's/\\author{\([^}]*\)}/ \1 /g' |       #
  sed 's/\\center{\([^}]*\)}/ \1 /g' |       #
  sed 's/\\index{\([^}]*\)}/ \1 /g' |        #
  sed 's/\\caption{\([^}]*\)}/ \1 /g' |      #

  # Custom commands
  sed 's/^\\exercises$//' |              #
  sed 's/^\\begin{titlebox}{[^}]*}$//' | #
  sed 's/^\\end{titlebox}$//' |          #

  # Theorem-like environments
  sed 's/^\\begin{dfn}\[\([^]]*\)\]/ \1 /g' |       #
  sed 's/^\\begin{dfn}//g' |                        #
  sed 's/^\\end{dfn}$//' |                          #
  sed 's/^\\begin{thm}\[\([^]]*\)\]/ \1 /g' |       #
  sed 's/^\\begin{thm}//g' |                        #
  sed 's/^\\end{thm}$//' |                          #
  sed 's/^\\begin{lem}\[\([^]]*\)\]/ \1 /g' |       #
  sed 's/^\\begin{lem}//g' |                        #
  sed 's/^\\end{lem}$//' |                          #
  sed 's/^\\begin{axiom}\[\([^]]*\)\]/ \1 /g' |     #
  sed 's/^\\begin{axiom}//g' |                      #
  sed 's/^\\end{axiom}$//' |                        #
  sed 's/^\\begin{construct}\[\([^]]*\)\]/ \1 /g' | #
  sed 's/^\\begin{construct}//g' |                  #
  sed 's/^\\end{construct}$//' |                    #
  sed 's/^\\begin{prop}\[\([^]]*\)\]/ \1 /g' |      #
  sed 's/^\\begin{prop}//g' |                       #
  sed 's/^\\end{prop}$//' |                         #
  sed 's/^\\begin{exercise}\[\([^]]*\)\]/ \1 /g' |  #
  sed 's/^\\begin{exercise}//g' |                   #
  sed 's/^\\end{exercise}$//' |                     #
  sed 's/^\\begin{cor}\[\([^]]*\)\]/ \1 /g' |       #
  sed 's/^\\begin{cor}$//g' |                       #
  sed 's/^\\end{cor}$//' |                          #
  sed 's/^\\begin{framed}\[\([^]]*\)\]/ \1 /g' |    #
  sed 's/^\\begin{framed}//g' |                     #
  sed 's/^\\end{framed}$//' |                       #

  # List-like environments
  sed '/^\\begin{proplist}$/d' |         #
  sed '/^\\end{proplist}$/d' |           #
  sed '/^\\begin{inductionproof}$/d' |   #
  sed '/^\\end{inductionproof}$/d' |     #
  sed '/^\\begin{inlineproplist}$/d' |   #
  sed '/^\\end{inlineproplist}$/d' |     #
  sed '/^\\begin{inlinecaselist}$/d' |   #
  sed '/^\\end{inlinecaselist}$/d' |     #
  sed '/^\\begin{proplist\*}$/d' |       #
  sed '/^\\end{proplist\*}$/d' |         #
  sed '/^\\begin{examples}$/d' |         #
  sed '/^\\end{examples}$/d' |           #

  # Punctuation
  tr '!.?,:;()' ' ' | #
  sed 's/--//g' |     #
  sed "s/''//g" |     #
  sed "s/\`\`//g" |   #

  # Split & sort words
  tr -s '[[:space:]]' '\n' | #
  sort -d |                  #
  uniq |                     #

#  sed "/%&%$/d" | \
  cat
