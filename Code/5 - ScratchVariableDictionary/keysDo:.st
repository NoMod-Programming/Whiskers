
!ScratchVariableDictionary methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 18:01'!
keysDo: aBlock 
	"Evaluate aBlock for each of the receiver's keys."

	self associationsDo: [:association | aBlock value: association varName]! !
