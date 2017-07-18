
!Pkcs12PrivateKeyFileReader methodsFor: 'accessing' stamp: 'rww 4/9/2007 04:36'!
privateKeys
	"Answer the value of privateKeys"

	privateKeys isNil ifTrue: [self privateKeys: OrderedCollection new].
	^ privateKeys! !
