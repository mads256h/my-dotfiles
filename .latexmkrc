$latex = "latex %O --shell-escape %S";
$pdflatex = "pdflatex %O --shell-escape %S";


$latex = "$latex ; python /usr/share/texmf/tex/latex/sagetex/run-sagetex-if-necessary.py %B";
$pdflatex = "$pdflatex ; python /usr/share/texmf/tex/latex/sagetex/run-sagetex-if-necessary.py %B";

$pdf_mode = 1;
