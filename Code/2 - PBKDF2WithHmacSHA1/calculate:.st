
!PBKDF2WithHmacSHA1 methodsFor: 'private' stamp: 'rww 10/13/2016 07:23'!
calculate: password

	| result blocksNeeded |
	self initializeMac: password.
	blocksNeeded := (self keyBitSize asFloat / ((self mac: (ByteArray new: 100 withAll: 10)) size * 8)) ceiling.
	result := ByteArray new.
	1 to: blocksNeeded do: [:i |
		result := result, (self calculateBlock: i).
	].
	^ result copyFrom:1 to: (self keyBitSize // 8)! !
