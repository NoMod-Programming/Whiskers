
!PasswordSaltAndStretch methodsFor: 'services' stamp: 'RJT 2/9/2007 15:47'!
saltAndStretch: aPassword
	| result |
	result := ByteArray new.
	1 to: r do: [:i |
		result := SHA256 new hashMessage: (result, aPassword asByteArray, self s)
	].
	^result -> self s! !
