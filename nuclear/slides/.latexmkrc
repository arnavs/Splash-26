# Build from slides/ by running `latexmk` with no arguments.
#   template:  assets/template.tex
#   content:   actual-content.tex  (found in the current directory)
#   output:    output/X16580-26.pdf
@default_files = ('assets/template.tex');
$pdf_mode = 4;               # lualatex
$out_dir  = 'output';
$jobname  = 'X16580-26';
# Let \input / \includegraphics / \IfFileExists find files in assets/
# (logo, comics, setup-*.tex) without path prefixes.
ensure_path('TEXINPUTS', './assets//');
# Don't stop at TeX's interactive "?" prompt; fail fast and point at file:line.
$lualatex = 'lualatex -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
