$pdf_mode = 1;
$pdflatex = "pdflatex --shell-escape %O %S";
$bibtex_use = 2;

push @generated_exts, "auxlock", "run.xml";
$clean_full_ext = "pgf-cache/%R-*";

