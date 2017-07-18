
!ASN1AnyDefinedByType methodsFor: 'accessing' stamp: 'rww 3/27/2007 20:29'!
at: key

	^self typeMap at: key ifAbsent: [self defaultType]! !
