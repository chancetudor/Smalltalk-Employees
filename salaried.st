Employee subclass: SalariedEmployee [
	<comment: 'I am an inherited class for salaried employees'>

	SalariedEmployee class >> new [
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
		type := 'Salaried employee'.
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
		line2 := 'weekly salary: ', earnings.
		string := line1, Character nl asString, line2, Character nl asString,
			'earned $', (self getEarning) asString.
		^string
	]

	getEarning [
		<category: 'accessor'>
		^earnings asNumber
	]

	setEarning: ws [
		<category: 'accessor'>
		earnings := ws.
	]
]
