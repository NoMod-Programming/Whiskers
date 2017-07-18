
!PBKDF2WithHmacSHA1 methodsFor: 'private' stamp: 'rww 10/13/2016 07:23'!
initializeMac: password

	(hmac == nil)
		ifTrue: [
			hmac := SHA1 new hmac
				key: password asByteArray;
				yourself].! !
