#!/bin/bash

cat | \
  sed "/%&%$/d" | \
  sed "s/%.*$//" | \
  tr "A-Z" "a-z" | \
  sed "s/\\\\ref{[a-z0-9:\-]*}//g" | \
  sed "s/\\\\eref{[a-z0-9:\-]*}//g" | \
  sed "s/\\\\propref{[a-z0-9:\-]*}//g" | \
  sed "s/\\\\paref{[a-z0-9:\-]*}//g" | \
  sed "s/\\\\autoref{[a-z0-9:\-]*}//g" | \
  sed "s/\\\\sref{[a-z0-9:-]*}{[a-z0-9:-]*}//g" | \
  sed "s/\\\\label{[a-z0-9:\-]*}//g" | \
  sed -e "s/\\\\(\([^\\\\]\|\\\\[^)]\)*\\\\)//g" | \
  sed -e "s/\\\\\[\([^\\\\]\|\\\\[^]]\)*\\\\\]//g" | \
  sed "s/^\\\\item\[[^]]*\]/\\\\item/g" | \
  sed "s/\\\\textbf{\([^}]*\)}/\1/g" | \
  sed "s/\\\\emph{\([^}]*\)}/\1/g" | \
  sed "s/\\\\chapter{\([^}]*\)}/\1/g" | \
  sed "s/\\\\section{\([^}]*\)}/\1/g" | \
  sed "s/\\\\index{\([^}]*\)}/\1/g" | \
  sed "s/^\\\\begin{dfn}\[\([^]]*\)\]/\1/g" | \
  sed "s/^\\\\begin{dfn}//g" | \
  sed "s/^\\\\end{dfn}//g" | \
  sed "s/^\\\\begin{axiom}\[\([^]]*\)\]/\1/g" | \
  sed "s/^\\\\begin{axiom}//g" | \
  sed "s/^\\\\end{axiom}//g" | \
  sed "s/^\\\\begin{cor}\[\([^]]*\)\]/\1/g" | \
  sed "s/^\\\\begin{cor}//g" | \
  sed "s/^\\\\end{cor}//g" | \
  sed "s/^\\\\begin{prop}\[\([^]]*\)\]/\1/g" | \
  sed "s/^\\\\begin{prop}//g" | \
  sed "s/^\\\\end{prop}//g" | \
  sed "s/^\\\\begin{exercise}\[\([^]]*\)\]/\1/g" | \
  sed "s/^\\\\begin{exercise}//g" | \
  sed "s/^\\\\end{exercise}//g" | \
  sed "/^\\\\begin{proof}$/d" | \
  sed "/^\\\\end{proof}$/d" | \
  sed "/^\\\\newcommand/d" | \
  sed "s/\\\\newpage//g" | \
  sed "/^\\\\renewcommand/d" | \
  sed "/^\\\\counterwithout/d" | \
  sed "/^\\\\usepackage/d" | \
  sed "/\\\\usetikzlibrary/d" | \
  sed "/\\\\hypersetup/d" | \
  sed "/^\\\\begin{eqnarray\*}/,/^\\\\end{eqnarray\*}/{//!d}" | \
  sed "s/^\\\\begin{eqnarray\*}//g" | \
  sed "s/^\\\\end{eqnarray\*}//g" | \
  sed "/^\\\\begin{tabular}/,/^\\\\end{tabular}/{//!d}" | \
  sed "/^\\\\begin{tabular}/d" | \
  sed "s/^\\\\end{tabular}//g" | \
  sed "/^\\\\begin{tikzpicture}/,/^\\\\end{tikzpicture}/{//!d}" | \
  sed "/^\\\\begin{tikzpicture}/d" | \
  sed "s/^\\\\end{tikzpicture}//g" | \
  sed "/^\\\\begin{tikzcd}/,/^\\\\end{tikzcd}/{//!d}" | \
  sed "/^\\\\begin{tikzcd}/d" | \
  sed "s/^\\\\end{tikzcd}//g" | \
  sed "/^\\\\exercises$/d" | \
  sed "/^\\\\begin{examples}$/d" | \
  sed "/^\\\\end{examples}$/d" | \
  sed "/^\\\\begin{proplist}$/d" | \
  sed "/^\\\\end{proplist}$/d" | \
  sed "/^\\\\begin{proplist\*}$/d" | \
  sed "/^\\\\end{proplist\*}$/d" | \
  sed "/^\\\\begin{inlineproplist}$/d" | \
  sed "/^\\\\end{inlineproplist}$/d" | \
  sed "s/^\\\\item//" | \
  sed "/^\\\\begin{center}$/d" | \
  sed "/^\\\\end{center}$/d" | \
  sed "s/\\\\caption{\([^}]*\)}/\1/g" | \
  sed "/^\\\\begin{figure}/d" | \
  sed "/^\\\\end{figure}$/d" | \
  sed "s/--//g" | \
  sed "s/''//g" | \
  sed "s/\`\`//g" | \
  tr -s "().:;!?,[[:space:]]" "\n" | \
  sort -d | uniq
