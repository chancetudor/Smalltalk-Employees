Employee subclass: CommissionEmployee [
	| minSal sales commRate |
	<comment: 'I am an inherited class for commission employees'>

	CommissionEmployee class >> new [
		<category: 'instance creation'>
		| tempEmployee |
		tempEmployee := super new.
		tempEmployee init.
		^tempEmployee
	]

	init [
		<category: 'initialization'>
		firstName := ''.
		lastName := ''.
		earnings := 0.0.
		minSal := 0.0.
		sales := 0.0.
		commRate := 0.0.
		type := 'Commission employee'.
	]

	printOn: stream [
		<category: 'printing'>
		type printOn: stream.
		stream nextPutAll: ': '.
		firstName printOn: stream.
		stream nextPutAll: ' '.
		lastName printOn: stream.
	]

	getInfo [
		<category: 'accessor'>
		| name line1 line2 string |
		name := firstName, ' ', lastName.
		line1 := type, ':', ' ', name.
		line2 := 'minimum salary: ', minSal asString,
			', sales amount: ', sales asString,
			', commission rate: ', ((commRate * 100) truncateTo: 0.01) asString, '%'.
		string := line1, Character nl asString, line2.
		"TODO: Maybe take out the 'transcript show:' bit?
		maybe put in payroll.st instead"
		Transcript show: string; cr.
	]

	getEarning [
		earnings := (sales * commRate) truncateTo: 0.01.
		(earnings < minSal) ifTrue: [ Transcript show: 'earned: '. ^minSal ].
		"TODO: Maybe take out the 'transcript show:' bit?
		maybe put in payroll.st instead"
		Transcript show: 'earned: $'. ^earnings
	]

	setMinSal: ms [
		<category: 'accessor'>
		minSal := ms.
	]

	setSales: s [
		<category: 'accessor'>
		sales := s.
	]

	setRate: r [
		<category: 'accessor'>
		commRate := r.
	]
]
