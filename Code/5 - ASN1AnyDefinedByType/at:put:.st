
!ASN1AnyDefinedByType methodsFor: 'accessing' stamp: 'rww 3/27/2007 16:49'!
at: key put: typeSpec

	^self typeMap at: key put: (self typeFrom: typeSpec)! !
