
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/3/2005 10:13'!
transformFromSVGAttribute: trans
	"Answer a new MatrixTransform2x3 for the transform attribute."

	|str matrix|
	matrix := MatrixTransform2x3 identity.
	trans ifNil: [^matrix].
	str := trans readStream.
	[str atEnd] whileFalse: [
		str upToAny: 'mtsr'. "find the next transform in the list"
		matrix := matrix composedWithLocal: (self transformFromSVGAttributeStream: str)].
	^matrix! !
