
!Collection methodsFor: '*json' stamp: 'Igor.Stasenko 12/27/2009 08:03'!
jsonWriteOn: aStream
	"By default, use array braces "
	aStream nextPut: $[.
	
	self do: [:each |
		each jsonWriteOn: aStream
		  ] separatedBy: [ aStream nextPut: $, ].

	aStream nextPut: $]! !
