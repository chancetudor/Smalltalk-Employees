| fs line parts empColl action op thresh |
empColl := OrderedCollection new.
action := Smalltalk arguments second.
"op := Smalltalk arguments third.
thresh := Smalltalk arguments fourth."
fs := FileStream open: Smalltalk arguments first mode: FileStream read.
	"TODO: add exception handling"
	"on: Exception
	do: [
		e := Exception new.
		e messageText: 'Unable to open ', fileName asString, ' for reading'.
		e signal.
	]"
	"TODO: print usage message if # args incorrect"
[fs atEnd] whileFalse: [
	line := fs upTo: Character nl.
	parts := line substrings. "parts: OrderedCollection with parsed contents of line"
	(parts includes: 'salaried')
		ifTrue: [
			Salaried := SalariedEmployee new.
			Salaried setFirstName: (parts at: 2).
			Salaried setLastName: (parts at: 3).
			Salaried setEarning: (parts at: 4).
			empColl add: Salaried.
		].
	(parts includes: 'hourly')
		ifTrue: [
			Hourly := HourlyEmployee new.
			Hourly setFirstName: (parts at: 2).
			Hourly setLastName: (parts at: 3).
			Hourly setHours: (parts at: 4).
			Hourly setRate: (parts at: 5).
			empColl add: Hourly.
		].
	(parts includes: 'commission')
		ifTrue: [
			Commission := CommissionEmployee new.
			Commission setFirstName: (parts at: 2).
			Commission setLastName: (parts at: 3).
			Commission setMinSal: (parts at: 4).
			Commission setSales: (parts at: 5).
			Commission setRate: (parts at: 6).
			empColl add: Commission.
		].
].

(action = 'count')
	ifTrue: [
		| count |
		count := 'There are ', empColl size asString, ' employees'.
		(empColl size = 0) ifTrue: [ count := 'There are no employees' ].
		Transcript show: count; cr.
	].

(action = 'total' or: [action = 'avg'])
	ifTrue: [
		| total avg return |
		total := 0.0.
		avg := 0.0.
		empColl do: [ :empColl | total := total + (empColl getEarning) ].
		(action = 'total')
			ifTrue: [
				return := 'Total payment is $', total asString.
				Transcript show: return; cr.
			]
			ifFalse: [
				avg := total / (empColl size) asExactFraction asScaledDecimal: 2.
				return := 'Average payment per employee is $', avg asString.
				Transcript show: return; cr.
			].
	].

(action = 'min' or: [action = 'max'])
	ifTrue: [
		| min max |
		min := 0.0.
		max := 0.0.
		"TODO: include operators"
		(op = nil)
			ifTrue: [
				'yes' printNl.
			]
			ifFalse: [

			].
	].

"iterates through employee collection array"
"empColl do:
	[ :empColl |
		Transcript show: empColl getInfo; cr.
	]."
