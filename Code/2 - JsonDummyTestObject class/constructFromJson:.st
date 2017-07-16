
!JsonDummyTestObject class methodsFor: 'as yet unclassified' stamp: 'tonyg 11/29/2005 17:49'!
constructFromJson: j
	^ self new a: (j at: 'a'); b: (j at: 'b'); c: (j at: 'c'); yourself! !
