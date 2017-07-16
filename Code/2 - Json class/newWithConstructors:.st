
!Json class methodsFor: 'as yet unclassified' stamp: 'dkb 12/25/2009 02:51'!
newWithConstructors: aCollection
	| m |
	m := Dictionary new.
	aCollection do: [:each |
		(each isKindOf: Association)
			ifTrue: [m add: each]
			ifFalse: [m at: each name asString put: each]].
	^ self new ctorMap: m; yourself.! !
