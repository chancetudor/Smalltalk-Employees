Object subclass: Employees [
	| empColl |
	<comment: 'Class to deal with actions requested by user for employee data file'>

	Employees class >> new [
		<category: 'instance creation'>
		| temp |
		temp := super new.
		temp init.
		^temp
	]

	init [
		<category: 'initialization'>
		empColl := OrderedCollection new.
	]

	count: list [
		| sizeColl |
		empColl := list.
		sizeColl := 'There are ', empColl size asString, ' employees'.
		Transcript show: sizeColl; cr.
	]

	print: list [
		| size i |
		empColl := list.
		size := empColl size.
		i := 1.
		empColl do:
			[ :empColl |
				Transcript show: empColl getInfo; cr.
				(i = size) "for formatting purposes"
					ifTrue: [ ^nil ]
					ifFalse: [ Transcript cr ].
				i := i + 1.
			].
	]

	min: list [
		| min currMin minEmp |
		empColl := list.
		min := empColl first getEarning.
		empColl do:
			[ :empColl |
				currMin := empColl getEarning.
				(currMin < min)
					ifTrue: [
						min := currMin.
						minEmp := empColl. "employee w/ min earnings"
					]
			].
		Transcript show: minEmp getInfo; cr.
	]

	max: list [
		| max currMax maxEmp |
		empColl := list.
		max := empColl first getEarning.
		empColl do:
			[ :empColl |
				currMax := empColl getEarning.
				(currMax > max)
					ifTrue: [
						max := currMax.
						maxEmp := empColl.
					].
			].
		Transcript show: maxEmp getInfo; cr.
	]

	total: list [
		| total return |
		empColl := list.
		total := 0.0.
		empColl do: [ :empColl | total := total + (empColl getEarning) ].
		return := 'Total payment is $', total asString.
		Transcript show: return; cr.
	]

	avg: list [
		| total avg return |
		empColl := list.
		total := 0.0.
		empColl do: [ :empColl | total := total + (empColl getEarning) ].
		avg := total / (empColl size) asExactFraction asScaledDecimal: 2.
		return := 'Average payment per employee is $', avg asString.
		Transcript show: return; cr.
	]
]

| inFile fullEmps argCount action op thresh |
fullEmps := OrderedCollection new. "stores all employees from data file"
empColl := Employees new. "used for the actions requested"
argCount := Smalltalk getArgc.
(argCount == 2 or: [argCount == 4])
	ifFalse: [
		validActions := 'Valid actions: count print min max total avg'.
		validOps := 'Valid operators: eq ne gt ge lt le'.
		usage := 'Usage: -f payroll.st employee_file action',
			Character nl asString, 'or', Character nl asString,
			'Usage: -f payroll.st employee_file action operator threshold',
			Character nl asString, validActions,
			Character nl asString, validOps.
		Transcript show: usage; cr.
		ObjectMemory quit: -1.
	].
action := Smalltalk arguments second.
(argCount == 4)
	ifTrue: [
		op := Smalltalk arguments third.
		thresh := Smalltalk arguments fourth.
	].
inFile := FileStream open: Smalltalk arguments first mode: FileStream read ifFail: [
	Transcript show: 'Unable to open ', Smalltalk arguments first, ' for reading'; cr.
	ObjectMemory quit: -2.
].
[inFile atEnd] whileFalse: [
	| line parts |
	line := inFile upTo: Character nl.
	parts := line substrings. "parts: OrderedCollection with parsed contents of line"
	(parts includes: 'salaried')
		ifTrue: [
			Salaried := SalariedEmployee new.
			Salaried setFirstName: (parts at: 2); setLastName: (parts at: 3).
			Salaried setEarning: (parts at: 4).
			fullEmps add: Salaried.
		].
	(parts includes: 'hourly')
		ifTrue: [
			Hourly := HourlyEmployee new.
			Hourly setFirstName: (parts at: 2); setLastName: (parts at: 3).
			Hourly setHours: (parts at: 4); setRate: (parts at: 5).
			fullEmps add: Hourly.
		].
	(parts includes: 'commission')
		ifTrue: [
			Commission := CommissionEmployee new.
			Commission setFirstName: (parts at: 2); setLastName: (parts at: 3).
			Commission setMinSal: (parts at: 4); setSales: (parts at: 5).
			Commission setRate: (parts at: 6).
			fullEmps add: Commission.
		].
].
(fullEmps size == 0)
	ifTrue: [
		Transcript show: 'There are no employees'; cr.
		ObjectMemory quit: 1.
	].
(argCount == 2)
	ifTrue: [
		(action = 'print') ifTrue: [ empColl print: fullEmps ].
		(action = 'count') ifTrue: [ empColl count: fullEmps ].
		(action = 'total') ifTrue: [ empColl total: fullEmps ].
		(action = 'avg') ifTrue: [ empColl avg: fullEmps ].
		(action = 'min') ifTrue: [ empColl min: fullEmps ].
		(action = 'max') ifTrue: [ empColl max: fullEmps ].
	]
	ifFalse: [ "argCount include operations and thresholds"
		| threshEmps earning |
		thresh := thresh asInteger.
		threshEmps := OrderedCollection new. "employees whose earnings meet the threshold value"
		fullEmps do: [ :fullEmps |
			earning := fullEmps getEarning asInteger.
			(op = 'eq')
				ifTrue: [ (earning = thresh) ifTrue: [ threshEmps add: fullEmps ] ].
			(op = 'ne')
				ifTrue: [ (earning ~= thresh) ifTrue: [ threshEmps add: fullEmps ] ].
			(op = 'gt')
				ifTrue: [ (earning > thresh) ifTrue: [ threshEmps add: fullEmps ] ].
			(op = 'ge')
				ifTrue: [ (earning >= thresh) ifTrue: [ threshEmps add: fullEmps ] ].
			(op = 'lt')
				ifTrue: [ (earning < thresh) ifTrue: [ threshEmps add: fullEmps ] ].
			(op = 'le')
				ifTrue: [ (earning <= thresh) ifTrue: [ threshEmps add: fullEmps ] ].
		].
		(action = 'print') ifTrue: [ empColl print: threshEmps ].
		(action = 'count') ifTrue: [ empColl count: threshEmps ].
		(action = 'total') ifTrue: [ empColl total: threshEmps ].
		(action = 'avg') ifTrue: [ empColl avg: threshEmps ].
		(action = 'min') ifTrue: [ empColl min: threshEmps ].
		(action = 'max') ifTrue: [ empColl max: threshEmps ].
	].
