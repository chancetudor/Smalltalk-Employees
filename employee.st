Object subclass: Employee [
	| firstName lastName earnings type |
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
		firstName := ''.
		lastName := ''.
		earnings := 0.
	]

	getInfo [
		<category: 'accessor'>
		| name |
		name := firstName, ' ', lastName.
		^name
	]

	getEarning [
		<category: 'accessor'>
		^earnings
	]

	setEarning: money [
		<category: 'accessor'>
		earnings := money.
	]

	setFirstName: fName [
		<category: 'accessor'>
		firstName := fName.
	]

	setLastName: lName [
		<category: 'accessor'>
		lastName := lName.
	]

	getFirstName [
		<category: 'accessor'>
		^firstName
	]

	getLastName [
		<category: 'accessor'>
		^lastName
	]

	printOn: stream [
		<category: 'printing'>
		super printOn: stream.
		stream nextPutAll: ' with name: '.
		firstName printOn: stream.
		stream nextPutAll: ' '.
		lastName printOn: stream.
	]
]
