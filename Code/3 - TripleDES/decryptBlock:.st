

!TripleDES methodsFor: 'accessing' stamp: 'len 8/2/2002 03:15'!

decryptBlock: plainText

	des3 decryptBlock: plainText.

	des2 encryptBlock: plainText.

	des1 decryptBlock: plainText! !

