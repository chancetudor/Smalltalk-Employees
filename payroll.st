| line parts empColl |
empColl := OrderedCollection new.
fs := FileStream open: Smalltalk arguments first mode: FileStream read.
	"TODO: add exception handling"
	"on: Exception
	do: [
		e := Exception new.
		e messageText: 'Unable to open ', fileName asString, ' for reading'.
		e signal.
	]"
"iterate through file and grab contents"
[fs atEnd] whileFalse: [
	line := fs upTo: Character nl.
	parts := line substrings. "parts: ordColl with parsed contents of line"
	Transcript show: parts printString, ' '. "TODO: remove line"
	"TODO: CALL SUBCLASSES' METHODS (CTRL + SHIFT + T FOR TODOS)"
	(parts includes: 'salaried')
		ifTrue: [
			'SALARIED' printNl. "TODO: remove line"
			Salaried := SalariedEmployee new.
			Salaried setFirstName: (parts at: 2).
			Salaried setLastName: (parts at: 3).
			Salaried setEarning: (parts at: 4).
			empColl add: Salaried.
		].
	(parts includes: 'hourly')
		ifTrue: [
			'HOURLY' printNl

		].
	(parts includes: 'commission')
		ifTrue: [
			'COMMISSION' printNl

		].
].

empColl printNl.
"iterates through parts array"
"parts do: [ :parts | Transcript show: parts printString; cr ]."
