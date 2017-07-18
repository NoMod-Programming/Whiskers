
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 4/29/2016 11:12'!
assertInvalidJson: aString
	self should: [self readFrom: aString] raise: JsonInvalidError! !
