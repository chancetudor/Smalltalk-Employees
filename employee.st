Object subclass: Employee [
	| firstName lastName |
	<comment: 'I am the base class for other types of employees'>

	Employee class >> new [
		<category: 'instance creation'>
		| tempEmployee |
		tempEmployee := super new.
		"tempEmployee init."
		^tempEmployee
	]

	Employee >> firstName:fName [
		<category: 'accessor'>
		^firstName := fName
	]

	Employee >> lastName:lName [
		<category: 'accessor'>
		^lastName := lName
	]

	firstName [
		<category: 'accessor'>
		^firstName
	]

	lastName [
		<category: 'accessor'>
		^lastName
	]

	"init [
		<category: 'initialization'>
		firstName := 'Joe'.
		lastName := 'Test'.
	]"

	printOn: stream [
		<category: 'printing'>
		super printOn: stream.
		"stream nextPutAll: ' with name: '.
		firstName printOn: stream.
		stream nextPutAll: ' '.
		lastName printOn: stream."
	]

	"getInfo [
		| name |
		name := 'Test'.
		^name
	]

	getEarning [
		| earnings |
		earnings := 0.
		^earnings
	]"
]
