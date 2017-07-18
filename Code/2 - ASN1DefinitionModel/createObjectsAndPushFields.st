
!ASN1DefinitionModel methodsFor: 'services parsing' stamp: 'RJT 9/7/2006 15:50'!
createObjectsAndPushFields
	self resultObject ifNil: 
		[self setRootObject].
	self currentObject ifNil: 
		[self setCurrentObject].
	self currentField isNil 
		ifTrue: [self setCurrentField]
		ifFalse: [self pushNextField].
	self setCurrentMutator.
	! !
