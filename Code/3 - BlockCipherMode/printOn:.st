
!BlockCipherMode methodsFor: 'printing' stamp: 'rww 11/19/2002 02:17'!
printOn: aStream
	aStream print: cipher; nextPut: $-; nextPutAll: self class name! !
