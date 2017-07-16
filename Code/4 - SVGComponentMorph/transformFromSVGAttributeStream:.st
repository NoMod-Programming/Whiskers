
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 09:19'!
transformFromSVGAttributeStream: str
	"Answer a new MatrixTransform2x3 for the transform (sub)attribute."

	|matrix a x y type|
	matrix := MatrixTransform2x3 identity.
	type := str upTo: $(.
	(type = 'matrix')
		ifTrue: [matrix
				a11: str nextNumber;
				a21: str nextNumber;
				a12: str nextNumber;
				a22: str nextNumber;
				a13: str nextNumber;
				a23: str nextNumber].
	(type = 'translate')
		ifTrue: [x := str nextNumber.
				y := str nextNumber.
				y ifNil: [y := 0].
				matrix
					setOffset: x@y].
	(type = 'scale')
		ifTrue: [x := str nextNumber.
				y := str nextNumber.
				y ifNil: [y := x].				
				matrix
					setScale: x@y].
	(type = 'rotate')
		ifTrue: [a  := str nextNumber.
				x := str nextNumber.
				y := str nextNumber.	
				matrix
					setAngle: a.
				(x notNil and: [y notNil])
					ifTrue: [matrix := ((MatrixTransform2x3 withOffset: x@y)
									composedWithLocal: matrix)
									composedWithLocal: (MatrixTransform2x3 withOffset: x negated@y negated)]].
	(type = 'skewX')
		ifTrue: [str match: 'skewX('.
				a := str nextNumber.		
				matrix
					setSkew: a@0].
	(type = 'skewY')
		ifTrue: [str match: 'skewY('.
				a := str nextNumber.		
				matrix
					setSkew: 0@a].
	^matrix! !
