| fileName |
fileName := Smalltalk arguments first.
"TODO: add exception handling"
(fs := FileStream open: Smalltalk arguments first mode: FileStream read) on: Exception do:
	[
		e := Exception new.
		e messageText: 'Unable to open ', fileName asString, ' for reading'.
		e signal.
	]
[fs atEnd] whileFalse: [
  | line |
  line := fs upTo: Character cr.
  Transcript show: line.
].
"TODO: PARSE FILE, CALL SUBCLASSES' METHODS
	CTRL + SHIFT + T FOR TODOS"
