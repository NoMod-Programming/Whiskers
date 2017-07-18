
!PasswordSaltAndStretch class methodsFor: 'instance creation' stamp: 'RJT 2/9/2007 15:46'!
hashForPassword: aPassword r: aStretchInteger s: salt
	^self new
		r: aStretchInteger;
		s: salt;
		saltAndStretch: aPassword! !
