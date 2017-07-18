
!ARC2 methodsFor: 'services' stamp: 'RJT 4/3/2007 21:09'!
mixUp: a64BitWord withKeys: expandedKeys
	"The primitive 'Mix up R[i]' operation is defined as follows, where
   s[0] is 1, s[1] is 2, s[2] is 3, and s[3] is 5, and where the indices
   of the array R are always to be considered 'modulo 4,' so that R[i-1]
   refers to R[3] if i is 0 (these values are

   'wrapped around' so that R always has a subscript in the range 0 to 3
   inclusive):

   R[i] = R[i] + K[j] + (R[i-1] & R[i-2]) + ((~R[i-1]) & R[i-3]);
   j = j + 1;
   R[i] = R[i] rol s[i];
   "
	| aS aR aByteStream aRi aKj aRa aRb aRc aRd si result |
	aS := Array with: 1 with: 2 with: 3 with: 5.
	aR := Array new: 4.
	aByteStream := (a64BitWord asByteArrayOfSize: 8) readStream.
	1 to: 4 do: [:i |
		aR at: i put: ((aByteStream next bitShift: 8) + aByteStream next).
	].
	0 to: 3 do: [:i | 
		aRi := aR at: i +1.
		aKj := expandedKeys at: self j + 1. "j+1 changes offset from 0 - 3 to 1 to 4"
		aRa := aR at: ((i - 1 \\ 4) + 1).
		aRb := aR at: ((i - 2 \\ 4) + 1).
		aRc := aRa bitXor: 16rFFFF.
		aRd := aR at: ((i - 3 \\ 4) + 1).
		si := aS at: i +1.
		aR at: i+1 put: (self class rotate16BitWord:  ((aRi + aKj + (aRa bitAnd: aRb) + (aRc bitAnd: aRd)) bitAnd: 16rFFFF) leftBy: si).	
		self j: self j + 1.	
	].	
	result := ByteArray new.
	aR do: [:a16BitWord |
		result := result, (a16BitWord asByteArrayOfSize: 2)
	].
	^result.
	! !
