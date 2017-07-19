

!ARC2 methodsFor: 'encryption/decryption' stamp: 'RJT 4/6/2007 16:00'!

decryptBlock: cipherText

	| result |

	result := self decryptBlock: cipherText key: self expandedKey.

	result withIndexDo: [:a :i |

		cipherText at: i put: a

	].

	^cipherText! !

