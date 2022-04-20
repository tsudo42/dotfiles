#!/usr/bin/env perl

# defaults
@default_files = ('demo.tex');

# LaTeX
$latex = 'uplatex %O -synctex=1 -interaction=nonstopmode -halt-on-error %S';
$pdflatex = 'pdflatex %O -synctex=1 -interaction=nonstopmode -halt-on-error %S';
$lualatex = 'lualatex %O -synctex=1 -interaction=nonstopmode -halt-on-error %S';
$xelatex = 'xelatex %O -synctex=1 -interaction=nonstopmode -halt-on-error %S';

# BibTeX
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'upbibtex %O %B';

# index
$makeindex = 'upmendex %O -o %D %S';

# DVI / PDF
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf = 'ps2pdf %O %S %D';
$pdf_mode = 3;

# preview
if ($^O eq 'darwin') {
    $pvc_view_file_via_temporary = 0;
    $pdf_previewer = 'open';
} else {
    $pdf_previewer = 'xdg-open';
}

