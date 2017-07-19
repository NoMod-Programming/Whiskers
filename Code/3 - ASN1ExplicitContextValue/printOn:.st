

!ASN1ExplicitContextValue methodsFor: 'printing' stamp: 'RJT 9/8/2006 15:53'!

printOn: aStream



	aStream nextPutAll: '[', self tagIndex asString, ']', (self tagValue printString).

! !

