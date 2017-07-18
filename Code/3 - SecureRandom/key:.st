
!SecureRandom methodsFor: 'initialization-release' stamp: 'len 11/15/2002 23:28'!
key: aByteArray
	| srcIndex |
	key := LargePositiveInteger new: (aByteArray size min: 64).
	srcIndex := 0.
	key digitLength to: 1 by: -1 do: [:i |
		key digitAt: i put: (aByteArray at: (srcIndex := srcIndex + 1)) asInteger].
	key highBit > 512 ifTrue: [key := key bitShift: key highBit - 512].
	key := key normalize.
	seed := 16rEFCDAB8998BADCFE10325476C3D2E1F067452301 "initial seed"! !
