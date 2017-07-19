

!CryptoX509Test methodsFor: 'as yet unclassified' stamp: 'rww 6/30/2010 14:44'!

testSignatureValidation



	self assert: (self certificate1 verifyFromParentCertificate: self certificate1).

! !

