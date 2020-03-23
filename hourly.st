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
		earnings := 0.0.
		hours := 0.0.
		hourlyRate := 0.0.
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
		line2 := 'hours worked: ', (hours asNumber asExactFraction asScaledDecimal: 2) asString,
			', hourly rate: ', (hourlyRate asNumber asExactFraction asScaledDecimal: 2) asString.
		string := line1, Character nl asString, line2, Character nl asString,
			'earned $', (self getEarning) asString.
		^string
	]

	getEarning [
		<category: 'accessor'>
		"first 40 hours is paid exactly at the hourly rate,
		next 10 hours (40 to 50) is paid at 1.5 times the hourly rate,
		and any hours over 50 is paid at 2.0 times the hourly rate."
		(hours asNumber <= 40)
			ifTrue: [ earnings := hours asNumber * hourlyRate asNumber ].
		(hours asNumber > 40 & (hours asNumber <= 50))
			ifTrue: [
				earnings := ((hours asNumber - 40) * (hourlyRate asNumber * 1.5))
					+ (40 * hourlyRate asNumber)
			].
		(hours asNumber > 50)
			ifTrue: [
				earnings := ((hours asNumber - 50) * (hourlyRate asNumber * 2)) +
					(10 * (hourlyRate asNumber * 1.5)) + (hourlyRate asNumber * 40)
			].
		^earnings asNumber asExactFraction asScaledDecimal: 2
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
