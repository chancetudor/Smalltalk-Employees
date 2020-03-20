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
			', commission rate: ', commRate printString.
		string := line1, Character nl asString, line2.
		^string
	]

	getEarning [
		| computed |
		computed := (sales * commRate) truncateTo: 0.01.
		(computed < minSal) ifTrue: [ ^minSal ].
		^computed
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
