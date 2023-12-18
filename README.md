# OWD's University of York Mathematics Notes

This repository contains my personal collection of LaTeX-typeset notes based on
the Mathematics curriculum at the University of York. If you're looking for the
compiled PDFs, go straight to <https://www-users.york.ac.uk/~od641/l5-notes>. If
you're looking for my Level 4 examination crib sheets (which are no longer
permitted in centrally timetabled exams), head over to
<https://github.com/oliverdixon/exam-crib-sheets>.

## Module Index

 * Level 5: Metric Spaces [*In progress*]
 * Level 5: Linear Algebra [*Scheduled for Semester 2*]
 * Level 5: Groups, Rings, and Fields [*Scheduled for Semester 2*]

## Contributing

Contact me at <od641@york.ac.uk> if you spot any errors or have comments
regarding these notes. Please be mindful that I am reading the
[MMath Mathematics and Computer Science (with a year in industry)](https://www.york.ac.uk/study/undergraduate/courses/mmath-mathematics-computer-science-year-industry/)
degree, and therefore do not study approximately half of the modules considered
"core" by the Mathematics Department.

If you would like to contribute to any or all of these notes, please feel free
to (a) send a patch to <od641@york.ac.uk>, or (b) fork the GitHub repository,
make the necessary changes in your own copy, and submit a pull request.

## Building

To configure a suitable environment, clone the repository and complete the
following set-up tasks:

 * Set-up [a post-commit/checkout
   hook](http://mirrors.ctan.org/macros/latex/contrib/gitinfo2/post-xxx-sample.txt)
in the cloned Git repository to make version-control data visible to
[gitinfo2](https://ctan.org/pkg/gitinfo2) when rendering the front covers.  This
can be done automatically by executing [setup-gitinfo.sh](/setup-gitinfo.sh) in
a Bash shell.

 * Convert the icons from SVG to PDF
   ([why?](https://maths.york.ac.uk/moodle/mod/hsuforum/discuss.php?d=7352#p18645))
by executing [icons/generate-pdfs.sh](/icons/generate-pdfs.sh) in a Bash shell.

 * Navigate into the directory containing the TeX file, and execute `latexmk -r
   ../latexmkrc`. You can omit the `-r` option on the command-line by creating a
symbolic link to the Perl configuration script from the TeX directory: `ln -s
../latexmkrc .`.

 * **(Optional)** By default, the documents will be compiled in "draft mode",
   which removes the requirement for the externally hosted cover images. To
compile a release document, issue `\draftfalse` in place of `\drafttrue` in the
preamble of the relevant TeX file, download the appropriate cover image from
[the assets folder](https://www-users.york.ac.uk/~od641/l5-notes/assets/), to be
stored as `cover.jpg` in the same folder as the TeX file, and compile as usual.

 * **(Optional)** PDF compression under GhostScript can often yield
   significantly smaller (albeit visually identical) output files; this is
principally achieved through compression of the embedded vector typefaces
(portability doesn't come for free!). Try `gs -sDEVICE=pdfwrite -dNOPAUSE
-dQUIET -dBATCH -sOutputFile=out.pdf in.pdf` to produce `out.pdf` from `in.pdf`.

