
!JsonDummyTestObject methodsFor: 'as yet unclassified' stamp: 'tonyg 11/30/2005 16:42'!
jsonWriteOn: s
	Json renderInstanceVariables: {#a. #b. #c} of: self on: s
! !
