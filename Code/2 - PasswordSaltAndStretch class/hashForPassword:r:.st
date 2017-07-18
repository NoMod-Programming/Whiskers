
!PasswordSaltAndStretch class methodsFor: 'instance creation' stamp: 'RJT 5/2/2007 15:53'!
hashForPassword: aPassword r: aStretchInteger
	^self hashForPassword: aPassword r: aStretchInteger s: (SecureRandom picker nextBytesNonZero: 32)! !
