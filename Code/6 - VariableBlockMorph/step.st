
!VariableBlockMorph methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 19:02'!
step
	varReference ifNil: [^ self].
	commandSpec = (varReference varName) ifFalse: [
		self commandSpec: (varReference varName)
	].! !
