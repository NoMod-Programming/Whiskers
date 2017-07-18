
!ARC2 methodsFor: 'encryption/decryption' stamp: 'RJT 4/6/2007 11:56'!
encryptBlock: plainText
	| result |
	result := self encryptBlock: plainText key: self expandedKey.
	result withIndexDo: [:a :i |
		plainText at: i put: a
	].
	^plainText! !
