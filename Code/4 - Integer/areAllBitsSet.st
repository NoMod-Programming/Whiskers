
!Integer methodsFor: '*cryptography-core' stamp: 'rww 12/7/2002 23:27'!
areAllBitsSet

	^self digitLength ~= (self + 1) digitLength! !
