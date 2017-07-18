
!Json class methodsFor: 'as yet unclassified' stamp: 'dkb 12/25/2009 02:52'!
renderInstanceVariables: aCollection of: anObject on: aStream
	| map |
	map := Dictionary new.
	aCollection do: [:ivarName | map at: ivarName put: (anObject instVarNamed: ivarName)].
	self render: map withConstructor: anObject class name asString on: aStream! !
