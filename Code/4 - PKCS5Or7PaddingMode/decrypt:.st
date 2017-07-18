
!PKCS5Or7PaddingMode methodsFor: 'accessing' stamp: 'rww 10/16/2016 22:15'!
decrypt: aByteArray 

	| decryptable |
	decryptable := 	self 
		decrypt: aByteArray copy
		from: 1
		to: aByteArray size.
	^ self isStreamCipher 
		ifTrue: [ decryptable ]
		ifFalse: [ decryptable copyFrom: 1 to: decryptable unpaddedSize ]! !
