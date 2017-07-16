
!Json class methodsFor: 'as yet unclassified' stamp: 'tonyg 8/17/2005 07:45'!
render: anObject
	| s |
	s := WriteStream on: String new.
	anObject jsonWriteOn: s.
	^ s contents.! !
