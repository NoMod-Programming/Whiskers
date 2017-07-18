
!ByteArray methodsFor: '*cryptography-core' stamp: 'cmm 3/3/2006 00:08'!
unpad
	| pad end |
	self isProperlyPadded ifFalse: [ CryptographyError signal: 'Authentication failure (improperly padded!!)' ].
	pad := self last.
	end := self size - pad.
	^ self copyFrom: 1 to: end! !
