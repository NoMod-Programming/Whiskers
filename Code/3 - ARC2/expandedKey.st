
!ARC2 methodsFor: 'services' stamp: 'RJT 4/5/2007 22:12'!
expandedKey

	"for i = T, T+1, ..., 127 do
     L[i] = PITABLE[L[i-1] + L[i-T]];"

	| keyBuffer aT v1 v2 pos byteStream result |
	keyBuffer := (self key reverse asByteArrayOfSize: 128) reverse.
	aT := self key size.
	aT to: 127 do: [:i |
		v1 := keyBuffer at: (i -1) + 1.
		v2 := keyBuffer at: (i - aT) + 1.
		keyBuffer at: (i+1) put: (self class PITABLE at: (((v1 + v2) \\ 256) + 1)).
	].

	"L[128-T8] = PITABLE[L[128-T8] & TM];"
	pos := (128 - self T8) + 1.
	keyBuffer at: pos put: (self class PITABLE at: (((keyBuffer at: pos) bitAnd: self TM) + 1)).
	
	"for i = 127-T8, ..., 0 do
     L[i] = PITABLE[L[i+1] XOR L[i+T8]];
	"
	(127 - self T8) to: 0 by: -1 do: [:i |
		keyBuffer at: (i+1) put: (self class PITABLE at: (((keyBuffer at: ((i + 1) +1)) bitXor: (keyBuffer at: ((i + self T8)+1))) +1))
	].
	byteStream := keyBuffer readStream.
	result := OrderedCollection new: byteStream size.
	[byteStream atEnd] whileFalse: [
		result add: (byteStream next  + (byteStream next bitShift: 8))  "Little Endian"
	].
	^result
	! !
