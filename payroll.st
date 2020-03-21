fs := FileStream open: Smalltalk arguments first mode: FileStream read.
[fs atEnd] whileFalse: [
  | line |
  line := fs upTo: Character cr.
  Transcript show: line.
].
