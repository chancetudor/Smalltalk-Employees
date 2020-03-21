[ self thrower ] on: Exception do: [ :e |
    Transcript show: e messageText
  ]

fs := FileStream open: Smalltalk arguments first mode: FileStream read.
[fs atEnd] whileFalse: [
  | line |
  line := fs upTo: Character cr.
  Transcript show: line.
].
"TODO: PARSE FILE, CALL SUBCLASSES' METHODS
	CTRL + SHIFT + T FOR TODOS"
