
!RandomGenerator class methodsFor: 'create' stamp: 'cmm 5/4/2006 00:06'!
picker
	^ picker ifNil: [ picker := self withGeneratedKey ]! !
