
!RandomPool methodsFor: 'as yet unclassified' stamp: 'len 8/20/2002 03:14'!
nextPutAll: aCollection
	aCollection do: [ :each | self nextPut: each].
	^ aCollection! !
