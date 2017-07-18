
!Fortuna methodsFor: 'initialize' stamp: 'cmm 4/4/2006 16:53'!
setKey: aByteArray
	aByteArray size < Rijndael keySize
		ifTrue:
			[ CryptographyError signal: 'Fortuna requires a ', Rijndael keySize printString, '-byte key' ].
	key := aByteArray copyFrom: 1 to: Rijndael keySize.
	self initializeCtr! !
