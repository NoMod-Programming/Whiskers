
!ASN1BitString methodsFor: 'private - parsing' stamp: 'rww 1/29/2007 17:30'!
printOn: aStream

	1 to: bytes size - 1 do: [:idx |
		aStream nextPutAll: ((self bytes at: idx) printStringBase: 2)].
	aStream nextPutAll: ((160 printStringBase: 2) copyFrom: 1 to: (8 - self bitsPadding))! !
