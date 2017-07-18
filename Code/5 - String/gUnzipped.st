
!String methodsFor: '*cryptography-utility' stamp: 'rww 10/20/2016 07:42'!
gUnzipped
	^self isByteString
		ifTrue: [self asByteArray gUnzipped asString]
		ifFalse: [self asByteArray gUnzipped asWideString]! !
