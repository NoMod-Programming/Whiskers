
!HMAC methodsFor: 'printing' stamp: 'len 8/3/2002 02:08'!
printOn: aStream
	aStream nextPutAll: 'HMAC-'; print: hash! !
