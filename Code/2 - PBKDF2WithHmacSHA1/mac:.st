
!PBKDF2WithHmacSHA1 methodsFor: 'private' stamp: 'rww 10/10/2016 03:48'!
mac: buffer

	(hmac == nil)
		ifTrue: [self error: 'hmac is nil'].

	^ hmac digestMessage: buffer! !
