
!VariableArgMorph methodsFor: 'other' stamp: 'EMP 11/5/2017 18:16'!
printArgOn: aStream
	"Print this argument morph on the given stream."

	aStream nextPutAll: 's['.
	aStream nextPutAll: self labelMorph contents.
	aStream nextPut: $].
! !
