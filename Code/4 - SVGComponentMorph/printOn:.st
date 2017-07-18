
!SVGComponentMorph methodsFor: 'accessing' stamp: 'gvc 10/3/2005 09:04'!
printOn: aStream
	"Print a description of the receiver on the given stream,"

	super printOn: aStream.
	aStream 
		nextPutAll: '(id=';
		nextPutAll: (self id ifNil: ['<none>']);
		nextPut: $)! !
