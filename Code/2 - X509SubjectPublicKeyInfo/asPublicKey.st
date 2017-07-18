
!X509SubjectPublicKeyInfo methodsFor: 'accessing' stamp: 'rww 3/27/2007 21:14'!
asPublicKey

	self algorithm isDSA ifTrue: [^ self asDSAPublicKey].
	self algorithm isRSA ifTrue: [^ self asRSAPublicKey].
	^ nil! !
