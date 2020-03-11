Employee subclass: HourlyEmployee [
	| hours hourlyRate |
	<comment: 'I am an inherited class for hourly employees'>

	HourlyEmployee class >> new [
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
		earnings := 0.
		hours := 0.
		hourlyRate := 0.
		type := 'Hourly employee'.
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
		line2 := 'hours worked: ', hours asString,
			', hourly rate: ', hourlyRate asString.
		string := line1, Character nl asString, line2.
		^string
	]

	getEarning [
		<category: 'accessor'>
		^earnings
	]

	setHours: hrs [
		<category: 'accessor'>
		hours := hrs.
	]

	setRate: rate [
		<category: 'accessor'>
		hourlyRate := rate.
	]
]
