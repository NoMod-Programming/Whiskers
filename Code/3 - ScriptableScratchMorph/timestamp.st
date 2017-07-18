
!ScriptableScratchMorph methodsFor: 'other ops' stamp: 'EMP 7/17/2017 16:59'!
timestamp
	| d tempSeconds |
	d _ (((367 * (Date today year) - (((7 * ((Date today year) + (((Date today monthIndex + 9) / 12) floor))) / 4) floor) + (((((275 * (Date today monthIndex)) / 9) floor) + (Date today weekdayIndex)) - 730530)))).
	tempSeconds _ (((((Time now hours) * 60) + (Time now minutes)) * 60) + (Time now seconds)).
^ d + (tempSeconds / (24 * 60 * 60)) asFloat! !
