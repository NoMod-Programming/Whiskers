

!ASN1Module methodsFor: 'services' stamp: 'rww 3/28/2007 05:55'!

typeFrom: aTypeSpec



	(aTypeSpec isKindOf: ASN1Type) ifTrue: [^ aTypeSpec].

	aTypeSpec isBehavior ifTrue: [^ aTypeSpec new].

	^self find: aTypeSpec! !

