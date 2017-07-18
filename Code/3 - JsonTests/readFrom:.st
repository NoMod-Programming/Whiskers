
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 11/29/2005 18:03'!
readFrom: aString
	^ (Json newWithConstructors: {JsonDummyTestObject.}) readFrom: aString readStream
! !
