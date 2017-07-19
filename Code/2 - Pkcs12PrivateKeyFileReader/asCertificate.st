

!Pkcs12PrivateKeyFileReader methodsFor: 'accessing' stamp: 'rww 4/8/2007 20:36'!

asCertificate



	self certs isEmpty ifTrue: [^ nil].

	^ self certs first

! !

