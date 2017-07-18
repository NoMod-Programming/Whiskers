
!ASN1StructureElement methodsFor: 'testing' stamp: 'rww 3/25/2007 23:11'!
isTypeFor: anObject

	| val |
	val := self valueFrom: anObject.
	^self type isTypeFor: val! !
