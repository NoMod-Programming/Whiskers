

!DES methodsFor: 'private' stamp: 'rww 7/25/2010 03:27'!

transform: block



	self primPluginAvailable ifFalse: [self error: 'DES plugin missing'].

	cookedKey ifNil: [ self error: 'DES key not provided'].

	cookedKey size = 32 ifFalse: [ self error: 'DES cooked key damaged'].

	block size = 8 ifFalse: [ self error: 'DES block must be 8

bytes'].

	self primTransform: block using: cookedKey.



	! !

