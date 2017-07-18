
!ByteArray methodsFor: '*cryptography-core' stamp: 'cmm 2/21/2006 00:05'!
destroy
	1 to: self size do: 
		[ : x |
		self at: x put: 0 ]! !
