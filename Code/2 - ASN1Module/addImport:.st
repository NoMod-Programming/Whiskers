

!ASN1Module methodsFor: 'accessing' stamp: 'rww 4/13/2007 20:44'!

addImport: aModule



	(self imports includes: aModule)

		ifFalse: [self imports add: aModule].

! !

