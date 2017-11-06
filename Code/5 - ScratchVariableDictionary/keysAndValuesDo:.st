
!ScratchVariableDictionary methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 18:09'!
keysAndValuesDo: aBlock
	^self associationsDo:[:assoc|
		aBlock value: assoc varName value: assoc varValue].! !
