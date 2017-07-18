
!Pkcs12PrivateKeyFileReader methodsFor: 'accessing' stamp: 'rww 4/9/2007 04:35'!
certs
	"Answer the value of certs"

	certs isNil ifTrue: [self certs: OrderedCollection new].
	^ certs! !
