| inFile empColl args action op thresh |
empColl := OrderedCollection new.
args := Smalltalk getArgc.
(args == 2 or: [args == 4])
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
(args == 4)
	ifTrue: [
		op := Smalltalk arguments third.
		thresh := Smalltalk arguments fourth.
	].
inFile := FileStream open: Smalltalk arguments first mode: FileStream read ifFail: [
	Transcript show: 'Error: could not open file ', Smalltalk arguments first; cr.
	ObjectMemory quit: -2.
].
[inFile atEnd] whileFalse: [
	| line parts |
	line := inFile upTo: Character nl.
	parts := line substrings. "parts: OrderedCollection with parsed contents of line"
	(parts includes: 'salaried')
		ifTrue: [
			Salaried := SalariedEmployee new.
			Salaried setFirstName: (parts at: 2).
			Salaried setLastName: (parts at: 3).
			Salaried setEarning: (parts at: 4).
			empColl add: Salaried.
		].
	(parts includes: 'hourly')
		ifTrue: [
			Hourly := HourlyEmployee new.
			Hourly setFirstName: (parts at: 2).
			Hourly setLastName: (parts at: 3).
			Hourly setHours: (parts at: 4).
			Hourly setRate: (parts at: 5).
			empColl add: Hourly.
		].
	(parts includes: 'commission')
		ifTrue: [
			Commission := CommissionEmployee new.
			Commission setFirstName: (parts at: 2).
			Commission setLastName: (parts at: 3).
			Commission setMinSal: (parts at: 4).
			Commission setSales: (parts at: 5).
			Commission setRate: (parts at: 6).
			empColl add: Commission.
		].
].
(empColl size == 0)
	ifTrue: [
		Transcript show: 'There are no employees'; cr.
		ObjectMemory quit: 1.
	].
(args == 2)
	ifTrue: [
		(action = 'print')
			ifTrue: [
				empColl do: [ :empColl | Transcript show: empColl getInfo; cr. ].
			].
		(action = 'count')
			ifTrue: [
				| count |
				count := 'There are ', empColl size asString, ' employees'.
				Transcript show: count; cr.
			].
		(action = 'total' or: [action = 'avg'])
			ifTrue: [
				| total avg return |
				total := 0.0.
				avg := 0.0.
				empColl do: [ :empColl | total := total + (empColl getEarning) ].
				(action = 'total')
					ifTrue: [
						return := 'Total payment is $', total asString.
						Transcript show: return; cr.
					]
					ifFalse: [ "action = avg"
						avg := total / (empColl size) asExactFraction asScaledDecimal: 2.
						return := 'Average payment per employee is $', avg asString.
						Transcript show: return; cr.
					].
			].
		(action = 'min' or: [action = 'max'])
			ifTrue: [
				| min max maxEmp minEmp |
				min := empColl first getEarning.
				max := empColl first getEarning.
				(action = 'max')
					ifTrue: [
						empColl do:
							[ :empColl |
								currMax := empColl getEarning.
								(currMax > max)
									ifTrue: [
										max := currMax.
										maxEmp := empColl. "employee w/ max earnings"
									].
							].
						Transcript show: maxEmp getInfo; cr.
					]
					ifFalse: [ "find min instead"
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
					].
			].
	]
	ifFalse: [ "args include operations and thresholds"
		| validEmps earning |
		thresh := thresh asNumber asExactFraction asScaledDecimal: 2.
		validEmps := OrderedCollection new.
		(action = 'print')
			ifTrue: [
				empColl do: [ :empColl |
					earning := empColl getEarning.
					(op = 'eq') "FIXME: not adding employees to validEmps idt"
						ifTrue: [
							(earning = thresh) ifTrue: [ validEmps add: empColl. ]
						].
					"(op = 'ne')
						ifTrue: [

						].
					(op = 'gt')
						ifTrue: [

						].
					(op = 'ge')
						ifTrue: [

						].
					(op = 'lt')
						ifTrue: [

						].
					(op = 'le')
						ifTrue: [

						]."
				].
				validEmps do: [ :validEmps | Transcript show: validEmps getInfo; cr. ].
			].
	].
