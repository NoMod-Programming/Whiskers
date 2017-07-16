
!JsonObject class methodsFor: 'as yet unclassified' stamp: 'Igor.Stasenko 1/9/2010 16:51'!
fromAssociations: collectionOfAssociations

	| result |
	result := self new.
	
	collectionOfAssociations do: [:each |
		result at: each key put: each value ].
	^ result! !
