
!ARC2 methodsFor: 'services' stamp: 'RJT 4/5/2007 15:26'!
mash: a64BitWord withKeys: expandedKeys
	"The primitive 'Mash R[i]' operation is defined as follows (using the
   previous conventions regarding subscripts for R):

   R[i] = R[i] + K[R[i-1] & 63];

   In words: R[i] is 'mashed; by adding to it one of the words of the
   expanded key. The key word to be used is determined by looking at the
   low-order six bits of R[i-1], and using that as an index into the key
   array K.
"
	| aR aByteStream aRi aK result |
	aR := Array new: 4.
	aByteStream := (a64BitWord asByteArrayOfSize: 8) readStream.
	1 to: 4 do: [:i |
		aR at: i put: ((aByteStream next bitShift: 8) + aByteStream next).
	].
	0 to: 3 do: [:i | 
		aRi := aR at: i + 1.
		aK := expandedKeys at: (((aR at: ((i - 1) \\ 4)+1) bitAnd: 63) + 1).
		aR at: i + 1 put: ((aRi + aK) bitAnd: 16rFFFF).
	].
	result := ByteArray new.
	aR do: [:a16BitWord |
		result := result, (a16BitWord asByteArrayOfSize: 2)
	].
	^result.
	

! !
