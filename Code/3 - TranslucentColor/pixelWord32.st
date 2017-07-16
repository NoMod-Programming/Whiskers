
!TranslucentColor methodsFor: '*SVG-Morphic' stamp: 'gvc 8/2/2005 11:04'!
pixelWord32
	"Returns an integer representing the bits that appear in a single pixel of this color in a Form of depth 32.
	Transparency: The pixel value zero is reserved for transparent. For depths greater than 8, black maps to the darkest possible blue."

	| val |
	"eight bits per component; top 8 bits set to all ones (opaque alpha)"
	val := LargePositiveInteger new: 4.
	val at: 3 put: ((rgb bitShift: -22) bitAnd: 16rFF).
	val at: 2 put: ((rgb bitShift: -12) bitAnd: 16rFF).
	val at: 1 put: ((rgb bitShift: -2) bitAnd: 16rFF).
	val = 0 ifTrue: [val at: 1 put: 1].  "closest non-transparent black"
	val at: 4 put: alpha.
	^val! !
