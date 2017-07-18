
!ASN1DefinitionModel methodsFor: 'services parsing' stamp: 'RJT 9/7/2006 16:09'!
setRootObject
	self resultObject: self parseRootObjectType new.
	self resultObject isCollection
		ifTrue: [self currentObject: self subject new]
		ifFalse: [self currentObject: self resultObject]! !
