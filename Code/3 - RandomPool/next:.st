
!RandomPool methodsFor: 'as yet unclassified' stamp: 'len 11/15/2002 23:20'!
next: anInteger
	| answer |
	answer := ByteArray new: anInteger.
	1 to: anInteger do: [ :each | answer at: each put: self next].
	^ answer! !
