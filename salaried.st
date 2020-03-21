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
		line2 := 'weekly salary: ', earnings asString.
		string := line1, Character nl asString, line2.
		"QUESTION: Maybe take out the 'transcript show:' bit?
		maybe put in payroll.st instead"
		Transcript show: string; cr.
	]

	getEarning [
		<category: 'accessor'>
		"QUESTION: Maybe take out the 'transcript show:' bit?
		maybe put in payroll.st instead"
		Transcript show: 'earned: $'. ^earnings
	]

	setEarning: ws [
		<category: 'accessor'>
		earnings := ws.
	]
]
