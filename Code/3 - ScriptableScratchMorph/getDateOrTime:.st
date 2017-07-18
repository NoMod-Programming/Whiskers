
!ScriptableScratchMorph methodsFor: 'other ops' stamp: 'EMP 7/17/2017 16:57'!
getDateOrTime: wanted
	| date time |
	date _ Date today.
	time _ Time now.
	'time' = wanted ifTrue: [^ time asString].
	'hour' = wanted ifTrue: [^ time hours].
	'minute' = wanted ifTrue: [^ time minutes].
	'second' = wanted ifTrue: [^ time seconds].
	'date' = wanted ifTrue: [^ date asString].
	'year' = wanted ifTrue: [^ date year].
	'month' = wanted ifTrue: [^ date monthIndex].
	'day of week' = wanted ifTrue: [^ date weekdayIndex].
	^ -1! !
