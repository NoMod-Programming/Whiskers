
!ASN1AnyDefinedByType methodsFor: 'testing' stamp: 'rww 3/27/2007 16:47'!
matchesTag: anInteger

	^ (self typeMap
		detect: [:each | each matchesTag: anInteger]
		ifNone: [nil]) notNil
! !
