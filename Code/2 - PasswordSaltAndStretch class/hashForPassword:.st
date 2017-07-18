
!PasswordSaltAndStretch class methodsFor: 'instance creation' stamp: 'RJT 2/9/2007 15:52'!
hashForPassword: aPassword
	"the default for r is way to small.  Once we have a primitive SHA256 this should be increased so that this method takes at least 1 second"
	^self hashForPassword: aPassword r: self defaultR
		! !
