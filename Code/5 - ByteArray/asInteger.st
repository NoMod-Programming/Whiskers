
!ByteArray methodsFor: '*cryptography-core' stamp: 'len 10/15/2002 18:45'!
asInteger
	^ self inject: 0 into: [ :sum :each | sum * 256 + each]! !
