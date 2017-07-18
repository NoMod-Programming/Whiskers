
!RandomGenerator class methodsFor: 'initialize-release' stamp: 'cmm 12/16/2006 10:22'!
destroyPickers
	self withAllSubclassesDo: 
		[ : each | 
		(each instVarNamed: 'picker') ifNotNilDo: [ : thePicker | thePicker destroy ].
		each 
			instVarNamed: 'picker'
			put: nil ]! !
