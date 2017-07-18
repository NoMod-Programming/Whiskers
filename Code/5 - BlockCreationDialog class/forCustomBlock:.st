
!BlockCreationDialog class methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 11:46'!
forCustomBlock: anArray
	| result |
	"anArray is an array with the following:
	[
	the block spec string
	the argument names
	isAtomic
	]"

	result _ self new.
	result isAtomic: ((anArray third) = true).
	result block commandSpec: (anArray first asString).
	result block fixParametersWith: (anArray second).
^ result! !
