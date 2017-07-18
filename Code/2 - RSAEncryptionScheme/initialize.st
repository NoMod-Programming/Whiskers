
!RSAEncryptionScheme methodsFor: 'initialization' stamp: 'cs 8/12/2002 13:32'!
initialize
	rand := Random new.
	hash := SHA1 new.
	hashLen := 20! !
