
!BlockCipher methodsFor: 'private' stamp: 'cmm 3/2/2006 23:22'!
validateEndpointsFrom: startIndex to: endIndex
	endIndex-startIndex+1 \\ self blockSize = 0 ifFalse: [ CryptographyError signal: 'message size must be a multiple of my blockSize.' ]! !
