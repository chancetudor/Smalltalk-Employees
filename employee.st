Object subclass: Employee [
	| firstName lastName |
	<comment: 'I am the base class for other types of employees'>

	Employee class >> new [
		<category: 'instance creation'>
		| tempEmployee |
		tempEmployee := super new.
		tempEmployee init.
		^tempEmployee
	]

	init [
		<category: 'initialization'>
		firstName := 'Joe'.
		lastName := 'Test'.
	]

	printOn: stream [
		<category: 'printing'>
		super printOn: stream.
		stream nextPutAll: ' with name: '.
		firstName printOn: stream.
		stream nextPutAll: ' '.
		lastName printOn: stream.
	]

	"getInfo [

	]"

	getEarning [
		| earnings |
		earnings := 0.
		^earnings
	]
]
