(eval-when-compile (require 'cl))
(require 'dict-tree)
(defvar dict-latex-env nil "Dictionary dict-latex-env.")
(setq dict-latex-env '[cl-struct-dictree- "dict-latex-env" "latex/dict-latex-env" t nil < + (lambda (new old) (dictree--cell-set-data old (+ (dictree--cell-data new) (dictree--cell-data old))) old) predictive-dict-rank-function (lambda (a b) (predictive-dict-rank-function (cons (car a) (dictree--cell-data (cdr a))) (cons (car b) (dictree--cell-data (cdr b))))) time synchronize nil nil nil nil nil 0.1 nil nil nil 0.1 nil nil nil nil nil nil [cl-struct-trie- [nil [cl-struct-avl-tree- [[[[[[[[[[[[[[[[[nil nil [66 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [120 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :help #("\\begin{Bmatrix}...\\end{Bmatrix}  Matrix delimited by {...}" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 14 (face (font-lock-function-name-face)) 18 22 (face (font-lock-keyword-face font-latex-sedate-face)) 23 30 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil [86 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [120 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :help #("\\begin{Vmatrix}...\\end{Vmatrix}  Matrix delimited by ||...||" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 14 (face (font-lock-function-name-face)) 18 22 (face (font-lock-keyword-face font-latex-sedate-face)) 23 30 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil [97 [cl-struct-avl-tree- [[[nil nil [98 [cl-struct-avl-tree- [[nil nil [115 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [99 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [nil nil [114 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [121 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [108 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [103 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[[[nil nil [--trie--terminator (0 :help #("\\begin{align}...\\end{align}  Aligned equation group" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 12 (face (font-lock-function-name-face)) 17 20 (face (font-lock-keyword-face font-latex-sedate-face)) 21 26 (face (font-lock-function-name-face))))] 0] nil [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("align") :help #("\\begin{align*}...\\end{align*}  Unnumbered aligned equation group" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 13 (face (font-lock-function-name-face)) 18 21 (face (font-lock-keyword-face font-latex-sedate-face)) 22 28 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] [nil nil [101 [cl-struct-avl-tree- [[nil nil [100 [cl-struct-avl-tree- [[nil [nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("align" "aligned") :help #("\\begin{alignedat}{<#cols>}...\\end{alignedat}  Aligned equation building block with explicit column spacing" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 16 (face (font-lock-function-name-face)) 18 25 (face (font-lock-variable-name-face)) 29 33 (face (font-lock-keyword-face font-latex-sedate-face)) 34 43 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [--trie--terminator (0 :prefixes ("align") :help #("\\begin{aligned}...\\end{aligned}  Aligned equation building block" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 14 (face (font-lock-function-name-face)) 18 22 (face (font-lock-keyword-face font-latex-sedate-face)) 23 30 (face (font-lock-function-name-face))))] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil [nil nil [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("align" "alignat") :help #("\\begin{alignat*}{<#cols>}...\\end{alignat*}  Unnumbered aligned equation group with explicit column spacing" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 15 (face (font-lock-function-name-face)) 17 24 (face (font-lock-variable-name-face)) 28 31 (face (font-lock-keyword-face font-latex-sedate-face)) 32 40 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] [--trie--terminator (0 :prefixes ("align") :help #("\\begin{alignat}{<#cols>}...\\end{alignat}  Aligned equation group with explicit spacing between columns" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 14 (face (font-lock-function-name-face)) 16 23 (face (font-lock-variable-name-face)) 27 31 (face (font-lock-keyword-face font-latex-sedate-face)) 32 39 (face (font-lock-function-name-face))))] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil [98 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [120 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :help #("\\begin{bmatrix}...\\end{bmatrix}  Matrix delimited by [...]" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 14 (face (font-lock-function-name-face)) 18 22 (face (font-lock-keyword-face font-latex-sedate-face)) 23 30 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil [99 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil [100 [cl-struct-avl-tree- [[[nil nil [101 [cl-struct-avl-tree- [[nil nil [115 [cl-struct-avl-tree- [[nil nil [99 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [112 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [111 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [nil nil [111 [cl-struct-avl-tree- [[nil nil [99 [cl-struct-avl-tree- [[nil nil [117 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [105 [cl-struct-avl-tree- [[nil nil [115 [cl-struct-avl-tree- [[nil nil [112 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [121 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [104 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil [101 [cl-struct-avl-tree- [[nil [nil nil [113 [cl-struct-avl-tree- [[nil nil [117 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [111 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil [nil nil [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] [--trie--terminator (0)] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [110 [cl-struct-avl-tree- [[nil nil [117 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil [102 [cl-struct-avl-tree- [[nil [nil nil [108 [cl-struct-avl-tree- [[nil [nil nil [117 [cl-struct-avl-tree- [[nil nil [115 [cl-struct-avl-tree- [[nil nil [104 [cl-struct-avl-tree- [[nil [nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [103 [cl-struct-avl-tree- [[nil nil [104 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [108 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [102 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [97 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [103 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil [nil nil [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("flalign"))] 0] nil nil 0] nil]] 0] [--trie--terminator (0)] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] [105 [cl-struct-avl-tree- [[nil nil [103 [cl-struct-avl-tree- [[nil nil [117 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil [nil nil [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("figure"))] 0] nil nil 0] nil]] 0] [--trie--terminator (0)] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil [103 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [104 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[[nil nil [--trie--terminator (0)] 0] [nil nil [101 [cl-struct-avl-tree- [[nil nil [100 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("gather"))] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil [105 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [122 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil [108 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [115 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil [109 [cl-struct-avl-tree- [[[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [120 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :help #("\\begin{matrix}...\\end{matrix}  Matrix without delimiters" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 13 (face (font-lock-function-name-face)) 17 21 (face (font-lock-keyword-face font-latex-sedate-face)) 22 28 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [nil nil [117 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil [nil nil [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("multline"))] 0] nil nil 0] nil]] 0] [--trie--terminator (0)] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [105 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [112 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [103 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil [112 [cl-struct-avl-tree- [[nil [nil nil [109 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [120 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :help #("\\begin{pmatrix}...\\end{pmatrix}  Matrix delimited by (...)" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 14 (face (font-lock-function-name-face)) 18 22 (face (font-lock-keyword-face font-latex-sedate-face)) 23 30 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [105 [cl-struct-avl-tree- [[nil nil [99 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [117 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil [113 [cl-struct-avl-tree- [[nil nil [117 [cl-struct-avl-tree- [[nil nil [111 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil [nil nil [101 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [111 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil [115 [cl-struct-avl-tree- [[[nil nil [109 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [120 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :help #("\\begin{smallmatrix}...\\end{smallmatrix}  Matrix suitable for inline math" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 18 (face (font-lock-function-name-face)) 22 26 (face (font-lock-keyword-face font-latex-sedate-face)) 27 38 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [nil nil [117 [cl-struct-avl-tree- [[nil nil [98 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [113 [cl-struct-avl-tree- [[nil nil [117 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [111 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil nil [115 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [112 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] [nil nil [118 [cl-struct-avl-tree- [[nil [nil nil [109 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [120 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :help #("\\begin{vmatrix}...\\end{vmatrix}  Matrix delimited by |...|" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 14 (face (font-lock-function-name-face)) 18 22 (face (font-lock-keyword-face font-latex-sedate-face)) 23 30 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [101 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil [nil nil [115 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [98 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil [nil nil [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("verbatim"))] 0] nil nil 0] nil]] 0] [--trie--terminator (0)] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] [116 [cl-struct-avl-tree- [[[[nil nil [97 [cl-struct-avl-tree- [[nil nil [98 [cl-struct-avl-tree- [[[nil nil [98 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [110 [cl-struct-avl-tree- [[nil nil [103 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [nil nil [117 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil [nil nil [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("tabular") :help #("\\begin{tabular*}{<width>}[<pos>]{<cols>}...\\end{tabular*}  Fixed width tabular material" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 15 (face (font-lock-function-name-face)) 17 24 (face (font-lock-variable-name-face)) 26 31 (face (font-lock-variable-name-face)) 33 39 (face (font-lock-variable-name-face)) 43 47 (face (font-lock-keyword-face font-latex-sedate-face)) 48 56 (face (font-lock-function-name-face))))] 0] nil nil 0] nil]] 0] [--trie--terminator (0 :help #("\\begin{tabular}[<pos>]{<cols>}...\\end{tabular}  Tabular material" 0 6 (face (font-lock-keyword-face font-latex-sedate-face)) 7 14 (face (font-lock-function-name-face)) 16 21 (face (font-lock-variable-name-face)) 23 29 (face (font-lock-variable-name-face)) 33 37 (face (font-lock-keyword-face font-latex-sedate-face)) 38 45 (face (font-lock-function-name-face))))] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [108 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil [nil nil [42 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0 :prefixes ("table"))] 0] nil nil 0] nil]] 0] [--trie--terminator (0)] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil [104 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil [nil nil [111 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [109 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [98 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [98 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [111 [cl-struct-avl-tree- [[nil nil [103 [cl-struct-avl-tree- [[nil nil [114 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [112 [cl-struct-avl-tree- [[nil nil [104 [cl-struct-avl-tree- [[nil nil [121 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [nil nil [114 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [118 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [105 [cl-struct-avl-tree- [[nil nil [115 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] [105 [cl-struct-avl-tree- [[nil nil [116 [cl-struct-avl-tree- [[nil nil [108 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [112 [cl-struct-avl-tree- [[nil nil [97 [cl-struct-avl-tree- [[nil nil [103 [cl-struct-avl-tree- [[nil nil [101 [cl-struct-avl-tree- [[nil nil [--trie--terminator (0)] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 0] nil nil 0] nil]] 1] nil nil 0] nil]] 1] nil nil 0] (lambda (a b) (setq a (trie--node-split a) b (trie--node-split b)) (cond ((eq a trie--terminator) (if (eq b trie--terminator) nil t)) ((eq b trie--terminator) nil) (t (< a b))))]] < (lambda (a b) (setq a (trie--node-split a) b (trie--node-split b)) (cond ((eq a trie--terminator) (if (eq b trie--terminator) nil t)) ((eq b trie--terminator) nil) (t (< a b)))) #[(cmpfun seq) "\301!\207" [cmpfun avl-tree-create] 2] avl-tree-enter avl-tree-delete avl-tree-member avl-tree-mapc avl-tree-empty avl-tree-stack avl-tree-stack-pop avl-tree-stack-empty-p trie--avl-transform-for-print trie--avl-transform-from-read t] nil])
(trie-transform-from-read (dictree--trie dict-latex-env))
(let ((cache (make-hash-table :test 'equal))
      (trie (dictree--trie dict-latex-env)))
  (mapc
   (lambda (entry)
     (puthash
      (car entry)
      (dictree--cache-create
       (mapcar
        (lambda (key)
          (cons key
                (trie-member
                 trie (if (stringp key) key (car key)))))
        (dictree--cache-results (cdr entry)))
       (dictree--cache-maxnum (cdr entry)))
      cache))
   (dictree--complete-ranked-cache dict-latex-env))
  (setf (dictree--complete-ranked-cache dict-latex-env)
        cache))
(let ((cache (make-hash-table :test 'equal))
      (trie (dictree--trie dict-latex-env)))
  (mapc
   (lambda (entry)
     (puthash
      (car entry)
      (dictree--cache-create
       (mapcar
        (lambda (key)
          (cons key
                (trie-member
                 trie (if (stringp key) key (car key)))))
        (dictree--cache-results (cdr entry)))
       (dictree--cache-maxnum (cdr entry)))
      cache))
   (dictree--regexp-ranked-cache dict-latex-env))
  (setf (dictree--regexp-ranked-cache dict-latex-env)
        cache))
(unless (memq dict-latex-env dictree-loaded-list)
  (push dict-latex-env dictree-loaded-list))
