
!BlockCreationDialog class methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 22:29'!
forCustomBlock: anArray
	| result |
	"anArray is an array with the following:
	[
	the block spec string
	the argument names
	isAtomic
	]"

	result := self new.
	result isAtomic: ((anArray third) = true).
	result block commandSpec: (anArray first asString).
	result block fixParametersWith: (anArray second).
	^ result! !
