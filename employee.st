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
		type := ''.
	]

	printOn: stream [
		<category: 'printing'>
		super printOn: stream.
		stream nextPutAll: ' with name: '.
		firstName printOn: stream.
		stream nextPutAll: ' '.
		lastName printOn: stream.
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
]
