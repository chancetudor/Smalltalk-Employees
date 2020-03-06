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
		firstName := ''
		lastName := ''
	]
]
