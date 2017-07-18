
!TripleDES methodsFor: 'accessing' stamp: 'len 8/2/2002 03:15'!
encryptBlock: plainText
	des1 encryptBlock: plainText.
	des2 decryptBlock: plainText.
	des3 encryptBlock: plainText! !
