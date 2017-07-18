
!SecureRandom methodsFor: 'printing' stamp: 'cmm 2/13/2006 21:30'!
printOn: aStream
	aStream 
		nextPutAll: 'a ' ;
		nextPutAll: self class name! !
