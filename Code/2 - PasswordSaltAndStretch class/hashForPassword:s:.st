
!PasswordSaltAndStretch class methodsFor: 'instance creation' stamp: 'RJT 2/9/2007 15:52'!
hashForPassword: aPassword s: salt
	^self new
		r: self defaultR;
		s: salt;
		saltAndStretch: aPassword! !
