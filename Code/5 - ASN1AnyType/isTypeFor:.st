
!ASN1AnyType methodsFor: 'testing' stamp: 'rww 3/28/2007 11:29'!
isTypeFor: anObject

	^ (ASN1Stream tagToTypeDispatchTable
		detect: [:eachType | eachType isTypeFor: anObject]
		ifNone: [nil]) notNil
! !
