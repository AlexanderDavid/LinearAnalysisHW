(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "fleqn" "leqno" "letterpaper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "textwidth=7in" "textheight=11in")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "lmodern"
    "relsize"
    "geometry"
    "amsmath"
    "amsthm"
    "amssymb"
    "mathtools"
    "mathrsfs"
    "graphicx"
    "adjustbox")
   (TeX-add-symbols
    '("norm" 1)))
 :latex)

